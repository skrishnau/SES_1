﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.AccessControl;
using System.Text;
using System.Threading.Tasks;

namespace Academic.DbEntities.AcacemicPlacements
{
   public  class TeacherClass
    {
       public int Id { get; set; }

       public int TeacherId { get; set; }
       public virtual Teachers.Teacher Teacher { get; set; }
       
       public int SubjectClassId { get; set; }
       public virtual SubjectClass SubjectClass { get; set; }


       //public string MessageToTeacher { get; set; }

       //next version
       //this has to be in another table
       public string PostingFor { get; set; }//Instructor, Lecturer, Junior, Assistant, 


       public bool? Void { get; set; }
       public bool? IsActive { get; set; }

       public virtual ICollection<Exams.ExamSubjectTeacher> ExamSubjectTeachers { get; set; }

    }
}
