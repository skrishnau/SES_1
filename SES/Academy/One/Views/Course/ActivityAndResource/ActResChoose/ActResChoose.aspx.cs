﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace One.Views.Course.ActivityAndResource.ActResChoose
{
    public partial class ActResChoose : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    var secId = Request.QueryString["SecId"];
                    var subId = Request.QueryString["SubId"];
                    int sId;
                    var parsed = Int32.TryParse(secId, out sId);
                    int suId;
                    if (parsed)
                    {
                        parsed = Int32.TryParse(subId, out suId);
                    }

                    if (parsed)
                    {
                        if (secId != null && subId != null)
                        {
                            //uncomment
                            //ActResChooseUc.SectionId = Convert.ToInt32(secId);
                            //ActResChooseUc.SubjectId = Convert.ToInt32(subId);
                        }

                    }
                }
                catch (Exception exe) { }
            }
        }
    }
}