﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Academic.DbEntities.Office;
using Academic.DbEntities.Structure;
using Academic.DbEntities.User;

namespace Academic.DbEntities.Exams
{
    public class Exam
    {
        public int Id { get; set; }

        public int? ExamTypeId { get; set; }
        public virtual ExamType ExamType { get; set; }

        public string Name { get; set; }
        public string NoticeContent { get; set; }

        public bool? IsPercent { get; set; }
        public float? Weight { get; set; }

        public DateTime? StartDate { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public DateTime? ResultDate { get; set; }

        public bool? Void { get; set; }

        public int SchoolId { get; set; }
        public virtual School School { get; set; }

        public int AcademicYearId { get; set; }
        public virtual AcademicYear AcademicYear { get; set; }

        public int? SessionId { get; set; }
        public virtual Session Session { get; set; }

        public int? ExamCoordinatorId { get; set; }
        public virtual Users ExamCoordinator { get; set; }//teacher or staff

        public virtual ICollection<ExamOfClass> ExamOfClasses { get; set; }

        public int CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }

        public bool? PublishNoticeToNoticeBoard { get; set; }

        public int? NoticeId { get; set; }
        public virtual Notices.Notice Notice { get; set; }
        //public int Position { get; set; }
        /*
        
        /// <summary>
        /// if null then for whole School
        /// </summary>
        public int? LevelId { get; set; }
        /// <summary>
        /// if null then for whole levels
        /// </summary>
        public int? FacltyId { get; set; }
        /// <summary>
        /// if null then for whole faculty
        /// </summary>
        public int? ProgramId { get; set; }
        /// <summary>
        /// if null then this exam is for whole program
        /// </summary>
        public int? YearId { get; set; }
          
        public virtual Level Level { get; set; }
        public virtual Faculty Faclty { get; set; }
        public virtual Program Program { get; set; }
        public virtual Year Year { get; set; }
          
        */
    }
}
