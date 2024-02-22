namespace DentalClinicProject.DTO
{
    public class AppointmentDTO
    {
        public int? EmployeeId { get; set; }
        public int? PatientId { get; set; }
        public DateTime? Datetime { get; set; }
        public string? Note { get; set; }
        public bool? Status { get; set; }
    }
}
