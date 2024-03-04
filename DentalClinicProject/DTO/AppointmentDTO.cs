namespace DentalClinicProject.DTO
{
    public class AppointmentDTO
    {
        public int AppointmentId { get; set; }
        public int? EmployeeId { get; set; }
        public string? EmployeeName { get; set; }
        public int? PatientId { get; set; }
        public string? PatientName { get; set; }
        public int? DoctorId { get; set; }
        public string? DoctorName { get; set; }
        public DateTime? Datetime { get; set; }
        public string? Note { get; set; }
        public string? Status { get; set; }
        public bool? DeleteFlag { get; set; }
    }
}
