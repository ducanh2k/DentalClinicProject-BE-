using System;
using System.Collections.Generic;

namespace DentalClinicProject.Models
{
    public partial class User
    {
        public User()
        {
            AppointmentEmployees = new HashSet<Appointment>();
            AppointmentPatients = new HashSet<Appointment>();
            AreasOfExpertises = new HashSet<AreasOfExpertise>();
            Comments = new HashSet<Comment>();
            Degrees = new HashSet<Degree>();
            ForeignLanguages = new HashSet<ForeignLanguage>();
            Invoices = new HashSet<Invoice>();
            MedicalRecords = new HashSet<MedicalRecord>();
            ParticipatingTrainingCourses = new HashSet<ParticipatingTrainingCourse>();
        }

        public int UserId { get; set; }
        public string? Name { get; set; }
        public DateTime? DateCreated { get; set; }
        public string? Phone { get; set; }
        public string? Email { get; set; }
        public string? Img { get; set; }
        public string? Description { get; set; }
        public double? Salary { get; set; }
        public int? Role { get; set; }
        public string? Password { get; set; }
        public bool? DeleteFlag { get; set; }

        public virtual Role? RoleNavigation { get; set; }
        public virtual ICollection<Appointment> AppointmentEmployees { get; set; }
        public virtual ICollection<Appointment> AppointmentPatients { get; set; }
        public virtual ICollection<AreasOfExpertise> AreasOfExpertises { get; set; }
        public virtual ICollection<Comment> Comments { get; set; }
        public virtual ICollection<Degree> Degrees { get; set; }
        public virtual ICollection<ForeignLanguage> ForeignLanguages { get; set; }
        public virtual ICollection<Invoice> Invoices { get; set; }
        public virtual ICollection<MedicalRecord> MedicalRecords { get; set; }
        public virtual ICollection<ParticipatingTrainingCourse> ParticipatingTrainingCourses { get; set; }
    }
}
