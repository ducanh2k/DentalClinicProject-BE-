using AutoMapper;
using DentalClinicProject.DTO;
using DentalClinicProject.Models;
using DentalClinicProject.Services.Interface;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;

namespace DentalClinicProject.Services.Implement
{
    public class AppointmentService : IAppointmentService
    {
        IMapper _mapper;
        private readonly dentalContext _context;
        private readonly IConfiguration _configuration;
        private readonly int PageSize;

        public AppointmentService(dentalContext context, IMapper mapper, IConfiguration configuration)
        {
            _context = context;
            _mapper = mapper;
            _configuration = configuration;
            PageSize = Convert.ToInt32(_configuration.GetValue<string>("AppSettings:PageSize"));
        }


        public List<AppointmentDTO> GetAppointments(int pageNumber)
        {
            try
            {
                var appointments = _context.Appointments
                    .Include(u => u.Employee)
                    .Include(u => u.Patient)
                    .Include(u => u.Doctor)
                    .Include(u => u.MedicalRecordDetail)
                        .ThenInclude(u => u.Service)
                    .Include(u => u.MedicalRecordDetail)
                        .ThenInclude(u => u.Prescription)
                    .Where(s => s.DeleteFlag == false)
                    .ToList();

                if (appointments == null || appointments.Count == 0)
                {
                    throw new Exception("Không có cuộc hẹn nào");
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
                return results;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        public List<AppointmentDTO> GetAppointmentsByUserId(int pageNumber, int userId)
        {
            try
            {
                var appointments = _context.Appointments
                .Include(u => u.Employee)
                .Include(u => u.Patient)
                .Include(u => u.Doctor)
                .Include(u => u.MedicalRecordDetail)
                    .ThenInclude(u => u.Service)
                .Include(u => u.MedicalRecordDetail)
                    .ThenInclude(u => u.Prescription)
                .Where(s => s.DeleteFlag == false && s.PatientId == userId)
                .ToList();
                if (appointments == null || appointments.Count == 0)
                {
                    throw new Exception("Không có cuộc hẹn nào");
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
                return results;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public AppointmentDTO GetAppointmentById(int id)
        {
            try
            {
                var appointment = _context.Appointments
                .Include(u => u.Employee)
                .Include(u => u.Patient)
                .Include(u => u.Doctor)
                .Include(u => u.MedicalRecordDetail)
                    .ThenInclude(u => u.Service)
                .Include(u => u.MedicalRecordDetail)
                    .ThenInclude(u => u.Prescription)
                .FirstOrDefault(s => s.DeleteFlag == false && s.AppointmentId == id);

                if (appointment == null)
                {
                    throw new Exception("Không có cuộc hẹn nào");
                }

                AppointmentDTO result = _mapper.Map<Appointment, AppointmentDTO>(appointment);
                return result ;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public List<AppointmentDTO> GetAppointmentsBySearch(int pageNumber, string keyword)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(keyword))
                {
                    throw new Exception("Từ khóa tìm kiếm không được để trống");
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
                    throw new Exception("Không có cuộc hẹn nào");
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
                return results;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void AddAppointment(AddAppointmentDTO appointmentDTO)
        {
            try
            {
                var appointment = new Appointment
                {
                    MedicalRecordDetailId = appointmentDTO.MedicalRecordDetailId,
                    EmployeeId = appointmentDTO.EmployeeId,
                    PatientId = appointmentDTO.PatientId,
                    DoctorId = appointmentDTO.DoctorId,
                    Datetime = DateTime.Now,
                    Note = appointmentDTO.Note,
                    Status = "Pending",
                    DeleteFlag = false
                };

                _context.Appointments.Add(appointment);
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void UpdateAppointment(int id, UpdateAppointmentDTO appointmentDTO)
        {
            try
            {
                var appointment = _context.Appointments.Include(m => m.MedicalRecordDetail)
                    .FirstOrDefault(a => a.AppointmentId == id);
                if (appointment == null)
                {
                    throw new Exception("Không có cuộc hẹn nào");
                }
                appointment.MedicalRecordDetailId = appointmentDTO.MedicalRecordDetailId;
                appointment.EmployeeId = appointmentDTO.EmployeeId;
                appointment.PatientId = appointmentDTO.PatientId;
                appointment.DoctorId = appointmentDTO.DoctorId;
                appointment.Note = appointmentDTO.Note;
                appointment.Status = appointmentDTO.Status;
                appointment.DeleteFlag = appointmentDTO.DeleteFlag;
                _context.SaveChanges();

                if (appointment.Status == "Doned")
                {
                    var medicalRecord = _context.MedicalRecords.FirstOrDefault(x => x.PatientId == appointment.PatientId);
                    // Tạo ra medical record details mới vì khám bệnh mới 
                    if (appointmentDTO.MedicalRecordDetailId == null)
                    {

                        var MedicalRecordDetail = new MedicalRecordDetail
                        {
                            MedicalRecordId = medicalRecord.MedicalRecordId,
                            DeleteFlag = false
                        };
                        try
                        {
                            _context.MedicalRecordDetails.Add(MedicalRecordDetail);
                            _context.SaveChanges();
                            appointment.MedicalRecordDetailId = MedicalRecordDetail.MrDetailId;
                            _context.SaveChanges();
                        }
                        catch (Exception ex)
                        {
                            throw new Exception("Cập nhật hồ sơ thất bại");
                        }
                    }


                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void DeleteAppointment(int id)
        {
            try
            {
                var appointment = _context.Appointments.FirstOrDefault(a => a.AppointmentId == id);
                if (appointment == null)
                {
                    throw new Exception("Không có cuộc hẹn nào");
                }

                appointment.DeleteFlag = true;
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public List<AppointmentDTO> GetAppointmentsByDoctorId(int pageNumber, int doctorId)
        {
            try
            {
                var appointments = _context.Appointments
                .Include(u => u.Employee)
                .Include(u => u.Patient)
                .Include(u => u.Doctor)
                .Include(u => u.MedicalRecordDetail)
                    .ThenInclude(u => u.Service)
                .Include(u => u.MedicalRecordDetail)
                    .ThenInclude(u => u.Prescription)
                .Where(s => s.DeleteFlag == false && s.DoctorId == doctorId && (s.Status == "Approved" || s.Status == "Doned"))
                .ToList();
                if (appointments == null || appointments.Count == 0)
                {
                    throw new Exception("Không có cuộc hẹn nào");
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
                return results;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
