using DentalClinicProject.DTO;
using DentalClinicProject.Models;
using DentalClinicProject.Services.Implement;
using DentalClinicProject.Services.Interface;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System;
using System.Runtime.ConstrainedExecution;
using System.Security.Claims;
namespace DentalClinicProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ServiceController : ControllerBase
    {
        
        private readonly IUserService _userService;
        private readonly IServiceService serviceService;

        public ServiceController(IServiceService _serviceService, IUserService userService)
        {
            serviceService = _serviceService;
            _userService = userService;
        }
        //get all


        
        //[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Doctor, Admin")]
        [HttpGet("list")]
        public IActionResult GetServices(int pageNumber)
        {
            try
            {
                var services = serviceService.GetServices(pageNumber);
                return Ok(services);
            }catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        //search name
        [HttpGet("search")]
        public IActionResult GetServicesByName(string keyword, int pageNumber)
        {
            try
            {
                var services = serviceService.GetServicesByName(keyword,pageNumber);
                return Ok(services);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("{id}")]
        public IActionResult GetService(int id)
        {
            try
            {
                var services = serviceService.GetService(id);
                return Ok(services);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }


        [HttpPost]
        public IActionResult AddService(ServiceDTO ser)
        {
            try
            {
                serviceService.AddService(ser);
                return Ok("Thêm mới dịch vụ thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Thêm mới dịch vụ thất bại");
            }
        }
        
        [HttpPut("{id}")]
        public ActionResult UpdateService(int id, ServiceDTO serDTO)
        {
            try
            {
                serviceService.UpdateService(id, serDTO);
                return Ok("Cập nhật dịch vụ thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Cập nhật dịch vụ thất bại");
            }
        }

        [HttpDelete("{id}")]
        public ActionResult DeleteService(int id)
        {
            try
            {
                serviceService.DeleteService(id);
                return Ok("Xóa dịch vụ thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Xóa dịch vụ thất bại");
            }
        }
    }
}
