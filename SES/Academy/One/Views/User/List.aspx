﻿<%@ Page Language="C#" MasterPageFile="~/ViewsSite/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="One.Views.User.List" %>

<%@ Register Src="~/Views/All_Resusable_Codes/SiteMaps/SiteMapUc.ascx" TagPrefix="uc1" TagName="SiteMapUc" %>
<asp:Content runat="server" ID="content3" ContentPlaceHolderID="SiteMapPlace">
    <uc1:SiteMapUc runat="server" ID="SiteMapUc" />
</asp:Content>


<asp:Content runat="server" ID="content" ContentPlaceHolderID="Body">
    <h3 class="heading-of-listing">Users
    </h3>
    <%-- option-div --%>
    <div class="text-right" style="margin-bottom: 15px;">
        <%-- link-dark --%>
        <asp:HyperLink runat="server" ID="lnkAddNewUser" NavigateUrl="~/Views/User/Create.aspx"
            CssClass="btn btn-default">
                Add New User
        </asp:HyperLink>

        <asp:HyperLink runat="server" ID="lnkAssignRole" NavigateUrl="~/Views/Role/Assign.aspx"
            CssClass="btn btn-default">
                Assign Role
        </asp:HyperLink>
    </div>


    <div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <div class="panel-title">
                    <asp:LinkButton ID="lnkFilterPanel" runat="server" OnClick="lnkFilterPanel_OnClick"
                        CssClass="link">
                        <asp:Image ID="imgFilter" runat="server" 
                            ImageUrl="~/Content/Icons/Sort/sort-right-20px.png" />
                        Filter
                    </asp:LinkButton>
                </div>
            </div>
            <asp:Panel ID="pnlFilter" runat="server" Visible="False" CssClass="panel-body">
                <div style="float: left;">
                    <table class="">
                        <tr>
                            <td>Name</td>
                            <td>
                                <asp:TextBox ID="txtNameFilter" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Username</td>
                            <td>
                                <asp:TextBox ID="txtUsernameFilter" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td>
                                <asp:TextBox ID="txtEmailFilter" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                </div>

                <div style="float: left; padding-left: 15px;">
                    <div>
                        Roles:
                        &nbsp;
                            <asp:CheckBox ID="chkStudents" runat="server" Text="Students" Checked="True" />
                        &nbsp;&nbsp;&nbsp;
                            <asp:CheckBox ID="chkTeachers" runat="server" Text="Teachers" Checked="True" />
                    </div>
                    <br />
                    <div style="margin-top: -1px;">
                        <%-- link-button --%>
                        <asp:LinkButton ID="btnFilter"
                            CssClass="btn btn-default"
                            runat="server" Text="Filter" OnClick="btnFilter_OnClick" />
                    </div>
                </div>

                <div style="clear: both;"></div>

                <div>

                    <div style="clear: both;"></div>
                </div>
            </asp:Panel>
        </div>

        <div style="clear: both;"></div>
    </div>
    <br />

    <div style="margin-top: 10px" class="panel panel-default">
        <%-- CssClass="gridview" --%>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" PageSize="25" Width="100%" 
            CssClass="table table-hover table-responsive border"
            AutoGenerateColumns="False" DataSourceID="ObjectDataSource1"
            OnRowDataBound="GridView1_OnRowDataBound"
            OnSelectedIndexChanged="GridView1_OnSelectedIndexChanged"
            CellPadding="4" ForeColor="#333333" GridLines="None" EmptyDataText="No users">

            <%--<AlternatingRowStyle BackColor="White" ForeColor="#284775" />--%>
            

            <Columns>
                
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" Visible="False" />

                <asp:TemplateField HeaderText="Image">
                    <EditItemTemplate>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server"
                            NavigateUrl='<%#  GetImageUrl(DataBinder.Eval(Container.DataItem,"UserImageId")) %>'>
                            <asp:Image ID="Image1" runat="server"
                                Height="20" Width="20"
                                ImageUrl='<%#  GetImageUrl(DataBinder.Eval(Container.DataItem,"UserImageId")) %>' />
                        </asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle Width="25"></ItemStyle>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:HyperLink ID="Label1" runat="server"
                            
                            NavigateUrl='<%# "~/Views/User/Detail.aspx?uId="+Eval("Id") %>'
                            Text='<%# GetName(Eval("FirstName"),Eval("MiddleName"),Eval("LastName"))  %>'></asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle Width="150"></ItemStyle>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Username" SortExpression="UserName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("UserName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="100"></ItemStyle>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Email" SortExpression="Email">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="150"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Phone" SortExpression="Phone">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Phone") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="90"></ItemStyle>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Online" SortExpression="Online">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("LastOnline") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <span style="font-size: 0.9em">
                            <asp:Label ID="Label8" runat="server" Text='<%# GetLastOnline(DataBinder.Eval(Container.DataItem,"LastOnline"))  %>'></asp:Label>
                        </span>
                    </ItemTemplate>
                    <ItemStyle Width="80"></ItemStyle>
                </asp:TemplateField>

            </Columns>

            <%--<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />--%>

            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <%--  BackColor="#557d96" Font-Bold="True" ForeColor="White" --%>
            <HeaderStyle CssClass="data-list-header thead-default" />
            <%--<HeaderStyle CssClass="thead-default" />--%>
            

            <PagerStyle HorizontalAlign="Center" CssClass="data-list-footer" />
            <%--<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />--%>
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />

        </asp:GridView>

        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="ListAllUsers"
            TypeName="Academic.DbHelper.DbHelper+User">
            <SelectParameters>
                <asp:ControlParameter ControlID="hidSchoolId" DefaultValue="0" Name="schoolId" PropertyName="Value" Type="Int32" />
                <asp:ControlParameter ControlID="hidPerPage" DefaultValue="0" Name="perPage" PropertyName="Value" Type="Int32" />
                <asp:ControlParameter ControlID="hidPageNo" DefaultValue="0" Name="pageNo" PropertyName="Value" Type="Int32" />
                <asp:ControlParameter ControlID="txtNameFilter" DefaultValue="" Name="filterName" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtUsernameFilter" DefaultValue="" Name="filterUsername" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtEmailFilter" DefaultValue="" Name="filteremail" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="chkStudents" DefaultValue="False" Name="selectStudents" PropertyName="Checked" Type="Boolean" />
                <asp:ControlParameter ControlID="chkTeachers" DefaultValue="True" Name="selectTeachers" PropertyName="Checked" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>

    </div>

    <asp:HiddenField ID="hidPerPage" runat="server" Value="0" />
    <asp:HiddenField ID="hidPageNo" runat="server" Value="0" />

    <asp:HiddenField ID="hidSchoolId" runat="server" Value="0" />

    <br />
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .auto-style1 {
            width: 99px;
        }

        .auto-style2 {
            width: 65px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="title">
    Users
</asp:Content>
