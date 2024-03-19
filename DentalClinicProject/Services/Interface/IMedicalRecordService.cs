using DentalClinicProject.DTO;
using DentalClinicProject.Models;

namespace DentalClinicProject.Services.Interface
{
    public interface IMedicalRecordService
    {
        List<MedicalRecordDTO> GetMedicalRecords(int pageNumber);
        object GetMedicalRecord(int id);
        object GetMedicalRecordsByPatientId(int patientId);
        void AddMedicalRecord(MedicalRecordDTO MedicalRecordDTO);
        void UpdateMedicalRecords(int id, MedicalRecordDTO MedicalRecordDTO);
        void DeleteMedicalRecord(int id);
    }
}
