﻿using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Transactions;
using System.Web.Caching;
using Academic.Database;
using Academic.DbEntities.AcacemicPlacements;
using Academic.DbEntities.Batches;
using Academic.DbEntities.Class;
using Academic.DbEntities.Students;
using Academic.DbEntities.Subjects;
using Academic.ViewModel;
using Academic.ViewModel.AcademicPlacement;

namespace Academic.DbHelper
{
    public partial class DbHelper
    {
        public class Subject : IDisposable
        {
            private AcademicContext Context;

            public Subject()
            {
                Context = new AcademicContext();
            }

            public List<IdAndName> ListSubjects(int levelId)
            {
                //return Context.Subject.Where(x => x.LevelId == levelId).Select(x => new IdAndName() { Id = x.Id, Name = x.Name }).ToList();
                return
                null;
            }

            public List<IdAndName> ListAllSubjects(int schoolId)
            {
                var subs = from c in Context.SubjectCategory
                           join s in Context.Subject on c.Id equals s.SubjectCategoryId
                           where c.SchoolId == schoolId
                           select s
                ;
                //return subs.ToList();

                return subs.Select(x => new IdAndName()
                {
                    Id = x.Id
                    ,
                    Name = x.FullName
                }).ToList();
            }

            public int AddIfNotExists(ViewModel.Subject.Subject subject)
            {

                //var entity = Context.Subject.FirstOrDefault(x => x.Name == subject.Name && x.LevelId == subject.LevelId);
                //if (entity == null)
                //{
                //    var sub = new DbEntities.Subjects.Subject()
                //      {
                //          Name = subject.Name,
                //          LevelId = subject.LevelId
                //      };
                //    var su = Context.Subject.Add(sub);
                //    Context.SaveChanges();
                //    return su.Id;
                //}
                //else
                //{
                //    return entity.Id;
                //}
                return 0;
            }

            public void Dispose()
            {
                Context.Dispose();
            }

            public List<IdAndName> ListSubjectsOfYearForCombo(int YearId)
            {
                List<IdAndName> sub = new List<IdAndName>();

                //var subjects = Context.Subject.Where(x => x.YearId == YearId && (x.IsNotInSyllabus==false || x.IsNotInSyllabus==null) ).ToList();
                //subjects.ForEach(x =>
                //{
                //    sub.Add(new IdAndName(){Id=x.Id, Name = x.Name});
                //});
                return sub;
            }


            //=========================WebForm ===============New ==========//

            public DbEntities.Subjects.SubjectCategory AddOrUpdateSubjectCategory(DbEntities.Subjects.SubjectCategory cat)
            {
                try
                {
                    var c = Context.SubjectCategory.Find(cat.Id);
                    if (c == null)
                    {
                        var category = Context.SubjectCategory.Add(cat);
                        Context.SaveChanges();
                        return category;
                    }
                    else
                    {
                        c.Description = cat.Description;
                        c.IsActive = cat.IsActive;
                        c.IsVoid = cat.IsVoid;
                        c.Name = cat.Name;
                        c.ParentId = cat.ParentId;
                    }
                    Context.SaveChanges();
                    return c;
                }
                catch (Exception)
                {
                    return null;
                }
            }

            public List<SubjectCategory> GetCategories(int schoolId)
            {
                return Context.SubjectCategory.Where(x => x.SchoolId == schoolId).ToList();
            }

            public bool AddOrUpdateSubject(DbEntities.Subjects.Subject subject, int subjectGroupId = 0)
            {
                try
                {
                    var ent = Context.Subject.Find(subject.Id);
                    if (ent == null)
                    {
                        var sub = Context.Subject.Add(subject);
                        Context.SaveChanges();
                        //if (sub != null && subjectGroupId > 0)
                        //{
                        //    Context.SubjectGroupSubject.Add(new SubjectGroupSubject()
                        //    {
                        //        AssignedDate = DateTime.Now
                        //        ,
                        //        SubjectGroupId = subjectGroupId
                        //        ,
                        //        SubjectId = sub.Id
                        //    });
                        //    Context.SaveChanges();
                        //}
                        return true;
                    }
                    //else
                    {
                        ent.Code = subject.Code;
                        ent.Void = subject.Void;
                        ent.Credit = subject.Credit;
                        ent.FullName = subject.FullName;
                        ent.ShortName = subject.ShortName;
                        ent.Summary = subject.Summary;
                        //ent.
                        //s.FullNames
                        //s.CompletionHours = subject.CompletionHours;
                        //s.FullMarks = subject.FullMarks;
                        //s.HasLab = subject.HasLab;
                        //s.HasProject = subject.HasProject;
                        //s.HasTheory = subject.HasTheory;
                        //s.HasTutorial = subject.HasTutorial;
                        //s.IsActive = subject.IsActive;
                        //s.IsElective = subject.IsElective;
                        //s.IsOutOfSyllabus = subject.IsOutOfSyllabus;
                        //s.PassPercentage = subject.PassPercentage;
                        Context.SaveChanges();

                        return true;
                    }

                }
                catch (Exception)
                {
                    return false;
                }
            }

