namespace DentalClinicProject.DTO
{
    public class ServiceDTO
    {
        public int ServiceId { get; set; }
        public string? ServiceName { get; set; }
        public string? BriefInfo { get; set; }
        public string? Description { get; set; }
        public double? Price { get; set; }
        public bool? DeleteFlag { get; set; }
    }
}
