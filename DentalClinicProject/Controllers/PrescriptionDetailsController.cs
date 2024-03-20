using AutoMapper;
using DentalClinicProject.DTO;
using DentalClinicProject.Models;
using DentalClinicProject.Services.Interface;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using static Microsoft.Extensions.Logging.EventSource.LoggingEventSource;

namespace DentalClinicProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PrescriptionDetailsController : Controller
    {
        private readonly IPrescriptionDetailService prescriptionDetailService;

        public PrescriptionDetailsController(IPrescriptionDetailService _prescriptionDetailService)
        {
            prescriptionDetailService = _prescriptionDetailService;
        }

        [HttpGet("list")]
        public IActionResult GetPrescriptionDetailss(int pageNumber)
        {
            try
            {
                var result = prescriptionDetailService.GetPrescriptionDetailss(pageNumber);
                return Ok(result);
            }catch (Exception ex)
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
                var result = prescriptionDetailService.GetPrescriptionsBySearch(keyword,pageNumber);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("{id}")]
        public IActionResult GetPrescriptionDetail(int id)
        {
            try
            {
                var result = prescriptionDetailService.GetPrescriptionDetail(id);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("prescription/{prescriptionId}")]
        public IActionResult GetPrescriptionDetails(int prescriptionId)
        {
            try
            {
                var result = prescriptionDetailService.GetPrescriptionDetails(prescriptionId);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }


        [HttpPost]
        public IActionResult AddPrescription(PrescriptionDetailDTO PrescriptionDetaiDTO)
        {
            
            try
            {
                prescriptionDetailService.AddPrescription(PrescriptionDetaiDTO);
                return Ok("Thêm mới đơn thuốc thành công"); 
            }
            catch (Exception ex)
            {
                return BadRequest("Thêm mới đơn thuốc thất bại");
            }
        }

        [HttpPut("{id}")]
        public ActionResult UpdatePrescriptions(int id, PrescriptionDetailDTO PrescriptionDetaiDTO)
        {
            try
            {
                prescriptionDetailService.UpdatePrescriptions(id,PrescriptionDetaiDTO);
                return Ok("Cập nhật đơn thuốc thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Cập nhật đơn thuốc thất bại");
            }
        }

        [HttpDelete("{id}")]
        public ActionResult DeletePrescriptionDetail(int id)
        {
            try
            {
                prescriptionDetailService.DeletePrescriptionDetail(id);
                return Ok("Xóa đơn thuốc thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Xóa đơn thuốc thất bại");
            }
        }

    }
}

