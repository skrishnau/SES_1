﻿using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Diagnostics;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;
using System.Transactions;
using System.Web;
using Academic.Database;
using Academic.DbEntities;
using Academic.DbEntities.User;
//using Academic.InitialValues;
using System.IO;
using System.Web.UI.WebControls;

namespace Academic.DbHelper
{
    public partial class DbHelper
    {
        public class User : IDisposable
        {
            private AcademicContext Context;

            public User()
            {
                Context = new AcademicContext();
            }
            public void Dispose()
            {
                Context.Dispose();
            }

            public List<Users> Users
            {
                get { return Context.Users.ToList(); }
            }

            //Roles
            public List<Role> GetRole(int schoolId)
            {
                return Context.Role.Where(x => !(x.Void ?? false) && (x.SchoolId == schoolId || x.SchoolId == null)).ToList();
            }

            //used
            public Role GetRole(string roleName)
            {
                return Context.Role.FirstOrDefault(x => x.RoleName.ToLower().Equals(roleName.ToLower()));
            }

            public List<Role> GetRolesForUserEnrollOption(int schoolId)
            {
                var rolesToSelect = new List<string>()
                {
                  "student",  "manager","teacher"
                };
                //var r = Context.Role.Where(x => !(x.Void ?? false) && (x.SchoolId == schoolId || x.SchoolId == null)).ToList();
                //return r.Where(x => rolesToSelect.Contains(x.RoleName)).ToList();

                var roles = Context.Role.Where(x => !(x.Void ?? false) && (x.SchoolId == schoolId || x.SchoolId == null)
                    && rolesToSelect.Contains(x.RoleName)).ToList();
                return roles;
            }

            //public List<DbEntities.User.UserType> GetUserTypes(int schoolId)
            //{
            //    var type = Context.UserType.Where(x => !(x.Void ?? false) && (x.SchoolId == schoolId
            //        || x.SchoolId == null)).ToList();
            //    if (type.Count == 0)
            //    {
            //        var stdType = new UserType()
            //        {
            //            Name = "Student"


            //        };
            //        var teachType = new UserType()
            //        {
            //            Name = "Teacher"
            //        };
            //        Context.UserType.Add(stdType);
            //        Context.UserType.Add(teachType);
            //        Context.SaveChanges();
            //        type = Context.UserType.Where(x => !(x.Void ?? false) && (x.SchoolId == schoolId
            //        || x.SchoolId == null)).ToList();
            //    }
            //    return type;
            //}
            public bool AddOrUpdateRole(Role role)
            {
                try
                {
                    var r = Context.Role.Find(role.Id);
                    if (r == null)
                    {
                        Context.Role.Add(role);

                    }
                    else
                    {
                        r.RoleName = role.RoleName;
                        r.Description = role.Description;
                        r.SchoolId = role.SchoolId;
                    }
                    Context.SaveChanges();
                    return true;
                }
                catch (Exception)
                {
                    return false;
                }

            }
            //working
            public bool SaveUsersRole(List<int> userList, int roleId)
            {
                try
                {
                    var date = DateTime.Now;
                    var role = Context.Role.Find(roleId);
                    if (role != null)
                    {
                        using (var scope = new TransactionScope())
                        {
                            if (role.RoleName.ToLower() == "teacher")
                            {
                                foreach (var i in userList)
                                {
                                    var ur = new Academic.DbEntities.User.UserRole()
                                    {
                                        UserId = i,
                                        RoleId = roleId,
                                        AssignedDate = DateTime.Now.Date
                                    };
                                    var savedRole = Context.UserRole.Add(ur);
                                    var usr = Context.Users.Find(i);
                                    var name = (usr == null) ? "" : usr.FullName;

                                    var teacher = new DbEntities.Teachers.Teacher()
                                    {
                                        UserId = i
                                        ,
                                        Name = name
                                        ,
                                        AppointedDate = date
                                    };
                                    var savedteacher = Context.Teacher.Add(teacher);
                                    Context.SaveChanges();
                                }
                            }
                            else if (role.RoleName.ToLower() == "student")
                            {
                                foreach (var i in userList)
                                {
                                    var ur = new Academic.DbEntities.User.UserRole()
                                    {
                                        UserId = i,
                                        RoleId = roleId,
                                        AssignedDate = DateTime.Now.Date
                                    };
                                    var savedRole = Context.UserRole.Add(ur);
                                    var usr = Context.Users.Find(i);
                                    var name = (usr == null) ? "" : usr.FullName;

                                    var std = new DbEntities.Students.Student()
                                    {
                                        UserId = i
                                        ,
                                        Name = name
                                        ,
                                        AssignedDate = date
                                    };
                                    var savedStd = Context.Student.Add(std);
                                    Context.SaveChanges();
                                }
                            }

                            Context.SaveChanges();
                            scope.Complete();
                            return true;
                        }
                    }
                    return false;
                }
                catch (Exception)
                {
                    return false;
                }
            }


