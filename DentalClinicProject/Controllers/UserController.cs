using AutoMapper;
using Azure.Core;
using DentalClinicProject.DTO;
using DentalClinicProject.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Numerics;
using System.Runtime.ConstrainedExecution;
using System.Security.Cryptography;

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
        private void CreatePasswordHash(string password, out byte[] passwordHash, out byte[] passwordSalt)
        {
            using (var hmac = new HMACSHA512())
            {
                passwordSalt = hmac.Key;
                passwordHash = hmac.ComputeHash(System.Text.Encoding.UTF8.GetBytes(password));
            }
        }

        private bool VerifyPasswordHash(string password, byte[] passwordHash, byte[] passwordSalt)
        {
            using (var hmac = new HMACSHA512(passwordSalt))
            {
                var computedHash = hmac.ComputeHash(System.Text.Encoding.UTF8.GetBytes(password));
                return computedHash.SequenceEqual(passwordHash);
            }
        }

        //get all 
        [HttpGet("list")]
        public IActionResult GetUsers(int pageNumber)
        {
            var totalUsers = _context.Users
                              .Count(s => s.DeleteFlag == false);

            var totalPages = (int)Math.Ceiling((double)totalUsers / PageSize);
            var getPageNumber = pageNumber;
            if (pageNumber <= 0) getPageNumber += 1;
            if (pageNumber > totalPages) getPageNumber = totalPages;
            
            List<User> users = _context.Users
                .Include(r => r.RoleNavigation)
                .Where(x => x.DeleteFlag == false)
                .Skip((getPageNumber - 1) * PageSize)
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
                u.PasswordHash,
                u.PasswordSalt,
                u.RefreshToken,
                u.TokenCreated,
                u.TokenExpires,
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
                //PasswordHash = userDTO.PasswordHash,
                //PasswordSalt = userDTO.PasswordSalt,
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
            if (user == null)
            {
                return NotFound();
            }

            try {
                user.Name = userDTO.Name;
                user.Phone = userDTO.Phone;
                user.Email = userDTO.Email;
                user.Img = userDTO.Img;
                user.Description = userDTO.Description;
                user.Salary = userDTO.Salary;
                user.Role = userDTO.RoleId;
                user.DeleteFlag = userDTO.DeleteFlag;
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
                
            _context.SaveChanges();
            return NoContent();
        }

        [HttpPut("changePassword/{id}")]
        public ActionResult ChangeUserPassword(int id, string Oldpassword, string Newpassword)
        {
            var user = _context.Users.FirstOrDefault(o => o.UserId == id);
            if (user == null)
            {
                return NotFound();
            }

            try
            {
                if (!VerifyPasswordHash(Oldpassword, user.PasswordHash, user.PasswordSalt))
                {
                    return BadRequest("Wrong password.");
                }
                CreatePasswordHash(Newpassword, out byte[] passwordHash, out byte[] passwordSalt);
                user.PasswordHash = passwordHash;
                user.PasswordSalt = passwordSalt;
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
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
            try
            {
                var user = _context.Users.FirstOrDefault(x => x.UserId == userId);
                if (user.Role != 3)
                {
                    return BadRequest("Người dùng không phải là bác sĩ");
                }

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
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("degree/{Id}")]
        public IActionResult GetDegree(int Id)
        {
            try
            {
                var degrees = _context.Degrees
                    .Select(d => new
                    {
                        d.Id,
                        d.EmployeeId,
                        d.Detail
                    }).FirstOrDefault(x => x.Id == Id);

                return Ok(degrees);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPost("degree")]
        public IActionResult AddDegree(DegreeDTO degreeDTO)
        {
            // Chuyển đổi từ DegreeDTO sang Degree nếu cần
            try
            {
                var degree = new Degree
                {
                    EmployeeId = degreeDTO.EmployeeId,
                    Detail = degreeDTO.Detail
                };

                var user = _context.Users.FirstOrDefault(x => x.UserId == degree.EmployeeId);
                if (user.Role != 3)
                {
                    return BadRequest("Người dùng không phải là bác sĩ");
                }

                _context.Degrees.Add(degree);
                _context.SaveChanges();

                return Ok("Degree đã được thêm thành công");
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    


        [HttpPut("degree/{id}")]
        public IActionResult UpdateDegree(int id, DegreeDTO degreeDTO)
        {
            try
            {
                var degree = _context.Degrees.FirstOrDefault(d => d.Id == id);

                if (degree == null)
                {
                    return NotFound("Không tìm thấy degree");
                }

                // Cập nhật thông tin degree
                degree.EmployeeId = degreeDTO.EmployeeId;
                degree.Detail = degreeDTO.Detail;
                var user = _context.Users.FirstOrDefault(x => x.UserId == degree.EmployeeId);
                if (user.Role != 3)
                {
                    return BadRequest("Người dùng không phải là bác sĩ");
                }
                _context.SaveChanges();

                return Ok("Degree đã được cập nhật thành công");
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
            
        }

        [HttpDelete("degree/{id}")]
        public IActionResult DeleteDegree(int id)
        {
            try
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
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
            
        }



        [HttpGet("AreasOfExpertise")]
        public IActionResult GetAreasOfExpertisesByUserId(int userId)
        {
            try
            {
                var user = _context.Users.FirstOrDefault(r => r.UserId == userId);
                if (user.Role != 3)
                {
                    return BadRequest("Người dùng không phải là bác sĩ");
                }
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
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
            
        }

        [HttpGet("AreasOfExpertise/{Id}")]
        public IActionResult GetAreasOfExpertise(int Id)
        {
            try
            {
                
                var AreasOfExpertises = _context.AreasOfExpertises
                        .Select(d => new
                        {
                            d.Id,
                            d.EmployeeId,
                            d.Detail
                        })
                        .FirstOrDefault(d => d.Id == Id);

                var user = _context.Users.FirstOrDefault(r => r.UserId == AreasOfExpertises.EmployeeId);
                if (user.Role != 3)
                {
                    return BadRequest("Người dùng không phải là bác sĩ");
                }

                if (AreasOfExpertises == null)
                {
                    return NotFound("Không có gi");
                }
                return Ok(AreasOfExpertises);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }

        }

        [HttpPost("AreasOfExpertise")]
        public IActionResult AddAreaOfExpertise(AreasOfExpertiseDTO areaOfExpertiseDTO)
        {
            try
            {
                var areaOfExpertise = new AreasOfExpertise
                {
                    EmployeeId = areaOfExpertiseDTO.EmployeeId,
                    Detail = areaOfExpertiseDTO.Detail
                };
                var user = _context.Users.FirstOrDefault(r => r.UserId == areaOfExpertise.EmployeeId);
                if (user.Role != 3)
                {
                    return BadRequest("Người dùng không phải là bác sĩ");
                }
                _context.AreasOfExpertises.Add(areaOfExpertise);
                _context.SaveChanges();

                return Ok("Kỹ năng chuyên môn đã được thêm thành công");
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPut("AreasOfExpertise/{id}")]
        public IActionResult UpdateAreaOfExpertise(int id, AreasOfExpertiseDTO updatedAreaOfExpertiseDTO)
        {
            try
            {
                var areaOfExpertise = _context.AreasOfExpertises.FirstOrDefault(a => a.Id == id);
                if (areaOfExpertise == null)
                {
                    return NotFound("Không tìm thấy kỹ năng chuyên môn");
                }

                // Cập nhật thông tin kỹ năng chuyên môn
                areaOfExpertise.EmployeeId = updatedAreaOfExpertiseDTO.EmployeeId;
                areaOfExpertise.Detail = updatedAreaOfExpertiseDTO.Detail;
                var user = _context.Users.FirstOrDefault(r => r.UserId == areaOfExpertise.EmployeeId);
                if (user.Role != 3)
                {
                    return BadRequest("Người dùng không phải là bác sĩ");
                }
                _context.SaveChanges();

                return Ok("Kỹ năng chuyên môn đã được cập nhật thành công");
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpDelete("AreasOfExpertise/{id}")]
        public IActionResult DeleteAreaOfExpertise(int id)
        {
            try
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
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }


        [HttpGet("ForeignLanguages")]
        public IActionResult GetForeignLanguagesByUserId(int userId)
        {
            try
            {
                var user = _context.Users.FirstOrDefault(r => r.UserId == userId);
                if (user.Role != 3)
                {
                    return BadRequest("Người dùng không phải là bác sĩ");
                }
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
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }

            
        }

        [HttpGet("ForeignLanguages/{Id}")]
        public IActionResult GetForeignLanguage(int Id)
        {
            try
            {
                
                var ForeignLanguages = _context.ForeignLanguages
                        .Select(d => new
                        {
                            d.Id,
                            d.EmployeeId,
                            d.Detail
                        })
                        .FirstOrDefault(d => d.Id == Id);
                var user = _context.Users.FirstOrDefault(r => r.UserId == ForeignLanguages.EmployeeId);
                if (user.Role != 3)
                {
                    return BadRequest("Người dùng không phải là bác sĩ");
                }
                if (ForeignLanguages == null)
                {
                    return NotFound("Không có gi");
                }
                return Ok(ForeignLanguages);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }


        }

        [HttpPost("ForeignLanguages")]
        public IActionResult AddForeignLanguage(ForeignLanguageDTO foreignLanguageDTO)
        {
            try
            {
                var foreignLanguage = new ForeignLanguage
                {
                    EmployeeId = foreignLanguageDTO.EmployeeId,
                    Detail = foreignLanguageDTO.Detail
                };
                var user = _context.Users.FirstOrDefault(r => r.UserId == foreignLanguage.EmployeeId);
                if (user.Role != 3)
                {
                    return BadRequest("Người dùng không phải là bác sĩ");
                }
                _context.ForeignLanguages.Add(foreignLanguage);
                _context.SaveChanges();

                return Ok("Ngoại ngữ đã được thêm thành công");
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
            
        }

        [HttpPut("ForeignLanguages/{id}")]
        public IActionResult UpdateForeignLanguage(int id, ForeignLanguageDTO updatedForeignLanguageDTO)
        {
            try
            {
                var foreignLanguage = _context.ForeignLanguages.FirstOrDefault(f => f.Id == id);
                if (foreignLanguage == null)
                {
                    return NotFound("Không tìm thấy ngoại ngữ");
                }

                // Cập nhật thông tin ngoại ngữ
                foreignLanguage.EmployeeId = updatedForeignLanguageDTO.EmployeeId;
                foreignLanguage.Detail = updatedForeignLanguageDTO.Detail;
                var user = _context.Users.FirstOrDefault(r => r.UserId == foreignLanguage.EmployeeId);
                if (user.Role != 3)
                {
                    return BadRequest("Người dùng không phải là bác sĩ");
                }
                _context.SaveChanges();

                return Ok("Ngoại ngữ đã được cập nhật thành công");
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }

            
        }

        [HttpDelete("ForeignLanguages/{id}")]
        public IActionResult DeleteForeignLanguage(int id)
        {
            try
            {

            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }

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
            try
            {
                var user = _context.Users.FirstOrDefault(r => r.UserId == userId);
                if (user.Role != 3)
                {
                    return BadRequest("Người dùng không phải là bác sĩ");
                }

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
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
            
        }

        [HttpGet("ParticipatingTrainingCourse/{Id}")]
        public IActionResult GetParticipatingTrainingCourse(int Id)
        {
            try
            {
                

                var ParticipatingTrainingCourses = _context.ParticipatingTrainingCourses
                        .Select(d => new
                        {
                            d.Id,
                            d.EmployeeId,
                            d.Detail
                        })
                        .FirstOrDefault(d => d.Id == Id);
                var user = _context.Users.FirstOrDefault(r => r.UserId == ParticipatingTrainingCourses.EmployeeId);
                if (user.Role != 3)
                {
                    return BadRequest("Người dùng không phải là bác sĩ");
                }
                if (ParticipatingTrainingCourses == null)
                {
                    return NotFound("Không có gi");
                }
                return Ok(ParticipatingTrainingCourses);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }

        }

        [HttpPost("ParticipatingTrainingCourses")]
        public IActionResult AddParticipatingTrainingCourse(ParticipatingTrainingCourseDTO participatingTrainingCourseDTO)
        {
            try
            {
                var participatingTrainingCourse = new ParticipatingTrainingCourse
                {
                    EmployeeId = participatingTrainingCourseDTO.EmployeeId,
                    Detail = participatingTrainingCourseDTO.Detail
                };
                var user = _context.Users.FirstOrDefault(r => r.UserId == participatingTrainingCourse.EmployeeId);
                if (user.Role != 3)
                {
                    return BadRequest("Người dùng không phải là bác sĩ");
                }
                _context.ParticipatingTrainingCourses.Add(participatingTrainingCourse);
                _context.SaveChanges();

                return Ok("Khóa đào tạo đã được thêm thành công");
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
            
        }

        [HttpPut("ParticipatingTrainingCourses/{id}")]
        public IActionResult UpdateParticipatingTrainingCourse(int id, ParticipatingTrainingCourseDTO updatedParticipatingTrainingCourseDTO)
        {
            try
            {
                var participatingTrainingCourse = _context.ParticipatingTrainingCourses.FirstOrDefault(p => p.Id == id);
                if (participatingTrainingCourse == null)
                {
                    return NotFound("Không tìm thấy khóa đào tạo");
                }
                var user = _context.Users.FirstOrDefault(r => r.UserId == participatingTrainingCourse.EmployeeId);
                if (user.Role != 3)
                {
                    return BadRequest("Người dùng không phải là bác sĩ");
                }
                // Cập nhật thông tin khóa đào tạo
                participatingTrainingCourse.EmployeeId = updatedParticipatingTrainingCourseDTO.EmployeeId;
                participatingTrainingCourse.Detail = updatedParticipatingTrainingCourseDTO.Detail;

                _context.SaveChanges();

                return Ok("Khóa đào tạo đã được cập nhật thành công");
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
            
        }

        [HttpDelete("ParticipatingTrainingCourses/{id}")]
        public IActionResult DeleteParticipatingTrainingCourse(int id)
        {
            try
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
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
            
        }



    }
}
