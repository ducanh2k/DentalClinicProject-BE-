using System;
using System.Collections.Generic;

namespace DentalClinicProject.Models
{
    public partial class Event
    {
        public Event()
        {
            BookTables = new HashSet<BookTable>();
        }

        public int Id { get; set; }
        public string EventName { get; set; } = null!;

        public virtual ICollection<BookTable> BookTables { get; set; }
    }
}
