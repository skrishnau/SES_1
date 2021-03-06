﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Transactions;
using Academic.Database;
using Academic.DbEntities.User;

namespace Academic.DbHelper
{
    public partial class DbHelper
    {
        public class CustomAccount : IDisposable
        {
            private AcademicContext Context;

            public CustomAccount()
            {
                Context = new AcademicContext();
            }

            public bool CheckUser(string username, string password)
            {
                try
                {
                    var user = Context.Users.FirstOrDefault(x => x.UserName.Trim() == username.Trim() && x.Password.Trim() == password.Trim());
                    if (user != null)
                    {
                        //valid user
                        return true;
                    }
                    return false;
                }
                catch (Exception)
                {
                    return false;
                }
            }

            public Users GetUser(string username, string password)
            {
                try
                {
                    return Context.Users.FirstOrDefault(x => x.UserName.Trim() == username.Trim() && x.Password.Trim() == password.Trim());
                    //if (user != null)
                    //{
                    //    //valid user
                    //    return true;
                    //}
                    //return false;
                }
                catch (Exception)
                {
                    return null;
                }
            }

            public List<string> GetUserRoles(string username)
            {
                try
                {
                    var roles = Context.UserRole.Where(x => x.User.UserName == username);
                    return roles.Select(x => x.Role.RoleName).ToList();
                }
                catch (Exception)
                {
                    return null;
                }
            }

            public string Register(DbEntities.User.Users user)
            {
                try
                {
                    var xUser = Context.Users.FirstOrDefault(x => x.UserName == user.UserName);
                    if (xUser == null)
                    {
                        using (var scope = new TransactionScope())
                        {
                            var savedUser = Context.Users.Add(user);
                            Context.SaveChanges();
                            var roleId = Context.Role.FirstOrDefault(x => x.RoleName == "manager");
                            if (roleId == null)
                            {
                                roleId = Context.Role.Add(new Role()
                                {
                                    DisplayName = "Manager"
                                    ,
                                    RoleName = "manager"
                                    ,
                                    Description = "'Manager' has complete access over all of the settings."
                                });
                                Context.SaveChanges();
                            }
                            var urole = new UserRole()
                            {
                                AssignedDate = DateTime.Now
                                ,
                                UserId = savedUser.Id
                                ,
                                RoleId = roleId.Id
                            };

                            Context.UserRole.Add(urole);
                            Context.SaveChanges();
                            scope.Complete();
                            return "success";
                        }

                    }
                    return "Username already exist.";

                }
                catch (Exception e)
                {
                    return "Error while creating user.";
                }
            }


            public void Dispose()
            {
                Context.Dispose();
            }
        }
    }
}
