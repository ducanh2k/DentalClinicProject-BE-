using DentalClinicProject.DTO;
using DentalClinicProject.Models;
using Microsoft.AspNetCore.Mvc;

namespace DentalClinicProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MaterialController : Controller
    {
        
        private readonly dentalContext _context;

        public MaterialController(dentalContext context)
        {
            _context = context;
        }

        //get all 
        [HttpGet("list")]
        public IActionResult GetMaterials()
        {
            var Materials = _context.Materials.ToList();
            if (Materials == null || Materials.Count == 0)
            {
                return NotFound("Không có dịch vụ");
            }
            return Ok(Materials);
        }

        //search name
        [HttpGet("search")]
        public IActionResult GetMaterialsByName(string keyword)
        {
            if (string.IsNullOrWhiteSpace(keyword))
            {
                return BadRequest("Từ khóa tìm kiếm không được để trống");
            }

            var Materials = _context.Materials.Where(s => s.MaterialName.Contains(keyword)).ToList();

            if (Materials == null || Materials.Count == 0)
            {
                return NotFound("Không có dịch vụ nào phù hợp");
            }

            return Ok(Materials);
        }

        [HttpPost]
        public IActionResult AddMaterial(Material mat)
        {
            
            try
            {
                _context.Materials.Add(mat);
                _context.SaveChanges();
                return Ok("Thêm mới thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Thêm mới thất bại");
            }
        }

        [HttpPut("{id}")]
        public ActionResult UpdateMaterial(int id, Material mat)
        {
            var material = _context.Materials.FirstOrDefault(o => o.MaterialId == id);
            if (material == null)
            {
                return NotFound();
            }
            material.MaterialName = mat.MaterialName;
            material.Supplier = mat.Supplier;
            material.UnitPrice = mat.UnitPrice;
            material.QuantityInStock = mat.QuantityInStock;
            material.Type = mat.Type;
            _context.SaveChanges();
            return NoContent();
        }

        [HttpDelete("{id}")]
        public ActionResult DeleteMaterial(int id)
        {
            var material = _context.Materials.FirstOrDefault(o => o.MaterialId == id);
            if (material == null)
            {
                return NotFound();
            }
            _context.Remove(material);
            _context.SaveChanges();
            return NoContent();
        }
    }
}
