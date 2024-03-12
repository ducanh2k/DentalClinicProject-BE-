namespace DentalClinicProject.DTO
{
    public class CommentDTO
    {
        public int Id { get; set; }
        public int? PatientId { get; set; }
        public string? PatientName { get; set; }
        public string? CommentDetail { get; set; }
        public bool? DeleteFlag { get; set; }
        public DateTime? CreatedAt { get; set; }
        public int? DoctorId { get; set; }
        public string? DoctorName { get; set; }
        public int? RatingStar { get; set; }

    }
}
