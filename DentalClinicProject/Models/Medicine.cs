using System;
using System.Collections.Generic;

namespace DentalClinicProject.Models
{
    public partial class Medicine
    {
        public Medicine()
        {
            Prescriptions = new HashSet<Prescription>();
        }

        public int Id { get; set; }
        public string? Name { get; set; }
        public string? Manufacturer { get; set; }
        public DateTime? ExpiryDate { get; set; }
        public DateTime? InputDay { get; set; }
        public double? Price { get; set; }
        public int? QuantityInStock { get; set; }
        public string? Dosage { get; set; }
        public string? Description { get; set; }
        public bool? DeleteFlag { get; set; }

        public virtual ICollection<Prescription> Prescriptions { get; set; }
    }
}
