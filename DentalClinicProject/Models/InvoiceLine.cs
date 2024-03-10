using System;
using System.Collections.Generic;

namespace DentalClinicProject.Models
{
    public partial class InvoiceLine
    {
        public int LineId { get; set; }
        public int? InvoiceId { get; set; }
        public int? ServiceId { get; set; }
        public int? MaterialId { get; set; }
        public int? Quantity { get; set; }
        public string? Comment { get; set; }
        public bool? DeleteFlag { get; set; }

        public virtual Invoice? Invoice { get; set; }
        public virtual Material? Material { get; set; }
        public virtual Service? Service { get; set; }
    }
}
