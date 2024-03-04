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
                .Where(s => s.Name.Contains(keyword) || s.Email.Contains(keyword) || s.Phone.Contains(keyword) && s.DeleteFlag == false)
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

        [HttpGet("{id}")]
        public IActionResult GetUser(int id)
        {
       
            var user = _context.Users
        .Where(u => u.UserId == id)
        .Select(u => new
        {
            User = new
            {
                u.UserId,
                u.DateCreated,
                u.Name,
                u.Phone,
                u.Email,
                u.Img,
                u.Description,
                u.Salary,
                u.Password,
                u.DeleteFlag,
                u.Role,
                RoleName = u.RoleNavigation.Name
            },
            Degrees = u.Degrees.Select(d => new { d.Id, d.Detail }),
            AreasOfExpertises = u.AreasOfExpertises.Select(a => new { a.Id, a.Detail }),
            ForeignLanguages = u.ForeignLanguages.Select(f => new { f.Id, f.Detail }),
            ParticipatingTrainingCourses = u.ParticipatingTrainingCourses.Select(p => new { p.Id, p.Detail })
        })
        .FirstOrDefault();
            if (user == null)
            {
                return NotFound("Không có ");
            }
            return Ok(user);
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
                Password = userDTO.Password,
                DeleteFlag = userDTO.DeleteFlag,
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
                user.Phone = userDTO.Phone;
                user.Email = userDTO.Email;
                user.Img = userDTO.Img;
                user.Description = userDTO.Description;
                user.Salary = userDTO.Salary;
                user.Role = userDTO.RoleId;
                user.DeleteFlag = userDTO.DeleteFlag;
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

        // CRUD Degree
        [HttpGet("degree")]
        public IActionResult GetDegreesByUserId(int userId)
        {
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

        [HttpPost("degree")]
        public IActionResult AddDegree(DegreeDTO degreeDTO)
        {
            // Chuyển đổi từ DegreeDTO sang Degree nếu cần
            var degree = new Degree
            {
                EmployeeId = degreeDTO.EmployeeId,
                Detail = degreeDTO.Detail
            };

            _context.Degrees.Add(degree);
            _context.SaveChanges();

            return Ok("Degree đã được thêm thành công");
        }

        [HttpPut("degree/{id}")]
        public IActionResult UpdateDegree(int id, DegreeDTO degreeDTO)
        {
            var degree = _context.Degrees.FirstOrDefault(d => d.Id == id);
            if (degree == null)
            {
                return NotFound("Không tìm thấy degree");
            }

            // Cập nhật thông tin degree
            degree.EmployeeId = degreeDTO.EmployeeId;
            degree.Detail = degreeDTO.Detail;

            _context.SaveChanges();

            return Ok("Degree đã được cập nhật thành công");
        }

        [HttpDelete("degree/{id}")]
        public IActionResult DeleteDegree(int id)
        {
            var degree = _context.Degrees.FirstOrDefault(d => d.Id == id);
            if (degree == null)
            {
                return NotFound("Không tìm thấy degree");
            }

            _context.Degrees.Remove(degree);
            _context.SaveChanges();

            return Ok("Degree đã được xóa thành công");
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

        [HttpPost("AreasOfExpertise")]
        public IActionResult AddAreaOfExpertise(AreasOfExpertiseDTO areaOfExpertiseDTO)
        {
            var areaOfExpertise = new AreasOfExpertise
            {
                EmployeeId = areaOfExpertiseDTO.EmployeeId,
                Detail = areaOfExpertiseDTO.Detail
            };

            _context.AreasOfExpertises.Add(areaOfExpertise);
            _context.SaveChanges();

            return Ok("Kỹ năng chuyên môn đã được thêm thành công");
        }

        [HttpPut("AreasOfExpertise/{id}")]
        public IActionResult UpdateAreaOfExpertise(int id, AreasOfExpertiseDTO updatedAreaOfExpertiseDTO)
        {
            var areaOfExpertise = _context.AreasOfExpertises.FirstOrDefault(a => a.Id == id);
            if (areaOfExpertise == null)
            {
                return NotFound("Không tìm thấy kỹ năng chuyên môn");
            }

            // Cập nhật thông tin kỹ năng chuyên môn
            areaOfExpertise.EmployeeId = updatedAreaOfExpertiseDTO.EmployeeId;
            areaOfExpertise.Detail = updatedAreaOfExpertiseDTO.Detail;

            _context.SaveChanges();

            return Ok("Kỹ năng chuyên môn đã được cập nhật thành công");
        }

        [HttpDelete("AreasOfExpertise/{id}")]
        public IActionResult DeleteAreaOfExpertise(int id)
        {
            var areaOfExpertise = _context.AreasOfExpertises.FirstOrDefault(a => a.Id == id);
            if (areaOfExpertise == null)
            {
                return NotFound("Không tìm thấy kỹ năng chuyên môn");
            }

            _context.AreasOfExpertises.Remove(areaOfExpertise);
            _context.SaveChanges();

            return Ok("Kỹ năng chuyên môn đã được xóa thành công");
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

        [HttpPost("ForeignLanguages")]
        public IActionResult AddForeignLanguage(ForeignLanguageDTO foreignLanguageDTO)
        {
            var foreignLanguage = new ForeignLanguage
            {
                EmployeeId = foreignLanguageDTO.EmployeeId,
                Detail = foreignLanguageDTO.Detail
            };

            _context.ForeignLanguages.Add(foreignLanguage);
            _context.SaveChanges();

            return Ok("Ngoại ngữ đã được thêm thành công");
        }

        [HttpPut("ForeignLanguages/{id}")]
        public IActionResult UpdateForeignLanguage(int id, ForeignLanguageDTO updatedForeignLanguageDTO)
        {
            var foreignLanguage = _context.ForeignLanguages.FirstOrDefault(f => f.Id == id);
            if (foreignLanguage == null)
            {
                return NotFound("Không tìm thấy ngoại ngữ");
            }

            // Cập nhật thông tin ngoại ngữ
            foreignLanguage.EmployeeId = updatedForeignLanguageDTO.EmployeeId;
            foreignLanguage.Detail = updatedForeignLanguageDTO.Detail;

            _context.SaveChanges();

            return Ok("Ngoại ngữ đã được cập nhật thành công");
        }

        [HttpDelete("ForeignLanguages/{id}")]
        public IActionResult DeleteForeignLanguage(int id)
        {
            var foreignLanguage = _context.ForeignLanguages.FirstOrDefault(f => f.Id == id);
            if (foreignLanguage == null)
            {
                return NotFound("Không tìm thấy ngoại ngữ");
            }

            _context.ForeignLanguages.Remove(foreignLanguage);
            _context.SaveChanges();

            return Ok("Ngoại ngữ đã được xóa thành công");
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

        [HttpPost("ParticipatingTrainingCourses")]
        public IActionResult AddParticipatingTrainingCourse(ParticipatingTrainingCourseDTO participatingTrainingCourseDTO)
        {
            var participatingTrainingCourse = new ParticipatingTrainingCourse
            {
                EmployeeId = participatingTrainingCourseDTO.EmployeeId,
                Detail = participatingTrainingCourseDTO.Detail
            };

            _context.ParticipatingTrainingCourses.Add(participatingTrainingCourse);
            _context.SaveChanges();

            return Ok("Khóa đào tạo đã được thêm thành công");
        }

        [HttpPut("ParticipatingTrainingCourses/{id}")]
        public IActionResult UpdateParticipatingTrainingCourse(int id, ParticipatingTrainingCourseDTO updatedParticipatingTrainingCourseDTO)
        {
            var participatingTrainingCourse = _context.ParticipatingTrainingCourses.FirstOrDefault(p => p.Id == id);
            if (participatingTrainingCourse == null)
            {
                return NotFound("Không tìm thấy khóa đào tạo");
            }

            // Cập nhật thông tin khóa đào tạo
            participatingTrainingCourse.EmployeeId = updatedParticipatingTrainingCourseDTO.EmployeeId;
            participatingTrainingCourse.Detail = updatedParticipatingTrainingCourseDTO.Detail;

            _context.SaveChanges();

            return Ok("Khóa đào tạo đã được cập nhật thành công");
        }

        [HttpDelete("ParticipatingTrainingCourses/{id}")]
        public IActionResult DeleteParticipatingTrainingCourse(int id)
        {
            var participatingTrainingCourse = _context.ParticipatingTrainingCourses.FirstOrDefault(p => p.Id == id);
            if (participatingTrainingCourse == null)
            {
                return NotFound("Không tìm thấy khóa đào tạo");
            }

            _context.ParticipatingTrainingCourses.Remove(participatingTrainingCourse);
            _context.SaveChanges();

            return Ok("Khóa đào tạo đã được xóa thành công");
        }



    }
}
