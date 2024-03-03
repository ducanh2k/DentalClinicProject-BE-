using System;
using System.Collections.Generic;

namespace DentalClinicProject.Models
{
    public partial class PrescriptionDetail
    {
        public int PrescriptionDetailId { get; set; }
        public int? PrescriptionId { get; set; }
        public int? MedicineId { get; set; }
        public int? Quantity { get; set; }
        public string? DosageInstruction { get; set; }
        public string? DeleteFlag { get; set; }

        public virtual Medicine? Medicine { get; set; }
        public virtual Prescription? Prescription { get; set; }
    }
}
