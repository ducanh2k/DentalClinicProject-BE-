using System;
using System.Collections.Generic;

namespace DentalClinicProject.Models
{
    public partial class OrdersChef
    {
        public int Id { get; set; }
        public int Oid { get; set; }
        public int ChefId { get; set; }

        public virtual Chef Chef { get; set; } = null!;
        public virtual Order OidNavigation { get; set; } = null!;
    }
}
