using DentalClinicProject.DTO;
using DentalClinicProject.Models;

namespace DentalClinicProject.Services.Interface
{
    public interface IServiceService
    {
        List<Service> GetServices(int pageNumber);
        List<Service> GetServicesByName(string keyword, int pageNumber);
        Service GetService(int id);
        void AddService(ServiceDTO ser);
        void UpdateService(int id, ServiceDTO serDTO);
        void DeleteService(int id);
    }
}
