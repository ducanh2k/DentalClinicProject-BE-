using System;
using System.Collections.Generic;

namespace DentalClinicProject.Models
{
    public partial class Comment
    {
        public int Id { get; set; }
        public int? PatientId { get; set; }
        public string? CommentDetail { get; set; }

        public virtual User? Patient { get; set; }
    }
}
