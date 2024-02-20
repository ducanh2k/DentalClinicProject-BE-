using System;
using System.Collections.Generic;

namespace DentalClinicProject.Models
{
    public partial class Invoice
    {
        public int Id { get; set; }
        public int? PrescriptionId { get; set; }
        public int? PatientId { get; set; }
        public int? AppointmentId { get; set; }
        public double? Discount { get; set; }

        public virtual Appointment? Appointment { get; set; }
        public virtual User? Patient { get; set; }
        public virtual Prescription? Prescription { get; set; }
    }
}
