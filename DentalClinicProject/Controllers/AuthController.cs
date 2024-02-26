using DentalClinicProject.DTO;
using DentalClinicProject.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace DentalClinicProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : Controller
    {
        private readonly dentalContext _context;
        private readonly string _jwtSecret;

        public AuthController(dentalContext context)
        {
            _context = context;
            _jwtSecret = "your_secret_key";
        }

        [HttpPost("login")]
        public IActionResult Login(UserDTO userDTO)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest("Invalid login data.");
            }

            var user = _context.Users.SingleOrDefault(u => u.Phone == userDTO.Phone
            && u.Password == userDTO.Password);
            if(user == null)
            {
                return Unauthorized();
            }

            var token = GenerateToken(user.UserId);

            return Ok(new { Token = token });
        }

        [HttpPost("register")]
        public IActionResult Register(UserDTO model)
        {
            // Check if the username is already taken
            if (_context.Users.Any(u => u.Email == model.Email))
            {
                return BadRequest("Email is already taken");
            }

            // Create a new user
            var newUser = new User
            {
                Name = model.Name,
                Phone = model.Phone,
                Email = model.Email,
                Password = model.Password
            };

            _context.Users.Add(newUser);
            _context.SaveChanges();

            return Ok("Register Successfully.");
        }

        private string GenerateToken(int userId)
        {
            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(_jwtSecret);

            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new[]
                {
                new Claim(ClaimTypes.NameIdentifier, userId.ToString())
            }),
                Expires = DateTime.UtcNow.AddDays(7), // Token expiration time
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            };

            var token = tokenHandler.CreateToken(tokenDescriptor);
            return tokenHandler.WriteToken(token);
        }
    }
}
