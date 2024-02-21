﻿using System;
using System.Collections.Generic;

namespace DentalClinicProject.Models
{
    public partial class News
    {
        public int Id { get; set; }
        public string? Tittle { get; set; }
        public string? BriefInfo { get; set; }
        public string? Description { get; set; }
        public int? Author { get; set; }
        public DateTime? CreatedAt { get; set; }
    }
}
