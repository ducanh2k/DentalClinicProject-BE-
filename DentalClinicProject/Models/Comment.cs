using System;
using System.Collections.Generic;

namespace DentalClinicProject.Models
{
    public partial class Comment
    {
        public int Id { get; set; }
        public int? PatientId { get; set; }
        public string? CommentDetail { get; set; }
        public bool? DeleteFlag { get; set; }
        public DateTime? CreatedAt { get; set; }
        public int? DoctorId { get; set; }
        public int? RatingStar { get; set; }

        public virtual User? Doctor { get; set; }
        public virtual User? Patient { get; set; }
    }
}
