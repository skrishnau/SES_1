﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace One.Views.AcademicPlacement.RunningClass.AddClasses
{
    public partial class AddClasses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TreeViewUC1.SchoolId = Values.Session.GetSchool(Session);
            }
        }
    }
}