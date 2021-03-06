﻿using Academic.DbEntities;
//using Academic.DbEntities.SystemModules;
using Academic.DbEntities.User;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Data.Entity.ModelConfiguration.Conventions;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Academic.DbEntities.AcacemicPlacements;
using Academic.DbEntities.Global;
using Academic.DbEntities.Messages;
using Academic.DbEntities.Teachers;

//using Academic.DbEntities;

namespace Academic.Database
{
    public class AcademicContext : DbContext
    {
        public AcademicContext()
            // : base("Academy")
            // : base("Academy_New")//all tables in the table AcademyDB
            // :base("Academic_Migration") // for migration only
            //: base("Academy_New_Project")
            : base("Latest_Academy")
        {

        }


        //Message
        public DbSet<Message> Message { get; set; }

        public DbSet<AcademicYear> AcademicYear { get; set; }
        public DbSet<Session> Session { get; set; }
        public DbSet<SessionDefault> SessionDefault { get; set; }
        
        //public DbSet<Admins> Admins { get; set; }
        //public DbSet<AdminTitle> AdminTitle { get; set; }
        //public DbSet<OtherAdmins> OtherAdmins { get; set; }
        //public DbSet<SessionAdmins> SessionAdmins { get; set; }

        public DbSet<FileCategory> FileCategory { get; set; }
        public DbSet<UserFile> File { get; set; }


        //Event
        public DbSet<DbEntities.Events.Event> Event { get; set; }


        //------------------------- GRADE ---------------------------//

        public DbSet<DbEntities.Grades.Grade> Grade { get; set; }
        public DbSet<DbEntities.Grades.GradeValue> GradeValue { get; set; }

        //-----------------------------------------------------------//


        // ---------------- ClassUser, ClassSubject ----------------//

        public DbSet<Academic.DbEntities.Class.UserClass> UserClass { get; set; }
        public DbSet<DbEntities.Class.SubjectClass> SubjectClass { get; set; }
        public DbSet<DbEntities.Class.SubjectClassGrouping> SubjectClassGrouping { get; set; }
        public DbSet<DbEntities.Class.UserClassGrouping> UserClassGrouping { get; set; }
        
        //---------------------------------------------------------//


        //--------Academic Placement--------------//
        public DbSet<Academic.DbEntities.AcacemicPlacements.RunningClass> RunningClass { get; set; }

        //public DbSet<Academic.DbEntities.AcacemicPlacements.StudentClass> StudentClass { get; set; }

        //uncomment this
        //public DbSet<Academic.DbEntities.AcacemicPlacements.SubjectClass> SubjectClass { get; set; }


        //public DbSet<Academic.DbEntities.AcacemicPlacements.SubjectSubscription> SubjectSubscription { get; set; }
        //public DbSet<Academic.DbEntities.AcacemicPlacements.StudentsOpinionAboutSubject> StudentsOpinionAboutSubject { get; set; }
        //public DbSet<Academic.DbEntities.AcacemicPlacements.TeacherClass> TeacherClass { get; set; }
        //-----------------END----------------------//

        //------------Restriction ------------------------//
        public DbSet<DbEntities.AccessPermission.ActivityCompletionRestriction> ActivityCompletionRestriction { get; set; }
        public DbSet<DbEntities.AccessPermission.DateRestriction> DateRestriction { get; set; }
        public DbSet<DbEntities.AccessPermission.GradeRestriction> GradeRestriction { get; set; }
        public DbSet<DbEntities.AccessPermission.GroupRestriction> GroupRestriction { get; set; }
        public DbSet<DbEntities.AccessPermission.UserProfileRestriction> UserProfileRestriction { get; set; }
        public DbSet<DbEntities.AccessPermission.Restriction> Restriction { get; set; }
        //------------------- Restriction END -----------------------/



