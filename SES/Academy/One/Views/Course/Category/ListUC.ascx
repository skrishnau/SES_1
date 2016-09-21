﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListUC.ascx.cs" Inherits="One.Views.Course.Category.ListUC" %>

<%--   --%>
<%--<div style="margin-left: 8px; width: 800px;">--%>
    <asp:Panel ID="pnlName" runat="server" CssClass="block" EnableViewState="True">
        <%--<asp:Label ID="lblName" runat="server" Text="CategoryName"></asp:Label>--%>
    </asp:Panel>
    <span class="category-text" style="font-size: 1.2em; margin: 2px; word-wrap: normal; display: block; background-color: white; padding: 5px 5px 5px 1px;">
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
        <asp:LinkButton ID="lblName"  runat="server" OnClick="lblName_Click">name</asp:LinkButton>
    </span>
    <asp:HiddenField ID="hidCategoryId" Value="0" runat="server" />
    <asp:PlaceHolder ID="pnlSubCategories" runat="server"></asp:PlaceHolder>
<%--</div>--%>
<style type="text/css">
    .category-text {
        display: block;
        overflow: auto;
    }
</style>

