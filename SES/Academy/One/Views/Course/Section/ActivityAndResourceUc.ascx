﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ActivityAndResourceUc.ascx.cs" Inherits="One.Views.Course.Section.ActivityAndResourceUc" %>

<%--<div class="course-act-res-whole">--%>
<asp:Panel ID="pnlHeading" runat="server">
    <%-- class="course-act-res-heading" --%>
    <div>

        <table>
            <tr>
                <td>
                    <asp:Image ID="imgIcon" runat="server" ImageUrl="" AlternateText="" Height="16" Width="16" />

                </td>
                <td>
                    <asp:HyperLink ID="lblTitle" CssClass="link-act-res-title" runat="server" Text="Heading">
                        
                    </asp:HyperLink>

                    &nbsp;
                    <span>
                        <asp:Image ID="imgNew" runat="server" Visible="False" />
                    </span>

                    &nbsp;
            
                    <span class="span-edit-delete">
                        <asp:HyperLink ID="lnkEdit" runat="server" Visible="False">
                            <asp:Image ID="imgedt" runat="server" ToolTip="Edit"
                                ImageUrl="~/Content/Icons/Edit/edit_orange.png" />
                        </asp:HyperLink>
                        <asp:HyperLink ID="lnkDelete" Visible="False" runat="server" >
                            <asp:Image ID="Image2" runat="server" ToolTip="Delete"
                                ImageUrl="~/Content/Icons/delete/trash.png" />
                        </asp:HyperLink>
                    </span>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Panel ID="pnlDescription" runat="server" CssClass="course-act-res-description">
                        <asp:Label ID="lblDescription" runat="server" Text=""></asp:Label>
                    </asp:Panel>
                </td>
            </tr>
        </table>

        <%-- course-act-res-title --%>


        <%-- class="course-act-res-body" --%>
    </div>


    <%--<div class="item-message">
            <asp:PlaceHolder ID="pnlMessages" runat="server"></asp:PlaceHolder>
        </div>--%>
    <%-- True- activity, False- resource --%>
    <asp:HiddenField ID="hidActOrRes" runat="server" Value="True" />

    <asp:HiddenField ID="hid" runat="server" Value="0" />
    <asp:HiddenField ID="hidActOrResId" runat="server" Value="0" />
    <asp:HiddenField ID="hidType" runat="server" Value="0" />
</asp:Panel>

<%--</div>--%>
