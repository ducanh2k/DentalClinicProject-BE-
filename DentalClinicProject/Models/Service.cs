using System;
using System.Collections.Generic;

namespace DentalClinicProject.Models
{
    public partial class Service
    {
        public Service()
        {
            InvoiceLines = new HashSet<InvoiceLine>();
            MedicalRecordDetails = new HashSet<MedicalRecordDetail>();
        }

        public int ServiceId { get; set; }
        public string? ServiceName { get; set; }
        public string? BriefInfo { get; set; }
        public string? Description { get; set; }
        public double? Price { get; set; }
        public bool? DeleteFlag { get; set; }

        public virtual ICollection<InvoiceLine> InvoiceLines { get; set; }
        public virtual ICollection<MedicalRecordDetail> MedicalRecordDetails { get; set; }
    }
}
