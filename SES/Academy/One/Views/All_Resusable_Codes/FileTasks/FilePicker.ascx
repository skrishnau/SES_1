﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FilePicker.ascx.cs" Inherits="One.Views.All_Resusable_Codes.FileTasks.FilePicker" %>
<%@ Register Src="~/Views/All_Resusable_Codes/FileTasks/FileUploadUc.ascx" TagPrefix="uc1" TagName="FileUploadUc" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<div>
    <table style="width: 100%;">
        <tr>
            <%-- ========Left panel --%>
            <td style="width: 300px; margin-bottom: 20px; text-align: left;" runat="server" ID="leftPanel">
                <span style="padding: 5px; display: block;">
                    <asp:LinkButton ID="lnkServerFiles"
                        CausesValidation="False"
                        Enabled="False" runat="server" CssClass="inline-block" OnClick="options_Click">Server files</asp:LinkButton>
                </span>
                <span style="padding: 5px; display: block;">
                    <asp:LinkButton ID="lnkUploadFile"
                        CausesValidation="False"
                        runat="server" CssClass="inline-block" OnClick="options_Click">Upload file</asp:LinkButton>
                </span>
                <span style="padding: 5px; display: block;">
                    <asp:LinkButton ID="lnkPrivateFiles"
                        CausesValidation="False"
                        Enabled="False" runat="server" CssClass="inline-block" OnClick="options_Click">Private files</asp:LinkButton>
                </span>
            </td>

            <%-- ============== Body ========= --%>
            <td>
                <asp:Panel ID="pnlBody" runat="server"></asp:Panel>
                <div runat="server" id="pnlUpload" clientidmode="Static"
                    style="text-align: center; overflow-x: auto; vertical-align: central;">
                    <ajaxToolkit:AsyncFileUpload ID="file_upload" runat="server"
                         
                        OnUploadedComplete="file_upload_UploadedComplete" />

                    <%--OnClientUploadError="" OnClientUploadStarted="AssemblyFileUpload_Started"--%>
                    <br />
                    <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click"
                        CausesValidation="False" ValidationGroup="filepicker"
                        Width="93px" />
                    &nbsp; &nbsp;
                    <br />
                    <asp:Label ID="lblMessage" runat="server" Text="Error! Please reload the page." ForeColor="red" Visible="False"></asp:Label>
                    <asp:HiddenField ID="hdnFileFolder" runat="server" Value="" />
                </div>
                <%--<uc1:FileUploadUc runat="server" ID="FileUploadUc" Visible="False"/>--%>
            </td>
        </tr>
    </table>
    <asp:HiddenField ID="hidPageKey" runat="server" Value="0" />
    <asp:HiddenField ID="hidLocalId" runat="server" Value="1" />
    <asp:HiddenField ID="hidFileSaveDirectory" runat="server" Value="" />
    <asp:HiddenField ID="hidFileAcquireMode" runat="server" Value="Multiple" />
    <asp:HiddenField ID="hidFileType" runat="server" Value="All" />
    <asp:HiddenField ID="hidFileExtension" runat="server" Value="All" />
</div>
