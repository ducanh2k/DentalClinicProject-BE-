using System;
using System.Collections.Generic;

namespace DentalClinicProject.Models
{
    public partial class MarketingBudget
    {
        public MarketingBudget()
        {
            ScheduleMarketings = new HashSet<ScheduleMarketing>();
        }

        public int Id { get; set; }
        public string Type { get; set; } = null!;
        public decimal Budget { get; set; }

        public virtual ICollection<ScheduleMarketing> ScheduleMarketings { get; set; }
    }
}