            //public bool AddOrUpdateRegularSubject(DbEntities.Subjects.Subject subject, int yearId, int subYearId = 0)
            //{
            //    try
            //    {
            //        var s = Context.Subject.Find(subject.Id);
            //        if (s == null)
            //        {
            //            var sub = Context.Subject.Add(subject);
            //            Context.SaveChanges();
            //            if (sub != null)
            //            {
            //                var rsg = new RegularSubject()
            //                {
            //                    AssignedDate = DateTime.Now
            //                    ,
            //                    YearId = yearId
            //                    ,
            //                    SubjectId = sub.Id
            //                };
            //                if (subYearId > 0)
            //                {
            //                    rsg.SubYearId = subYearId;
            //                }
            //                Context.RegularSubjectsGrouping.Add(rsg);
            //                Context.SaveChanges();
            //            }
            //            return true;
            //        }
            //        //else
            //        {
            //            s.Code = subject.Code;
            //            //s.CompletionHours = subject.CompletionHours;
            //            //s.Credit = subject.Credit;
            //            //s.FullMarks = subject.FullMarks;
            //            //s.HasLab = subject.HasLab;
            //            //s.HasProject = subject.HasProject;
            //            //s.HasTheory = subject.HasTheory;
            //            //s.HasTutorial = subject.HasTutorial;
            //            //s.IsActive = subject.IsActive;
            //            s.Void = subject.Void;
            //            //s.IsElective = subject.IsElective;
            //            //s.IsOutOfSyllabus = subject.IsOutOfSyllabus;
            //            s.SubjectCategoryId = subject.SubjectCategoryId;
            //            //s.PassPercentage = subject.PassPercentage;
            //            //s.Name = subject.Name;
            //            Context.SaveChanges();

            //            return true;
            //        }

            //    }
            //    catch (Exception)
            //    {
            //        return false;
            //    }
            //}


            public List<DbEntities.Subjects.Subject> GetSubjectList(int schoolId)
            {
                return Context.Subject.Where(x => x.SubjectCategory.SchoolId == schoolId
                    && !(x.Void ?? false)).ToList();

            }

            public DbEntities.Subjects.Subject Find(int id)
            {
                var sub = Context.Subject.Include(x => x.SubjectSections).FirstOrDefault(y => y.Id == id);
                return sub;
            }



            #region SubjectGroup

            //public SubjectGroup AddOrUpdateSubjectGroup(SubjectGroup subGrp)
            //{
            //    try
            //    {
            //        var entity = Context.SubjectGroup.Find(subGrp.Id);
            //        if (entity == null)
            //        {
            //            var saved = Context.SubjectGroup.Add(subGrp);
            //            Context.SaveChanges();
            //            return saved;
            //        }
            //        entity.YearId = subGrp.SubYearId;
            //        entity.SubYearId = subGrp.SubYearId;
            //        entity.ProgramId = subGrp.ProgramId;
            //        entity.Name = subGrp.Name;
            //        entity.Void = subGrp.Void;
            //        entity.Desctiption = subGrp.Desctiption;
            //        Context.SaveChanges();
            //        return entity;
            //    }
            //    catch (Exception)
            //    {
            //        return null;
            //    }
            //}
            //public List<DbEntities.Subjects.SubjectGroup> GetSubjectGroups(int programId)
            //{
            //    //var subgrps = from g in Context.SubjectGroup
            //    //    join sgs in Context.SubjectGroupSubject on g.Id equals sgs.SubjectGroupId
            //    //    join s in Context.Subject on sgs.SubjectId equals s.Id
            //    //    where (g.ProgramId ?? 0) == programId && !(g.Void ?? false)
            //    //          && !(sgs.Void ?? false) && !(s.Void ?? false)
            //    //    select g;

            //    try
            //    {
            //        var grps = Context.SubjectGroup.Include(i => i.Year).Include(i => i.SubYear)
            //       .Include(i => i.SubjectGroupSubjects)
            //       .Where(x => (x.ProgramId ?? 0) == programId && !(x.Void ?? false))
            //       .OrderBy(x => (x.Year == null) ? x.Id : x.Year.Position).ThenBy(u => u.Name)
            //       .ThenBy(y => (y.SubYear == null) ? y.Id : y.SubYear.Position).ThenBy(u => u.Name)
            //       .ToList();
            //        return grps;
            //    }
            //    catch (Exception)
            //    {
            //        return new List<SubjectGroup>();
            //    }
            //}


            //public List<DbEntities.Subjects.SubjectGroup> GetRegularSubjectGroups(int programId)
            //{
            //    try
            //    {
            //        var program = Context.Program.Find(programId);
            //        if (program != null)
            //        {
            //            var years = Context.Year.Where(x => x.ProgramId == programId && !(x.Void ?? false))
            //                .OrderBy(x => x.Position).ThenBy(u => u.Name);
            //            //var firstTimeValueFound = false;
            //            //var subyearExist = false;
            //            var lst = new List<SubjectGroup>();
            //            var min = years.Min(x => x.SubYears.Count);
            //            var max = years.Max(x => x.SubYears.Count);
            //            if (min != max)
            //            {

