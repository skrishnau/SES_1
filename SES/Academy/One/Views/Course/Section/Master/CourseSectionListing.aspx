﻿<%@ Page Language="C#" MasterPageFile="~/ViewsSite/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="CourseSectionListing.aspx.cs" Inherits="One.Views.Course.Section.Master.CourseSectionListing" %>

<%--<%@ Register Src="~/Views/Course/Display/EachCourse/CourseDetailUc.ascx" TagPrefix="uc1" TagName="CourseDetailUc" %>--%>
<%--<%@ Register Src="~/Views/Course/ActivityAndResource/ActResChoose/ActResChooseUc.ascx" TagPrefix="uc1" TagName="ActResChooseUc" %>--%>
<%--<%@ Register Src="~/Views/Course/Section/CreateSectionUc.ascx" TagPrefix="uc1" TagName="CreateSectionUc" %>--%>
<%--<%@ Register Src="~/Views/Course/Section/Master/ListOfSectionsInCourseUC.ascx" TagPrefix="uc1" TagName="ListOfSectionsInCourseUC" %>--%>


<asp:Content runat="server" ID="contentHead" ContentPlaceHolderID="head">
    <%--<link href="../../../../Content/themes/base/jquery.ui.dialog.css" rel="stylesheet" />--%>
    <%--<script src="../../../../Scripts/jquery-1.7.1.min.js"></script>--%>
   
    <%--<link rel="stylesheet" href="../../../../Remodal/dist/remodal.css">
    <link rel="stylesheet" href="../../../../Remodal/dist/remodal-default-theme.css">--%>
    
    <%--<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/start/jquery-ui.css"
        rel="stylesheet" type="text/css" />
    --%>
    
    <%--<script type="text/javascript" src="../../../../AjaxAspNetJquery/jquery-ui-1.12.0.custom/jquery-ui.min.js"></script>
    <script src="../../../../AjaxAspNetJquery/jquery-ui-1.12.0.custom/jquery-ui.js" type="text/javascript"></script>
    <link href="../../../../AjaxAspNetJquery/jquery-ui-1.12.0.custom/jquery-ui.css" rel="stylesheet"  type="text/css"/>--%>

</asp:Content>

<asp:Content runat="server" ID="content1" ContentPlaceHolderID="Body">
    
   <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div style="font-size: 1.3em; font-weight: 700; text-align: center; color: lightsalmon;">
                <asp:Literal ID="txtSubjectName" runat="server"></asp:Literal>
                <hr />
            </div>
            <div style="text-align: right; margin-right: 15px;">
                <asp:HyperLink ID="lnkEdit"
                    runat="server"> <asp:Image ID="ImageButton1" runat="server"
                        ImageUrl="~/Content/Icons/Edit/edit_orange.png" /><asp:Literal ID="lblEdit" runat="server"></asp:Literal></asp:HyperLink>
            </div>
            <uc1:ListOfSectionsInCourseUC runat="server" ID="ListOfSectionsInCourseUC1" />
            <asp:Panel ID="Panel1" runat="server" Visible="False">
            </asp:Panel>

        </ContentTemplate>
    </asp:UpdatePanel>
    <br />--%>
</asp:Content>
