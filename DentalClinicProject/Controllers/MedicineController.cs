using DentalClinicProject.DTO;
using DentalClinicProject.Models;
using Microsoft.AspNetCore.Components.Forms;
using Microsoft.AspNetCore.Mvc;
using System.Runtime.ConstrainedExecution;

namespace DentalClinicProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MedicineController : Controller
    {
        private readonly dentalContext _context;
        private readonly IConfiguration _configuration;
        private readonly int PageSize;
        public MedicineController(dentalContext context, IConfiguration configuration)
        {
            _context = context;
            _configuration = configuration;
            PageSize = Convert.ToInt32(_configuration.GetValue<string>("AppSettings:PageSize"));
        }

        [HttpGet("list")]
        public IActionResult GetMedicines(int pageNumber)
        {
            var totalMeds = _context.Medicines
                              .Count(s => s.DeleteFlag == false);

            var totalPages = (int)Math.Ceiling((double)totalMeds / PageSize);

            if (pageNumber <= 0) pageNumber = 1;
            if (pageNumber > totalPages) pageNumber = totalPages;
            var medicines = _context.Medicines
                        .Where(s => s.DeleteFlag == false)
                        .Skip((pageNumber - 1) * PageSize)
                        .Take(PageSize)
                        .ToList();
            if (medicines == null || medicines.Count == 0)
            {
                return NotFound("Không có thuốc");
            }
            return Ok(medicines);
        }

        //search name
        [HttpGet("search")]
        public IActionResult GetMedicinesByName(string keyword, int pageNumber)
        {
            if (string.IsNullOrWhiteSpace(keyword))
            {
                return BadRequest("Từ khóa tìm kiếm không được để trống");
            }
            var totalMeds = _context.Medicines
                             .Count(s => s.DeleteFlag == false);

            var totalPages = (int)Math.Ceiling((double)totalMeds / PageSize);

            if (pageNumber <= 0) pageNumber = 1;
            if (pageNumber > totalPages) pageNumber = totalPages;

            var medicines = _context.Medicines
                .Where(s => s.Name.Contains(keyword)
                || s.Dosage.Contains(keyword)
                || s.Manufacturer.Contains(keyword)
                || s.Description.Contains(keyword)
                && s.DeleteFlag == false)
                .Skip((pageNumber - 1) * PageSize)
                .Take(PageSize)
                .ToList();

            if (medicines == null || medicines.Count == 0)
            {
                return NotFound("Không có dịch vụ nào phù hợp");
            }

            return Ok(medicines);
        }

        [HttpGet("{id}")]
        public IActionResult GetMedicine(int id)
        {
            var ser = _context.Medicines
                .Where(x => x.Id == id)
                .Select(d => new
                {
                    Id = d.Id,
                    Name = d.Name,
                    Price = d.Price,
                    Manufacturer = d.Manufacturer,
                    ExpiryDate = d.ExpiryDate,
                    InputDay = d.InputDay,
                    QuantityInStock = d.QuantityInStock,
                    Dosage = d.Dosage,
                    DeleteFlag = d.DeleteFlag,
                    Description = d.Description
                })
                .FirstOrDefault();

            if (ser == null)
            {
                return NotFound("Không có");
            }
            return Ok(ser);
        }


        [HttpPost]
        public IActionResult AddMedicine(MedicineDTO med)
        {
            var medicine = new Medicine
            {
                Name = med.Name,
                Manufacturer = med.Manufacturer,
                ExpiryDate = med.ExpiryDate,
                InputDay = med.InputDay,
                Price = med.Price,
                QuantityInStock = med.QuantityInStock,
                Dosage = med.Dosage,
                Description = med.Description,
                DeleteFlag = med.DeleteFlag,
            };
            try
            {
                _context.Medicines.Add(medicine);
                _context.SaveChanges();
                return Ok("Thêm mới thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Thêm thuốc mới thất bại");
            }
        }

        [HttpPut("{id}")]
        public ActionResult UpdateMedicine(int id, MedicineDTO medDTO)
        {
            var medicine = _context.Medicines.FirstOrDefault(o => o.Id == id);
            if (medicine == null)
            {
                return NotFound();
            }
            medicine.Name = medDTO.Name;
                medicine.Manufacturer = medDTO.Manufacturer;
                medicine.ExpiryDate = medDTO.ExpiryDate;
                medicine.InputDay = medDTO.InputDay;
                medicine.Price = medDTO.Price;
                medicine.QuantityInStock = medDTO.QuantityInStock;
                medicine.Dosage = medDTO.Dosage;
                medicine.Description = medDTO.Description;
                medicine.DeleteFlag = medDTO.DeleteFlag;
            _context.SaveChanges();
            return NoContent();
        }

        [HttpDelete("{id}")]
        public ActionResult DeleteMedicine(int id)
        {
            var medicine = _context.Medicines.FirstOrDefault(o => o.Id == id);
            if (medicine == null)
            {
                return NotFound();
            }
            medicine.DeleteFlag = true;
            _context.SaveChanges();
            return NoContent();
        }
    }
}
