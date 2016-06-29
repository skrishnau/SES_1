﻿<%@ Page Language="C#" MasterPageFile="~/ViewsSite/UserSite.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="One.Views.Course.List" %>
<%@ Register TagPrefix="uc1" TagName="LstUc" Src="~/ViewsSite/DashBoard/Student/CourseOverView/LstUc.ascx" %>

<asp:Content runat="server" ID="content1" ContentPlaceHolderID="Body">

    <div>
        <asp:Panel ID="Panel1" runat="server">
            <strong>Course List</strong>
            <div style="float: right;">
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">New Category</asp:LinkButton>
                &nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">New Course</asp:LinkButton>
            </div>
            <div style="float: right;">
            </div>
            <div style="float: right; width: 100%">
                <hr />
            </div>
        </asp:Panel>
        

    </div>
</asp:Content>


