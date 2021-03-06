﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CoursesUc.ascx.cs" Inherits="One.ViewsSite.User.ModulesUc.CoursesUc" %>

<div class="module-whole">
    <div class="modules-heading">
        <asp:HyperLink ID="lbltitle"
            NavigateUrl="~/ViewsSite/User/Dashboard/Dashboard.aspx?type=current" CssClass="modules-title" runat="server">
                                Courses
        </asp:HyperLink>
    </div>
    <%-- class="modules-body" --%>
    <div >
        <asp:PlaceHolder ID="pnlRegularCourses" runat="server"></asp:PlaceHolder>
        <div runat="server" id="divNonRegular" visible="False">
            <hr />
            <asp:DataList ID="dListNonRegularSubjects" runat="server" Width="98%">
                <%-- DataSourceID="RegularCourseDS" --%>
                <ItemTemplate>
                    <div class="auto-st2">
                        <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("Id") %>' />
                        <asp:HyperLink ID="HyperLink5" runat="server"  CssClass="link"
                            NavigateUrl='<%# "~/Views/Course/Section/Master/CourseSectionListing.aspx?SubId="+Eval("Id") %>'
                            Font-Underline="False" ToolTip='<%# Eval("FullName") %>'>
                                       &nbsp;<%# Eval("ShortName") %>
                            <%--  ■ --%>
                        </asp:HyperLink>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>

        <%-- <asp:ObjectDataSource ID="RegularCourseDS" runat="server" SelectMethod="ListCurrentCoursesOfUser" TypeName="Academic.DbHelper.DbHelper+Subject">
            <SelectParameters>
                <asp:ControlParameter ControlID="hidUserId" DefaultValue="0" Name="userId" PropertyName="Value" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>--%>


        <%-- Structure show --%>
        <%-- <div>
            <asp:DataList ID="DataList2" runat="server" DataSourceID="CurrentYearsAndSubYearsDS">
                <ItemTemplate>
                    <asp:HiddenField ID="IdLabel1" runat="server" Value='<%# GetId(Eval("YearId"),Eval("SubYearId")) %>' />
                    <div>
                        <asp:Label ID="Label1" runat="server" Text='<%# (Eval("YearName")) %>' />
                    </div>
                    <div style="margin-left: 20px;">
                        <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("SubYearName")%>' />
                    </div>
                    <asp:HiddenField ID="TypeLabel" runat="server" Value='<%# GetType(Eval("SubYearName")) %>' />

                </ItemTemplate>
            </asp:DataList>
        </div>--%>
        <%-- GetEarlierYearsAndSubYearsOfStudent --%>
        <%-- <asp:ObjectDataSource ID="CurrentYearsAndSubYearsDS" runat="server" SelectMethod="GetCurrentrStructure" TypeName="Academic.DbHelper.DbHelper+Student">
        <SelectParameters>
            <asp:ControlParameter ControlID="hidUserId" DefaultValue="0" Name="userId" PropertyName="Value" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>--%>



        <asp:HiddenField ID="hidUserId" runat="server" Value="0" />
        <asp:HiddenField ID="hidTopLevelRole" runat="server" Value="" />


    </div>
</div>
