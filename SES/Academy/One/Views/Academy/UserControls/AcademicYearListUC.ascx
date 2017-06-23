﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AcademicYearListUC.ascx.cs" Inherits="One.Views.Academy.UserControls.AcademicYearListUC" %>

<div class="list-item" runat="server" id="divBody">

    <%--<asp:Panel ID="pnlBody" runat="server" CssClass="auto-st1">--%>
    <div>
        <asp:HyperLink ID="lnkAcademicYearName" runat="server" CssClass="list-item-heading"></asp:HyperLink>
        <asp:Image ID="imgActive" runat="server"
            Width="10" Height="10"
            ImageUrl="~/Content/Icons/Stop/Stop_10px.png"
            Visible="False" />


        <span class="list-item-option">
            <asp:HyperLink ID="lnkEdit" runat="server" CssClass="link">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Content/Icons/Edit/edit_orange.png" />
            </asp:HyperLink>
            <asp:HyperLink ID="lnkDelete" runat="server" CssClass="link">
                <asp:Image ID="Image2" runat="server" ImageUrl="~/Content/Icons/delete/remove_icon_color.png" />
            </asp:HyperLink>
        </span>
        <%--<asp:Label ID="lblActiveIndicator" runat="server" Text=""></asp:Label>--%>
    </div>
    <div style="margin: 1px 5px 2px 20px;">
        <table>
            <tr>
                <td><strong>Start Date</strong></td>
                <td>
                    <asp:Label ID="lblStartDate" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td><strong>End Date</strong></td>
                <td>
                    <asp:Label ID="lblEndDate" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="vertical-align: top;"><strong>Sessions</strong></td>
                <td>
                    <asp:Label ID="lblTitleInSessionsList" runat="server" Text="" ForeColor="darkred"></asp:Label>
                    <asp:Panel ID="pnlSessionsList" runat="server"></asp:Panel>
                </td>
            </tr>
        </table>
    </div>
    <%--</asp:Panel>--%>
</div>
