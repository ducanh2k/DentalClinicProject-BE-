namespace DentalClinicProject.DTO
{
    public class PrescriptionDTO
    {
        public int PrescriptionId { get; set; }
        public bool? DeleteFlag { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? DoctorId { get; set; }
        public string? DoctorName { get; set; }
        public string? Note { get; set; }
    }

    public class PrescriptionDetailDTO
    {
        public int PrescriptionDetailId { get; set; }
        public int? PrescriptionId { get; set; }
        public int? MedicineId { get; set; }
        public string? MedicineName { get; set; }
        public int? Quantity { get; set; }
        public string? DosageInstruction { get; set; }
        public string? DeleteFlag { get; set; }
    }
}
