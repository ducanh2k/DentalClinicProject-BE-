using System;
using System.Collections.Generic;

namespace DentalClinicProject.Models
{
    public partial class AreasOfExpertise
    {
        public int Id { get; set; }
        public int? EmployeeId { get; set; }
        public string? Detail { get; set; }

        public virtual User? Employee { get; set; }
    }

   
}