            //            }
            //            else
            //            {
            //                if (max == 0)
            //                {
            //                    //no subyears 
            //                    foreach (var year in years)
            //                    {
            //                        var subGrp = new SubjectGroup()
            //                        {
            //                            //CreatedDate = DateTime.Now
            //                            //,
            //                            Desctiption = "Program: " + program.Name + ", Year: " + year.Name
            //                            ,
            //                            Name = year.Name
            //                            ,
            //                            ProgramId = program.Id
            //                            ,
            //                            YearId = year.Id
            //                            ,
            //                        };
            //                        //var subjects = Context.RegularSubjectsGrouping.Where(
            //                        //    x => x.YearId == year.Id && x.SubYearId == null).ToList();
            //                        //subjects.ForEach(x =>
            //                        //{
            //                        //    subGrp.SubjectGroupSubjects
            //                        //});
            //                        lst.Add(subGrp);
            //                    }
            //                }
            //                else
            //                {
            //                    //has subyears
            //                    foreach (var year in years)
            //                    {
            //                        foreach (var subyear in year.SubYears.Where(x => !(x.Void ?? false)).OrderBy(x => x.Position).ThenBy(u => u.Name))
            //                        {
            //                            var subGrp = new SubjectGroup()
            //                            {
            //                                CreatedDate = DateTime.Now
            //                                ,
            //                                Desctiption = "Program: " + program.Name + ", Year: " + year.Name + ", Sem: " + subyear.Name
            //                                ,
            //                                Name = year.Name + " / " + subyear.Name
            //                                ,
            //                                ProgramId = program.Id
            //                                ,
            //                                YearId = year.Id
            //                                ,
            //                                SubYearId = subyear.Id
            //                            };
            //                            lst.Add(subGrp);
            //                        }
            //                    }
            //                }

            //            }
            //            return lst;

            //        }
            //        return new List<SubjectGroup>();
            //    }
            //    catch (Exception)
            //    {
            //        return new List<SubjectGroup>();
            //    }
            //}

            //public int GetSubjectsCountInAGroup(int subjectGroupId)
            //{
            //    try
            //    {
            //        var s =
            //       Context.SubjectGroup.Find(subjectGroupId)
            //           .SubjectGroupSubjects.Count(x => !(x.Void ?? false) && !(x.Subject.Void ?? false));
            //        return s;
            //    }
            //    catch (Exception)
            //    {
            //        return 0;
            //    }
            //}


            //public List<DbEntities.Subjects.Subject> GetSubjectsOfAGroup(int subjectGroupId)
            //{
            //    try
            //    {
            //        var g =
            //        Context.SubjectGroup.Find(subjectGroupId)
            //            .SubjectGroupSubjects.Where(x => !(x.Void ?? false) && !(x.Subject.Void ?? false))
            //            .Select(x => x.Subject).ToList();
            //        return g;
            //    }
            //    catch { return new List<DbEntities.Subjects.Subject>(); }
            //}
            #endregion

            //public List<DbEntities.Subjects.Subject> GetRegularSubjectList(int yearId, int subYearId = 0)
            //{
            //    var grps = Context.RegularSubjectsGrouping.Where(x => x.YearId == yearId && (x.SubYearId ?? 0) == subYearId
            //        && !(x.Void ?? false));
            //    var subs = grps.Select(x => x.Subject).Include(i => i.SubjectSections).Where(x => !(x.Void ?? false)).ToList();
            //    return subs;
            //}

            //uncomment this

