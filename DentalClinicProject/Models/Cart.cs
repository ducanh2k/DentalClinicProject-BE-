using System;
using System.Collections.Generic;

namespace DentalClinicProject.Models
{
    public partial class Cart
    {
        public int Id { get; set; }
        public int FoodId { get; set; }
        public int UserId { get; set; }
        public int Quantity { get; set; }

        public virtual Food Food { get; set; } = null!;
        public virtual User User { get; set; } = null!;
    }
}
