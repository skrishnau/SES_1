﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListLevelUC.ascx.cs" Inherits="One.Views.Structure.All.UserControls.ListLevelUC" %>
<%-- lightblue --%>
<div runat="server" id="panel" style="margin: 20px 3px 20px 0;  padding: 5px 5px 10px 10px; background-color: #ccccff; ">
    <div class="block" style="font-weight: 600;font-size: 1.1em">
        <asp:HyperLink ID="lblName" runat="server">
                Name
        </asp:HyperLink>
    </div>

    <%--<asp:Label ID="lblName" runat="server" Text="Label"></asp:Label>--%>
    <asp:HiddenField ID="hidStructureId" Value="0" runat="server" />
    <asp:HiddenField ID="hidStructureType" Value="0" runat="server" />

    <div style="margin-left: 25px; border-left: solid lightgray 1px; background-color: #ddddff">
        <asp:PlaceHolder ID="pnlSubControls" runat="server"></asp:PlaceHolder>
    </div>

</div>
<hr />