            public List<StudentSubjectModel> GetCurrentRegularSubjectsOfUser(int userId)
            {
                // uncomment all
                /*
                var user = Context.Users.Find(userId);
                if (user != null)
                {
                    var roles = Context.UserRole.Where(x => x.UserId == userId).Select(x => x.Role.RoleName);
                    if (roles.Contains("teacher"))
                    {
                        //get running class and subjects, etc from RegularSubjectClass and UserClass
                        var tea = Context.Teacher.FirstOrDefault(x => x.UserId == user.Id);
                        if (tea != null)
                        {
                            //Context.TeacherClass.Where(x=>x.TeacherId ==tea.Id).Select(x=>x.SubjectClass).Where(x=>x.RunningClass)
                            var runningClasses = (from sb in Context.TeacherClass.Where(x => x.TeacherId == tea.Id)
                                                  join rc in Context.RunningClass on sb.SubjectClass.RunningClassId equals rc.Id
                                                  join a in Context.AcademicYear.Where(ay => ay.IsActive && !(ay.Void ?? false)) on rc.AcademicYearId equals a.Id
                                                  join sess in Context.Session on rc.SessionId equals sess.Id
                                                  where sess.IsActive && !(sess.Void ?? false)
                                                  select new StudentSubjectModel()
                                                  {
                                                      Complete = rc.Completed ?? false
                                                          //,StudentId = std.Id
                                                          //,SubjectGroupName = 
                                                      ,
                                                      SubjectName = sb.SubjectClass.Subject.Name
                                                      ,
                                                      SubjectId = sb.SubjectClass.SubjectId
                                                      //rsg.Subject
                                                  }).ToList();
                            return runningClasses;
                        }
                    }
                    else if (roles.Contains("student"))
                    {
                        var std = Context.Student.FirstOrDefault(x => x.UserId == user.Id);
                        if (std != null)
                        {
                            var runningClasses = (from sb in Context.StudentBatch.Where(x => x.StudentId == std.Id)
                                                  join pb in Context.ProgramBatch on sb.ProgramBatchId equals pb.Id
                                                  join rc in Context.RunningClass on pb.Id equals rc.ProgramBatchId
                                                  join ay in Context.AcademicYear on rc.AcademicYearId equals ay.Id
                                                  where ay.IsActive && !(ay.Void ?? false)
                                                  select rc).ToList();
                            if (runningClasses.Count > 1)
                            {
                                //there are subyears and we need to consider session
                                var subs = (from r in runningClasses
                                            join sess in Context.Session on r.SessionId equals sess.Id
                                            where sess.IsActive && !(sess.Void ?? false)
                                            join rsg in Context.RegularSubjectsGrouping on r.YearId equals rsg.YearId
                                            where r.SubYearId == rsg.SubYearId && !(rsg.Subject.Void ?? false)
                                            select new StudentSubjectModel()
                                            {
                                                Complete = r.Completed ?? false
                                                    //,StudentId = std.Id
                                                    //,SubjectGroupName = 
                                                ,
                                                SubjectName = rsg.Subject.Name
                                                ,
                                                SubjectId = rsg.SubjectId
                                                //rsg.Subject
                                            }).ToList();

                                //return subs;
                                // var teachers =
                                //Context.TeacherClass.Where(x => x.SubjectClassId == a.subc.Id).Select(y => y.Teacher).ToList();
                                return subs;

                            }
                            else
                            {
                                //there are no subyears and we only consider academic year.
                                var subs = (from r in runningClasses
                                            join rsg in Context.RegularSubjectsGrouping on r.YearId equals rsg.YearId
                                            where r.SubYearId == rsg.SubYearId
                                            select new StudentSubjectModel()
                                            {
                                                Complete = r.Completed ?? false
                                                    //,StudentId = std.Id
                                                    //,SubjectGroupName = 
                                                ,
                                                SubjectName = rsg.Subject.Name
                                                ,
                                                SubjectId = rsg.SubjectId
                                                //rsg.Subject
                                            }).ToList();
                                //select rsg.Subject);
                                return subs;
                            }

                        }
                    }

                }*/
                return new List<StudentSubjectModel>();
            }






            /// <summary>
            /// It is the union of GetRegularSubjectsOfUser() and GetExtraSubjectsOfUser()
            /// Extra is  not implemented yet...
            /// </summary>
            /// <param name="userId"></param>
            public List<StudentSubjectModel> GetAllSubjectsOfUser(int userId)
            {
                //uncomment this all
                //var regular = GetCurrentRegularSubjectsOfUser(userId);
                //var extra = GetExtraSubjectsOfUser(userId);
                //regular.AddRange(extra);
                //return regular;

                return null;
            }


            //===========================Listing Codes =================================//
            #region Category Listing

            public List<SubjectCategory> ListAllCategories(int schoolId)
            {
                return Context.SubjectCategory
                    .Where(x => x.SchoolId == schoolId && (x.ParentId ?? 0) == 0 && !(x.IsVoid ?? false))
                    .OrderBy(x => x.Name).ToList();
            }

            public List<SubjectCategory> ListSubCategories(int schoolId, int categoryId)
            {
                return Context.SubjectCategory.Where(x => x.SchoolId == schoolId && x.ParentId == categoryId)
                    .OrderBy(y => y.Name).ToList();
            }
            #endregion

            #region Course Listing

            public List<DbEntities.Subjects.Subject> ListCourses(int schoolId, int categoryId)
            {
                return Context.Subject.Where(x => x.SubjectCategoryId == categoryId)
                    .OrderBy(y => y.FullName).ToList();
            }

            public List<DbEntities.Subjects.Subject> ListCourses(int categoryId)
            {
                return Context.Subject.Where(x => x.SubjectCategoryId == categoryId && !(x.Void ?? false))
                    .OrderBy(y => y.FullName).ToList();
            }

            public List<DbEntities.Subjects.Subject> ListCourses(int programId,int categoryId, List<int> dontIncludeCourseIds)
            {
                var already = Context.SubjectStructure.Where(x => !(x.Void??false) 
                                                                && x.Year.ProgramId == programId)
                                                      .Select(x=>x.SubjectId).ToList();
                var courses = Context.Subject.Where(x => x.SubjectCategoryId == categoryId
                                                    && !(x.Void ?? false)
                                                    && !dontIncludeCourseIds.Contains(x.Id)
                                                    && !already.Contains(x.Id))
                    .OrderBy(y => y.FullName).ToList();


                return courses;
            }

            public List<ViewModel.Subject.Subject> ListCoursesOfStructure(
                int yearId, int subyearId = 0, bool returnVoidAlso = false)
            {
                var list = new List<ViewModel.Subject.Subject>();
                Context.SubjectStructure
                   .Where(x => x.YearId == yearId && (x.SubYearId ?? 0) == subyearId
                       && (!(x.Void ?? false) || returnVoidAlso))
                   .ToList().ForEach(x =>
                            {
                                list.Add(new ViewModel.Subject.Subject()
                                {
                                    Id = x.Subject.Id
                                    ,
                                    CategoryId = x.Subject.SubjectCategoryId
                                    ,
                                    SubjectStructureId = x.Id
                                    ,
                                    Name = x.Subject.FullName
                                    ,
                                    Checked = false
                                    ,
                                    CategoryName = x.Subject.SubjectCategory.Name
                                    ,
                                    Code = x.Subject.Code
                                    ,
                                    IsElective = x.IsElective
                                    ,
                                    Credit = x.Credit
                                });
                            });
                return list.OrderBy(x => x.Name).ToList();
            }




