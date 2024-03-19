using AutoMapper;
using DentalClinicProject.DTO;
using DentalClinicProject.Models;
using DentalClinicProject.Services.Interface;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace DentalClinicProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PrescriptionController : Controller
    {
        private readonly IPrescriptionService prescriptionService;
        public PrescriptionController(IPrescriptionService _prescriptionService)
        {
            prescriptionService = _prescriptionService;
        }

        [HttpGet("list")]
        public IActionResult GetPrescriptions(int pageNumber)
        {
            try
            {
                var results = prescriptionService.GetPrescriptions(pageNumber);
                return Ok(results);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);  
            }
        }

        [HttpGet("search")]
        public IActionResult GetPrescriptionsBySearch(string keyword, int pageNumber)
        {
            if (string.IsNullOrWhiteSpace(keyword))
            {
                return BadRequest("Từ khóa tìm kiếm không được để trống");
            }

            try
            {
                var results = prescriptionService.GetPrescriptionsBySearch(keyword, pageNumber);
                return Ok(results);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("{id}")]
        public IActionResult GetPrescription(int id)
        {
            try
            {
                var result = prescriptionService.GetPrescription(id);

                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPost]
        public IActionResult AddPrescription(PrescriptionDTO PrescriptionDTO)
        {
            
            try
            {
                prescriptionService.AddPrescription(PrescriptionDTO);
                return Ok("Thêm mới đơn thuốc thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Thêm mới đơn thuốc thất bại");
            }
        }

        [HttpPut("{id}")]
        public ActionResult UpdatePrescriptions(int id, PrescriptionDTO PrescriptionDTO)
        {
            try
            {
                prescriptionService.UpdatePrescriptions(id,PrescriptionDTO);
                return Ok("Cập nhật đơn thuốc thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Cập nhật đơn thuốc thất bại");
            }
        }

        [HttpDelete("{id}")]
        public ActionResult DeletePrescription(int id)
        {
            try
            {
                prescriptionService.DeletePrescription(id);
                return Ok("Xóa đơn thuốc thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Xóa đơn thuốc thất bại");
            }
        }

    }
}
