﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ClassGradeDisplayUc.ascx.cs" Inherits="One.Views.ActivityResource.Grading.ClassGradeDisplayUc" %>

<style type="text/css">
    .bold-row {
        font-weight: bold;
        padding: 10px 0 10px;
    }
</style>
<div class="data-entry-section-body" style="border: 1px solid darkgrey; padding: 5px;">
    <div class="data-entry-section-heading" style="background-color: darkslategray; color: white; padding-left: 5px;">
        <asp:Label ID="lblClassName" runat="server" Text="Label"></asp:Label>
        <hr />
    </div>
    <div>
        <table style="width: 98%; border-collapse: collapse;">
            <thead>
                <tr runat="server" id="headingRow">
                    <td class="bold-row">
                        <asp:Label ID="Label1" runat="server" Text="Image"></asp:Label>
                    </td>
                    <td class="bold-row">
                        <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label>
                    </td>
                    <td class="bold-row">
                        <asp:Label ID="lblUserName" runat="server" Text="Username"></asp:Label>
                    </td>
                    <td class="bold-row">
                        <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                    </td>
                    <td class="bold-row">
                        <asp:Label ID="lblSubmissionStatus" runat="server" Text="Submission status"></asp:Label>
                    </td>
                    <td class="bold-row">
                        <asp:Label ID="lblGrade" runat="server" Text="Grade"></asp:Label>
                    </td>
                </tr>
            </thead>

            <tbody>
                <asp:Panel ID="pnlUsers" runat="server"></asp:Panel>
            </tbody>
        </table>
        <asp:Panel ID="pnlOtherControls" runat="server"></asp:Panel>

    </div>
</div>