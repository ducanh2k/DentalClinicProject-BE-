using System;
using System.Collections.Generic;

namespace DentalClinicProject.Models
{
    public partial class MedicalRecordDetail
    {
        public MedicalRecordDetail()
        {
            Appointments = new HashSet<Appointment>();
        }

        public int MrDetailId { get; set; }
        public int? MedicalRecordId { get; set; }
        public int? ServiceId { get; set; }
        public int? PrescriptionId { get; set; }
        public string? Diagnosis { get; set; }
        public bool? DeleteFlag { get; set; }

        public virtual MedicalRecord? MedicalRecord { get; set; }
        public virtual Prescription? Prescription { get; set; }
        public virtual Service? Service { get; set; }
        public virtual ICollection<Appointment> Appointments { get; set; }
    }
}
