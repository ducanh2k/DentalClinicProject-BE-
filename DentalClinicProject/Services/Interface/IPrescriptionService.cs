using DentalClinicProject.DTO;

namespace DentalClinicProject.Services.Interface
{
    public interface IPrescriptionService
    {
        object GetPrescriptions(int pageNumber);
        object GetPrescriptionsBySearch(string keyword, int pageNumber);
        object GetPrescription(int id); 
        void AddPrescription(PrescriptionDTO PrescriptionDTO);
        void UpdatePrescriptions(int id, PrescriptionDTO PrescriptionDTO);
        void DeletePrescription(int id); 
    }
}
