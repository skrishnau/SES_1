﻿<%@ Page Language="C#" MasterPageFile="~/ViewsSite/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="One.Views.Student.Default" %>


<%@ Register Src="~/Views/Student/Batch/List/listUc.ascx" TagPrefix="uc1" TagName="listUc" %>

<%@ Register Src="~/Views/All_Resusable_Codes/SiteMaps/SiteMapUc.ascx" TagPrefix="uc1" TagName="SiteMapUc" %>
<asp:Content runat="server" ID="content3" ContentPlaceHolderID="SiteMapPlace">
    <uc1:SiteMapUc runat="server" ID="SiteMapUc" />
</asp:Content>

<asp:Content runat="server" ID="content1" ContentPlaceHolderID="Body">
    <div>
        <h3 class="heading-of-listing">Batches
        <%--<span class="list-heading-option">
            <asp:HyperLink ID="lnkAdd" runat="server"
                NavigateUrl="~/Views/Student/Batch/Create/BatchCreate.aspx" Visible="False">
                <asp:Image ID="Image2" runat="server" ImageUrl="~/Content/Icons/Add/Add-icon.png" />
                New Batch
            </asp:HyperLink>
        </span>--%>
        </h3>
    </div>

    <hr />
    <%--<div style="text-align: right;">
        <asp:HyperLink ID="lnkEdit" runat="server" >
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Content/Icons/Edit/edit_orange.png" />
            <asp:Label ID="lblEdit" runat="server" Text="Edit"></asp:Label>
        </asp:HyperLink>
    </div>--%>

    <%-- <div>
        
    </div>--%>
    <div>
        <uc1:listUc runat="server" ID="listUc" />
    </div>
</asp:Content>

<asp:Content runat="server" ID="Content2" ContentPlaceHolderID="head">
</asp:Content>

<asp:Content runat="server" ID="titleContnet" ContentPlaceHolderID="title">
    Batch list
</asp:Content>

