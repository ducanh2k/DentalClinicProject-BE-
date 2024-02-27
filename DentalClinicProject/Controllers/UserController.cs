using AutoMapper;
using DentalClinicProject.DTO;
using DentalClinicProject.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Numerics;
using System.Runtime.ConstrainedExecution;

namespace DentalClinicProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : Controller
    {
        IMapper _mapper;
        private readonly dentalContext _context;

        public UserController(dentalContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }


        //get all 
        [HttpGet("list")]
        public IActionResult GetUsers()
        {
            List<User> users = _context.Users.Include(r => r.RoleNavigation).ToList();
            if (users == null || users.Count == 0)
            {
                return NotFound("Không có dịch vụ");
            }
            //map
            List<UserDTO> results = new List<UserDTO>();
            results = users.Select(_mapper.Map<User, UserDTO>).ToList();
            return Ok(results);
        }

        //search name
        [HttpGet("search")]
        public IActionResult GetUsersByName(string keyword)
        {
            if (string.IsNullOrWhiteSpace(keyword))
            {
                return BadRequest("Từ khóa tìm kiếm không được để trống");
            }

            var users = _context.Users.Include(r => r.RoleNavigation).Where(s => s.Name.Contains(keyword)).ToList();

            if (users == null || users.Count == 0)
            {
                return NotFound("Không có dịch vụ nào phù hợp");
            }

            //map
            List<UserDTO> results = new List<UserDTO>();
            results = users.Select(_mapper.Map<User, UserDTO>).ToList();
            return Ok(results);
        }

        [HttpPost]
        public IActionResult AddUser(UserDTO userDTO)
        {
            var user = new User
            {
                Name = userDTO.Name,
                DateCreated = DateTime.Now,
                Phone = userDTO.Phone,
                Email = userDTO.Email,
                Img = userDTO.Img,
                Description = userDTO.Description,
                Salary = userDTO.Salary,
                Role = userDTO.RoleId
            };
            try
            {
                _context.Users.Add(user);
                _context.SaveChanges();
                return Ok("Thêm mới thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Thêm mới thất bại");
            }
        }

        [HttpPut("{id}")]
        public ActionResult UpdateUser(int id, UserDTO userDTO)
        {
            var user = _context.Users.FirstOrDefault(o => o.UserId == id);
            if (User == null)
            {
                return NotFound();
            }
                user.Name = userDTO.Name;
                user.DateCreated = DateTime.Now;
                user.Phone = userDTO.Phone;
                user.Email = userDTO.Email;
                user.Img = userDTO.Img;
                user.Description = userDTO.Description;
                user.Salary = userDTO.Salary;
                user.Role = userDTO.RoleId;
            _context.SaveChanges();
            return NoContent();
        }

        
    }
}
