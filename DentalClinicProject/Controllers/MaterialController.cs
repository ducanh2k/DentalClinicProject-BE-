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
        private readonly IConfiguration _configuration;
        private readonly int PageSize;
        public MaterialController(dentalContext context, IConfiguration configuration)
        {
            _context = context;
            _configuration = configuration;
            PageSize = Convert.ToInt32(_configuration.GetValue<string>("AppSettings:PageSize"));
        }

        //get all 
        [HttpGet("list")]
        public IActionResult GetMaterials(int pageNumber)
        {
            var totalMats = _context.Materials
                              .Count(s => s.DeleteFlag == false);

            var totalPages = (int)Math.Ceiling((double)totalMats / PageSize);

            if (pageNumber <= 0) pageNumber = 1;
            if (pageNumber > totalPages) pageNumber = totalPages;
            var Materials = _context.Materials
                .Where(s => s.DeleteFlag == false)
                        .Skip((pageNumber - 1) * PageSize)
                        .Take(PageSize)
                .ToList();
            if (Materials == null || Materials.Count == 0)
            {
                return NotFound("Không có dịch vụ");
            }
            return Ok(Materials);
        }

        [HttpGet("{id}")]
        public IActionResult GetMaterial(int id)
        {
            var ser = _context.Materials
                .Where(x => x.MaterialId == id)
                .FirstOrDefault();

            if (ser == null)
            {
                return NotFound("Không có");
            }
            return Ok(ser);
        }

        //search name
        [HttpGet("search")]
        public IActionResult GetMaterialsByName(string keyword, int pageNumber)
        {
            if (string.IsNullOrWhiteSpace(keyword))
            {
                return BadRequest("Từ khóa tìm kiếm không được để trống");
            }
            var totalMats = _context.Materials
                              .Count(s => s.DeleteFlag == false);

            var totalPages = (int)Math.Ceiling((double)totalMats / PageSize);

            if (pageNumber <= 0) pageNumber = 1;
            if (pageNumber > totalPages) pageNumber = totalPages;
            var Materials = _context.Materials
                .Where(s => s.MaterialName.Contains(keyword) 
                || s.Supplier.Contains(keyword)
                && s.DeleteFlag == false
                )
                .Skip((pageNumber - 1) * PageSize)
                .Take(PageSize).ToList();

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
            material.DeleteFlag = true;
            _context.SaveChanges();
            return NoContent();
        }
    }
}
