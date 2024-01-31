using System;
using System.Collections.Generic;

namespace DentalClinicProject.Models
{
    public partial class WorkShift
    {
        public int Id { get; set; }
        public double WorkHours { get; set; }
        public string Shifts { get; set; } = null!;
        public string? Holidays { get; set; }
        public int ChefId { get; set; }

        public virtual Chef Chef { get; set; } = null!;
    }
}
