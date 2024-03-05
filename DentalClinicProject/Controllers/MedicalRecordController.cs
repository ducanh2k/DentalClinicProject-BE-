using AutoMapper;
using DentalClinicProject.DTO;
using DentalClinicProject.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace DentalClinicProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MedicalRecordController : Controller
    {
        IMapper _mapper;
        private readonly dentalContext _context;
        private readonly IConfiguration _configuration;
        public readonly int PageSize;
        public MedicalRecordController(dentalContext context, IMapper mapper, IConfiguration configuration)
        {
            _context = context;
            _mapper = mapper;
            _configuration = configuration;
            PageSize = Convert.ToInt32(_configuration.GetValue<string>("AppSettings:PageSize"));
        }

        [HttpGet("list")]
        public IActionResult GetMedicalRecords(int pageNumber)
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
                return NotFound("Không có lịch sử khám");
            }

            //map
            List<MedicalRecordDTO> results = new List<MedicalRecordDTO>();
            results = list.Select(_mapper.Map<MedicalRecord, MedicalRecordDTO>).ToList();
            return Ok(results);
        }

        [HttpGet("{id}")]
        public IActionResult GetMedicalRecord(int id)
        {

            var MedicalRecords = _context.MedicalRecords
                .Include(d => d.Patient)
                .FirstOrDefault(x => x.MedicalRecordId == id);
            if (MedicalRecords == null)
            {
                return NotFound("Không có đơn thuốc");
            }

            //map
            var results = _mapper.Map<MedicalRecordDTO>(MedicalRecords);
            return Ok(results);
        }

        [HttpGet("patient/{patientId}")]
        public IActionResult GetMedicalRecordsByPatientId(int patientId)
        {
            // Truy vấn cơ sở dữ liệu để lấy tất cả các hồ sơ y tế của bệnh nhân
            var medicalRecords = _context.MedicalRecords
                .Include(mr => mr.Patient)
                .Include(mr => mr.MedicalRecordDetails)
                    .ThenInclude(md => md.Appointment)
                .Include(mr => mr.MedicalRecordDetails)
                    .ThenInclude(md => md.Prescription)
                .Include(mr => mr.MedicalRecordDetails)
                    .ThenInclude(md => md.Service)
                .Where(mr => mr.PatientId == patientId && mr.DeleteFlag == false)
                .Select( m => new
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
                        o.AppointmentId,
                        o.ServiceId,
                        ServiceName = o.Service.ServiceName,
                        o.PrescriptionId,
                        o.Diagnosis
                    }
                    )
                    
                }
                )
                .ToList();


            // Kiểm tra xem có bất kỳ hồ sơ y tế nào được tìm thấy không
            if (medicalRecords == null || medicalRecords.Count == 0)
            {
                return NotFound("Không có hồ sơ y tế nào cho bệnh nhân này");
            }
          
            //var medicalRecordDTOs = _mapper.Map<List<MedicalRecordDTO>>(medicalRecords);

            return Ok(medicalRecords);
        }


        [HttpPost]
        public IActionResult AddMedicalRecord(MedicalRecordDTO MedicalRecordDTO)
        {
            var MedicalRecord = new MedicalRecord
            {
                PatientId = MedicalRecordDTO.PatientId,
                DeleteFlag = false


            };
            try
            {
                _context.MedicalRecords.Add(MedicalRecord);
                _context.SaveChanges();
                return Ok("Thêm mới thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Thêm mới thất bại");
            }
        }

        [HttpPut("{id}")]
        public ActionResult UpdateMedicalRecords(int id, MedicalRecordDTO MedicalRecordDTO)
        {
            var MedicalRecord = _context.MedicalRecords.FirstOrDefault(o => o.MedicalRecordId == id);
            if (MedicalRecord == null)
            {
                return NotFound();
            }
            MedicalRecord.PatientId = MedicalRecordDTO.PatientId;
            MedicalRecord.DeleteFlag = MedicalRecordDTO.DeleteFlag;
            _context.SaveChanges();
            return NoContent();
        }

        [HttpDelete("{id}")]
        public ActionResult DeleteMedicalRecord(int id)
        {
            var MedicalRecord = _context.MedicalRecords.FirstOrDefault(o => o.MedicalRecordId == id);
            if (MedicalRecord == null)
            {
                return NotFound();
            }
            MedicalRecord.DeleteFlag = true;
            _context.SaveChanges();
            return NoContent();
        }
    }
}
