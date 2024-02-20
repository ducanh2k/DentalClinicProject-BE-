using System;
using System.Collections.Generic;

namespace DentalClinicProject.Models
{
    public partial class Service
    {
        public Service()
        {
            MedicalRecords = new HashSet<MedicalRecord>();
        }

        public int ServiceId { get; set; }
        public string? ServiceName { get; set; }
        public string? BriefInfo { get; set; }
        public string? Description { get; set; }
        public double? Price { get; set; }

        public virtual ICollection<MedicalRecord> MedicalRecords { get; set; }
    }
}
