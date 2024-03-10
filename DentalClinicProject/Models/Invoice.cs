using System;
using System.Collections.Generic;

namespace DentalClinicProject.Models
{
    public partial class Invoice
    {
        public Invoice()
        {
            InvoiceLines = new HashSet<InvoiceLine>();
        }

        public int InvoiceId { get; set; }
        public int? CustomerId { get; set; }
        public int? StaffId { get; set; }
        public DateTime? Date { get; set; }
        public double? Discount { get; set; }
        public int? Status { get; set; }
        public string? Comment { get; set; }
        public int? PaymentId { get; set; }
        public bool? DeleteFlag { get; set; }

        public virtual User? Customer { get; set; }
        public virtual Payment? Payment { get; set; }
        public virtual User? Staff { get; set; }
        public virtual ICollection<InvoiceLine> InvoiceLines { get; set; }
    }
}
