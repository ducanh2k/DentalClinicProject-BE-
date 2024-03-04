using System;
using System.Collections.Generic;

namespace DentalClinicProject.Models
{
    public partial class Appointment
    {
        public Appointment()
        {
            Invoices = new HashSet<Invoice>();
            MedicalRecordDetails = new HashSet<MedicalRecordDetail>();
        }

        public int AppointmentId { get; set; }
        public int? EmployeeId { get; set; }
        public int? PatientId { get; set; }
        public DateTime? Datetime { get; set; }
        public string? Note { get; set; }
        public string? Status { get; set; }
        public bool? DeleteFlag { get; set; }
        public int? DoctorId { get; set; }

        public virtual User? Doctor { get; set; }
        public virtual User? Employee { get; set; }
        public virtual User? Patient { get; set; }
        public virtual ICollection<Invoice> Invoices { get; set; }
        public virtual ICollection<MedicalRecordDetail> MedicalRecordDetails { get; set; }
    }
}
