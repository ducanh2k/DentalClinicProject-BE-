  using DentalClinicProject.DTO;
using DentalClinicProject.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System.Runtime.ConstrainedExecution;
namespace DentalClinicProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ServiceController : ControllerBase
    {
        private readonly dentalContext _context;
        private readonly IConfiguration _configuration;
        public readonly int PageSize;

        public ServiceController(dentalContext context, IConfiguration configuration)
        {
            _context = context;
            _configuration = configuration;
            PageSize = Convert.ToInt32(_configuration.GetValue<string>("AppSettings:PageSize"));
        }
        //get all 
        [HttpGet("list")]
        public IActionResult GetServices(int pageNumber)
        {
            var totalServices = _context.Services
                              .Count(s => s.DeleteFlag == false);

            var totalPages = (int)Math.Ceiling((double)totalServices / PageSize);

            if (pageNumber <= 0) pageNumber = 1;
            if (pageNumber > totalPages) pageNumber = totalPages;
            var services = _context.Services
                        .Where(s => s.DeleteFlag == false) 
                        .Skip((pageNumber - 1) * PageSize)
                        .Take(PageSize)
                        .ToList();

            if (services == null || services.Count == 0)
            {
                return NotFound("Không có dịch vụ");
            }
            return Ok(services);
        }

        //search name
        [HttpGet("search")]
        public IActionResult GetServicesByName(string keyword, int pageNumber)
        {
            if (string.IsNullOrWhiteSpace(keyword))
            {
                return BadRequest("Từ khóa tìm kiếm không được để trống");
            }
            var totalServices = _context.Services
                              .Count(s => s.DeleteFlag == false);

            var totalPages = (int)Math.Ceiling((double)totalServices / PageSize);

            if (pageNumber <= 0) pageNumber = 1;
            if (pageNumber > totalPages) pageNumber = totalPages;
            var services = _context.Services
                .Where(s => s.ServiceName.Contains(keyword) && s.DeleteFlag == false)
                .Skip((pageNumber - 1) * PageSize)
                .Take(PageSize)
                .ToList();

           

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
                DeleteFlag = ser.DeleteFlag,
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
            service.DeleteFlag = serDTO.DeleteFlag;
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
            service.DeleteFlag = true;
            _context.SaveChanges();
            return NoContent();
        }
    }
}
