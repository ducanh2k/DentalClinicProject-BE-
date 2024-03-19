using DentalClinicProject.DTO;
using DentalClinicProject.Models;

namespace DentalClinicProject.Services.Interface
{
    public interface IAppointmentService
    {
        List<AppointmentDTO> GetAppointments(int pageNumber);
        List<AppointmentDTO> GetAppointmentsByUserId(int pageNumber,int userId);
        AppointmentDTO GetAppointmentById(int id);
        List<AppointmentDTO> GetAppointmentsBySearch(int pageNumber,string keyword);
        void AddAppointment(AddAppointmentDTO appointmentDTO);

        void UpdateAppointment(int id, UpdateAppointmentDTO appointmentDTO);
        void DeleteAppointment(int id);
    }
}
