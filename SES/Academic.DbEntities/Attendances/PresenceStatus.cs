﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Academic.DbEntities.Attendances
{
    public class PresenceStatus
    {
        public int Id { get; set; }
        public string Status { get; set; }

        public bool IsActive { get; set; }
    }
}
