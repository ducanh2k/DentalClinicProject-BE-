namespace DentalClinicProject.DTO
{
    public class MedicalRecordDTO
    {
        public int MedicalRecordId { get; set; }
        public int? PatientId { get; set; }
        public string? PatientName { get; set; }
        public bool? DeleteFlag { get; set; }

    }

    public class MedicalRecordDetailDTO
    {
        public int MrDetailId { get; set; }
        public int? MedicalRecordId { get; set; }
        public int? ServiceId { get; set; }
        public string? ServiceName { get; set; }
        public int? PrescriptionId { get; set; }
        public string? PrescriptionNote { get; set; }
        public string? Diagnosis { get; set; }
        public bool? DeleteFlag { get; set; }
    }
}
