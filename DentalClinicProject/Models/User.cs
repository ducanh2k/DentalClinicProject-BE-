using System;
using System.Collections.Generic;
using System.Security.Cryptography;

namespace DentalClinicProject.Models
{
    public partial class User
    {
        public User()
        {
            AppointmentDoctors = new HashSet<Appointment>();
            AppointmentEmployees = new HashSet<Appointment>();
            AppointmentPatients = new HashSet<Appointment>();
            AreasOfExpertises = new HashSet<AreasOfExpertise>();
            CommentDoctors = new HashSet<Comment>();
            CommentPatients = new HashSet<Comment>();
            Degrees = new HashSet<Degree>();
            ForeignLanguages = new HashSet<ForeignLanguage>();
            InvoiceCustomers = new HashSet<Invoice>();
            InvoiceStaffs = new HashSet<Invoice>();
            MedicalRecords = new HashSet<MedicalRecord>();
            News = new HashSet<News>();
            ParticipatingTrainingCourses = new HashSet<ParticipatingTrainingCourse>();
            Prescriptions = new HashSet<Prescription>();
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
        public bool? DeleteFlag { get; set; }
        public byte[]? PasswordHash { get; set; }
        public byte[]? PasswordSalt { get; set; }
        public string? RefreshToken { get; set; }
        public DateTime? TokenCreated { get; set; }
        public DateTime? TokenExpires { get; set; }
        public bool? Gender { get; set; }
        public string? Address { get; set; }
        public DateTime? Dob { get; set; }

        public virtual Role? RoleNavigation { get; set; }
        public virtual ICollection<Appointment> AppointmentDoctors { get; set; }
        public virtual ICollection<Appointment> AppointmentEmployees { get; set; }
        public virtual ICollection<Appointment> AppointmentPatients { get; set; }
        public virtual ICollection<AreasOfExpertise> AreasOfExpertises { get; set; }
        public virtual ICollection<Comment> CommentDoctors { get; set; }
        public virtual ICollection<Comment> CommentPatients { get; set; }
        public virtual ICollection<Degree> Degrees { get; set; }
        public virtual ICollection<ForeignLanguage> ForeignLanguages { get; set; }
        public virtual ICollection<Invoice> InvoiceCustomers { get; set; }
        public virtual ICollection<Invoice> InvoiceStaffs { get; set; }
        public virtual ICollection<MedicalRecord> MedicalRecords { get; set; }
        public virtual ICollection<News> News { get; set; }
        public virtual ICollection<ParticipatingTrainingCourse> ParticipatingTrainingCourses { get; set; }
        public virtual ICollection<Prescription> Prescriptions { get; set; }

        internal void CreatePasswordHash(string password)
        {
            using (var hmac = new HMACSHA512())
            {
                PasswordSalt = hmac.Key;
                PasswordHash = hmac.ComputeHash(System.Text.Encoding.UTF8.GetBytes(password));
            }
        }

        internal bool VerifyPasswordHash(string password)
        {
            using (var hmac = new HMACSHA512(PasswordSalt))
            {
                var computedHash = hmac.ComputeHash(System.Text.Encoding.UTF8.GetBytes(password));
                return PasswordHash != null && computedHash != null && PasswordHash.Length == computedHash.Length && PasswordHash.AsSpan().SequenceEqual(computedHash);
            }
        }

        internal string GenerateRandomPassword(int length = 8)
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            var random = new Random();
            return new string(Enumerable.Repeat(chars, length)
                .Select(s => s[random.Next(s.Length)]).ToArray());
        }

    }
}
