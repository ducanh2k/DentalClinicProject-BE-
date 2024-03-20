using AutoMapper;
using Azure.Core;
using DentalClinicProject.DTO;
using DentalClinicProject.Models;
using DentalClinicProject.Services.Interface;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Numerics;
using System.Runtime.ConstrainedExecution;
using System.Security.Cryptography;
using static Microsoft.Extensions.Logging.EventSource.LoggingEventSource;

namespace DentalClinicProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : Controller
    {
        private readonly IUserService userService;

        public UserController(IUserService _userService)
        {
            userService = _userService;
        }
        
        [HttpGet("list")]
        public IActionResult GetUsers(int pageNumber)
        {
            try
            {
                var results = userService.GetUsers(pageNumber);
                return Ok(results);
            }catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("search")]
        public IActionResult GetUsersByName(string keyword, int pageNumber)
        {
            if (string.IsNullOrWhiteSpace(keyword))
            {
                return BadRequest("Từ khóa tìm kiếm không được để trống");
            }
            try
            {
                var results = userService.GetUsersByName(keyword,pageNumber);
                return Ok(results);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("{id}")]
        public IActionResult GetUser(int id)
        {

            try
            {
                var results = userService.GetUser(id);
                return Ok(results);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPost]
        public IActionResult AddUser(UserRegisterDTO userDTO)
        {
            try
            {
                userService.AddUser(userDTO);
                return Ok("Thêm mới người dùng thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Thêm mới thất bại");
            }
        }


        [HttpPut("{id}")]
        public ActionResult UpdateUser(int id, UserDTO userDTO)
        {
            try
            {
                userService.UpdateUser(id, userDTO);
                return Ok("Thêm mới người dùng thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Thêm mới thất bại");
            }
        }

        [HttpPut("changePassword/{id}")]
        public ActionResult ChangeUserPassword(int id, string Oldpassword, string Newpassword)
        {
            try
            {
                userService.ChangeUserPassword(id, Oldpassword, Newpassword);
                return Ok("Thêm mới người dùng thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Thêm mới thất bại");
            }
        }

        [HttpDelete("{id}")]
        public ActionResult DeleteUser(int id)
        {
            try
            {
                userService.DeleteUser(id);
                return Ok("Thêm mới người dùng thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Thêm mới thất bại");
            }
        }

        // CRUD Degree
        [HttpGet("degree")]
        public IActionResult GetDegreesByUserId(int userId)
        {
            try
            {
                var degrees = userService.GetDegreesByUserId(userId);
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
                var degrees = userService.GetDegree(Id);

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
            try
            {
                userService.AddDegree(degreeDTO);
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
                userService.UpdateDegree(id, degreeDTO);

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
                userService.DeleteDegree(id);

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
                var AreasOfExpertises = userService.GetAreasOfExpertisesByUserId(userId);
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
                
                var AreasOfExpertises = userService.GetAreasOfExpertise(Id);
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
                userService.AddAreaOfExpertise(areaOfExpertiseDTO);
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
                userService.UpdateAreaOfExpertise(id, updatedAreaOfExpertiseDTO);

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
                userService.DeleteAreaOfExpertise(id);

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
                
                var ForeignLanguages = userService.GetForeignLanguagesByUserId(userId);
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
                
                var ForeignLanguages = userService.GetForeignLanguage(Id);
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
                userService.AddForeignLanguage(foreignLanguageDTO);

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
                userService.UpdateForeignLanguage(id, updatedForeignLanguageDTO);

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
                userService.DeleteForeignLanguage(id);
                return Ok("Ngoại ngữ đã được xóa thành công");
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }


        [HttpGet("ParticipatingTrainingCourse")]
        public IActionResult GetParticipatingTrainingCoursesByUserId(int userId)
        {
            try
            {

                var ParticipatingTrainingCourses = userService.GetParticipatingTrainingCoursesByUserId(userId);
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
                var ParticipatingTrainingCourses = userService.GetParticipatingTrainingCourse(Id);
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
                userService.AddParticipatingTrainingCourse(participatingTrainingCourseDTO);

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
                userService.UpdateParticipatingTrainingCourse(id, updatedParticipatingTrainingCourseDTO);

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
                userService.DeleteParticipatingTrainingCourse(id);

                return Ok("Khóa đào tạo đã được xóa thành công");
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
            
        }



    }
}
