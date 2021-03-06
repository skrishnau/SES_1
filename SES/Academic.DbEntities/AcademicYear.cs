﻿
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Academic.DbEntities.AcacemicPlacements;

namespace Academic.DbEntities
{
    public class AcademicYear
    {
        public int Id { get; set; }
        public string Name { get; set; }

        //automatically generated
        public int Position { get; set; }


        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }

        public bool? RemindWhenEndDate { get; set; }//setting to check ; true -- remind about the nearing of end date

        //foreign
        /// <summary>
        /// if completed = true ; then we can't activate.
        /// </summary>
        public bool IsActive { get; set; }
        public DateTime? ActiveMarkedDate { get; set; }
        public int? ActiveMarkedById { get; set; }
        /// <summary>
        /// Completed is marked true when all the classes are completed whereas IsActive only indicates if the acacemic year 
        /// is active.
        /// So if commpleted, then we can't activate..
        /// </summary>
        public bool? Completed { get; set; }
        public DateTime? CompleteMarkedDate { get; set; }
        public int? CompleteMarkedById { get; set; }

        public int SchoolId { get; set; }
        

        public bool? Void { get; set; }
        //public virtual School  School { get; set; }
        /// <summary>
        /// Since academic year and batch have 1 to 1 relationship, so 'Batches' has only one 'batch'.
        /// </summary>
        public virtual ICollection<Batches.Batch> Batches { get; set; }
        public virtual ICollection<Session> Sessions { get; set; } 
        public virtual ICollection<Exams.Exam> Exams { get; set; }
        public virtual ICollection<RunningClass> RunningClasses { get; set; }
    }
}
