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

        public MedicineController(dentalContext context)
        {
            _context = context;
        }

        [HttpGet("list")]
        public IActionResult GetMedicines()
        {
            var medicines = _context.Medicines.ToList();
            if (medicines == null || medicines.Count == 0)
            {
                return NotFound("Không có thuốc");
            }
            return Ok(medicines);
        }

        //search name
        [HttpGet("search")]
        public IActionResult GetMedicinesByName(string keyword)
        {
            if (string.IsNullOrWhiteSpace(keyword))
            {
                return BadRequest("Từ khóa tìm kiếm không được để trống");
            }

            var medicines = _context.Medicines.Where(s => s.Name.Contains(keyword)).ToList();

            if (medicines == null || medicines.Count == 0)
            {
                return NotFound("Không có dịch vụ nào phù hợp");
            }

            return Ok(medicines);
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
            _context.Remove(medicine);
            _context.SaveChanges();
            return NoContent();
        }
    }
}