            //Not Used--
            //its after github but now new function which is just below this function is used
            public List<DbEntities.Subjects.Subject> ListCurrentCoursesOfUser(int userId)
            {
                var user = Context.Users.Find(userId);
                if (user != null)
                {
                    var subSession = user.Classes.Where(x => !(x.Void ?? false) && !(x.Suspended ?? false))
                        .Select(x => x.SubjectClass).Where(x => !(x.Void ?? false) && !(x.SessionComplete ?? false))
                        .ToList();
                    //.Select(x=>x.Subject).ToList();

                    //var incomplete = subSession.Where(x => ).ToList();

                    var regularincomplete = subSession.Where(x => x.IsRegular)
                        .Select(x => x.SubjectStructure.Subject).ToList();

                    var notregularincomplete = subSession.Where(x => !x.IsRegular)
                        .Select(x => x.Subject).ToList();

                    regularincomplete.AddRange(notregularincomplete);

                    return regularincomplete;
                }
                return new List<DbEntities.Subjects.Subject>();
            }

            //Used--- Latest version -- 1.0 :):):) -- DEPRICATED --
            /// <summary>
            /// Use the function ListAllSubjectClassesOfUser(int userId) instead
            /// </summary>
            /// <param name="userId"></param>
            /// <returns></returns>
            [Obsolete]
            public List<DbEntities.Class.SubjectClass> ListCurrentSubjectClasses(int userId)
            {
                var user = Context.Users.Find(userId);
                if (user != null)
                {
                    var subSession = user.Classes.Where(x => !(x.Void ?? false) && !(x.Suspended ?? false))
                        .Select(x => x.SubjectClass).Where(x => !(x.Void ?? false) && !(x.SessionComplete ?? false))
                        .ToList();
                    return subSession;
                }
                return new List<DbEntities.Class.SubjectClass>();
            }


            //Used --Latest version --1.0 :) -- replacemnt of ListCurrentSubjectClasses()
            /// <summary>
            /// Latest after redesign into black and white; Use this and calculate complete and running manually in your code
            /// </summary>
            /// <param name="userId"></param>
            /// <returns></returns>
            public List<DbEntities.Class.SubjectClass> ListAllSubjectClassesOfUser(int userId)
            {
                var user = Context.Users.Find(userId);
                if (user != null)
                {
                    var subSession = user.Classes.Where(x => !(x.Void ?? false) && !(x.Suspended ?? false))
                        .Select(x => x.SubjectClass).Where(x => !(x.Void ?? false) //&& !(x.SessionComplete ?? false)) -- return all
                        ).ToList();
                    return subSession;
                }
                return new List<DbEntities.Class.SubjectClass>();
            }


            //used--shree krishna v2.0
            /// <summary>
            /// For manager and teacher to display in sidebar.
            /// Returns: Dict[0]=current ... Dict[1]=earlier
            /// </summary>
            /// <param name="userId"></param>
            /// <param name="getOnlyCurrent">True: Current only, False: Earlier only, NULL: both</param>
            /// <returns>Dict[0]=current ... Dict[1]=earlier</returns>
            public Dictionary<DbEntities.Subjects.Subject, List<SubjectClass>>[]
                GetEarlierAndCurrentCourseAndClassesForManagerAndTeacher(int userId, bool? getOnlyCurrent = null)
            {
                var now = DateTime.Now.Date;
                var currentSubjectClassDictionary = new Dictionary<DbEntities.Subjects.Subject, List<SubjectClass>>();
                var earlierSubjectClassDictionary = new Dictionary<DbEntities.Subjects.Subject, List<SubjectClass>>();

                var user = Context.Users.Find(userId);
                if (user != null)
                {
                    var subClasses = user.Classes.Where(x => !(x.Void ?? false) && !(x.Suspended ?? false))
                        .Select(x => x.SubjectClass).Where(x => !(x.Void ?? false) //&& !(x.SessionComplete ?? false)) -- return all
                        )
                        .OrderBy(x=>(x.IsRegular)?x.SubjectStructure.Subject.FullName:x.Subject.FullName)
                        .ToList();

                    var getEarlier = getOnlyCurrent == null || getOnlyCurrent == false;
                    var getCurrent = getOnlyCurrent == null || getOnlyCurrent == true;

                    //logic. if getonlyCurrent is null then take both, 
                    // if getonly current is true then take current only.
                    foreach (var sc in subClasses)
                    {
                        var sessionComplete = (sc.SessionComplete ?? false) ||( sc.EndDate??DateTime.MaxValue)<now;
                        var subject = sc.Subject ?? sc.SubjectStructure.Subject;
                        if (sessionComplete)
                        {
                            //complete--means earlier
                            if ((getEarlier))
                            {
                                if (!earlierSubjectClassDictionary.ContainsKey(subject))
                                {
                                    earlierSubjectClassDictionary.Add(subject, new List<SubjectClass>());
                                }
                                earlierSubjectClassDictionary[subject].Add(sc);
                            }
                        }
                        else
                        {
                            //current
                            if (getCurrent)
                            {
                                if (!currentSubjectClassDictionary.ContainsKey(subject))
                                {
                                    currentSubjectClassDictionary.Add(subject, new List<SubjectClass>());
                                }
                                currentSubjectClassDictionary[subject].Add(sc);
                            }
                        }
                    }


                    return new[]//Dictionary<DbEntities.Subjects.Subject, List<SubjectClass>>[]
                    {
                        currentSubjectClassDictionary,earlierSubjectClassDictionary
                    };
                }
                return null;
            }


