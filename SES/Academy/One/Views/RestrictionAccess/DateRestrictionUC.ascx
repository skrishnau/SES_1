﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DateRestrictionUC.ascx.cs" Inherits="One.Views.RestrictionAccess.DateRestrictionUC" %>

<div class="restriction-uc-whole">
    <asp:ImageButton ID="imgVisibility" ImageUrl="~/Content/Icons/Visibility/eye_16x20_visible.png" runat="server" />    
    &nbsp;
    <span>Date&nbsp; 
    <asp:DropDownList ID="ddlFromUntil" runat="server" Height="20px" Width="70px">
        <Items>
            <asp:ListItem Value="0" Text="from"></asp:ListItem>
            <asp:ListItem Value="1" Text="until"></asp:ListItem>
        </Items>
    </asp:DropDownList>
        &nbsp;
    <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
    </span>
    &nbsp;
    <asp:ImageButton ID="imgClose" ImageUrl="~/Content/Icons/Close/cross_8x20_center.png" runat="server" />
</div>
