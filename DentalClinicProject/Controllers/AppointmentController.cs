using AutoMapper;
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
        IMapper _mapper;
        private readonly dentalContext _context;
        private readonly IConfiguration _configuration;
        private readonly int PageSize;

        public AppointmentController(dentalContext context, IMapper mapper, IConfiguration configuration)
        {
            _context = context;
            _mapper = mapper;
            _configuration = configuration;
            PageSize = Convert.ToInt32(_configuration.GetValue<string>("AppSettings:PageSize"));
        }

        [HttpGet("list")]
        public IActionResult GetAppointments(int pageNumber)
        {
            var appointments = _context.Appointments
                .Include(u => u.Employee)
                .Include(u => u.Patient)
                .Include(u => u.Doctor)
                .Where(s => s.DeleteFlag == false)
                .ToList();
            if (appointments == null || appointments.Count == 0)
            {
                return NotFound("Không có cuộc hẹn nào");
            }
            var totalAppointments = appointments.Count();

            var totalPages = (int)Math.Ceiling((double)totalAppointments / PageSize);

            if (pageNumber <= 0) pageNumber = 1;
            if (pageNumber > totalPages) pageNumber = totalPages;
            appointments = appointments
                .Skip((pageNumber - 1) * PageSize)
                .Take(PageSize)
                .ToList();
            
            List<AppointmentDTO> results = new List<AppointmentDTO>();
            results = appointments.Select(_mapper.Map<Appointment, AppointmentDTO>).ToList();
            return Ok(results);
        }

        [HttpGet("{id}")]
        public IActionResult GetAppointment(int id)
        {
            var appointment = _context.Appointments
                .Include(u => u.Employee)
                .Include(u => u.Patient)
                .Include(u => u.Doctor)
                .FirstOrDefault(s => s.DeleteFlag == false && s.AppointmentId == id);

            if (appointment == null)
            {
                return NotFound("Không có cuộc hẹn nào");
            }

            AppointmentDTO result = _mapper.Map<Appointment, AppointmentDTO>(appointment);
            return Ok(result);
        }



        [HttpGet("search")]
        public IActionResult GetAppointmentsBySearch(string keyword, int pageNumber)
        {
            if (string.IsNullOrWhiteSpace(keyword))
            {
                return BadRequest("Từ khóa tìm kiếm không được để trống");
            }

            var appointments = _context.Appointments
                .Include(u => u.Employee)
                .Include(u => u.Patient)
                .Include(u => u.Doctor)
                .Where(
                s => s.Patient.Name.Contains(keyword)
                || s.Employee.Name.Contains(keyword)
                || s.Doctor.Name.Contains(keyword)
                || s.Note.Contains(keyword)
                && s.DeleteFlag == false
                )
                .ToList();
            if (appointments == null || appointments.Count == 0)
            {
                return NotFound("Không có cuộc hẹn nào");
            }


            var totalAppointments = appointments.Count();

            var totalPages = (int)Math.Ceiling((double)totalAppointments / PageSize);

            if (pageNumber <= 0) pageNumber = 1;
            if (pageNumber > totalPages) pageNumber = totalPages;
            appointments = appointments
                .Skip((pageNumber - 1) * PageSize)
                .Take(PageSize)
                .ToList();
            
            List<AppointmentDTO> results = new List<AppointmentDTO>();
            results = appointments.Select(_mapper.Map<Appointment, AppointmentDTO>).ToList();
            return Ok(results);
        }

        [HttpPost]
        public IActionResult AddAppointment(AppointmentDTO appointmentDTO)
        {
            var appointment = new Appointment
            {
                MedicalRecordDetailId = appointmentDTO.MedicalRecordDetailId,
                EmployeeId = appointmentDTO.EmployeeId,
                PatientId = appointmentDTO.PatientId,
                DoctorId = appointmentDTO.DoctorId,
                Datetime = DateTime.Now,
                Note = appointmentDTO.Note,
                Status = "1",
                DeleteFlag = false
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
            appointment.MedicalRecordDetailId = appointmentDTO.MedicalRecordDetailId;
            appointment.EmployeeId = appointmentDTO.EmployeeId;
            appointment.PatientId = appointmentDTO.PatientId;
            appointment.DoctorId = appointmentDTO.DoctorId;
            appointment.Note = appointmentDTO.Note;
            appointment.Status = appointmentDTO.Status;
            appointment.DeleteFlag = appointmentDTO.DeleteFlag;
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

            appointment.DeleteFlag = true;
            _context.SaveChanges();
            return NoContent();
        }
    }
}
