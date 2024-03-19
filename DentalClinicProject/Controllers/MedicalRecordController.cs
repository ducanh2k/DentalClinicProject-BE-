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
    public class MedicalRecordController : Controller
    {
        private readonly IMedicalRecordService mrService;

        public MedicalRecordController(IMedicalRecordService _mrService)
        {
            mrService = _mrService;
        }

        [HttpGet("list")]
        public IActionResult GetMedicalRecords(int pageNumber)
        {
            try
            {
                var medicalRecords = mrService.GetMedicalRecords(pageNumber);
                return Ok(medicalRecords);
            }catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("{id}")]
        public IActionResult GetMedicalRecord(int id)
        {

            try
            {
                var medicalRecords = mrService.GetMedicalRecord(id);
                return Ok(medicalRecords);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("patient/{patientId}")]
        public IActionResult GetMedicalRecordsByPatientId(int patientId)
        {
            try
            {
                var medicalRecords = mrService.GetMedicalRecordsByPatientId(patientId);
                return Ok(medicalRecords);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }


        [HttpPost]
        public IActionResult AddMedicalRecord(MedicalRecordDTO MedicalRecordDTO)
        {
            
            try
            {
                mrService.AddMedicalRecord(MedicalRecordDTO);
                return Ok("Thêm mới hồ sơ thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Thêm mới hồ sơ thất bại");
            }
        }

        [HttpPut("{id}")]
        public ActionResult UpdateMedicalRecords(int id, MedicalRecordDTO MedicalRecordDTO)
        {
            try
            {
                mrService.UpdateMedicalRecords(id,MedicalRecordDTO);
                return Ok("Cập nhật hồ sơ thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Cập nhật hồ sơ thất bại");
            }
        }

        [HttpDelete("{id}")]
        public ActionResult DeleteMedicalRecord(int id)
        {
            try
            {
                mrService.DeleteMedicalRecord(id);
                return Ok("Xóa hồ sơ thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Xóa hồ sơ thất bại");
            }
        }
    }
}
