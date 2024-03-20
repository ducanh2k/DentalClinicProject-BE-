using DentalClinicProject.DTO;
using DentalClinicProject.Models;
using DentalClinicProject.Services.Interface;
using Microsoft.AspNetCore.Components.Forms;
using Microsoft.AspNetCore.Mvc;
using System.Runtime.ConstrainedExecution;
using static Microsoft.Extensions.Logging.EventSource.LoggingEventSource;

namespace DentalClinicProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MedicineController : Controller
    {
        private readonly IMedicineService medicineService;

        public MedicineController(IMedicineService _medicineService)
        {
            medicineService = _medicineService;
        }

        [HttpGet("list")]
        public IActionResult GetMedicines(int pageNumber)
        {
            try
            {
                var medicines = medicineService.GetMedicines(pageNumber);
                return Ok(medicines);
            }catch (Exception ex)
            {
                return BadRequest(ex.Message);  
            }
        }

        //search name
        [HttpGet("search")]
        public IActionResult GetMedicinesByName(string keyword, int pageNumber)
        {
            try
            {
                var medicines = medicineService.GetMedicinesByName(keyword,pageNumber);
                return Ok(medicines);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("{id}")]
        public IActionResult GetMedicine(int id)
        {
            try
            {
                var medicines = medicineService.GetMedicine(id);
                return Ok(medicines);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }


        [HttpPost]
        public IActionResult AddMedicine(MedicineDTO med)
        {
            try
            {
                medicineService.AddMedicine(med);
                return Ok("Thêm mới thuốc thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Thêm thuốc mới thất bại");
            }
        }

        [HttpPut("{id}")]
        public ActionResult UpdateMedicine(int id, MedicineDTO medDTO)
        {
            try
            {
                medicineService.UpdateMedicine(id, medDTO);
                return Ok("Cập nhật thuốc thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Cập nhật thuốc thất bại");
            }
        }

        [HttpDelete("{id}")]
        public ActionResult DeleteMedicine(int id)
        {
            try
            {
                medicineService.DeleteMedicine(id);
                return Ok("Xóa thuốc thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Xóa thuốc thất bại");
            }
        }
    }
}
