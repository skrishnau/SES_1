﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Academic.DbEntities.Class;
using Academic.DbEntities.Subjects;
using Academic.DbHelper;
using One.Values.MemberShip;

namespace One.ViewsSite.User.ModulesUc
{
    public partial class CoursesMenuUc : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                var thisUrl = Request.Url.AbsolutePath;
                if (thisUrl.Contains("/Views/Courses/"))
                {
                    var query = Request.QueryString["type"];
                    var q = query ?? "current";
                    if (q.Equals("current"))
                        lnkCurrent.CssClass = "course-menu-selected-item"; //"list-unmargined-selected-item";
                    else
                        lnkEarlier.CssClass = "course-menu-selected-item"; //"list-unmargined-selected-item";
                }
                //else if (thisUrl.Contains("/Views/Courses/?type=earlier"))
            }
            LoadCourses(UserId);
        }

        private void LoadCourses(int userId)
        {
            var user = Page.User as CustomPrincipal;
            if (user != null)
            {
                var elligibleForManagement = user.IsElligibleForManagement;
                using (var helper = new DbHelper.Subject())
                {
                    var subClasses = helper.GetEarlierAndCurrentCourseAndClassesForManagerAndTeacher(userId);//ListAllSubjectClassesOfUser(userId);

                    if (subClasses != null)
                    {
                        #region Current Subjects and classes

                        var current = subClasses[0];
                        foreach (var subject in current.Keys)
                        {
                            //display subject first

                            #region Subject Dispaly first

                            var hyperLink = new HyperLink()
                            {
                                Text = subject.FullName// "▪" +
                                ,
                                NavigateUrl = "~/Views/Course/Section/?SubId=" + subject.Id
                                ,
                                CssClass = "course-menu-subjct-class padding-left-20px"
                                ,
                                ToolTip = "course"
                            };
                            pHolderCurrent.Controls.Add(hyperLink);

                            #endregion
                            if (elligibleForManagement)
                                foreach (var scls in current[subject])
                                {
                                    var clsLink = new HyperLink()
                                    {
                                        Text = "▫" + scls.GetName
                                        ,
                                        NavigateUrl = "~/Views/Class/CourseClassDetail.aspx?ccId=" + scls.Id
                                        ,
                                        CssClass = "course-menu-subjct-class padding-left-40px"
                                        ,
                                        Font = { Italic = true, Size = new FontUnit(10) }
                                        ,
                                        ToolTip = "class in '" + subject.FullName + "'"
                                    };
                                    pHolderCurrent.Controls.Add(clsLink);
                                }
                        }

                        #endregion


                        #region Earlier Subjects and Classes

                        var earlier = subClasses[1];
                        foreach (var subject in earlier.Keys)
                        {
                            //display subject first

                            #region Subject Dispaly first

                            var hyperLink = new HyperLink()
                            {
                                Text = "▪" + subject.FullName
                                ,
                                NavigateUrl = "~/Views/Course/Section/?SubId=" + subject.Id
                                ,
                                CssClass = "course-menu-subjct-class padding-left-30px"
                                ,
                                ToolTip = "course"
                            };
                            pHolderEarlier.Controls.Add(hyperLink);

                            #endregion

                            if (elligibleForManagement)
                                foreach (var scls in current[subject])
                                {
                                    var clsLink = new HyperLink()
                                    {
                                        Text = "▫" + scls.GetName
                                        ,
                                        NavigateUrl = "~/Views/Class/CourseClassDetail.aspx?ccId=" + scls.Id
                                        ,
                                        CssClass = "course-menu-subjct-class padding-left-40px"
                                        ,
                                        Font = { Italic = true, Size = new FontUnit(10) }
                                        ,
                                        ToolTip = "class in '" + subject.FullName + "'"
                                    };
                                    pHolderEarlier.Controls.Add(clsLink);
                                }
                        }

                        #endregion

                    }
                }
            }
        }


        public int UserId
        {
            get { return Convert.ToInt32(hidUserId.Value); }
            set { hidUserId.Value = value.ToString(); }
        }


    }
}