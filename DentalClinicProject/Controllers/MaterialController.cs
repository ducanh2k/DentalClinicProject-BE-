using DentalClinicProject.DTO;
using DentalClinicProject.Models;
using DentalClinicProject.Services.Interface;
using Microsoft.AspNetCore.Mvc;
using System;

namespace DentalClinicProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MaterialController : Controller
    {

        private readonly IMaterialService materialService;

        public MaterialController(IMaterialService _materialService)
        {
            materialService = _materialService;
        }

        [HttpGet("list")]
        public IActionResult GetMaterials(int pageNumber)
        {
            try
            {
                var materials = materialService.GetMaterials(pageNumber);
                return Ok(materials);
            }catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("{id}")]
        public IActionResult GetMaterial(int id)
        {
            try
            {
                var materials = materialService.GetMaterialById(id);
                return Ok(materials);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        //search name
        [HttpGet("search")]
        public IActionResult GetMaterialsByName(string keyword, int pageNumber)
        {
            try
            {
                var materials = materialService.GetMaterialsByName(keyword,pageNumber);
                return Ok(materials);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPost]
        public IActionResult AddMaterial(Material mat)
        {
            try
            {
                materialService.AddMaterial(mat);
                return Ok("Thêm mới vật liệu thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Thêm mới vật liệu thất bại");
            }
        }

        [HttpPut("{id}")]
        public ActionResult UpdateMaterial(int id, Material mat)
        {
            try
            {
                materialService.UpdateMaterial(id,mat);
                return Ok("Cập nhật vật liệu thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Cập nhật vật liệu thất bại");
            }
        }

        [HttpDelete("{id}")]
        public ActionResult DeleteMaterial(int id)
        {
            try
            {
                materialService.DeleteMaterial(id);
                return Ok("Xóa vật liệu thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Xóa vật liệu thất bại");
            }
        }
    }
}
