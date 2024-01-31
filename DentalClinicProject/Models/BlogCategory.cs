using System;
using System.Collections.Generic;

namespace DentalClinicProject.Models
{
    public partial class BlogCategory
    {
        public BlogCategory()
        {
            BlogsCategories = new HashSet<BlogsCategory>();
        }

        public int Id { get; set; }
        public string CategoryName { get; set; } = null!;

        public virtual ICollection<BlogsCategory> BlogsCategories { get; set; }
    }
}