            //User
            public DbEntities.User.Users AddOrUpdateUser(DbEntities.User.Users user, string roleId, HttpPostedFile file)
            {
                try
                {
                    var date = DateTime.Now.Date;

                    using (TransactionScope scope = new TransactionScope())
                    {
                        //byte[] imgBytes = null;

                        //using (var filehelper = new DbHelper.WorkingWithFiles())
                        //{
                        //    if (file != null)
                        //    {
                        //        imgBytes = filehelper.ConvertToBytes(file);
                        //        user.Image = imgBytes;
                        //        user.ImageType = file.ContentType;
                        //    }
                        //}

                        var ent = Context.Users.Find(user.Id);
                        if (ent == null)
                        {
                            ent = Context.Users.Add(user);
                            Context.SaveChanges();

                            //save  image
                            //var path = Path.Combine(Server.MapPath(StaticValue.UserImageDirectory), image.FileName);

                            //file.SaveAs();


                            //new ma matra role Admin hunxa other wise there are many roles for a user
                            if (roleId != "")
                            {
                                int rolei = Convert.ToInt32(roleId);
                                if (rolei > 0)
                                {
                                    SaveUsersRole(new List<int>() { ent.Id }, rolei);
                                    //var role = new UserRole()
                                    //{
                                    //    RoleId = rolei,
                                    //    UserId = entity.Id
                                    //    ,
                                    //    AssignedDate = DateTime.Now.Date

                                    //};
                                    //Context.UserRole.Add(role);
                                    //Context.SaveChanges();
                                }
                            }
                        }
                        else
                        {
                            //remained to add other attributes
                            ent.City = user.City;
                            ent.Country = user.Country;
                            ent.DOB = user.DOB;
                            ent.Description = user.Description;
                            ent.Email = user.Email;
                            ent.FirstName = user.FirstName;
                            ent.EmailDisplay = user.EmailDisplay;
                            ent.Email = user.Email;
                            //if (imgBytes != null)
                            //{
                            //    ent.Image = imgBytes;
                            //    ent.ImageType = file.ContentType;
                            //}
                            ent.UserName = user.UserName;
                            // ent.RoleId = user.RoleId;
                            ent.Phone = user.Phone;
                            ent.IsDeleted = user.IsDeleted;
                            ent.IsActive = user.IsActive;
                            ent.Password = user.Password;
                            ent.LastName = user.LastName;
                            Context.SaveChanges();
                            //return ent;
                        }
                        scope.Complete();
                        return ent;
                        //return true;
                    }
                }
                catch (Exception)
                {

                    return null;
                }
            }



            public bool UpdateUsersImage(int userId, int imageId)
            {
                var ent = Context.Users.Find(userId);
                if (ent != null)
                {
                    ent.UserImageId = imageId;
                    Context.SaveChanges();
                    return true;
                }
                return false;
            }


            private Users GetUser(int userId)
            {
                return Context.Users.Find(userId);
            }

            //public void SaveCreatedUser(DbEntities.User.CreatedUser createdUser, List<int> DivisonsAssigned, HttpPostedFile file)
            //{
            //    var date = DateTime.Now.Date;
            //    using (TransactionScope scope = new TransactionScope())
            //    {
            //        byte[] imgBytes = null;

            //        using (var filehelper = new DbHelper.WorkingWithFiles())
            //        {
            //            if (file != null)
            //            {
            //                imgBytes = filehelper.ConvertToBytes(file);
            //                createdUser.Image = imgBytes;
            //                createdUser.ImageType = file.ContentType;
            //            }
            //        }
            //        Context.SaveChanges();
            //        //var entity = Context.CreatedUser.Add(createdUser);
            //        //if (entity != null)
            //        //{
            //        //    foreach (var i in DivisonsAssigned)
            //        //    {
            //        //        var ud = new DbEntities.User.UserDivision()
            //        //        {
            //        //            AssignDate = date
            //        //            ,
            //        //            DivisionId = i
            //        //            ,
            //        //            UsersId = entity.Id
            //        //            ,
            //        //            Void = false
            //        //            ,
            //        //        };
            //        //        Context.UsersDivision.Add(ud);
            //        //    }
            //        //    Context.SaveChanges();
            //        //}
            //        scope.Complete();
            //    }
            //}


