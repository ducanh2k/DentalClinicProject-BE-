namespace DentalClinicProject.DTO
{
    public class NewsDTO
    {
        public int Id { get; set; }
        public string? Tittle { get; set; }
        public string? BriefInfo { get; set; }
        public string? Description { get; set; }
        public int? Author { get; set; }
        public string? AuthorName { get; set; }
        public DateTime? CreatedAt { get; set; }
        public bool? DeleteFlag { get; set; }
        public bool? Featured { get; set; }
        public string? Img { get; set; }
    }
}