            //used--shree krishna v3.0
            /// <summary>
            /// For manager and teacher to display in sidebar.
            /// Returns: Dict[0]=current ... Dict[1]=earlier
            /// </summary>
            /// <param name="userId"></param>
            /// <param name="getOnlyCurrent">True: Current only, False: Earlier only, NULL: both</param>
            /// <returns>Dict[0]=current ... Dict[1]=earlier</returns>
            public List<DbEntities.Subjects.Subject>[]
                GetEarlierAndCurrentCourseAndClassesForManagerAndTeacherV3(int userId, bool? getOnlyCurrent = null)
            {
                var now = DateTime.Now.Date;
                var currentSubjectList = new List<DbEntities.Subjects.Subject>();
                var earlierSubjectList = new List<DbEntities.Subjects.Subject>();


                var scDict = new Dictionary<DbEntities.Subjects.Subject, List<SubjectClass>>();


                var user = Context.Users.Find(userId);
                if (user != null)
                {
                    var subClasses = user.Classes.Where(x => !(x.Void ?? false) && !(x.Suspended ?? false))
                        .Select(x => x.SubjectClass).Where(x => !(x.Void ?? false) //&& !(x.SessionComplete ?? false)) -- return all
                        )
                        .OrderBy(x => (x.IsRegular) ? x.SubjectStructure.Subject.FullName : x.Subject.FullName)
                        //.GroupBy(x => (x.IsRegular) ? x.SubjectStructure.Subject : x.Subject)
                        .ToList();

                    var getEarlier = getOnlyCurrent == null || getOnlyCurrent == false;
                    var getCurrent = getOnlyCurrent == null || getOnlyCurrent == true;

                    //logic. if getonlyCurrent is null then take both, 
                    // if getonly current is true then take current only.
                    foreach (var sc in subClasses)
                    {

                        var subject = sc.Subject ?? sc.SubjectStructure.Subject;

                        //new lines
                        if (!scDict.ContainsKey(subject))
                        {
                            scDict.Add(subject, new List<SubjectClass>());
                        }
                        scDict[subject].Add(sc);
                        // --end of new lines 

                        

                        //var sessionComplete = (sc.SessionComplete ?? false) || (sc.EndDate ?? DateTime.MaxValue) < now;
                        //if (sessionComplete)
                        //{
                        //    //complete--means earlier
                        //    if ((getEarlier))
                        //    {
                        //        if (!earlierSubjectClassDictionary.ContainsKey(subject))
                        //        {
                        //            earlierSubjectClassDictionary.Add(subject, new List<SubjectClass>());
                        //        }
                        //        earlierSubjectClassDictionary[subject].Add(sc);
                        //    }
                        //}
                        //else
                        //{
                        //    //current
                        //    if (getCurrent)
                        //    {
                        //        if (!currentSubjectClassDictionary.ContainsKey(subject))
                        //        {
                        //            currentSubjectClassDictionary.Add(subject, new List<SubjectClass>());
                        //        }
                        //        currentSubjectClassDictionary[subject].Add(sc);
                        //    }
                        //}
                    }

                    foreach (var sub in scDict.Keys)
                    {
                        var cur =
                            scDict[sub].Any(
                                sc => !((sc.SessionComplete ?? false) || (sc.EndDate ?? DateTime.MaxValue) < now));

                        if (cur)
                        {
                            //then its current subject
                            if (getCurrent)
                            {
                                currentSubjectList.Add(sub);
                            }
                        }
                        else
                        {
                            //else it's earlier... because it already has classes (as we extracted subjects from classes :)...
                            if (getEarlier)
                            {
                                earlierSubjectList.Add(sub);
                            }
                        }
                    }


                    return new[]//Dictionary<DbEntities.Subjects.Subject, List<SubjectClass>>[]
                    {
                        currentSubjectList,earlierSubjectList
                    };
                }
                return null;
            }


            public List<DbEntities.Class.UserClass> ListCurrentUserClasses(int userId)
            {
                var user = Context.Users.Find(userId);
                if (user != null)
                {
                    var subSession = user.Classes.Where(x => !(x.Void ?? false) && !(x.Suspended ?? false))
                        .Where(x => !(x.SubjectClass.Void ?? false) && !(x.SubjectClass.SessionComplete ?? false))
                        //.Select(x => x.SubjectClass).Where(x => !(x.Void ?? false) && !(x.SessionComplete ?? false))
                        .ToList();
                    return subSession;
                }
                return new List<DbEntities.Class.UserClass>();
            }

