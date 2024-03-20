using DentalClinicProject.DTO;

namespace DentalClinicProject.Services.Interface
{
    public interface IPrescriptionDetailService
    {
        List<PrescriptionDetailDTO> GetPrescriptionDetailss(int pageNumber);
        List<PrescriptionDetailDTO> GetPrescriptionsBySearch(string keyword, int pageNumber);
        PrescriptionDetailDTO GetPrescriptionDetail(int id);
        List<PrescriptionDetailDTO> GetPrescriptionDetails(int prescriptionId);
        void AddPrescription(PrescriptionDetailDTO PrescriptionDetaiDTO);
        void UpdatePrescriptions(int id, PrescriptionDetailDTO PrescriptionDetaiDTO);
        void DeletePrescriptionDetail(int id); 

    }
}
