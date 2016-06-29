﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Academic.DbHelper;

namespace One.Views.Student.Create
{
    public partial class StudentGroupUc : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // DbHelper.ComboLoader.LoadSchool(ref cmbSchool , InitialValues.CustomSession["InstitutionId"]);
                if (!String.IsNullOrEmpty(hidId.Value))
                {
                    int id = Convert.ToInt32(hidId.Value.ToString());
                    if (id > 0)
                    {
                        //using (var helper = new DbHelper.Student())
                        //{
                        //    //var sg = helper.GetStudentGroup(id);
                        //    //if (sg != null)
                        //    //    ShowStudentAssign(sg);
                        //}
                    }
                }
                //UserCreateUC.RoleName = "student";
                //cmbparent load not done yet
            }

        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            Academic.DbEntities.Students.StudentGroup saved = null;

            if (Page.IsValid)
            {
                using (var helper = new DbHelper.Student())
                {
                    var sgrop = new Academic.DbEntities.Students.StudentGroup()
                    {
                        Id = Convert.ToInt32(hidId.Value)
                        ,
                        Name = txtName.Text
                        ,
                        SchoolId = Values.Session.GetSchool(Session)
                        ,
                        IsActive = chkIsActive.Checked
                        ,
                        CreatedDate = DateTime.Now
                        ,
                        Description = txtDesc.Text
                    };
                    saved = helper.AddOrUpdateStudentGroup(sgrop);
                    if (saved != null)
                        Response.Write("Saved");
                    else
                    {
                        Response.Write("Couldn't save");
                    }
                }
            }
            if (saved != null)
            {
                hidId.Value = saved.Id.ToString();
                //pnlGroup.Enabled = false;
                //btnSave.Enabled = false;
                //ShowStudentAssign(saved);
            }
        }
    }
}