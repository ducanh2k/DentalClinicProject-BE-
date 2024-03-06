using AutoMapper;
using DentalClinicProject.DTO;
using DentalClinicProject.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace DentalClinicProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MedicalRecordDetailsController : Controller
    {
        IMapper _mapper;
        private readonly dentalContext _context;
        private readonly IConfiguration _configuration;
        public readonly int PageSize;
        public MedicalRecordDetailsController(dentalContext context, IMapper mapper, IConfiguration configuration)
        {
            _context = context;
            _mapper = mapper;
            _configuration = configuration;
            PageSize = Convert.ToInt32(_configuration.GetValue<string>("AppSettings:PageSize"));
        }

        [HttpGet("list")]
        public IActionResult GetMedicalRecordDetails(int pageNumber)
        {
            var totalMR = _context.MedicalRecordDetails
                              .Count(s => s.DeleteFlag == false);

            var totalPages = (int)Math.Ceiling((double)totalMR / PageSize);

            if (pageNumber <= 0) pageNumber = 1;
            if (pageNumber > totalPages) pageNumber = totalPages;
            List<MedicalRecordDetail> list = _context.MedicalRecordDetails
                .Include(d => d.Service)
                .Where(x => x.DeleteFlag == false)
                .Skip((pageNumber - 1) * PageSize)
                .Take(PageSize)
                .ToList();
            if (list == null || list.Count == 0)
            {
                return NotFound("Không có lịch sử khám");
            }

            //map
            List<MedicalRecordDetailDTO> results = new List<MedicalRecordDetailDTO>();
            results = list.Select(_mapper.Map<MedicalRecordDetail, MedicalRecordDetailDTO>).ToList();
            return Ok(results);
        }

        [HttpGet("{id}")]
        public IActionResult GetMedicalRecordDetail(int id)
        {

            var MedicalRecordDetails = _context.MedicalRecordDetails
                .Include(d => d.Service)
                .FirstOrDefault(x => x.MrDetailId == id);
            if (MedicalRecordDetails == null)
            {
                return NotFound("Không có đơn thuốc");
            }

            //map
            var results = _mapper.Map<MedicalRecordDetailDTO>(MedicalRecordDetails);
            return Ok(results);
        }



        [HttpPost]
        public IActionResult AddMedicalRecordDetail(MedicalRecordDetailDTO MedicalRecordDetailDTO)
        {
            var MedicalRecordDetail = new MedicalRecordDetail
            {
                MedicalRecordId = MedicalRecordDetailDTO.MedicalRecordId,
                ServiceId = MedicalRecordDetailDTO.ServiceId,
                PrescriptionId = MedicalRecordDetailDTO.PrescriptionId,
                Diagnosis = MedicalRecordDetailDTO.Diagnosis,
                DeleteFlag = false
            };
            try
            {
                _context.MedicalRecordDetails.Add(MedicalRecordDetail);
                _context.SaveChanges();
                return Ok("Thêm mới thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Thêm mới thất bại");
            }
        }

        [HttpPut("{id}")]
        public ActionResult UpdateMedicalRecordDetails(int id, MedicalRecordDetailDTO MedicalRecordDetailDTO)
        {
            var MedicalRecordDetail = _context.MedicalRecordDetails.FirstOrDefault(o => o.MrDetailId == id);
            if (MedicalRecordDetail == null)
            {
                return NotFound();
            }
            MedicalRecordDetail.MedicalRecordId = MedicalRecordDetailDTO.MedicalRecordId;
            MedicalRecordDetail.ServiceId = MedicalRecordDetailDTO.ServiceId;
            MedicalRecordDetail.PrescriptionId = MedicalRecordDetailDTO.PrescriptionId;
            MedicalRecordDetail.Diagnosis = MedicalRecordDetailDTO.Diagnosis;
            MedicalRecordDetail.DeleteFlag = MedicalRecordDetailDTO.DeleteFlag;
            _context.SaveChanges();
            return NoContent();
        }

        [HttpDelete("{id}")]
        public ActionResult DeleteMedicalRecordDetail(int id)
        {
            var MedicalRecordDetail = _context.MedicalRecordDetails.FirstOrDefault(o => o.MrDetailId == id);
            if (MedicalRecordDetail == null)
            {
                return NotFound();
            }
            MedicalRecordDetail.DeleteFlag = true;
            _context.SaveChanges();
            return NoContent();
        }
    }
}

