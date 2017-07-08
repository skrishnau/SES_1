﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Academic.DbHelper;
using Academic.ViewModel;
using One.Values.MemberShip;

namespace One.Views.Course.Section
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                var id = Request.QueryString["SubId"];

                var user = Page.User as CustomPrincipal;
                if (user != null)
                {
                    ListOfSectionsInCourseUC1.UserId = user.Id;
                    if ((user.IsInRole(DbHelper.StaticValues.Roles.CourseEditor)
                         || user.IsInRole(DbHelper.StaticValues.Roles.Manager)
                         || user.IsInRole(DbHelper.StaticValues.Roles.Teacher)))
                    {
                        var edit = Session["editMode"] as string;//Request.QueryString["edit"];
                        _path = Request.Url.AbsolutePath + "?SubId=" + id;
                        if (edit != null)
                        {

                            if (edit == "1")
                            {
                                //edit on all sections
                                //link on edit 
                                Edit = "1";
                                //lnkEdit.NavigateUrl = _path + "&edit=0";
                                //lblEdit.Text = "Exit Edit mode";
                                //ListOfSectionsInCourseUC1.AddNewButtonVisibility = true;
                                ListOfSectionsInCourseUC1.EditEnabled = true;

                            }
                            else
                            {
                                Edit = "0";
                                //lnkEdit.NavigateUrl = _path + "&edit=1";
                                //lblEdit.Text = "Edit";
                            }
                        }
                        else
                        {
                            //Request.Url.PathAndQuery
                            //lnkEdit.NavigateUrl = _path + "&edit=1";
                            //lblEdit.Text = "Edit";
                        }

                    }
                    else
                    {
                        //lnkEdit.Visible = false;
                        //lnkEdit.Enabled = false;
                    }
                }

                int subId = 0;
                var succ = int.TryParse(id, out subId);
                if (succ)
                {
                    Id = subId;
                    LoadCourse(subId);
                }
            }

        }

        private string _path = "";

        public string Edit
        {
            get { return hidEdit.Value; }
            set { hidEdit.Value = value; }
        }

        public int Id { get; set; }

        private void LoadCourse(int courseId)
        {
            var user = Page.User as CustomPrincipal;

            var edit = hidEdit.Value;
            if (user != null)
            {
                using (var cHelper = new DbHelper.Classes())
                using (var strHelper = new DbHelper.Structure())
                using (var helper = new DbHelper.Subject())
                {
                    
                    var sub = helper.Find(courseId);
                    if (sub != null)
                    {

                        LoadSitemap(strHelper,sub);

                        
                        txtSubjectName.Text = sub.FullName;
                        //uncomment
                        ListOfSectionsInCourseUC1.CourseId = Id;
                        lblPageTitle.Text = sub.FullName;

                        var courseStatus = cHelper.GetCourseClassesAvailabilityForUser(user.Id, sub.Id);

                        var stat = courseStatus.Split(new []{','});

                        if (stat.Length == 2)
                        {
                            lnkMyClasses.Visible = stat[1].Equals(DbHelper.StaticValues.Roles.Teacher);
                        }

                        switch (stat[0])
                        {
                            case "current":
                                imgJoinInfo.Visible = true;
                                imgJoinInfo.ImageUrl = "~/Content/Icons/Start/active_icon_10px.png";
                                break;
                            case "complete":
                                imgJoinInfo.Visible = true;
                                imgJoinInfo.ImageUrl = "~/Content/Icons/Diploma/diploma_16px.png";
                                break;
                            case "open":
                                lnkEnroll.Visible = true;
                                break;
                            case "close":
                               
                                break;
                            default:
                                break;

                        }
                        //lblClassInformation.Text = cHelper.GetCourseClassesAvailabilityForUser(user.Id, sub.Id);
                    }
                    //CourseDetailUc1.
                }}

        }


        void LoadSitemap(DbHelper.Structure strHelper,Academic.DbEntities.Subjects.Subject sub)
        {
            var fromCls = Request.QueryString["frmDetailView"];
            var yId = Request.QueryString["yId"];
            var sId = Request.QueryString["sId"];
            if (SiteMap.CurrentNode != null)
            {
                var list = new List<IdAndName>()
                        {
                           new IdAndName(){
                                        Name=SiteMap.RootNode.Title
                                        ,Value =  SiteMap.RootNode.Url
                                        ,Void=true
                                    },
                        };
                if (sId != null && yId != null)
                {
                    //lnkEdit.NavigateUrl += "&yId=" + yId + "&sId=" + sId;
                    list.Add(new IdAndName()
                    {
                        Name = "Manage Programs"
                        ,
                        Value = "~/Views/Structure/"
                        ,
                        Void = true
                    });
                    list.Add(new IdAndName()
                    {
                        Name = strHelper.GetSructureDirectory(Convert.ToInt32(yId), Convert.ToInt32(sId))
                        ,
                        Value = "~/Views/Structure/CourseListing.aspx?yId=" + yId + "&sId=" + sId 
                        ,
                        Void = true
                    });
                    list.Add(new IdAndName()
                    {
                        Name = sub.FullName
                    });
                }
                else if (fromCls != null)
                {
                    //lnkEdit.NavigateUrl += "&frmDetailView=" + fromCls;
                    list.Add(new IdAndName()
                    {
                        Name = SiteMap.CurrentNode.ParentNode.Title
                        ,
                        Value = SiteMap.CurrentNode.ParentNode.Url
                        ,
                        Void = true
                    });
                    list.Add(new IdAndName()
                    {
                        Name = sub.FullName
                        ,
                        Value = "~/Views/Course/CourseDetail.aspx?cId=" + sub.Id
                        ,
                        Void = true
                    });
                    list.Add(new IdAndName() { Name = "View" });
                }
                else
                {
                    list.Add(new IdAndName()
                    {
                        Name = sub.FullName
                        ,
                        //Value = "~/Views/Course/CourseDetail.aspx?cId=" + sub.Id
                        //,
                        //Void = true
                    });
                }
                SiteMapUc.SetData(list);
            }
        }
    }
}