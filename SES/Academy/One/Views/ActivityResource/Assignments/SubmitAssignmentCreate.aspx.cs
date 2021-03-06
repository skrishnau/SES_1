﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Academic.DbHelper;
using Academic.ViewModel;
using System.IO;
using System.Net;
using HtmlAgilityPack;
using One.Values.MemberShip;

namespace One.Views.ActivityResource.Assignments
{
    public partial class SubmitAssignmentCreate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblError.Visible = false;
            AsyncFileUpload1.Style.Add("visibility", " hidden");
            var user = Page.User as CustomPrincipal;
            if (user != null)
            {
                if (!IsPostBack)
                {
                    try
                    {
                        var aId = Request.QueryString["arId"];
                        var subId = Request.QueryString["SubId"];
                        var secId = Request.QueryString["secId"];
                        var ucId = Request.QueryString["ucId"];

                        //var edit = Request.QueryString["edit"];
                        if (ucId == null)
                        {
                            Response.Redirect("~/Views/All_Resusable_Codes/Error/ErrorPage.aspx");
                        }
                        else
                            UserClassId = Convert.ToInt32(ucId);

                        if (aId != null)
                        {
                            var assId = Convert.ToInt32(aId);
                            AssignmentId = assId;
                            LoadActivity(assId);
                        }
                        else
                            Response.Redirect("~/");

                        if (subId != null)
                        {
                            SubjectId = Convert.ToInt32(subId);
                            if (secId != null)
                            {
                                SectionId = Convert.ToInt32(secId);
                            }
                        }
                        //var key = Guid.NewGuid().ToString();
                        //FilesDisplay1.PageKey = key;
                        FilesDisplay1.FileSaveDirectory = DbHelper.StaticValues.AssignmentDirectory;
                        //FilesDisplay1.FileAcquireMode = Enums.FileAcquireMode.Multiple;
                        //Session["FilesList" + key] = new List<FileResourceEventArgs>();

                    }
                    catch
                    {
                        Response.Redirect("~/Views/All_Resusable_Codes/Error/ErrorPage.aspx");
                    }
                }
            }
            else
            {
                Response.Redirect("~/");
            }
        }

        #region Properties

        public int SectionId
        {
            get { return Convert.ToInt32(hidSectionId.Value); }
            set { hidSectionId.Value = value.ToString(); }
        }
        public int SubjectId
        {
            get { return Convert.ToInt32(hidSubjectId.Value); }
            set { hidSubjectId.Value = value.ToString(); }
        }

        public int UserClassId
        {
            get { return Convert.ToInt32(hidUserClassId.Value); }
            set { hidUserClassId.Value = value.ToString(); }
        }


        public int AssignmentId
        {
            get { return Convert.ToInt32(hidAssignmentId.Value); }
            set { hidAssignmentId.Value = value.ToString(); }
        }

        public int SubmissionId
        {
            get { return Convert.ToInt32(hidSubmissionId.Value); }
            set { hidSubmissionId.Value = value.ToString(); }
        }

        public int WordLimit
        {
            get { return Convert.ToInt32(hidWordLimit.Value); }
            set { hidWordLimit.Value = value.ToString(); }
        }
        public int FileLimit
        {
            get { return Convert.ToInt32(hidFileLimit.Value); }
            set { hidFileLimit.Value = value.ToString(); }
        }

        #endregion


        void LoadActivity(int assignmentId)
        {
            using (var helper = new DbHelper.ActAndRes())
            {
                var ass = helper.GetAssignment(assignmentId);
                if (ass != null)
                {
                    var submission = ass.Submissions.FirstOrDefault(x => x.UserClassId == UserClassId);
                    if (submission != null)
                    {
                        var files = new List<FileResourceEventArgs>();
                        SubmissionId = submission.Id;
                        if (ass.OnlineText)
                            CKEditor1.Text = submission.SubmissionText;
                        if (ass.FileSubmission)
                        {
                            FilesDisplay1.NumberOfFilesToUpload = ass.MaximumNoOfUploadedFiles ?? 0;
                            var i = 1;
                            foreach (var f in submission.AssignmentSubmissionFiles)
                            {
                                files.Add(new FileResourceEventArgs()
                                {
                                    Id = f.UserFileId,
                                    Visible = true,
                                    FileType = f.UserFile.FileType,
                                    IconPath = f.UserFile.IconPath,
                                    FilePath = f.UserFile.FileDirectory + "/" + f.UserFile.FileName,
                                    FileDisplayName = f.UserFile.DisplayName,
                                    FileSizeInBytes = f.UserFile.FileSizeInBytes
                                    ,
                                    LocalId = i.ToString()
                                });
                                i++;
                            }
                            FilesDisplay1.SetInitialValues(files);
                        }
                    }


                    AssignmentId = assignmentId;
                    lblName.Text = ass.Name;
                    lblDescription.Text = ass.Description;

                    if (ass.FileSubmission || ass.OnlineText)
                    {
                        if (ass.FileSubmission)
                        {
                            pnlFileSubmit.Visible = true;
                            lblFileLimit.Text = "(File Limit : " + (ass.MaximumNoOfUploadedFiles ?? 0) + " files, " +
                                " Maximum size per file: " + (ass.MaximumSubmissionSize ?? 0) +
                                "KB)";
                            //FilesDisplay1.NumberOfFilesToUpload = ass.MaximumNoOfUploadedFiles ?? 0;
                        }
                        else
                        {
                            pnlFileSubmit.Visible = false;
                            pnlFileSubmit.Controls.Clear();
                        }

                        if (ass.OnlineText)
                        {
                            //lblScript.Text = WordLimitScript(ass.WordLimit ?? 0);

                            lblWordLimit.Text = "(Word Limit : " + (ass.WordLimit ?? 0) + " words)";
                            pnlText.Visible = true;
                        }
                        else
                        {
                            pnlText.Visible = false;
                            pnlText.Controls.Clear();
                        }
                    }
                    else
                    {
                        btnSubmit.Visible = false;
                    }
                }
            }
        }

        private string WordLimitScript(int wLimit)
        {

            return

                // Add filter to add or remove element before counting (see CKEDITOR.htmlParser.filter), Default value : null (no filter)

                "<script type='text/javascript'>" +

                "var editor = CKEDITOR.replace( 'CKEditor1', {" +
                "extraPlugins: 'wordcount,notification'" +
                "} );" +

                //"CKEDITOR.editorConfig = function( config ) {" +
                //"config.extraPlugins = 'wordcount,notification';" +
                //"};" +

                "config.wordcount = {" +
                "showParagraphs: true," +
                "showWordCount: true," +
                "showCharCount: false," +
                "countSpacesAsChars: false," +
                "countHTML: false," +
                "maxWordCount: " + wLimit + "," +
                "maxCharCount: -1," +
                "filter: new CKEDITOR.htmlParser.filter({" +
                "elements: {" +
                "div: function (element) {" +
                "if (element.attributes.class == 'mediaembed') {" +
                "return false;" +
                "}" +
                "}" +
                "}" +
                "})" +
                "};" +
                "</script>";

        }


        protected void btnSubmit_OnClick(object sender, EventArgs e)
        {
            var user = Page.User as CustomPrincipal;
            if (user != null)
            {
                var date = DateTime.Now;
                var submission = new Academic.DbEntities.ActivityAndResource.AssignmentItems.AssignmentSubmissions()
                {
                    Id = SubmissionId
                    ,
                    AssignmentId = AssignmentId
                    ,
                    UserClassId = UserClassId
                };
                if (pnlText.Visible)
                {
                    submission.SubmissionText = CKEditor1.Text;
                }

                if (SubmissionId > 0)
                {
                    submission.ModifiedDate = date;
                }
                else
                {
                    submission.SubmittedDate = date;
                }



                #region Files

                var list = new List<Academic.DbEntities.UserFile>();
                if (pnlFileSubmit.Visible)
                {
                    var files = FilesDisplay1.GetFiles();
                    if (files != null)
                    {
                        foreach (var f in files)
                        {
                            var fileName = Path.GetFileName(f.FilePath);
                            var fi = new Academic.DbEntities.UserFile()
                            {
                                Id = f.Id,
                                CreatedBy = user.Id
                                ,
                                CreatedDate = DateTime.Now
                                ,
                                DisplayName = f.FileDisplayName //Path.GetFileName(imageFile.FileName)
                                ,
                                FileDirectory = DbHelper.StaticValues.CourseFilesLocation //StaticValue.UserImageDirectory
                                ,
                                FileName = fileName
                                    //Guid.NewGuid().ToString() + GetExtension(imageFile.FileName, imageFile.ContentType)
                                ,
                                FileSizeInBytes = f.FileSizeInBytes //imageFile.ContentLength
                                ,
                                FileType = f.FileType //imageFile.ContentType
                                ,
                                IconPath = f.IconPath
                                    //,
                                    //SubjectId = SubjectId
                                ,
                                Void = !f.Visible

                            };
                            list.Add(fi);
                        }

                    }
                    //    var files = FilesDisplay1.GetFiles();

                    //    var filelist = new List<Academic.DbEntities.UserFile>();
                    //    //var files = FilesDisplay1.GetFiles();
                    //    if (files != null)
                    //    {
                    //        var sublist = new
                    //           List<Academic.DbEntities.ActivityAndResource.AssignmentItems.AssignmentSubmissionFiles>();

                    //        foreach (var f in files)
                    //        {
                    //            var subFile = new Academic.DbEntities.ActivityAndResource.AssignmentItems.AssignmentSubmissionFiles()
                    //            {
                    //                AssignmentSubmissionsId = SubmissionId
                    //               ,FileSubmittedDate = date
                    //            };
                    //            var fileName = Path.GetFileName(f.FilePath);
                    //            var fi = new Academic.DbEntities.UserFile()
                    //            {
                    //                CreatedBy = user.Id
                    //                ,
                    //                CreatedDate = date
                    //                ,
                    //                DisplayName = f.FileDisplayName //Path.GetFileName(imageFile.FileName)
                    //                ,
                    //                FileDirectory = DbHelper.StaticValues.CourseFilesLocation //StaticValue.UserImageDirectory
                    //                ,
                    //                FileName = fileName
                    //                    //Guid.NewGuid().ToString() + GetExtension(imageFile.FileName, imageFile.ContentType)
                    //                ,
                    //                FileSizeInBytes = f.FileSizeInBytes //imageFile.ContentLength
                    //                ,
                    //                FileType = f.FileType //imageFile.ContentType
                    //                ,
                    //                IconPath = f.IconPath
                    //                ,
                    //                Id = f.Id
                    //                ,
                    //                //SubjectId = SubjectId
                    //            };
                    //            filelist.Add(fi);
                    //        }
                    //    }


                }


                #endregion

                using (var helper = new DbHelper.Assignments())
                {
                    var saved = helper.AddOrUpdateAssignmentSubmission(submission, list);
                    if (saved != null)
                    {
                        Response.Redirect("~/Views/ActivityResource/Assignments/AssignmentView.aspx?SubId=" + SubjectId +
                                          "&arId=" + AssignmentId +
                                          "&secId=" + SectionId
                            );
                    }
                    else
                    {
                        lblError.Visible = true;
                    }
                }

            }
        }

        protected void CKEditor1_TextChanged(object sender, EventArgs e)
        {
            var html = CKEditor1.Text;
            var plainText = GetPlainText(html);
            if (plainText.Length >= WordLimit + 1)
            {
            }
        }

        string GetPlainText(string html)
        {
            if (String.IsNullOrEmpty(html)) return "";
            HtmlAgilityPack.HtmlDocument doc = new HtmlAgilityPack.HtmlDocument();
            doc.LoadHtml(html);
            return WebUtility.HtmlDecode(doc.DocumentNode.InnerText);
        }

        protected void btnCancel_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("~/Views/ActivityResource/Assignments/AssignmentView.aspx?SubId=" + SubjectId +
                                         "&arId=" + AssignmentId +
                                         "&secId=" + SectionId
                           );
        }
    }
}