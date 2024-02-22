using DentalClinicProject.DTO;
using DentalClinicProject.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Runtime.ConstrainedExecution;
namespace DentalClinicProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ServiceController : ControllerBase
    {
        private readonly dentalContext _context;

        public ServiceController(dentalContext context)
        {
            _context = context;
        }

        //get all 
        [HttpGet("list")]
        public IActionResult GetServices()
        {
            var services = _context.Services.ToList();
            if (services == null || services.Count == 0)
            {
                return NotFound("Không có dịch vụ");
            }
            return Ok(services);
        }

        //search name
        [HttpGet("search")]
        public IActionResult GetServicesByName(string keyword)
        {
            if (string.IsNullOrWhiteSpace(keyword))
            {
                return BadRequest("Từ khóa tìm kiếm không được để trống");
            }

            var services = _context.Services.Where(s => s.ServiceName.Contains(keyword)).ToList();

            if (services == null || services.Count == 0)
            {
                return NotFound("Không có dịch vụ nào phù hợp");
            }

            return Ok(services);
        }

        [HttpPost]
        public IActionResult AddService(ServiceDTO ser)
        {
            var service = new Service
            {
                ServiceName = ser.ServiceName,
                BriefInfo = ser.BriefInfo,
                Description = ser.Description,
                Price = ser.Price,
            };
            try
            {
                _context.Services.Add(service);
                _context.SaveChanges();
                return Ok("Thêm mới thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Thêm mới dịch vụ thất bại");
            }
        }

        [HttpPut("{id}")]
        public ActionResult UpdateService(int id, ServiceDTO serDTO)
        {
            var service = _context.Services.FirstOrDefault(o => o.ServiceId == id);
            if (service == null)
            {
                return NotFound();
            }
            service.ServiceName = serDTO.ServiceName;
            service.BriefInfo = serDTO.BriefInfo;
            service.Description = serDTO.Description;
            service.Price = serDTO.Price;
            _context.SaveChanges();
            return NoContent();
        }

        [HttpDelete("{id}")]
        public ActionResult DeleteService(int id)
        {
            var service = _context.Services.FirstOrDefault(o => o.ServiceId == id);
            if (service == null)
            {
                return NotFound();
            }
            _context.Remove(service);
            _context.SaveChanges();
            return NoContent();
        }
    }
}
