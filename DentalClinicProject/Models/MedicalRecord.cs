using System;
using System.Collections.Generic;

namespace DentalClinicProject.Models
{
    public partial class MedicalRecord
    {
        public int RecordId { get; set; }
        public int? PatientId { get; set; }
        public int? AppointmentId { get; set; }
        public int? ServiceId { get; set; }
        public int? PrescriptionId { get; set; }
        public string? Diagnosis { get; set; }

        public virtual Appointment? Appointment { get; set; }
        public virtual User? Patient { get; set; }
        public virtual Prescription? Prescription { get; set; }
        public virtual Service? Service { get; set; }
    }
}
