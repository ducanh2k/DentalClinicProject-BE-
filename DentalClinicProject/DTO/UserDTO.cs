namespace DentalClinicProject.DTO
{
    public class UserDTO
    {
        public string? Name { get; set; }
        public DateTime? DateCreated { get; set; }
        public string? Phone { get; set; }
        public string? Email { get; set; }
        public string? Img { get; set; }
        public string? Description { get; set; }
        public double? Salary { get; set; }
        public int? RoleId { get; set; }
        public string? RoleName { get; set; }
        public bool? DeleteFlag { get; set; }
    }
}
