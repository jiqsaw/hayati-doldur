<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uNavigate.ascx.cs" Inherits="UC_Management_uNavigate" %>

<asp:Repeater runat="server" ID="rptMenu" 
    onitemdatabound="rptMenu_ItemDataBound">
    <ItemTemplate>
        <asp:Literal runat="server" ID="ltlParentID" Visible="false" Text='<%# Eval("ParentID") %>' />
        <asp:Literal runat="server" ID="ltlContent" Visible="false" Text='<%# Eval("PermissionName") %>' />
        <asp:Literal runat="server" ID="ltlNavigate" Visible="false" Text='<%# Eval("PageName") %>' />
        <asp:Literal runat="server" ID="ltlShow"></asp:Literal>
    </ItemTemplate>
</asp:Repeater>

<br /><br />

<a href="Default.aspx?qo=true">· Güvenli Çıkış</a>