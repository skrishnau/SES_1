﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Academic.DbHelper;
using Academic.ViewModel;
using One.Values.MemberShip;

namespace One.Views
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var user = Page.User as CustomPrincipal;
            if (user != null)
            {
                lblConfirmCheck.Visible = false;
                lblPasswordError.Visible = false;
                lblQuestionSaveError.Visible = false;
                lblQuestionError.Visible = false;
                if (!IsPostBack)
                {
                    txtearlierPswrd1.Text = "";
                    using (var helper = new DbHelper.User())
                    using (var file = new DbHelper.WorkingWithFiles())
                    {
                        var usr = helper.GetUser(user.Id);
                        if (usr != null)
                        {
                            if (SiteMap.CurrentNode != null)
                            {
                                var list = new List<IdAndName>()
                                {
                                   new IdAndName(){
                                                Name=SiteMap.RootNode.Title
                                                ,Value =  SiteMap.RootNode.Url
                                                ,Void=true
                                            },
                                    new IdAndName(){
                                        Name = SiteMap.CurrentNode.Title
                                        //,Value = SiteMap.CurrentNode.ParentNode.Url
                                        //,Void=true
                                    }
                                };
                                SiteMapUc.SetData(list);
                            }
                            lblName.Text = usr.FullName;
                            lblEmail.Text = string.IsNullOrEmpty(usr.Email)? "  -  ":usr.Email;
                            lblUsername.Text = usr.UserName;

                            img.ImageUrl = file.GetImageUrl(usr.UserImageId ?? 0);
                            ddlQuestion.DataSource = DbHelper.StaticValues.SecurityQuestion();
                            ddlQuestion.DataBind();


                            try
                            {
                                var progBatch = usr.Student.FirstOrDefault().StudentBatch.FirstOrDefault().ProgramBatch;
                                //batch.ProgramBatch.NameFromBatch;
                                phProfileInfo.Controls.Add(new Literal()
                                {
                                    Text = "<tr><td class='data-type'>"
                                        +"Batch"+"</td><td class='data-value'>"+progBatch.Batch.Name
                                        +"</td></tr>"
                                });
                                phProfileInfo.Controls.Add(new Literal()
                                {
                                    Text = "<tr><td class='data-type'>"
                                        + "Program" + "</td><td  class='data-value'>" + progBatch.Program.Name
                                        + "</td></tr>"
                                });
                                phProfileInfo.Visible = true;
                            }
                            catch{}

                        }
                    }
                    SetView();
                }
            }

        }

        private void SetView()
        {
            var type = Request.QueryString["type"];
            if (type == "secQue")
            {
                //security question
                MultiView1.ActiveViewIndex = 2;
            }
            else if (type == "psw")
            {
                MultiView1.ActiveViewIndex = 1;
            }
            else
            {
                MultiView1.ActiveViewIndex = 0;
            }
        }

        //protected void lnkPassword_OnClick(object sender, EventArgs e)
        //{
        //    MultiView1.ActiveViewIndex = 1;
        //}

        //protected void lnkSecurityQuestion_OnClick(object sender, EventArgs e)
        //{
        //    MultiView1.ActiveViewIndex = 2;
        //}

        protected void btnSavePassword_OnClick(object sender, EventArgs e)
        {
            var user = Page.User as CustomPrincipal;
            if (user != null)
                if (txtConfirmPswrd.Text.Equals(txtNewPswrd.Text))
                {
                    using (var helper = new Academic.DbHelper.DbHelper.User())
                    {
                        var changed = helper.ChangePassword(user.Id, txtearlierPswrd1.Text, txtConfirmPswrd.Text);
                        if (changed)
                        {
                            Response.Redirect("~/Views/Profile.aspx");
                            //MultiView1.ActiveViewIndex = 0;
                            //ResetPasswordControls();
                        }
                        else
                        {
                            lblPasswordError.Visible = true;
                        }
                    }
                }
                else
                {
                    lblConfirmCheck.Visible = true;
                }
        }
        protected void btnSaveQuestion_OnClick(object sender, EventArgs e)
        {
            var user = Page.User as CustomPrincipal;
            if (user != null)
            {
                if (ddlQuestion.SelectedIndex == 0)
                {
                    lblQuestionError.Visible = true;
                }
                using (var helper = new Academic.DbHelper.DbHelper.User())
                {
                    var changed = helper.ChangeSecurityQuestion(user.Id, txtPswrd.Text, ddlQuestion.Text, txtAnswer.Text);
                    if (changed)
                    {
                        Response.Redirect("~/Views/Profile.aspx");

                        //MultiView1.ActiveViewIndex = 0;
                        //ResetQuestionControls();
                    }
                    else
                    {
                        lblQuestionSaveError.Visible = true;
                    }
                }
            }
        }

        protected void btnCancel_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("~/Views/Profile.aspx");
            //MultiView1.ActiveViewIndex = 0;
            //ResetQuestionControls();
            //ResetPasswordControls();
        }

        //private void ResetPasswordControls()
        //{
        //    txtearlierPassword.Text = "";
        //    txtNewPassword.Text = "";
        //    txtConfirmPassword.Text = "";
        //}

        //private void ResetQuestionControls()
        //{
        //    ddlQuestion.ClearSelection();
        //    txtPassword.Text = "";
        //    txtAnswer.Text = "";
        //}
    }
}