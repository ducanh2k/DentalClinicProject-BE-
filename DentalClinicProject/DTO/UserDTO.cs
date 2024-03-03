using DentalClinicProject.Models;

namespace DentalClinicProject.DTO
{
    public class UserDTO
    {
        public int UserId { get; set; }
        public string? Name { get; set; }
        public string? Phone { get; set; }
        public string? Email { get; set; }
        public string? Img { get; set; }
        public string? Description { get; set; }
        public double? Salary { get; set; }
        public int? RoleId { get; set; }
        public string? RoleName { get; set; }
        public bool? DeleteFlag { get; set; }
        public string? Password { get; set; }
    }

    public partial class ForeignLanguageDTO
    {
        public int Id { get; set; }
        public int? EmployeeId { get; set; }
        public string? Detail { get; set; }

    }

    public partial class DegreeDTO
    {
        public int Id { get; set; }
        public int? EmployeeId { get; set; }
        public string? Detail { get; set; }

    }

    public partial class AreasOfExpertiseDTO
    {
        public int Id { get; set; }
        public int? EmployeeId { get; set; }
        public string? Detail { get; set; }

    }

    public partial class ParticipatingTrainingCourseDTO
    {
        public int Id { get; set; }
        public int? EmployeeId { get; set; }
        public string? Detail { get; set; }
    }
}
