using AutoMapper;
using DentalClinicProject.DTO;
using DentalClinicProject.Models;
using DentalClinicProject.Services.Implement;
using DentalClinicProject.Services.Interface;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System.Runtime.ConstrainedExecution;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace DentalClinicProject.Controllers
{
    
    [Route("api/[controller]")]
    [ApiController]
    public class AppointmentController : ControllerBase
    {

        private readonly IAppointmentService appointmentService  ;

        public AppointmentController(IAppointmentService _appointmentService)
        {
            appointmentService = _appointmentService;
        }


        [HttpGet("list")]
        public IActionResult GetAppointments(int pageNumber)
        {
            try
            {
                var appointments = appointmentService.GetAppointments(pageNumber);
                return Ok(appointments);
            }catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("list/userId")]
        public IActionResult GetAppointmentsByUser(int pageNumber,int userId)
        {
            try
            {
                var appointments = appointmentService.GetAppointmentsByUserId(pageNumber, userId);
                return Ok(appointments);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("list/doctorId")]
        public IActionResult GetAppointmentsByDoctor(int pageNumber, int doctorId)
        {
            try
            {
                var appointments = appointmentService.GetAppointmentsByDoctorId(pageNumber, doctorId);
                return Ok(appointments);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("{id}")]
        public IActionResult GetAppointment(int id)
        {
            try
            {
                var appointments = appointmentService.GetAppointmentById(id);
                return Ok(appointments);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }



        [HttpGet("search")]
        public IActionResult GetAppointmentsBySearch(string keyword, int pageNumber)
        {
            try
            {
                var appointments = appointmentService.GetAppointmentsBySearch(pageNumber, keyword);
                return Ok(appointments);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPost]
        public IActionResult AddAppointment(AddAppointmentDTO appointmentDTO)
        {
            
            try
            {
                appointmentService.AddAppointment(appointmentDTO);
                return Ok("Thêm cuộc hẹn mới thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Thêm cuộc hẹn mới thất bại");
            }
        }

        [HttpPut("{id}")]
        public ActionResult UpdateAppointment(int id, UpdateAppointmentDTO appointmentDTO) 
        {
           
            try
            {
                appointmentService.UpdateAppointment(id, appointmentDTO);
                return Ok("Cập nhật cuộc hẹn thành công");
            }
            catch (Exception ex) { return BadRequest("Cập nhật cuộc hẹn thất bại"); }

        }

        [HttpDelete("{id}")]
        public ActionResult DeleteAppointment(int id)
        {
            try
            {
                appointmentService.DeleteAppointment(id);
                return Ok("Xoá cuộc hẹn thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Xoá cuộc hẹn thất bại");
            }
        }
    }
}
