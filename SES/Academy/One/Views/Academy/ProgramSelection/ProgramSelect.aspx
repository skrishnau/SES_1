﻿<%@ Page Language="C#" MasterPageFile="~/ViewsSite/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="ProgramSelect.aspx.cs" Inherits="One.Views.Academy.ProgramSelection.ProgramSelect" %>

<%@ Register Src="~/Views/Academy/ProgramSelection/BatchSelect.ascx" TagPrefix="uc1" TagName="BatchSelect" %>



<asp:Content runat="server" ID="content1" ContentPlaceHolderID="Body">
    <div>
        Program Selections
    </div>

    <div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table style="width: 100%; margin: 2px 5px;">
                    <tr>
                        <td class="inner-row-width">
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <asp:Panel ID="pnlProgramListing" runat="server"></asp:Panel>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>


                        <td class="inner-row-width">
                            <asp:Panel ID="pnlBatchSelect" runat="server" Visible="False">

                                <strong>
                                    <asp:Label runat="server" ID="lblBatchSelectionHeading" Text=""></asp:Label>
                                </strong>

                                <uc1:BatchSelect runat="server" ID="BatchSelect" />
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div>
        <asp:Button ID="btnSave" CausesValidation="False" runat="server" Text="Save" OnClick="btnSave_Click" Width="73px" />
        &nbsp;
        <asp:Button ID="btnCancel" CausesValidation="False" runat="server" Text="Cancel" OnClick="btnCancel_Click" Width="73px" />
        &nbsp;
        <asp:Button ID="btnReset" CausesValidation="False" runat="server" Text="Reset" Width="73px" OnClick="btnReset_Click" />

        <asp:HiddenField ID="hidAcademicYearId" runat="server" Value="0" />
        <asp:HiddenField ID="hidSessionId" runat="server" Value="0" />
    </div>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .inner-row-width {
            width: 50%;
            vertical-align: top;
        }
    </style>
</asp:Content>

