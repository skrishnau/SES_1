﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Academic.DbEntities.Class;
using Academic.DbEntities.User;

namespace Academic.DbEntities.ActivityAndResource
{
    public class ActivityGrading
    {
        public int Id { get; set; }
        public string Remarks { get; set; }

        public int UserClassId { get; set; }
        public virtual UserClass UserClass { get; set; }

        public int ActivityResourceId { get; set; }
        public virtual ActivityResource ActivityResource { get; set; }

        public DateTime GradedDate { get; set; }
        public int  GradedById { get; set; }
        public virtual Users GradedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedById { get; set; }
        public virtual Users ModifiedBy { get; set; }


        
        /// <summary>
        ///depending in gradeType of Activity, 
        ///Either ObtainedValue or GradeId is present but not both
        /// </summary>
        public int? ObtainedGradeId { get; set; }
        public virtual Grades.GradeValue ObtainedGrade { get; set; }

        /// <summary>
        ///depending in gradeType of Activity, 
        ///Either ObtainedValue or GradeId is present but not both
        /// </summary>
        public float? ObtainedGradeMarks { get; set; }
        
    }
}
