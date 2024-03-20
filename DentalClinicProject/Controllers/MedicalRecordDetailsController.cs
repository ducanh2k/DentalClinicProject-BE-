using AutoMapper;
using DentalClinicProject.DTO;
using DentalClinicProject.Models;
using DentalClinicProject.Services.Interface;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace DentalClinicProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MedicalRecordDetailsController : Controller
    {
        private readonly IMedicalRecordDetailService MedicalRecordDetailService;

        public MedicalRecordDetailsController(IMedicalRecordDetailService _MedicalRecordDetailService)
        {
            MedicalRecordDetailService = _MedicalRecordDetailService;
        }

        [HttpGet("list")]
        public IActionResult GetMedicalRecordDetails(int pageNumber)
        {
            try
            {
                var results = MedicalRecordDetailService.GetMedicalRecordDetails(pageNumber);
                return Ok(results);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
            
        }

        [HttpGet("{id}")]
        public IActionResult GetMedicalRecordDetail(int id)
        {
            try
            {
                var results = MedicalRecordDetailService.GetMedicalRecordDetail(id);
                return Ok(results);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }



        [HttpPost]
        public IActionResult AddMedicalRecordDetail(MedicalRecordDetailDTO MedicalRecordDetailDTO)
        {
            try
            {
                MedicalRecordDetailService.AddMedicalRecordDetail(MedicalRecordDetailDTO);
                return Ok("Thêm mới hồ sơ thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Thêm mới hồ sơ thất bại");
            }
        }

        [HttpPut("{id}")]
        public ActionResult UpdateMedicalRecordDetails(int id, MedicalRecordDetailDTO MedicalRecordDetailDTO, bool type) //true kham moi, tai kham
        {
            try
            {
                MedicalRecordDetailService.UpdateMedicalRecordDetails(id, MedicalRecordDetailDTO, type);
                return Ok("Cập nhật hồ sơ thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Cập nhật hồ sơ thất bại");
            }
        }

        [HttpDelete("{id}")]
        public ActionResult DeleteMedicalRecordDetail(int id)
        {
            try
            {
                MedicalRecordDetailService.DeleteMedicalRecordDetail(id);
                return Ok("Xóa hồ sơ thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Xóa hồ sơ thất bại");
            }
        }
    }
}

