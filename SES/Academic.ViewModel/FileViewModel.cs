﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Academic.ViewModel
{
    public class FileViewModel
    {
        public int Id { get; set; }
        public string DisplayName { get; set; }
        public string FileName { get; set; }
        public string FileDirectory { get; set; }

        public DateTime CreatedDate { get; set; }
        public DateTime ModifiedDate { get; set; }
        public int CreatedBy { get; set; }
        public int ModifiedBy { get; set; }

        public bool IsDeleted { get; set; }
    }
}
