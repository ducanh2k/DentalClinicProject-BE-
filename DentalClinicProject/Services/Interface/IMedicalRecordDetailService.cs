using DentalClinicProject.DTO;

namespace DentalClinicProject.Services.Interface
{
    public interface IMedicalRecordDetailService
    {
        List<MedicalRecordDetailDTO> GetMedicalRecordDetails(int pageNumber);
        MedicalRecordDetailDTO GetMedicalRecordDetail(int id);
        void AddMedicalRecordDetail(MedicalRecordDetailDTO MedicalRecordDetailDTO);
        void UpdateMedicalRecordDetails(int id, MedicalRecordDetailDTO MedicalRecordDetailDTO, bool type); //true kham moi, tai kham
        void DeleteMedicalRecordDetail(int id); 
    }
}