        //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$//
        public DbSet<DbEntities.ActivityAndResource.ActivityResource> ActivityResource { get; set; }
        public DbSet<DbEntities.ActivityAndResource.ActivityClass> ActivityClass { get; set; }
        public DbSet<DbEntities.ActivityAndResource.ActivityGrading> ActivityGrading { get; set; }
        public DbSet<DbEntities.ActivityAndResource.ActivityCompletion> ActivityCompletion { get; set; }
        public DbSet<DbEntities.ActivityAndResource.ActivityResourceView> ActivityResourceView { get; set; }


        public DbSet<DbEntities.ActivityAndResource.ChoiceActivity> ChoiceActivity { get; set; }
        public DbSet<DbEntities.ActivityAndResource.ChoiceItems.ChoiceOptions> ChoiceOptions { get; set; }
        public DbSet<DbEntities.ActivityAndResource.ChoiceItems.ChoiceUser> ChoiceUser { get; set; }


        public DbSet<DbEntities.ActivityAndResource.Assignment> Assignment { get; set; }
        public DbSet<DbEntities.ActivityAndResource.AssignmentItems.AssignmentSubmissions> AssignmentSubmissions { get; set; }
        public DbSet<DbEntities.ActivityAndResource.AssignmentItems.AssignmentSubmissionFiles> AssignmentSubmissionFiles { get; set; }


        public DbSet<DbEntities.ActivityAndResource.ForumActivity> ForumActivity { get; set; }
        public DbSet<DbEntities.ActivityAndResource.ForumItems.ForumDiscussion> ForumDiscussion { get; set; }




        public DbSet<DbEntities.ActivityAndResource.BookResource> BookResource { get; set; }
        public DbSet<DbEntities.ActivityAndResource.BookItems.BookChapter> BookChapter { get; set; }

        public DbSet<DbEntities.ActivityAndResource.UrlResource> UrlResource { get; set; }

        public DbSet<DbEntities.ActivityAndResource.FileResource> FileResource { get; set; }
        public DbSet<DbEntities.ActivityAndResource.FileItems.FileResourceFiles> FileResourceFiles { get; set; }

        public DbSet<DbEntities.ActivityAndResource.PageResource> PageResource { get; set; }

        public DbSet<DbEntities.ActivityAndResource.LabelResource> LabelResource { get; set; }
        //$$$$$$$$$$$$$$$$$$$$$!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!$$$$$$$$$$$$$$$$$$$$$$$$$

        //public DbSet<DbEntities.Activities.ClassInAcademicYear> ActiveClassesInAcademicYear { get; set; }


        //Uncomment later.. for use not

        //public DbSet<DbEntities.Attendances.Attendance> Attendance { get; set; }
        //public DbSet<DbEntities.Attendances.AttendanceDay> AttendanceDay { get; set; }
        //public DbSet<DbEntities.Attendances.PresenceStatus> PresenceStatus { get; set; }

        public DbSet<DbEntities.Exams.Exam> Exam { get; set; }
        public DbSet<DbEntities.Exams.ExamType> ExamType { get; set; }

        public DbSet<DbEntities.Exams.ExamOfClass> ExamOfClass { get; set; }
        public DbSet<DbEntities.Exams.ExamStudent> ExamStudent { get; set; }
        public DbSet<DbEntities.Exams.ExamSubject> ExamSubject { get; set; }
        public DbSet<DbEntities.Exams.ExamSubjectExaminer> ExamSubjectExaminer { get; set; }




        public DbSet<DbEntities.Libraries.TextBook> Book { get; set; }
        public DbSet<DbEntities.Libraries.BookAuthor> BookAuthor { get; set; }

        //public DbSet<DbEntities.Libraries.BookCategory> BookCategory { get; set; }
        //public DbSet<DbEntities.Libraries.BookReturnCategory> BookReturnCategory { get; set; }
        //public DbSet<DbEntities.Libraries.Issue> Issue { get; set; }
        //public DbSet<DbEntities.Libraries.Library> Library { get; set; }
        //public DbSet<DbEntities.Libraries.MemberShip> MemberShip { get; set; }
        //public DbSet<DbEntities.Libraries.MembershipType> MembershipType { get; set; }
        //public DbSet<DbEntities.Libraries.Return> Return { get; set; }
        //public DbSet<DbEntities.Libraries.UsefulnessCategory> UsefulnessCategory { get; set; }

