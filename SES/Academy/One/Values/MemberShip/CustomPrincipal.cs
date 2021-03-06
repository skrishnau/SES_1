﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Security;
using Academic.DbEntities.User;
using Academic.DbHelper;

namespace One.Values.MemberShip
{
    interface ICustomPrincipal : IPrincipal
    {
        int Id { get; set; }
        string UserName { get; set; }
        string FirstName { get; set; }
        string LastName { get; set; }
        List<string> UserRoles { get; set; }
    }

    public class CustomPrincipal : ICustomPrincipal
    {
        public IIdentity Identity { get; private set; }

        public bool IsInRole(string role)
        {
            foreach (var role1 in Roles)
            {
                if (role1.ToString().Equals(role))
                {
                    return true;
                }
            }
            return false;
        }

        /// <summary>
        /// checks whether the user is course editor or manager or admin or teacher
        /// </summary>
        public bool IsElligibleForManagement
        {
            get
            {
                var roles = GetRoles();
               return roles.Contains(DbHelper.StaticValues.Roles.CourseEditor.ToString())
                                                            || roles.Contains(DbHelper.StaticValues.Roles.Manager.ToString())
                                                            || roles.Contains(DbHelper.StaticValues.Roles.Admin.ToString())
                                                            || roles.Contains("teacher");
            }
        }

        private Array Roles { get; set; }

        public List<string> GetRoles()
        {
            var lst = new List<string>();
            foreach (var role1 in Roles)
            {
                lst.Add(role1.ToString());
            }
            return lst;
        }

        public CustomPrincipal(string email)
        {
            this.Identity = new GenericIdentity(email);
        }

        public CustomPrincipal(string username, Array roles)
        {
            this.Identity = new GenericIdentity(username, "Forms");
            this.Roles = roles;
        }

        public string TestString { get; set; }

        public int Id { get; set; }
        public string UserName { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public List<string> UserRoles { get; set; }

        public int SchoolId { get; set; }

        public int AcademicYearId { get; set; }

        public int SessionId { get; set; }
    }

    public class CustomPrincipalSerializeModel
    {
        public int Id { get; set; }
        public string UserName { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }

        public int SchoolId { get; set; }
        public int AcademicYearId { get; set; }
        public int SessionId { get; set; }

        public string TestString { get; set; }

        public List<string> UserRoles { get; set; }
    }

    public class CustomLogin
    {
        //Take this as reference... for login
        //public void Login(Users viewModel)
        //{
        //    if (Membership.ValidateUser(viewModel.Email, viewModel.Password))
        //    {
        //        using (var helper = new DbHelper.User())
        //        {
        //            var user = helper.Users.Where(u => u.Email == viewModel.Email).First();

        //            CustomPrincipalSerializeModel serializeModel = new CustomPrincipalSerializeModel();
        //            serializeModel.Id = user.Id;
        //            serializeModel.FirstName = user.FirstName;
        //            serializeModel.LastName = user.LastName;

        //            JavaScriptSerializer serializer = new JavaScriptSerializer();

        //            string userData = serializer.Serialize(serializeModel);

        //            FormsAuthenticationTicket authTicket = new FormsAuthenticationTicket(
        //                1,
        //                viewModel.Email,
        //                DateTime.Now,
        //                DateTime.Now.AddMinutes(15),
        //                false,
        //                userData);

        //            string encTicket = FormsAuthentication.Encrypt(authTicket);
        //            HttpCookie faCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encTicket);
        //            Response.Cookies.Add(faCookie);

        //            return RedirectToAction("Index", "Home");
        //        }
        //    }
        //}
    }
}