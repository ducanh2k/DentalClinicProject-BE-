using AutoMapper;
using DentalClinicProject.DTO;
using DentalClinicProject.Models;
using DentalClinicProject.Services.Interface;
using Microsoft.EntityFrameworkCore;

namespace DentalClinicProject.Services.Implement
{
    public class MedicalRecordService : IMedicalRecordService
    {
        IMapper _mapper;
        private readonly dentalContext _context;
        private readonly IConfiguration _configuration;
        public readonly int PageSize;
        public MedicalRecordService(dentalContext context, IMapper mapper, IConfiguration configuration)
        {
            _context = context;
            _mapper = mapper;
            _configuration = configuration;
            PageSize = Convert.ToInt32(_configuration.GetValue<string>("AppSettings:PageSize"));
        }
        public void AddMedicalRecord(MedicalRecordDTO MedicalRecordDTO)
        {
            try
            {
                var MedicalRecord = new MedicalRecord
                {
                    PatientId = MedicalRecordDTO.PatientId,
                    DeleteFlag = false
                };
                _context.MedicalRecords.Add(MedicalRecord);
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void DeleteMedicalRecord(int id)
        {
            try
            {
                var MedicalRecord = _context.MedicalRecords.FirstOrDefault(o => o.MedicalRecordId == id);
                if (MedicalRecord == null)
                {
                    throw new Exception("Hồ sơ không tồn tại");
                }
                MedicalRecord.DeleteFlag = true;
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public object GetMedicalRecord(int id)
        {
            try
            {
                var medicalRecords = _context.MedicalRecords
                .Include(mr => mr.Patient)
                .Include(mr => mr.MedicalRecordDetails)
                .Include(mr => mr.MedicalRecordDetails)
                    .ThenInclude(md => md.Prescription)
                .Include(mr => mr.MedicalRecordDetails)
                    .ThenInclude(md => md.Service)
                .Include(mr => mr.MedicalRecordDetails)
                    .ThenInclude(md => md.Appointments) // Include appointments
                    .ThenInclude(appointment => appointment.Doctor) // Include doctor of the appointment
                .Where(mr => mr.MedicalRecordId == id && mr.DeleteFlag == false)
                .Select(m => new
                {
                    MedicalRecordDetails = m.MedicalRecordDetails.Select(o => new
                    {
                        o.MedicalRecordId,
                        o.MrDetailId,
                        o.ServiceId,
                        ServiceName = o.Service.ServiceName,
                        o.PrescriptionId,
                        o.Diagnosis,
                        PrescriptionNote = o.Prescription.Note,
                        Appointments = o.Appointments.Select(appointment => new
                        {
                            appointment.AppointmentId
                        })
                    }
                    )

                }
                )
                .ToList();


                // Kiểm tra xem có bất kỳ hồ sơ y tế nào được tìm thấy không
                if (medicalRecords == null || medicalRecords.Count == 0)
                {
                    throw new Exception("Không có hồ sơ y tế nào cho bệnh nhân này");
                }

                //var medicalRecordDTOs = _mapper.Map<List<MedicalRecordDTO>>(medicalRecords);

                return medicalRecords;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public List<MedicalRecordDTO> GetMedicalRecords(int pageNumber)
        {
            try
            {
                var totalMR = _context.MedicalRecords
                              .Count(s => s.DeleteFlag == false);

                var totalPages = (int)Math.Ceiling((double)totalMR / PageSize);

                if (pageNumber <= 0) pageNumber = 1;
                if (pageNumber > totalPages) pageNumber = totalPages;
                List<MedicalRecord> list = _context.MedicalRecords
                    .Include(d => d.Patient)
                    .Where(x => x.DeleteFlag == false)
                    .Skip((pageNumber - 1) * PageSize)
                    .Take(PageSize)
                    .ToList();
                if (list == null || list.Count == 0)
                {
                    throw new Exception("Không có lịch sử khám");
                }

                //map
                List<MedicalRecordDTO> results = new List<MedicalRecordDTO>();
                results = list.Select(_mapper.Map<MedicalRecord, MedicalRecordDTO>).ToList();
                return results;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public object GetMedicalRecordsByPatientId(int patientId)
        {
            try
            {
                var medicalRecords = _context.MedicalRecords
                    .Include(mr => mr.Patient)
                    .Include(mr => mr.MedicalRecordDetails)
                        .ThenInclude(md => md.Prescription)
                    .Include(mr => mr.MedicalRecordDetails)
                        .ThenInclude(md => md.Service)
                    .Where(mr => mr.PatientId == patientId && mr.DeleteFlag == false)
                    .Select(m => new
                    {
                        MedicalRecord = new
                        {
                            m.MedicalRecordId,
                            m.PatientId,
                            PatientName = m.Patient.Name,
                            m.DeleteFlag
                        },
                        MedicalRecordDetails = m.MedicalRecordDetails.Select(o => new
                        {
                            o.MrDetailId,
                            o.ServiceId,
                            ServiceName = o.Service.ServiceName,
                            o.PrescriptionId,
                            o.Diagnosis,
                            Appointments = o.Appointments.Select(appointment => new
                            {
                                appointment.AppointmentId,
                                appointment.EmployeeId,
                                EmployeeName = appointment.Employee.Name,
                                appointment.PatientId,
                                appointment.Datetime,
                                appointment.Note,
                                appointment.Status,
                                appointment.DeleteFlag,
                                appointment.DoctorId,
                                DoctorName = appointment.Doctor.Name,
                            })
                        })
                    })
                    .ToList();

                // Kiểm tra xem có bất kỳ hồ sơ y tế nào được tìm thấy không
                if (medicalRecords == null || medicalRecords.Count == 0)
                {
                    throw new Exception("Không có hồ sơ y tế nào cho bệnh nhân này");
                }

                return medicalRecords;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }


        public void UpdateMedicalRecords(int id, MedicalRecordDTO MedicalRecordDTO)
        {
            try
            {
                var MedicalRecord = _context.MedicalRecords.FirstOrDefault(o => o.MedicalRecordId == id);
                if (MedicalRecord == null)
                {
                    throw new Exception("Hồ sơ không tồn tại");
                }
                MedicalRecord.PatientId = MedicalRecordDTO.PatientId;
                MedicalRecord.DeleteFlag = MedicalRecordDTO.DeleteFlag;
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