        //public DbSet<DbEntities.Marks.ExamMarks> ExamMarks { get; set; }

        //public DbSet<DbEntities.Resources.AccessPermission> AccessPermission { get; set; }
        // public DbSet<DbEntities.Resources.ResourceFile> ResourceFile { get; set; }
        //public DbSet<DbEntities.Resources.Photo> Photo { get; set; }

        /*
        public DbSet<DbEntities.Resources.Resource> Resource { get; set; }
        public DbSet<DbEntities.Resources.Links> Links { get; set; }

        public DbSet<DbEntities.Resources.ResourcesSend.StudentGroupResourceShare> StudentGroupResourceShare { get; set; }
        public DbSet<DbEntities.Resources.ResourcesSend.StudentResourceShare> StudentResourceShare { get; set; }
        public DbSet<DbEntities.Resources.ResourcesSend.TeacherResourceShare> TeacherResourceShare { get; set; }
        */

        //public DbSet<DbEntities.Structure.Faculty> Faculty { get; set; }
        //public DbSet<DbEntities.Structure.FacultyCategory> FacultyCategory { get; set; }
        //public DbSet<DbEntities.Structure.Level> Level { get; set; }
        //public DbSet<DbEntities.Structure.LevelCategory> LevelCategory { get; set; }
        public DbSet<DbEntities.Structure.Program> Program { get; set; }
        public DbSet<DbEntities.Structure.SubYear> SubYear { get; set; }
        public DbSet<DbEntities.Structure.Year> Year { get; set; }


        //public DbSet<DbEntities.Students.Admission> Admission { get; set; }
        //public DbSet<DbEntities.Students.Fee> Fee { get; set; }
        //public DbSet<DbEntities.Students.Scholarship> Scholarship { get; set; }
        public DbSet<DbEntities.Students.Student> Student { get; set; }
        public DbSet<DbEntities.Students.StudentGroup> StudentGroup { get; set; }
        //public DbSet<DbEntities.Students.StudentNotification> StudentNotification { get; set; }
        //public DbSet<DbEntities.Students.StudentPreviousStudies> StudentPreviousStudies { get; set; }
        //public DbSet<DbEntities.Students.StudentTransfer> StudentTransfer { get; set; }
        //public DbSet<DbEntities.Students.StudentTransferType> TransferType { get; set; }
        public DbSet<DbEntities.Students.StudentGroupStudent> StudentGroupStudent { get; set; }

        /*
        public DbSet<DbEntities.Students.StudentFile> StudentFile { get; set; }
        public DbSet<DbEntities.Students.StudentGroupResource> StudentGroupResource { get; set; }
         
        */

        public DbSet<DbEntities.Batches.Batch> Batch { get; set; }
        public DbSet<DbEntities.Batches.ProgramBatch> ProgramBatch { get; set; }
        public DbSet<DbEntities.Batches.StudentBatch> StudentBatch { get; set; }
        public DbSet<DbEntities.Batches.BatchGrouping> BatchGrouping { get; set; }
        
        
        public DbSet<DbEntities.Subjects.Subject> Subject { get; set; }
        public DbSet<DbEntities.Subjects.SubjectFile> SubjectFile { get; set; }
        public DbSet<DbEntities.Subjects.SubjectGrouping> SubjectGrouping { get; set; }

        public DbSet<DbEntities.Subjects.Report> Report { get; set; }
        public DbSet<DbEntities.Subjects.SubjectCategory> SubjectCategory { get; set; }
        //public DbSet<DbEntities.Subjects.SubjectGroupSubject> SubjectGroupSubject { get; set; }
        //public DbSet<DbEntities.Subjects.RegularSubject> RegularSubjectsGrouping { get; set; }
        public DbSet<DbEntities.Subjects.SubjectStructure> SubjectStructure { get; set; }

