﻿<%@ Page Language="C#" MasterPageFile="~/ViewsSite/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="One.Views.Academy.Default" %>


<%@ Register Src="~/Views/All_Resusable_Codes/SiteMaps/SiteMapUc.ascx" TagPrefix="uc1" TagName="SiteMapUc" %>
<asp:Content runat="server" ID="content3" ContentPlaceHolderID="SiteMapPlace">
    <uc1:SiteMapUc runat="server" ID="SiteMapUc" />
</asp:Content>



<asp:Content runat="server" ID="content1" ContentPlaceHolderID="Body">
    <h3 class="heading-of-listing">Academic years
    </h3>

    <%-- class="menu" style="clear: both; margin: 20px 5px; padding: 10px;" --------------Menu------------- --%>
    <div>
        <%-- style="float: right;"  class="option-div"  --%>
        <div class="text-right">
            <span runat="server" id="pnlOtherEdits" visible="False">
                <%--  CssClass="link-dark" --%>
                <asp:HyperLink ID="lnkAdd" runat="server" CssClass="btn btn-default"
                    NavigateUrl="~/Views/Academy/Create.aspx">
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Content/Icons/Add/Add-icon.png" />
                    New Academic Year
                </asp:HyperLink>
                &nbsp;
                <asp:HyperLink ID="lnkStartSession" runat="server" CssClass="btn btn-default"
                    NavigateUrl="~/Views/Academy/StartSession.aspx">
                    <asp:Image ID="Image3" runat="server" ImageUrl="~/Content/Icons/Sort/sort-right-14px.png" Width="14" Height="14" />
                    Start Session
                </asp:HyperLink>
                <%-- "~/Content/Icons/Start/Start_16px.png" --%>
            </span>
            &nbsp;
            <asp:HyperLink ID="lnkBatchList" runat="server" CssClass="btn btn-default"
                NavigateUrl="~/Views/Student/Batch/Default.aspx">
                <asp:Image ID="Image4" runat="server" ImageUrl="~/Content/Icons/List/transaction-list-16px.png" Width="14" Height="14" />
                Batch List
            </asp:HyperLink>
        </div>
    </div>
    <%-- ------------END of Menu --%>

    <%-- <div>
        <asp:DataPager ID="DataPager1" runat="server" >
            <Fields>
                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
            </Fields>
        </asp:DataPager>
    </div>--%>
    <br />
    <%-- style="border-bottom: 1px solid lightgrey; border-top: 1px solid lightgrey; margin-top: 10px;" --%>
    <div class="well-sm well">
        <div style="float: left;">
            <asp:HyperLink ID="lnkPrevious" runat="server" CssClass="list-item-heading">
                <asp:Image ID="Image1" Height="10" Width="10"
                    ImageUrl="~/Content/Icons/Arrow/arrow_left.png"
                    runat="server" />
                Previous
            </asp:HyperLink>
        </div>
        <div style="float: right;">
            <asp:HyperLink ID="lnkNext" runat="server" CssClass="list-item-heading">
                Next
             <asp:Image ID="Image5" Height="10" Width="10"
                 ImageUrl="~/Content/Icons/Arrow/arrow_right.png"
                 runat="server" />
            </asp:HyperLink>
        </div>
        <div style="clear: both;"></div>
    </div>
    <div style="margin-top: 10px;">
        <asp:Panel ID="pnlAcademicYearListing" runat="server"></asp:Panel>
    </div>



    <asp:HiddenField ID="hidEdit" runat="server" Value="False" />

</asp:Content>


<asp:Content runat="server" ID="Content2" ContentPlaceHolderID="head">
    <link href="../../Content/CSSes/TableStyles.css" rel="stylesheet" />
</asp:Content>


<asp:Content runat="server" ID="contnettitle" ContentPlaceHolderID="title">
    Academic year list
</asp:Content>
