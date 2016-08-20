﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StudentListUC.ascx.cs" Inherits="One.Views.Student.Batch.StudentDisplay.Students.StudentList.StudentListUC" %>


<div>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">

        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />

        <Columns>
            <%--<asp:BoundField DataField="EmailDisplay" HeaderText="EmailDisplay" SortExpression="EmailDisplay" Visible="False" />--%>
            <%--<asp:BoundField DataField="City" HeaderText="City" SortExpression="City" Visible="False" />--%>
            <%--<asp:BoundField DataField="EmailDisplay" HeaderText="EmailDisplay" SortExpression="EmailDisplay" />--%>
            <%--<asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" Visible="False" />--%>
            <%--<asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" Visible="False" />--%>
            <%--<asp:CheckBoxField DataField="IsActive" HeaderText="IsActive" SortExpression="IsActive" Visible="False" />--%>
            <%--<asp:CheckBoxField DataField="IsDeleted" HeaderText="IsDeleted" SortExpression="IsDeleted" Visible="False" />--%>
            <%--<asp:BoundField DataField="GenderId" HeaderText="GenderId" SortExpression="GenderId" Visible="False" />--%>
            <%--<asp:BoundField DataField="SchoolId" HeaderText="SchoolId" SortExpression="SchoolId" />--%>
            <%--<asp:BoundField DataField="ImageType" HeaderText="ImageType" SortExpression="ImageType" />--%>
            <%--<asp:BoundField DataField="CreatedDate" HeaderText="CreatedDate" SortExpression="CreatedDate" />--%>
            <%--<asp:BoundField DataField="FullName" HeaderText="FullName" ReadOnly="True" SortExpression="FullName" />--%>
            <%--<asp:BoundField DataField="SecurityQuestion" HeaderText="SecurityQuestion" SortExpression="SecurityQuestion" />--%>
            <%--<asp:BoundField DataField="SecurityAnswer" HeaderText="SecurityAnswer" SortExpression="SecurityAnswer" />--%>
            <%--<asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />--%>
            <%--<asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />--%>
            <%--<asp:CheckBoxField DataField="IsActive" HeaderText="IsActive" SortExpression="IsActive" />--%>
            <%--<asp:CheckBoxField DataField="IsDeleted" HeaderText="IsDeleted" SortExpression="IsDeleted" />--%>
            <%--<asp:BoundField DataField="GenderId" HeaderText="GenderId" SortExpression="GenderId" />--%>
            <%--<asp:BoundField DataField="SchoolId" HeaderText="SchoolId" SortExpression="SchoolId" />--%>
            <%--<asp:BoundField DataField="ImageType" HeaderText="ImageType" SortExpression="ImageType" />--%>
            <%--<asp:BoundField DataField="CreatedDate" HeaderText="CreatedDate" SortExpression="CreatedDate" />--%>
            <%--<asp:BoundField DataField="FullName" HeaderText="FullName" ReadOnly="True" SortExpression="FullName" />--%>
            <%--<asp:BoundField DataField="SecurityQuestion" HeaderText="SecurityQuestion" SortExpression="SecurityQuestion" />--%>
            <%--<asp:BoundField DataField="SecurityAnswer" HeaderText="SecurityAnswer" SortExpression="SecurityAnswer" />--%>
            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" Visible="False" />

            <asp:TemplateField HeaderText="Image">
                <EditItemTemplate>

                    <%--<asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("LastOnline") %>'></asp:TextBox>--%>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#  GetImageUrl(DataBinder.Eval(Container.DataItem,"UserImageId")) %>'>
                        <asp:Image ID="Image1" runat="server"
                            Height="20" Width="20"
                            ImageUrl='<%#  GetImageUrl(DataBinder.Eval(Container.DataItem,"UserImageId")) %>' />
                    </asp:HyperLink>
                    <%--<asp:Label ID="Label8" runat="server" Text='<%# Bind("LastOnline") %>'></asp:Label>--%>
                </ItemTemplate>
                <ItemStyle Width="30"></ItemStyle>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="FirstName" SortExpression="FirstName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="100"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="LastName" SortExpression="LastName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("LastName") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("LastName") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="100"></ItemStyle>
            </asp:TemplateField>
            <%-- <asp:TemplateField HeaderText="UserName" SortExpression="UserName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("UserName") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="100"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Password" SortExpression="Password">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Password") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Password") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="100"></ItemStyle>
            </asp:TemplateField>--%>
            <asp:TemplateField HeaderText="Email" SortExpression="Email">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="100"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Phone" SortExpression="Phone">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Phone") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="100"></ItemStyle>
            </asp:TemplateField>
            <%--<asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />--%>
            <asp:TemplateField HeaderText="Country" SortExpression="Country">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Country") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Country") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle></ItemStyle>
                <ItemStyle Width="100"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="LastOnline" SortExpression="LastOnline">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("LastOnline") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <span style="font-size: 0.8em">
                        <asp:Label ID="Label8" runat="server" Text='<%# GetLastOnline(DataBinder.Eval(Container.DataItem,"LastOnline"))  %>'></asp:Label>
                    </span>
                </ItemTemplate>
                <ItemStyle Width="50"></ItemStyle>
            </asp:TemplateField>

        </Columns>

        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />

    </asp:GridView>

    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetStudentsOfProgramBatch_AsUser" TypeName="Academic.DbHelper.DbHelper+Batch">
        <SelectParameters>
            <asp:ControlParameter ControlID="hidProgramBatchId" DefaultValue="0" Name="programBatchId" PropertyName="Value" Type="Int32" />
            <%--<asp:ControlParameter ControlID="hidPerPage" DefaultValue="0" Name="perPage" PropertyName="Value" Type="Int32" />--%>
            <%--<asp:ControlParameter ControlID="hidPageNo" DefaultValue="0" Name="pageNo" PropertyName="Value" Type="Int32" />--%>
        </SelectParameters>
    </asp:ObjectDataSource>



    <asp:HiddenField ID="hidPageNo" runat="server" Value="1" />
    <asp:HiddenField ID="hidPerPage" runat="server" Value="100" />
    <%--<asp:HiddenField ID="hidSchoolId" runat="server" Value="0" />--%>
    <asp:HiddenField ID="hidProgramBatchId" runat="server" Value="0" />



    <hr />

    <br />
    <hr />



    <div>
        data list start

        <asp:DataList ID="DataList1" Width="100%" runat="server" DataSourceID="StudentsOfProgramBatch_DataSource">
            <ItemTemplate>

                <%--<asp:HiddenField ID="hidUserId" runat="server" Value='<%# Eval("UserId") %>' />--%>
                <div style="margin: 0 25px 0; border: 1px solid grey; width: 100%;">
                    <div style="border: 2px solid lightgray; width: 30px; height: 30px; float: left; margin: 5px; padding: 2px;">
                        <%--<asp:ImageButton ID="ImageButton1" runat="server" Height="36px" Width="36px" AlternateText="Lost" />--%>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#  Eval("ImageUrl") %>'>
                            <asp:Image ID="Image1" runat="server"
                                Height="24" Width="24"
                                ImageUrl='<%# Eval("ImageUrl")  %>' />
                            <%-- GetImageUrl(DataBinder.Eval(Container.DataItem,"UserImageId")) --%>
                        </asp:HyperLink>
                    </div>
                    <div style="margin-left: 20px; float: left;">
                        <asp:HiddenField ID="StudentIdLabel" runat="server" Value='<%# Eval("StudentId") %>' />
                        <strong>
                            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                            <br />
                        </strong>

                        CRN:
                        <asp:Label ID="CRNLabel" runat="server" Text='<%# Eval("CRN") %>' />
                        <br />
                    </div>

                    <div style="float: left; margin-left: 20px;">
                        Email:
            <%--<asp:Label ID="Label2" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "User.Email") %>' />--%>

                        <asp:Label ID="UserLabel" runat="server" Text='<%# Eval("Email") %>' />
                        <br />
                        Phone:
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Phone") %>' />
                        <br />
                    </div>
                    <div style="clear: both;"></div>
                    <asp:HiddenField ID="UserIdLabel" runat="server" Value='<%# Eval("UserId") %>' />
                    <%--<asp:HiddenField ID="BatchAssignedLabel" runat="server" Value='<%# Eval("BatchAssigned") %>' />--%>
                    <%-- ExamRollNoGlobal:
            <asp:Label ID="ExamRollNoGlobalLabel" runat="server" Text='<%# Eval("ExamRollNoGlobal") %>' />
            <br />--%>
                    <%-- UserId:
            <asp:Label ID="UserIdLabel" runat="server" Text='<%# Eval("UserId") %>' />
            <br />--%>

                    <%--  GuardianName:
            <asp:Label ID="GuardianNameLabel" runat="server" Text='<%# Eval("GuardianName") %>' />
            <br />
            GuardianEmail:
            <asp:Label ID="GuardianEmailLabel" runat="server" Text='<%# Eval("GuardianEmail") %>' />
            <br />
            GuardianContactNo:
            <asp:Label ID="GuardianContactNoLabel" runat="server" Text='<%# Eval("GuardianContactNo") %>' />
            <br />--%>

                    <%-- StudentGroupStudents:
            <asp:Label ID="StudentGroupStudentsLabel" runat="server" Text='<%# Eval("StudentGroupStudents") %>' />
            <br />
            Void:
            <asp:Label ID="VoidLabel" runat="server" Text='<%# Eval("Void") %>' />
            <br />
            AssignedDate:
            <asp:Label ID="AssignedDateLabel" runat="server" Text='<%# Eval("AssignedDate") %>' />
            <br />--%>

                    <%--BatchAssigned:
            <asp:Label ID="BatchAssignedLabel" runat="server" Text='<%# Eval("BatchAssigned") %>' />
            <br />--%>
                    <%--<br />--%>
                </div>
            </ItemTemplate>

        </asp:DataList>
        <asp:ObjectDataSource ID="StudentsOfProgramBatch_DataSource" runat="server" SelectMethod="ListStudentsOfProgramBatch" TypeName="Academic.DbHelper.DbHelper+Batch">
            <SelectParameters>
                <asp:ControlParameter ControlID="hidProgramBatchId" DefaultValue="0" Name="programBatchId" PropertyName="Value" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:HiddenField ID="HiddenField1" runat="server" Value="0" />
        data list end
    </div>





</div>
