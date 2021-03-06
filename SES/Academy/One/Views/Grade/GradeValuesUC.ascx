﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GradeValuesUC.ascx.cs" Inherits="One.Views.Grade.GradeValuesUC" %>

<div style="width: 100%;" class="list-group-item ">
    <%-- style="border: 1px solid lightgray; padding: 0 5px;" --%>
    <span>Value&nbsp;
    <asp:TextBox ID="txtValue" runat="server" Width="192px"></asp:TextBox>
        &nbsp;&nbsp;&nbsp; Equivalent&nbsp;
    <asp:TextBox ID="txtEquivalent" runat="server" Width="66px"></asp:TextBox>

        &nbsp;&nbsp;
    <asp:CheckBox ID="chkFail" runat="server" Text="Fail " ToolTip="To mark if this is a fail value." />
    </span>
    &nbsp;&nbsp;
       
    <asp:ImageButton ID="btnClose" runat="server" ImageUrl="~/Content/Icons/Close/cross_8x20_center.png" CausesValidation="False" OnClick="btnClose_Click" Style="width: 8px" />
    &nbsp;
    <asp:Label ID="lblError" runat="server" Text="Input Error." ForeColor="red" Visible="False"></asp:Label>

    <asp:HiddenField ID="hidId" runat="server" Value="0" />
    <asp:HiddenField ID="hidLocalId" runat="server" Value="0" />
</div>
