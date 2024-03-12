using System;
using System.Collections.Generic;

namespace DentalClinicProject.Models
{
    public partial class Payment
    {
        public Payment()
        {
            Invoices = new HashSet<Invoice>();
        }

        public int PaymentId { get; set; }
        public string? PaymentName { get; set; }

        public virtual ICollection<Invoice> Invoices { get; set; }
    }
}