            [Obsolete]
            public List<DbEntities.Class.SubjectClass> ListEarlierSubjectClasses(int userId)
            {
                var user = Context.Users.Find(userId);
                if (user != null)
                {
                    var subSession = user.Classes.Where(x => !(x.Void ?? false) && !(x.Suspended ?? false))
                        .Select(x => x.SubjectClass).Where(x => !(x.Void ?? false))
                        .ToList();
                    return subSession;
                }
                return new List<DbEntities.Class.SubjectClass>();
            }

            /* //used
             public
             List<DbEntities.Subjects.Subject> ListEarlierCoursesOfUser(int userId)
             {
                 var user = Context.Users.Find(userId);
                 if (user != null)
                 {
                     var subSession = user.Classes.Where(x => !(x.Void ?? false) && !(x.Suspended ?? false))
                         .Select(x => x.SubjectClass).Where(x => !(x.Void ?? false) && (x.SessionComplete ?? false))
                         .ToList();//.Select(x=>x.Subject).ToList();

                     //var complete = subSession.Where(x => ).ToList();

                     var regularcomplete = subSession.Where(x => x.IsRegular)
                        .Select(x => x.SubjectStructure.Subject).ToList();

                     var notregularcomplete = subSession.Where(x => !x.IsRegular).Select(x => x.Subject)
                         .ToList();

                     regularcomplete.AddRange(notregularcomplete);

                     return regularcomplete;

                 }
                 return new List<DbEntities.Subjects.Subject>();
             }
             */

            //used /// remain to edit more

            /*  public void ListCourses1(int userId)
              {
                  var user = Context.Users.Find(userId);
                  if (user != null)
                  {
                      var subjectClasses0 = user.Classes.Where(x => !(x.Void ?? false) && !(x.Suspended ?? false));
                      ////.Where(x=>!x.SubjectClass.IsRegular)
                      //.Select(x => x.SubjectClass)
                      ////.Where(x => !(x.Void ?? false) && (x.SessionComplete ?? false))
                      //.ToList(); //.Select(x=>x.Subject).ToList();

                      var alreadyEnteredUserClass = subjectClasses0.Select(x => x.Id);


                      var std = Context.Student.FirstOrDefault(x => x.UserId == userId);
                      if (std != null)
                      {
                          var subjectClasses = from sb in Context.StudentBatch
                                               join r in Context.RunningClass on sb.ProgramBatchId equals r.ProgramBatchId
                                               join sc in Context.SubjectClass on r.Id equals sc.RunningClassId
                                               where !(r.Void ?? false) && !(sb.Void ?? false) && !(sc.Void ?? false) &&
                                                     sc.IsRegular && !(sc.SessionComplete ?? false)
                                               select sc;
                          var userClasses = Context.UserClass.Where(x => x.UserId == userId);
                      }
                      else
                      {


                      }

                  }

              }*/

            //tag 1
            public List<Academic.DbEntities.Subjects.Subject>[] ListCurrentAndEarlierCoursesOfUser(int userId)
            {
                //var currAndEarlierCourses = new List<DbEntities.Subjects.Subject>[2];
                var user = Context.Users.Find(userId);

                if (user != null)
                {
                    var subSession = user.Classes.Where(x => !(x.Void ?? false) && !(x.Suspended ?? false))
                         .Select(x => x.SubjectClass).Where(x => !(x.Void ?? false)).ToList();//.Select(x=>x.Subject).ToList();

                    //complete means(or goes to)  earlier courses
                    var complete = subSession.Where(x => (x.SessionComplete ?? false)).ToList();

                    var regularcomplete = complete.Where(x => x.IsRegular)
                       .Select(x => x.SubjectStructure.Subject).ToList();

                    var notregularcomplete = complete.Where(x => !x.IsRegular).Select(x => x.Subject)
                        .ToList();

                    //incomplete means(or goes to) current courses
                    var incomplete = subSession.Where(x => !(x.SessionComplete ?? false)).ToList();

                    var regularincomplete = incomplete.Where(x => x.IsRegular)
                        .Select(x => x.SubjectStructure.Subject).ToList();

                    var notregularincomplete = incomplete.Where(x => !x.IsRegular)
                        .Select(x => x.Subject).ToList();


                    //regular.AddRange(notregular);
                    regularcomplete.AddRange(notregularcomplete);
                    regularincomplete.AddRange(notregularincomplete);
                    //should be in this order: incomplete:(current) and complete:(earlier)
                    return new List<DbEntities.Subjects.Subject>[2]
                    {
                       regularincomplete
                       ,
                       regularcomplete
                    };

                }
                return new List<DbEntities.Subjects.Subject>[2]
                {
                    new List<DbEntities.Subjects.Subject>()
                    , 
                    new List<DbEntities.Subjects.Subject>()
                };
            }


            #endregion