            //listing of users
            public List<Users> ListAllUsers(int schoolId, int perPage, int pageNo)
            {
                var list = Context.Users.Where(x => x.SchoolId == schoolId)
                    .OrderBy(y => y.FirstName).ThenBy(t => t.LastName)
                    .Skip(perPage * (pageNo - 1)).Take(perPage);
                return list.ToList();
            }

            public List<Users> ListAllUsers()
            {
                return Context.Users.ToList();
            }
            //gender
            public List<DbEntities.User.Gender> GetGender()
            {
                var gender = Context.Gender.ToList();
                if (gender.Count == 0)
                {
                    var male = new Gender() { Name = "Male" };
                    var female = new Gender() { Name = "Female" };
                    //var other = new Gender(){Name = "Other"};
                    Context.Gender.Add(male);
                    Context.Gender.Add(female);
                    Context.SaveChanges();
                }
                return Context.Gender.ToList();
            }

            //divisions
            //public List<Division> GetDivisionsForCombo(int schoolId)
            //{
            //    List<Division> list = new List<Division>();
            //    var divs = Context.Division.Include(x => x.ParentDivision).Where(x => x.SchoolId == schoolId).ToList();
            //    foreach (var division in divs)
            //    {
            //        var div = new Division()
            //        {
            //            Id = division.Id
            //            ,
            //            Name = division.Name
            //            ,
            //            SchoolId = division.SchoolId
            //            ,
            //        };
            //        if (division.ParentDivision != null)
            //        {
            //            div.Name += " (" + division.ParentDivision.Name + ")";
            //        }
            //        list.Add(div);
            //    }
            //    return list;
            //}




            public void UpadateUsersLoginTime(int userId)
            {
                var ent = Context.Users.Find(userId);
                if (ent != null)
                {
                    ent.LastOnline = DateTime.Now;
                    Context.SaveChanges();
                }
            }

            //Used
            //======listing 
            public void ListUsersWithFilter(
                string fullName, string fullName_crieteria,
                string firstName, string firstName_crieteria,
                string midName, string midName_crieteria,
                string lastName, string lastName_crieteria,
                int batchId, int programId, int yearId, int subYearId,
                string crn, int roleId, string userName, string email, int countryId, string guardianFullName)
            {
                return;
            }

            //used
            public List<Users> ListUsersWithNameStartingFrom(string nameStartsWith)
            {
                return Context.Users.Where(x => x.FirstName.StartsWith(nameStartsWith)).Take(50).ToList();
            }

            public List<Users> GetOnlineUsers(int userId, int schoolId)
            {
                var date = DateTime.Now;

                var tea = (from u in Context.Users.Where(y => y.SchoolId == schoolId)
                           join ur in Context.UserRole on u.Id equals ur.UserId
                           join r in
                               Context.Role.Where(
                                   x => x.RoleName == "teacher" || x.RoleName == "manager" && (x.SchoolId ?? 0) == 0)
                               on ur.RoleId equals r.Id
                           select u).ToList();//new Users { FirstName = u.FullName }
                var selftea = tea.Find(x => x.Id == userId);
                if (selftea != null)
                    tea.Remove(selftea);

                var std = Context.StudentBatch.FirstOrDefault(x => x.Student.UserId == userId);
                if (std != null)
                {
                    var others = std.ProgramBatch.StudentBatches.Select(y => y.Student.User)
                       .Where(x => x.SchoolId == schoolId)
                        //&& x.LastOnline != null && (x.LastOnline - date).Value.TotalMinutes<= 2)
                        .ToList();

                    var self = others.Find(x => x.Id == userId);
                    if (self != null)
                        others.Remove(self);
                    tea.AddRange(others);
                }
                return tea.Where(x => x.LastOnline != null && (date - x.LastOnline).Value.TotalMinutes <= 2).ToList();
            }
        }
    }
}
