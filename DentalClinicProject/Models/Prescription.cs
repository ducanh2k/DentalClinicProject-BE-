using System;
using System.Collections.Generic;

namespace DentalClinicProject.Models
{
    public partial class Prescription
    {
        public Prescription()
        {
            Invoices = new HashSet<Invoice>();
            MedicalRecordDetails = new HashSet<MedicalRecordDetail>();
        }

        public int Id { get; set; }
        public int? MedicineId { get; set; }
        public int? Quantity { get; set; }
        public string? DosageInstruction { get; set; }
        public bool? DeleteFlag { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? DoctorId { get; set; }
        public string? Note { get; set; }

        public virtual User? Doctor { get; set; }
        public virtual Medicine? Medicine { get; set; }
        public virtual ICollection<Invoice> Invoices { get; set; }
        public virtual ICollection<MedicalRecordDetail> MedicalRecordDetails { get; set; }
    }
}
