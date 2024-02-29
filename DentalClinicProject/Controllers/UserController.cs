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
        private readonly IConfiguration _configuration;
        public readonly int PageSize;
        public UserController(dentalContext context, IMapper mapper, IConfiguration configuration)
        {
            _context = context;
            _mapper = mapper;
            _configuration = configuration;
            PageSize = Convert.ToInt32(_configuration.GetValue<string>("AppSettings:PageSize"));
        }


        //get all 
        [HttpGet("list")]
        public IActionResult GetUsers(int pageNumber)
        {
            var totalUsers = _context.Users
                              .Count(s => s.DeleteFlag == false);

            var totalPages = (int)Math.Ceiling((double)totalUsers / PageSize);

            if (pageNumber <= 0) pageNumber = 1;
            if (pageNumber > totalPages) pageNumber = totalPages;
            List<User> users = _context.Users
                .Include(r => r.RoleNavigation)
                .Where(x => x.DeleteFlag == false)
                .Skip((pageNumber - 1) * PageSize)
                .Take(PageSize)
                .ToList();
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
        public IActionResult GetUsersByName(string keyword, int pageNumber)
        {
            if (string.IsNullOrWhiteSpace(keyword))
            {
                return BadRequest("Từ khóa tìm kiếm không được để trống");
            }
            var totalUsers = _context.Users
                              .Count(s => s.DeleteFlag == false);

            var totalPages = (int)Math.Ceiling((double)totalUsers / PageSize);

            if (pageNumber <= 0) pageNumber = 1;
            if (pageNumber > totalPages) pageNumber = totalPages;

            var users = _context.Users
                .Include(r => r.RoleNavigation)
                .Where(s => s.Name.Contains(keyword) && s.DeleteFlag == false)
                .Skip((pageNumber - 1) * PageSize)
                .Take(PageSize)
                .ToList();

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
                Role = userDTO.RoleId,
                DeleteFlag = false,
                Password = userDTO.Password,
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
            user.DeleteFlag = userDTO.DeleteFlag;
            user.Password = userDTO.Password;
            _context.SaveChanges();
            return NoContent();
        }

        [HttpDelete("{id}")]
        public ActionResult DeleteUser(int id)
        {
            var user = _context.Users.FirstOrDefault(o => o.UserId == id);
            if (user == null)
            {
                return NotFound();
            }
            user.DeleteFlag = true;
            _context.SaveChanges();
            return NoContent();
        }


        [HttpGet("degree")]
        public IActionResult GetDegreesByUserId(int userId)
        {
            var user = _context.Users.FirstOrDefault(r => r.UserId == userId);

            var degrees = _context.Degrees
                    .Where(d => d.EmployeeId == userId)
                    .Select(d => new
                    {
                        d.Id,
                        d.EmployeeId,
                        d.Detail
                    })
                    .ToList();

            if (degrees == null || degrees.Count == 0)
            {
                return NotFound("Không có gi");
            }
            return Ok(degrees);
        }

        [HttpGet("AreasOfExpertise")]
        public IActionResult GetAreasOfExpertisesByUserId(int userId)
        {
            var user = _context.Users.FirstOrDefault(r => r.UserId == userId);

            var AreasOfExpertises = _context.AreasOfExpertises
                    .Where(d => d.EmployeeId == userId)
                    .Select(d => new
                    {
                        d.Id,
                        d.EmployeeId,
                        d.Detail
                    })
                    .ToList();

            if (AreasOfExpertises == null || AreasOfExpertises.Count == 0)
            {
                return NotFound("Không có gi");
            }
            return Ok(AreasOfExpertises);
        }

        [HttpGet("ForeignLanguages")]
        public IActionResult GetForeignLanguagesByUserId(int userId)
        {
            var user = _context.Users.FirstOrDefault(r => r.UserId == userId);

            var ForeignLanguages = _context.ForeignLanguages
                    .Where(d => d.EmployeeId == userId)
                    .Select(d => new
                    {
                        d.Id,
                        d.EmployeeId,
                        d.Detail
                    })
                    .ToList();

            if (ForeignLanguages == null || ForeignLanguages.Count == 0)
            {
                return NotFound("Không có gi");
            }
            return Ok(ForeignLanguages);
        }

        [HttpGet("ParticipatingTrainingCourse")]
        public IActionResult GetParticipatingTrainingCoursesByUserId(int userId)
        {
            var user = _context.Users.FirstOrDefault(r => r.UserId == userId);

            var ParticipatingTrainingCourses = _context.ParticipatingTrainingCourses
                    .Where(d => d.EmployeeId == userId)
                    .Select(d => new
                    {
                        d.Id,
                        d.EmployeeId,
                        d.Detail
                    })
                    .ToList();

            if (ParticipatingTrainingCourses == null || ParticipatingTrainingCourses.Count == 0)
            {
                return NotFound("Không có gi");
            }
            return Ok(ParticipatingTrainingCourses);
        }



    }
}
