using System;
using System.Collections.Generic;

namespace DentalClinicProject.Models
{
    public partial class MedicalRecord
    {
        public MedicalRecord()
        {
            MedicalRecordDetails = new HashSet<MedicalRecordDetail>();
        }

        public int MedicalRecordId { get; set; }
        public int? PatientId { get; set; }
        public bool? DeleteFlag { get; set; }

        public virtual User? Patient { get; set; }
        public virtual ICollection<MedicalRecordDetail> MedicalRecordDetails { get; set; }
    }
}
