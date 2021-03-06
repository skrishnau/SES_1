﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SchoolTypeUC.ascx.cs" Inherits="One.Views.Office.School.SchoolTypeUC" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>


        <div id="ucDiv" runat="server">
            <fieldset>
                <legend>Add School Type
                    <asp:TextBox ID="txtId" runat="server" Width="16px" Visible="False"></asp:TextBox>
                    <%--<asp:TextBox ID="txtInstId" runat="server" Enabled="False" Visible="False" Width="16px"></asp:TextBox>--%>
                </legend>
                <table>
                    <tr>
                        <td>&nbsp;Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                        <td>
                            <asp:TextBox ID="txtSchoolTypeName" runat="server"></asp:TextBox>
                            <asp:Label ID="lblVali" runat="server" Text="Name is required" ForeColor="#FF3300" Visible="False"></asp:Label>

                        </td>
                    </tr>
                </table>
              
                <asp:PlaceHolder ID="PlaceHolder1" runat="server" Visible="True">
                    &nbsp; 
                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" Visible="True" />
                    &nbsp; &nbsp;
                 <asp:Button ID="btnClose" runat="server" Text="Cancel" OnClick="btnClose_Click" Visible="True" />
                    &nbsp;&nbsp;
                </asp:PlaceHolder>

            </fieldset>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
