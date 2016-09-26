﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Academic.DbHelper;
using Academic.ViewModel;
using One.Values.MemberShip;
using One.Values;

namespace One.Views.ActivityResource.Book
{
    public partial class BookView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var guid = Guid.NewGuid().ToString();
                hidPageKey.Value = guid;
                Session["EarlierSelectedChapter_" + guid] = -1;
                Session["NowSelectedChapter_" + guid] = -1;

                try
                {
                    ParseQueryString();
                }
                catch { }
            }
            LoadTOC();
        }

        private void ParseQueryString()
        {
            var subjectId = Request.QueryString["SubId"];

            var sectionId = Request.QueryString["secId"];
            var arId = Request.QueryString["arId"];
            //var edit = Request.QueryString["edit"];
            if (arId != null)
            {
                BookId = (Convert.ToInt32(arId.ToString()));
                using (var helper = new DbHelper.ActAndRes())
                {

                    var book = helper.GetBook(BookId);
                    lblBookName.Text = book.Name;
                    lblBookDescription.Text = book.Description;
                }
            }
            if (sectionId != null)
            {
                SectionId = Convert.ToInt32(sectionId);
            }

            var user = Page.User as CustomPrincipal;
            if (user != null)
            {
                if ((user.IsInRole(StaticValues.Roles.CourseEditor)
                     || user.IsInRole(StaticValues.Roles.Manager)
                     || user.IsInRole(StaticValues.Roles.Teacher)))
                {
                    var edit = Request.QueryString["edit"];
                    if (edit != null)
                    {
                        var path = Request.Url.AbsolutePath + "?arId=" + BookId;
                        if (edit == "1")
                        {
                            //edit on all sections
                            //link on edit 
                            Edit = edit;
                            lnkEdit.NavigateUrl = path + "&secId=" + SectionId + "&edit=0";
                            lblEdit.Text = "Exit Edit mode";
                            edit_panel.Visible = true;
                            //ListOfSectionsInCourseUC1.AddNewButtonVisibility = true;
                            //ListOfSectionsInCourseUC1.EditEnabled = true;
                        }
                        else
                        {
                            Edit = "0";
                            lnkEdit.NavigateUrl = path + "&secId=" + SectionId + "&edit=1";
                            lblEdit.Text = "Edit";
                            edit_panel.Visible = false;
                        }
                        if (subjectId != null && sectionId!=null)
                            lnkBackToCourse.NavigateUrl =
                                "~/Views/Course/Section/Master/CourseSectionListing.aspx?SubId=" + subjectId + "&edit=" + Edit
                                +"#section_"+sectionId;
                    }
                    else
                    {
                        lnkEdit.NavigateUrl = Request.Url.PathAndQuery + "&edit=1";
                        lblEdit.Text = "Edit";
                        edit_panel.Visible = false;
                    }

                }
                else
                {
                    Edit = "0";
                    lnkEdit.Visible = false;
                    lnkEdit.Enabled = false;
                }
            }
        }
        public int BookId
        {
            get { return Convert.ToInt32(hidBookId.Value); }
            set { hidBookId.Value = value.ToString(); }
        }
        public int SectionId
        {
            get { return Convert.ToInt32(hidSectionId.Value); }
            set { hidSectionId.Value = value.ToString(); }
        }

        public string Edit
        {
            get { return hidEdit.Value; }
            set { hidEdit.Value = value; }
        }

        //private void LoadBook()
        //{
        //    using (var helper = new DbHelper.ActAndRes())
        //    {
        //        var book = helper.GetBook(BookId);



        //        var toc = helper.GetTocOfBook(BookId);

        //        //var content = helper.GetContentOfBook(toc);
        //    }
        //}

        private void LoadTOC()
        {
            using (var helper = new DbHelper.ActAndRes())
            {
                var toc = helper.GetChaptersOfBook(BookId);
                if (!toc.Any())
                {
                    var user = Page.User as CustomPrincipal;
                    if (user != null)
                    {
                        if ((user.IsInRole(StaticValues.Roles.CourseEditor)
                             || user.IsInRole(StaticValues.Roles.Manager)
                             || user.IsInRole(StaticValues.Roles.Teacher)))
                        {
                            Response.Redirect("~/Views/ActivityResource/Book/ChapterCreate.aspx?bId=" + BookId +
                                              "&pcId=0");
                        }
                    }
                }
                else
                {
                    LoadParentChapters(toc);
                }
                //var content = helper.GetContentOfBook(toc);
            }
        }

        void LoadParentChapters(List<Academic.DbEntities.ActivityAndResource.BookItems.BookChapter> list)
        {


            marginleft += 15;
            var early = Session["EarlierSelectedChapter_" + hidPageKey.Value];
            var selectFirst = false;
            try
            {
                if (early != null)
                    if (early.ToString() == "-1")
                        selectFirst = true;
            }
            catch
            {
            }
            var parents = list.Where(x => (x.ParentChapterId ?? 0) == 0).ToList();

            var i = 0;

            foreach (var bc in parents)
            {

                var itemuc =
                            (BookItems.TocItemsUc)Page.LoadControl("~/Views/ActivityResource/Book/BookItems/TocItemsUc.ascx");

                itemuc.SetData(marginleft, bc.Id, bc.Position + ". " + bc.Title, bc.BookId, Edit
                    , bc.Position != 1
                    , bc.Position != parents.Max(x => x.Position)
                    , bc.Position != 1
                    , bc.ParentChapterId != null);
                itemuc.ID = "chapters_" + bc.Id;
                itemuc.ChapterUpdated += itemuc_ChapterUpdated;
                itemuc.ChapterClicked += itemuc_ChapterClicked;
                if (i == 0 && selectFirst)
                {
                    itemuc.Select();
                    Session["EarlierSelectedChapter_" + hidPageKey.Value] = bc.Id;
                    LoadContent(bc.Id, bc.Position + ". " + bc.Title);
                }
                pnlToc.Controls.Add(itemuc);

                //var children = list.Where(x => x.ParentChapterId == bc.Id).ToList();
                LoadChapters(list, bc.Id, bc.Position + ". ");
                i++;
            }
            marginleft -= 15;


        }



        private int marginleft = 0;
        void LoadChapters(List<Academic.DbEntities.ActivityAndResource.BookItems.BookChapter> list, int parentId, string number)
        {
            marginleft += 15;
            var thisone = list.Where(x => x.ParentChapterId == parentId).ToList();
            foreach (var bc in thisone)
            {
                var itemuc =
                            (BookItems.TocItemsUc)
                            Page.LoadControl("~/Views/ActivityResource/Book/BookItems/TocItemsUc.ascx");
                itemuc.SetData(marginleft, bc.Id, number + bc.Position + ". " + bc.Title, bc.BookId, Edit
                    , bc.Position != 1,
                    bc.Position != thisone.Max(x => x.Position),
                    bc.Position != 1,
                    bc.ParentChapterId != null);
                itemuc.ID = "chapters_" + bc.Id;
                itemuc.ChapterClicked += itemuc_ChapterClicked;
                itemuc.ChapterUpdated += itemuc_ChapterUpdated;
                pnlToc.Controls.Add(itemuc);
                //var children = list.Where(x => x.ParentChapterId == bc.Id).ToList();
                LoadChapters(list, bc.Id, number + bc.Position + ". ");
            }
            marginleft -= 15;
        }

        void itemuc_ChapterUpdated(object sender, IdAndNameEventArgs e)
        {
            pnlToc.Controls.Clear();
            LoadTOC();
        }

        void itemuc_ChapterClicked(object sender, Academic.ViewModel.IdAndNameEventArgs e)
        {
            try
            {
                var early = Session["EarlierSelectedChapter_" + hidPageKey.Value];
                if (early != null)
                {

                    var earlier = pnlToc.FindControl("chapters_" + early);
                    if (earlier != null)
                    {
                        var ear = earlier as BookItems.TocItemsUc;
                        if (ear != null)
                        {
                            ear.Deselect();
                            //Session["EarlierSelectedChapter_" + hidPageKey.Value] = e.Id;
                        }
                    }
                }

                var clicked = pnlToc.FindControl("chapters_" + e.Id);
                if (clicked != null)
                {
                    var cl = clicked as BookItems.TocItemsUc;
                    if (cl != null)
                    {
                        cl.Select();
                        Session["EarlierSelectedChapter_" + hidPageKey.Value] = e.Id;
                        LoadContent(e.Id, e.Name);
                        //imgPrevTop.CommandArgument= e.
                    }
                }

            }
            catch { }


        }

        private void LoadContent(int chapterId, string name)
        {
            using (var helper = new DbHelper.ActAndRes())
            {
                var content = helper.GetChapter(chapterId);
                lblChapterHeading.Text = name;
                if (content != null)
                {
                    lblContent.Text = content.Content;
                    lnkChapterEdit.NavigateUrl = "~/Views/ActivityResource/Book/ChapterCreate.aspx?bId=" + content.BookId + "&pcId=" + content.Id + "&edit=1";
                }

            }
        }

        //protected void imgNavigate_Click(object sender, ImageClickEventArgs e)
        //{
        //    var send = sender as ImageButton;
        //    if (send != null)
        //    {
        //        switch (send.ID)
        //        {
        //            case "imgPrevTop":

        //                break;

        //            case "":
        //                break;

        //            case "":
        //                break;

        //            case "":
        //                break;


        //        }

        //    }
        //}

    }
}