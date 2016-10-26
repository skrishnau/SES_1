﻿using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Academic.DbHelper;

namespace One.Views.Course
{
    public partial class CourseDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var courseId = Request.QueryString["cId"];
                if (courseId != null)
                {
                    hidCourseId.Value = courseId;
                    lnkNewClass.NavigateUrl = "~/Views/Class/CourseSessionCreate.aspx?cId=" + courseId;
                    try
                    {
                        using (var helper = new DbHelper.Classes())
                        {
                            var sessions = helper.ListClassesOfSubject(Convert.ToInt32(courseId),"All");
                            dlistClasses.DataSource = sessions;
                            dlistClasses.DataBind();
                        }
                    }
                    catch { Response.Redirect("~/Views/Course/List.aspx"); }
                }
                else
                {
                    Response.Redirect("~/Views/Course/List.aspx");
                }
                //load course detail
                using (var helper = new DbHelper.Subject())
                {
                    try
                    {
                        var cId = Convert.ToInt32(courseId);
                        var sub = helper.GetCourse(cId);
                        if (sub != null)
                        {
                            lblFullName.Text = sub.Name;
                            lblCategory.Text = sub.SubjectCategory.Name;
                            lblShortName.Text = sub.ShortName;
                            lblHeading.Text = sub.Name;
                        }

                    }
                    catch { }
                }
            }
        }

        public int CourseId
        {
            get { return Convert.ToInt32(hidCourseId.Value); }
            set { hidCourseId.Value = value.ToString(); }
        }

        public Color GetCompletedColor(object complete, object startDate, object endDate)
        {
            try
            {
                var completed = (complete == null) ? "False" : complete.ToString();
                //var color = Color.LightBlue;
                if (completed == "True")
                {
                    //return Color.LightGreen;
                    return Color.FromArgb(188, 244, 188);
                }
                var startD = (startDate == null) ? DateTime.MinValue : Convert.ToDateTime(startDate);
                var endD = (endDate == null) ? DateTime.MaxValue : Convert.ToDateTime(endDate.ToString());


                if (startD.Date > DateTime.Now.Date)
                {
                    //return Color.LightYellow;
                    return Color.FromArgb(253, 253, 194);
                }
                else if (endD < DateTime.Now)
                {
                    //return Color.LightPink;
                    return Color.FromArgb(253, 214, 220);
                }
                //return Color.LightBlue;
                return Color.FromArgb(215, 227, 231);
            }
            catch
            {
                //return Color.LightBlue;
                return Color.FromArgb(215, 227, 231);
            }

        }

        protected void lnkClassFilter_Click(object sender, EventArgs e)
        {
            if (imgFilter.ImageUrl.Contains("arrow_down"))
            {
                imgFilter.ImageUrl = "~/Content/Icons/Arrow/arrow_right.png";
            }
            else
            {
                imgFilter.ImageUrl = "~/Content/Icons/Arrow/arrow_down.png";
            }
            pnlClassFilter.Visible = !pnlClassFilter.Visible;
        }

        protected void btnFilterCrieteria_Click(object sender, EventArgs e)
        {
            var button = (LinkButton)sender;

            ApplyFilterAndLoadData(button.ID);
        }

        private void ApplyFilterAndLoadData(string courseCompletionType)
        {
            using (var helper = new DbHelper.Classes())
            {
                var sessions = helper.ListClassesOfSubject(CourseId, courseCompletionType);
                dlistClasses.DataSource = sessions;
                dlistClasses.DataBind();
            }
        }
    }
}