﻿using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Academic.DbHelper;

namespace One.Views.Academy.UserControls
{
    public partial class AcademicYearListUC : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void LoadAcademicYear(int academicYearId, string name, DateTime startDate
            , DateTime endDate, bool active, List<Academic.DbEntities.Session> sessionList
            , bool complete, bool edit)
        {
            lnkAcademicYearName.Text = " " + name + " ";
            lnkAcademicYearName.NavigateUrl = "~/Views/Academy/Detail.aspx?aId=" + academicYearId
                + "&edit=" + (edit ? "1" : "0");
            if (edit)
            {
                lnkEdit.NavigateUrl = "~/Views/Academy/Create.aspx?aId=" + academicYearId;
                if ((active || complete))
                    lnkDelete.Visible = false;
                else
                    lnkDelete.NavigateUrl = "~/Views/All_Resusable_Codes/Delete/DeleteForm.aspx?task=" +
                                            DbHelper.StaticValues.Encode("academicYear") + "&acaId=" + academicYearId;
            }
            lnkEdit.Visible = edit;
            lnkDelete.Visible = edit;

            lblEndDate.Text = endDate.ToString("D");
            lblStartDate.Text = startDate.ToString("D");
            if (complete)
            {
                //divBody.Style.Add("border-left", "10px solid lightgrey");
                imgActive.ImageUrl = "~/Content/Icons/Stop/Stop_10px.png";
                imgActive.Visible = true;
            }
            else if (sessionList.Any(x => !(x.Void ?? false) && !(x.Completed ?? false) && x.IsActive))//active ||
            {

                //divBody.Style.Add("border-left", "10px solid green");
                imgActive.ImageUrl = "~/Content/Icons/Start/active_icon_10px.png";
                imgActive.Visible = true;

            }

            #region Sessions

            //if (!sessionList.Any())
            //{
            //    //lblTitleInSessionsList.Text = "Sessions:";
            //    lblTitleInSessionsList.Text = "None";
            //    //pnlSessionsList.Controls.Add(new Label() { Text = "None" , ForeColor = Color.DarkSlateGray});

            //}
            //else
            //{
            //    var count = sessionList.Count;
            //    var i = 0;
            //    foreach (var sess in sessionList)
            //    {
            //        i++;
            //        var hypSes = new HyperLink()
            //        {
            //            Text = sess.Name
            //            ,
            //            //NavigateUrl = "~/Views/Academy/Session/SessionDetail.aspx?sId=" + sess.Id
            //            //,
            //        };
            //        pnlSessionsList.Controls.Add(hypSes);
            //        if (active && sess.IsActive)
            //        {
            //            //hypSes.BackColor = Color.LightGreen;
            //            var activeIndicator = new Label() { Text = " (Active)", ForeColor = Color.DarkGreen };
            //            pnlSessionsList.Controls.Add(activeIndicator);
            //        }
            //        //hypSes.Attributes.Add("margin","2px 0");
            //        if (count > i)
            //            pnlSessionsList.Controls.Add(new Literal() { Text = ", " });
            //        //pnlSessionsList.Controls.Add(new HtmlGenericControl("br"));
            //    }
            //}

            #endregion

        }


        public void LoadAcademicYear(Academic.DbEntities.AcademicYear ay,bool edit)
        {
            lnkAcademicYearName.Text = " " + ay.Name + " ";
            lnkAcademicYearName.NavigateUrl = "~/Views/Academy/Detail.aspx?aId=" + ay.Id
                                              + "&edit=" + (edit ? "1" : "0");
            if (edit)
            {
                lnkEdit.NavigateUrl = "~/Views/Academy/Create.aspx?aId=" + ay.Id;
                if (ay.IsActive || (ay.Completed??false))
                    lnkDelete.Visible = false;
                else
                    lnkDelete.NavigateUrl = "~/Views/All_Resusable_Codes/Delete/DeleteForm.aspx?task=" +
                                            DbHelper.StaticValues.Encode("academicYear") + "&acaId=" + ay.Id;
            }
            lnkEdit.Visible = edit;
            lnkDelete.Visible = edit;

            lblEndDate.Text = ay.EndDate.ToString("D");
            lblStartDate.Text = ay.StartDate.ToString("D");
            if (ay.Completed??false)
            {
                //divBody.Style.Add("border-left", "10px solid lightgrey");
                imgActive.ImageUrl = "~/Content/Icons/Stop/Stop_10px.png";
                imgActive.Visible = true;
            }
            else if (ay.Sessions.Any(x => !(x.Void ?? false) && !(x.Completed ?? false) && x.IsActive)) //active ||
            {

                //divBody.Style.Add("border-left", "10px solid green");
                imgActive.ImageUrl = "~/Content/Icons/Start/active_icon_10px.png";
                imgActive.Visible = true;

            }
            var batch = ay.Batches.FirstOrDefault();
            if (batch != null)
            {
                lnkBatch.Text = batch.Name ;
                lnkBatch.NavigateUrl = "~/Views/Student/Batch/?Id=" + batch.Id;
            }
            foreach (var sess in ay.Sessions.Where(x => !(x.Void ?? false)).ToList())
            {
                var sessUc = (Academy.UserControls.SessionsListingInAYDetailUC)
                    Page.LoadControl("~/Views/Academy/UserControls/SessionsListingInAYDetailUC.ascx");
                sessUc.LoadSessionData(ay.Id, sess.Id, sess.Name
                    , sess.StartDate, sess.EndDate
                    , sess.IsActive, sess.Completed ?? false, edit, false);
                pnlSessions.Controls.Add(sessUc);
            }
        }
    }
}