using DentalClinicProject.DTO;

namespace DentalClinicProject.Services.Interface
{
    public interface IServiceService
    {
        List<Service> GetServices(int pageNumber);
        List<Service> GetServicesByName(string keyword, int pageNumber);
        Service GetService(int id);
        void AddService(Service ser);
        void UpdateService(int id, Service serDTO);
        void DeleteService(int id);
    }
}
