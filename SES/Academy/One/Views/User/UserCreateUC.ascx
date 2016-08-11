﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserCreateUC.ascx.cs" Inherits="One.Views.User.UserCreateUC" %>
<%@ Register TagPrefix="uc1" TagName="ReqImageUC" Src="~/Views/UserControls/ReqImageUC.ascx" %>
<%@ Register Src="../UserControls/DateChooser.ascx" TagName="DateChooser" TagPrefix="uc2" %>
<div class="user-create">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <asp:Label ID="lblSaveStatus" runat="server" Text="Label" BackColor="#6666FF" Visible="False"></asp:Label>
                <asp:HiddenField ID="hidEditMode" runat="server" Value="New" />
                <asp:DropDownList ID="cmbRole" runat="server" Height="20px" Width="126px" Visible="false"></asp:DropDownList>
                <asp:HiddenField ID="hidSchoolId" runat="server" Value="0" />
            </div>
            <div style="float: none">
                <div style="float: none;">
                    <strong>General</strong>
                    <hr />
                    <table>

                        <tr>
                            <td>First Name*<uc1:ReqImageUC ID="ReqImageUC1" runat="server" />
                                <img src="~/Content/Icons/req.gif" alt="" />
                            </td>
                            <td>
                                <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                    ErrorMessage="Required"
                                    ControlToValidate="txtFirstName" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Middle Name</td>
                            <td>
                                <asp:TextBox ID="txtMidName" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Last Name</td>
                            <td>
                                <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                            </td>
                        </tr>

                        <tr>
                            <td>Username*<uc1:ReqImageUC ID="ReqImageUC5" runat="server" />
                            </td>
                            <td>
                                <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                                    ErrorMessage="Required"
                                    ControlToValidate="txtUserName" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Password*<uc1:ReqImageUC ID="ReqImageUC3" runat="server" />
                            </td>
                            <td>
                                <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                                    ErrorMessage="Required"
                                    ControlToValidate="txtPassword" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Email*<uc1:ReqImageUC ID="ReqImageUC2" runat="server" />
                            </td>
                            <td>
                                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                    ErrorMessage="Required"
                                    ControlToValidate="txtEmail" ForeColor="#FF3300"></asp:RequiredFieldValidator>

                            </td>
                        </tr>
                        <tr>
                            <td>Email Display</td>
                            <td>
                                <asp:DropDownList ID="cmbEmailDisplay" runat="server" Height="20px" Width="132px"></asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>Phone</td>
                            <td>
                                <asp:TextBox ID="txtPhone1" runat="server"></asp:TextBox>
                            </td>
                        </tr>

                        <tr>
                            <td>Description</td>
                            <td>
                                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Height="98px"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <br />
                </div>
                <div>
                    <strong>Image</strong>
                    <hr />

                    <a href="#">
                        <img src="~/Images/user.png" style="width: 57px" /><br />
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </a>
                </div>
                <br />
                <div class="user-optional">
                    <strong>Interest</strong>
                    <hr />
                    <div style="margin: 0 5px 0 20px;">
                        <div >
                            <div style="float: left">
                                List of Interest
                            </div>
                            <div style="float: left">
                                <asp:Panel ID="pnlInterest" runat="server"></asp:Panel>
                            </div>
                            <div style="clear: both"></div>
                        </div>
                        <asp:TextBox ID="txtInterest" runat="server" OnTextChanged="txtInterest_TextChanged"></asp:TextBox>
                    </div>
                </div>
                <br />
                <div>
                    <strong>Optional</strong>
                    <hr />
                    <table>

                        <tr>
                            <td>Gender</td>
                            <td>
                                <asp:DropDownList ID="cmbGender" runat="server" Height="20px" Width="120px"></asp:DropDownList>

                            </td>
                        </tr>
                        <tr>
                            <td>DOB</td>
                            <td>
                                <uc2:DateChooser ID="DateChooser1" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>Country</td>
                            <td>
                                <asp:TextBox ID="txtCountry" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>City</td>
                            <td>
                                <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Street</td>
                            <td>
                                <asp:TextBox ID="txtStreet" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </div>



            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div>
        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
    </div>
</div>
