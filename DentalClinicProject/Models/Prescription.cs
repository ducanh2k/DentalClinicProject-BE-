using System;
using System.Collections.Generic;

namespace DentalClinicProject.Models
{
    public partial class Prescription
    {
        public Prescription()
        {
            Invoices = new HashSet<Invoice>();
            MedicalRecords = new HashSet<MedicalRecord>();
        }

        public int Id { get; set; }
        public int? MedicineId { get; set; }
        public int? Quantity { get; set; }
        public string? DosageInstruction { get; set; }

        public virtual Medicine? Medicine { get; set; }
        public virtual ICollection<Invoice> Invoices { get; set; }
        public virtual ICollection<MedicalRecord> MedicalRecords { get; set; }
    }
}