        //public DbSet<DbEntities.Subjects.SubjectUserGroup> SubjectUserGroup { get; set; }

        //public DbSet<DbEntities.Subjects.RegularSubjectsTeacher> RegularSubjectsTeacher { get; set; }
        //public DbSet<DbEntities.AcacemicPlacements.RegularSubjectClass>  RegularSubjectClass { get; set; }
        //public DbSet<DbEntities.AcacemicPlacements.UserClass>  UserClass { get; set; }



        //public DbSet<DbEntities.Students.StudentSubject> StudentSubject { get; set; }


        public DbSet<DbEntities.Subjects.SubjectSection> SubjectSection { get; set; }



        //public DbSet<DbEntities.Subjects.Detail.SubjectActivityAndResource> SubjectActivityAndResource { get; set; }

        public DbSet<DbEntities.Teachers.Teacher> Teacher { get; set; }
        public DbSet<DbEntities.Teachers.TeacherQualification> TeacherQualification { get; set; }



        //public DbSet<DbEntities.Teachers.Appointment> Appointment { get; set; }
        //public DbSet<DbEntities.Teachers.TeacherExperience> TeacherExperience { get; set; }
        //public DbSet<DbEntities.Teachers.TeacherNotification> TeacherNotification { get; set; }
        //public DbSet<DbEntities.Teachers.TeacherJobTitle> TeacherJobTitles { get; set; }


        //public DbSet<DbEntities.Office.Institution> Institution { get; set; }

        //public DbSet<DbEntities.Office.Award> Award { get; set; }

        //public DbSet<DbEntities.Office.Branch> Branch { get; set; }

        public DbSet<DbEntities.Office.School> School { get; set; }
        public DbSet<DbEntities.Office.SchoolType> SchoolType { get; set; }


        public DbSet<Users> Users { get; set; }
        public DbSet<Gender> Gender { get; set; }
        //public DbSet<Relation> Relation { get; set; }
        //public DbSet<RelationShip> RelationShip { get; set; }
        public DbSet<Role> Role { get; set; }
        //public DbSet<UserTransfer> UserTransfer { get; set; }

        //public DbSet<UserAssociation> UserAssociation { get; set; }

        //public DbSet<UserType> UserType { get; set; }
        public DbSet<UserRole> UserRole { get; set; }
        public DbSet<UserLastLogin> UserLastLogin { get; set; }

        //public DbSet<RoleCapability> RoleCapability { get; set; }
        //public DbSet<Capability> Capability { get; set; }


        //public DbSet<Division> Division { get; set; }
        //public DbSet<UserDivision> UsersDivision { get; set; }

        //public DbSet<CreatedUser> CreatedUser { get; set; }

        public DbSet<Nation> Nation { get; set; }


        //public DbSet<ModuleAccessPermission> ModuleAccessPermission { get; set; }
        public DbSet<DbEntities.SystemModules.Module> Module { get; set; }
        public DbSet<DbEntities.SystemModules.ModuleAccess> ModuleAccess { get; set; }


        //public DbSet<UserImage> UserImage { get; set; }



        //============================Notice=========================
        public DbSet<DbEntities.Notices.Notice> Notice { get; set; }
        public DbSet<DbEntities.Notices.NoticeNotification> NoticeNotification { get; set; }
        //public DbSet<DbEntities.Notices.NoticeTo> NoticeTo { get; set; }
        //public DbSet<DbEntities.Notices.NoticeFiles> NoticeFiles { get; set; }



        //=========================END Notice ===========================


        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Remove<OneToManyCascadeDeleteConvention>();
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
        }



        //public DbSet<User> Users { get; set; }
        //protected override void OnModelCreating(DbModelBuilder modelBuilder)
        //{
        //modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
        //}
    }
}
