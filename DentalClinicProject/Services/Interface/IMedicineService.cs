using DentalClinicProject.DTO;
using DentalClinicProject.Models;

namespace DentalClinicProject.Services.Interface
{
    public interface IMedicineService
    {
        List<Medicine> GetMedicines(int pageNumber);
        List<Medicine> GetMedicinesByName(string keyword, int pageNumber);
        Medicine GetMedicine(int id);
        void AddMedicine(MedicineDTO med);
        void UpdateMedicine(int id, MedicineDTO medDTO);
        void DeleteMedicine(int id);
    }
}
