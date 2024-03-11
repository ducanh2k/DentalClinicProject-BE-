using AutoMapper;
using DentalClinicProject.DTO;
using DentalClinicProject.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace DentalClinicProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PrescriptionDetailsController : Controller
    {
        IMapper _mapper;
        private readonly dentalContext _context;
        private readonly IConfiguration _configuration;
        public readonly int PageSize;
        public PrescriptionDetailsController(dentalContext context, IMapper mapper, IConfiguration configuration)
        {
            _context = context;
            _mapper = mapper;
            _configuration = configuration;
            PageSize = Convert.ToInt32(_configuration.GetValue<string>("AppSettings:PageSize"));
        }

        [HttpGet("list")]
        public IActionResult GetPrescriptionDetailss(int pageNumber)
        {
            var totalPrescriptionDetails = _context.PrescriptionDetails
                              .Count(s => s.DeleteFlag == false);

            var totalPages = (int)Math.Ceiling((double)totalPrescriptionDetails / PageSize);

            if (pageNumber <= 0) pageNumber = 1;
            if (pageNumber > totalPages) pageNumber = totalPages;
            List<PrescriptionDetail> prescriptionDetails = _context.PrescriptionDetails
                .Include(d => d.Medicine)
                .Where(x => x.DeleteFlag == false)
                .Skip((pageNumber - 1) * PageSize)
                .Take(PageSize)
                .ToList();
            if (prescriptionDetails == null || prescriptionDetails.Count == 0)
            {
                return NotFound("Không có đơn thuốc");
            }

            //map
            List<PrescriptionDetailDTO> results = new List<PrescriptionDetailDTO>();
            results = prescriptionDetails.Select(_mapper.Map<PrescriptionDetail, PrescriptionDetailDTO>).ToList();
            return Ok(results);
        }

        [HttpGet("search")]
        public IActionResult GetPrescriptionsBySearch(string keyword, int pageNumber)
        {
            if (string.IsNullOrWhiteSpace(keyword))
            {
                return BadRequest("Từ khóa tìm kiếm không được để trống");
            }

            List<PrescriptionDetail> prescriptionDetails = _context.PrescriptionDetails
                .Include(d => d.Medicine)
                .Where(x =>
                x.Medicine.Name.Contains(keyword)
                || x.DosageInstruction.Contains(keyword)
                && x.DeleteFlag == false)
                .ToList();

            if (prescriptionDetails == null || prescriptionDetails.Count == 0)
            {
                return NotFound("Không có đơn thuốc");
            }

            var totalPrescriptionDetails = prescriptionDetails.Count();

            var totalPages = (int)Math.Ceiling((double)totalPrescriptionDetails / PageSize);

            if (pageNumber <= 0) pageNumber = 1;
            if (pageNumber > totalPages) pageNumber = totalPages;
            prescriptionDetails = prescriptionDetails
                .Skip((pageNumber - 1) * PageSize)
                .Take(PageSize)
                .ToList();
            if (prescriptionDetails == null || prescriptionDetails.Count == 0)
            {
                return NotFound("Không có đơn thuốc");
            }

            //map
            List<PrescriptionDetailDTO> results = new List<PrescriptionDetailDTO>();
            results = prescriptionDetails.Select(_mapper.Map<PrescriptionDetail, PrescriptionDetailDTO>).ToList();
            return Ok(results);
        }

        [HttpGet("{id}")]
        public IActionResult GetPrescriptionDetail(int id)
        {

            var prescriptions = _context.PrescriptionDetails
                .Include(d => d.Medicine)
                .FirstOrDefault(x => x.PrescriptionId == id);
            if (prescriptions == null)
            {
                return NotFound("Không có đơn thuốc");
            }

            //map
            var results = _mapper.Map<PrescriptionDetailDTO>(prescriptions);
            return Ok(results);
        }

        [HttpGet("prescription/{prescriptionId}")]
        public IActionResult GetPrescriptionDetails(int prescriptionId)
        {
            // Tìm đơn thuốc dựa trên prescriptionId
            var prescription = _context.Prescriptions
                .Include(p => p.PrescriptionDetails)
                    .ThenInclude(pd => pd.Medicine)
                .FirstOrDefault(p => p.PrescriptionId == prescriptionId);

            // Kiểm tra xem đơn thuốc có tồn tại không
            if (prescription == null)
            {
                return NotFound("Không tìm thấy đơn thuốc");
            }

            // Lấy tất cả các chi tiết đơn thuốc của đơn thuốc này
            var prescriptionDetails = prescription.PrescriptionDetails;

            // Kiểm tra xem có chi tiết đơn thuốc nào không
            if (prescriptionDetails == null || prescriptionDetails.Count == 0)
            {
                return NotFound("Đơn thuốc này không có chi tiết");
            }

            // Map prescriptionDetails sang DTO nếu cần
            var prescriptionDetailsDTO = prescriptionDetails.Select(pd =>
                new PrescriptionDetailDTO
                {
                    PrescriptionDetailId = pd.PrescriptionDetailId,
                    PrescriptionId = pd.PrescriptionId,
                    MedicineId = pd.MedicineId,
                    MedicineName = pd.Medicine != null ? pd.Medicine.Name : null,
                    Quantity = pd.Quantity,
                    DosageInstruction = pd.DosageInstruction,
                    DeleteFlag = pd.DeleteFlag
                }).ToList();

            return Ok(prescriptionDetailsDTO);
        }


        [HttpPost]
        public IActionResult AddPrescription(PrescriptionDetailDTO PrescriptionDetaiDTO)
        {
            var prescription = new PrescriptionDetail
            {
                PrescriptionId = PrescriptionDetaiDTO.PrescriptionId,
                MedicineId = PrescriptionDetaiDTO.MedicineId,
                Quantity = PrescriptionDetaiDTO.Quantity,
                DosageInstruction = PrescriptionDetaiDTO.DosageInstruction,
                DeleteFlag = false
            };
            try
            {
                _context.PrescriptionDetails.Add(prescription);
                _context.SaveChanges();
                return Ok("Thêm mới thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Thêm mới thất bại");
            }
        }

        [HttpPut("{id}")]
        public ActionResult UpdatePrescriptions(int id, PrescriptionDetailDTO PrescriptionDetaiDTO)
        {
            var prescription = _context.PrescriptionDetails.FirstOrDefault(o => o.PrescriptionDetailId == id);
            if (prescription == null)
            {
                return NotFound();
            }
            prescription.PrescriptionId = PrescriptionDetaiDTO.PrescriptionId;
            prescription.MedicineId = PrescriptionDetaiDTO.MedicineId;
            prescription.Quantity = PrescriptionDetaiDTO.Quantity;
            prescription.DosageInstruction = PrescriptionDetaiDTO.DosageInstruction;
            prescription.DeleteFlag = PrescriptionDetaiDTO.DeleteFlag;
            _context.SaveChanges();
            return NoContent();
        }

        [HttpDelete("{id}")]
        public ActionResult DeletePrescriptionDetail(int id)
        {
            var prescription = _context.PrescriptionDetails.FirstOrDefault(o => o.PrescriptionId == id);
            if (prescription == null)
            {
                return NotFound();
            }
            prescription.DeleteFlag = true;
            _context.SaveChanges();
            return NoContent();
        }

    }
}

