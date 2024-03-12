using System;
using System.Collections.Generic;

namespace DentalClinicProject.Models
{
    public partial class Prescription
    {
        public Prescription()
        {
            MedicalRecordDetails = new HashSet<MedicalRecordDetail>();
            PrescriptionDetails = new HashSet<PrescriptionDetail>();
        }

        public int PrescriptionId { get; set; }
        public bool? DeleteFlag { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? DoctorId { get; set; }
        public string? Note { get; set; }

        public virtual User? Doctor { get; set; }
        public virtual ICollection<MedicalRecordDetail> MedicalRecordDetails { get; set; }
        public virtual ICollection<PrescriptionDetail> PrescriptionDetails { get; set; }
    }
}
