﻿using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Cryptography;
using DentalClinicProject.Models;
using DentalClinicProject.DTO;
using Microsoft.EntityFrameworkCore;
using DentalClinicProject.Services.Interface;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace DentalClinicProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        public static User user;
        private readonly IConfiguration _configuration;
        private readonly IUserService _userService;
        private readonly dentalContext _context;
        private readonly IMailService _mailService;

        public AuthController(dentalContext context, IConfiguration configuration, IUserService userService, IMailService _MailService)
        {
            _configuration = configuration;
            _userService = userService;
            _context = context;
            _mailService = _MailService;
        }


        [HttpPost("login")]
        public async Task<ActionResult<string>> Login(UserLoginDTO request)
        {
            user = _context.Users.Include(u => u.RoleNavigation)
                .FirstOrDefault(o => o.Email == request.Email);

            if (user == null || user.Email != request.Email )
            {
                return BadRequest(user);
            }

            if (!user.VerifyPasswordHash(request.password))
            {
                return BadRequest("Wrong password.");
            }


            string token = CreateToken(user);
            var refreshToken = GenerateRefreshToken();

            SetRefreshToken(refreshToken);

            return Ok(new 
            { Token = token, 
              Role = user.RoleNavigation.Name
            });
        }

        [HttpPost("restPassword")]
        public async Task<ActionResult<string>> restPassword(UserLoginDTO request)
        {


            var checkMail = _mailService.SendMail(request);
            if (checkMail != true) {
                return BadRequest("Email không tồn tại trong hệ thống");
            }

            return Ok("Mật khẩu đã được đổi thành công và gửi qua email.");
        }


        [HttpPost("refresh-token")]
        public async Task<ActionResult<string>> RefreshToken()
        {
            var refreshToken = Request.Cookies["refreshToken"];

            if (!user.RefreshToken.Equals(refreshToken))
            {
                return Unauthorized("Invalid Refresh Token.");
            }
            else if (user.TokenExpires < DateTime.Now)
            {
                return Unauthorized("Token expired.");
            }

            string token = CreateToken(user);
            var newRefreshToken = GenerateRefreshToken();
            SetRefreshToken(newRefreshToken);

            return Ok(token);
        }

        private RefreshToken GenerateRefreshToken()
        {
            var refreshToken = new RefreshToken
            {
                Token = Convert.ToBase64String(RandomNumberGenerator.GetBytes(64)),
                Expires = DateTime.Now.AddDays(7),
                Created = DateTime.Now
            };

            return refreshToken;
        }

        private void SetRefreshToken(RefreshToken newRefreshToken)
        {
            var cookieOptions = new CookieOptions
            {
                HttpOnly = true,
                Expires = newRefreshToken.Expires
            };
            Response.Cookies.Append("refreshToken", newRefreshToken.Token, cookieOptions);

            user.RefreshToken = newRefreshToken.Token;
            user.TokenCreated = newRefreshToken.Created;
            user.TokenExpires = newRefreshToken.Expires;
        }

        private string CreateToken(User user)
        {
            List<Claim> claims = new List<Claim>
            {
                new Claim(ClaimTypes.NameIdentifier,  user.UserId.ToString()),
                new Claim(ClaimTypes.Email, user.Email),
                new Claim(ClaimTypes.Role, user.RoleNavigation.Name)
            };


            var key = new SymmetricSecurityKey(System.Text.Encoding.UTF8.GetBytes(
                _configuration.GetSection("JWT:Secret").Value));

            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha512Signature);

            var token = new JwtSecurityToken(
                _configuration["JWT:ValidIssuer"],
                _configuration["JWT:ValidAudience"],
                claims: claims,
                expires: DateTime.Now.AddDays(7),
                signingCredentials: creds);

            var jwt = new JwtSecurityTokenHandler().WriteToken(token);

            return jwt;
        }

        

    }
}
