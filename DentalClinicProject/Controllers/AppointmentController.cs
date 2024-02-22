using DentalClinicProject.DTO;
using DentalClinicProject.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Runtime.ConstrainedExecution;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace DentalClinicProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AppointmentController : ControllerBase
    {
        private readonly dentalContext _context;

        public AppointmentController(dentalContext context)
        {
            _context = context;
        }

        [HttpGet("list")]
        public IActionResult GetAppointments()
        {
            var appointments = _context.Appointments.ToList();
            if (appointments == null || appointments.Count == 0)
            {
                return NotFound("Không có cuộc hẹn nào");
            }
            return Ok(appointments);
        }

        [HttpGet("search")]
        public IActionResult GetAppointmentsByPatientName(string patientName)
        {
            return NotFound("Không có cuộc hẹn nào phù hợp");
        }

        [HttpPost]
        public IActionResult AddAppointment(AppointmentDTO appointmentDTO)
        {
            var appointment = new Appointment
            {
                EmployeeId = appointmentDTO.EmployeeId,
                PatientId = appointmentDTO.PatientId,
                Datetime = appointmentDTO.Datetime,
                Note = appointmentDTO.Note,
                Status = appointmentDTO.Status
            };

            try
            {
                _context.Appointments.Add(appointment);
                _context.SaveChanges();
                return Ok("Thêm cuộc hẹn mới thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Thêm cuộc hẹn mới thất bại");
            }
        }

        [HttpPut("{id}")]
        public ActionResult UpdateAppointment(int id, AppointmentDTO appointmentDTO)
        {
            var appointment = _context.Appointments.FirstOrDefault(a => a.AppointmentId == id);
            if (appointment == null)
            {
                return NotFound();
            }

            appointment.EmployeeId = appointmentDTO.EmployeeId;
            appointment.PatientId = appointmentDTO.PatientId;
            appointment.Datetime = appointmentDTO.Datetime;
            appointment.Note = appointmentDTO.Note;
            appointment.Status = appointmentDTO.Status;

            _context.SaveChanges();
            return NoContent();
        }

        [HttpDelete("{id}")]
        public ActionResult DeleteAppointment(int id)
        {
            var appointment = _context.Appointments.FirstOrDefault(a => a.AppointmentId == id);
            if (appointment == null)
            {
                return NotFound();
            }

            _context.Remove(appointment);
            _context.SaveChanges();
            return NoContent();
        }
    }
}