            //==============================End of Listing==========================//
            //=========================================================================//
            public bool AddOrUpdateStructureCourse(List<Academic.DbEntities.Subjects.SubjectStructure> assignedList,
                int yearId, int subYearId, int userId)
            {
                try
                {
                    using (var scope = new TransactionScope())
                    {
                        // remove the deleted subjects
                        //savedlist must be ViewModel.Subjects.Subject
                        var earlierAssigned = Context.SubjectStructure.Where(x => x.YearId == yearId
                                                                                  && x.SubYearId == subYearId
                                                                                  );
                        var currentAssignedSubjectIds = assignedList.Select(x => x.SubjectId).ToList();
                        var earlierAssignedSubjectIds = earlierAssigned.Select(x => x.SubjectId).ToList();

                        for (int i = 0; i < earlierAssignedSubjectIds.Count; i++)
                        {
                            var ear = earlierAssignedSubjectIds[i];
                            var found = earlierAssigned.FirstOrDefault(x => x.SubjectId == ear);

                            if (found != null)
                            {
                                if (currentAssignedSubjectIds.Contains(earlierAssignedSubjectIds[i]))
                                {
                                    //earlier and now are same.. look for void , if void then make it false
                                    found.Credit = assignedList[i].Credit;
                                    found.IsElective = assignedList[i].IsElective;
                                    if ((found.Void ?? false))
                                    {
                                        found.Void = false;
                                    }
                                    Context.SaveChanges();
                                    currentAssignedSubjectIds.Remove(earlierAssignedSubjectIds[i]);
                                }
                                else
                                {
                                    found.VoidBy = userId;
                                    found.VoidDate = DateTime.Now;
                                    found.Void = true;
                                    Context.SaveChanges();
                                }
                            }
                        }

                        foreach (var remain in currentAssignedSubjectIds)
                        {
                            var re = assignedList.FirstOrDefault(x => x.SubjectId == remain);
                            if (re != null)
                            {

                                re.CreatedBy = userId;

                                re.CreatedDate = DateTime.Now;

                                Context.SubjectStructure.Add(re);
                                Context.SaveChanges();
                            }
                            //Context.SubjectStructure
                            //   .Add();
                            //Context.SaveChanges();
                        }
                        scope.Complete();
                        return true;
                    }
                }
                catch (Exception)
                {
                    return false;
                }
                //return false;
            }

            public bool AddOrUpdateStructureCourse(
                List<Academic.DbEntities.Subjects.SubjectStructure> savedList,
                List<Academic.DbEntities.Subjects.SubjectStructure> selectedList)
            {
                try
                {
                    using (var scope = new TransactionScope())
                    {
                        // remove the deleted subjects
                        //savedlist must be ViewModel.Subjects.Subject
                        foreach (var ss in savedList)
                        {
                            var ent = Context.SubjectStructure.Find(ss.Id);
                            if (ent != null)
                            {
                                ent.UpdateDate = ss.UpdateDate;
                                ent.UpdatedBy = ss.UpdatedBy;
                                ent.Void = ss.Void;
                                ent.VoidBy = ss.VoidBy;
                                ent.VoidDate = ss.VoidDate;
                            }
                            Context.SaveChanges();
                        }

                        foreach (var ss in selectedList)
                        {
                            Context.SubjectStructure
                                .Add(ss);
                            Context.SaveChanges();
                        }
                        scope.Complete();
                    }
                    return true;
                }
                catch (Exception)
                {
                    return false;
                }
                //return false;
            }

            public DbEntities.Subjects.Subject GetCourse(int cId)
            {
                return Context.Subject.Find(cId);
            }

            public List<DbEntities.Class.SubjectClass> ListCoursesOfClass(int runningClassId)
            {
                return Context.SubjectClass.Where(x => x.RunningClassId == runningClassId && !(x.Void ?? false))
                    .ToList();
            }

            public List<DbEntities.Exams.ExamSubject> ListExamCourses(int examClassId)
            {
                return Context.ExamSubject.Where(x => x.ExamOfClassId == examClassId
                    && !(x.Void ?? false)).ToList();
            }

            public bool IsUserEnrolledToCourse(int userId, int SubjectId)
            {
                //var user = Context.Users.Find(userId);
                //if (user != null)
                //{
                //    user.Classes.FirstOrDefault(x=>x.SubjectClass.Subj)
                //}
                return true;
            }

            public SubjectCategory GetCategory(int categoryId)
            {
                return Context.SubjectCategory.Find(categoryId);
            }

            #region Delette functions

            public bool DeleteCourse(int courseId)
            {
                try
                {
                    var course = Context.Subject.Find(courseId);
                    if (course != null)
                    {
                        course.Void = true;
                        Context.SaveChanges();
                        return true;
                    }
                    return false;
                }
                catch
                {
                    return false;
                }
            }

            public bool DeleteSection(int sectionId)
            {
                try
                {
                    var section = Context.SubjectSection.Find(sectionId);
                    if (section != null)
                    {
                        section.Void = true;
                        Context.SaveChanges();
                        return true;
                    }
                    return false;
                }
                catch
                {
                    return false;
                }
            }

            #endregion


            public bool DeleteCategory(int catId)
            {
                var category = Context.SubjectCategory.Find(catId);
                if (category != null)
                {
                    category.IsVoid = true;
                    Context.SaveChanges();
                    return true;
                }
                return false;
            }
        }
    }
}
