using DentalClinicProject.DTO;
using DentalClinicProject.Models;
using DentalClinicProject.Services.Interface;

namespace DentalClinicProject.Services.Implement
{
    public class ServiceService : IServiceService
    {
        private readonly dentalContext _context;
        private readonly IConfiguration _configuration;
        private readonly int PageSize;
        private readonly IUserService _userService;

        public ServiceService(dentalContext context, IConfiguration configuration, IUserService userService)
        {
            _context = context;
            _configuration = configuration;
            PageSize = Convert.ToInt32(_configuration.GetValue<string>("AppSettings:PageSize"));
            _userService = userService;
        }
        public void AddService(ServiceDTO ser)
        {
            try
            {
                var service = new Service
                {
                    ServiceName = ser.ServiceName,
                    BriefInfo = ser.BriefInfo,
                    Description = ser.Description,
                    Price = ser.Price,
                    DeleteFlag = ser.DeleteFlag,
                };
                _context.Services.Add(service);
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void DeleteService(int id)
        {
            try
            {
                var service = _context.Services.FirstOrDefault(o => o.ServiceId == id);
                if (service == null)
                {
                    throw new Exception("Dịch vụ không tồn tại");
                }
                service.DeleteFlag = true;
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public Service GetService(int id)
        {
            try
            {
                Service ser = _context.Services
                .FirstOrDefault(x => x.ServiceId == id);

                if (ser == null)
                {
                    throw new Exception("Dịch vụ không tồn tại");
                }
                return ser;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public List<Service> GetServices(int pageNumber)
        {
            try
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
                    throw new Exception("Không có dịch vụ");
                }
                
                return services;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public List<Service> GetServicesByName(string keyword, int pageNumber)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(keyword))
                {
                    throw new Exception("Từ khóa tìm kiếm không được để trống");
                }

                var services = _context.Services
                    .Where(s => s.ServiceName.Contains(keyword)
                    || s.BriefInfo.Contains(keyword)
                    || s.Description.Contains(keyword)
                    && s.DeleteFlag == false)
                    .ToList();

                if (services == null || services.Count == 0)
                {
                    throw new Exception("Không có dịch vụ nào phù hợp");
                }

                var totalServices = services.Count();

                var totalPages = (int)Math.Ceiling((double)totalServices / PageSize);

                if (pageNumber <= 0) pageNumber = 1;
                if (pageNumber > totalPages) pageNumber = totalPages;
                services = services
                    .Skip((pageNumber - 1) * PageSize)
                    .Take(PageSize)
                    .ToList();

                return services;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void UpdateService(int id, ServiceDTO serDTO)
        {
            try
            {
                var service = _context.Services.FirstOrDefault(o => o.ServiceId == id);
                if (service == null)
                {
                    throw new Exception("Dịch vụ không tồn tại");
                }
                service.ServiceName = serDTO.ServiceName;
                service.BriefInfo = serDTO.BriefInfo;
                service.Description = serDTO.Description;
                service.Price = serDTO.Price;
                service.DeleteFlag = serDTO.DeleteFlag;
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
