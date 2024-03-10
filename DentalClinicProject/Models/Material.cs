using System;
using System.Collections.Generic;

namespace DentalClinicProject.Models
{
    public partial class Material
    {
        public Material()
        {
            InvoiceLines = new HashSet<InvoiceLine>();
        }

        public int MaterialId { get; set; }
        public string? MaterialName { get; set; }
        public string? Supplier { get; set; }
        public double? UnitPrice { get; set; }
        public int? QuantityInStock { get; set; }
        public bool? Type { get; set; }
        public bool? DeleteFlag { get; set; }

        public virtual ICollection<InvoiceLine> InvoiceLines { get; set; }
    }
}
