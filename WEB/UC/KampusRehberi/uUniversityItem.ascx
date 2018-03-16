<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uUniversityItem.ascx.cs" Inherits="UC_KampusRehberi_uUniversityItem" %>

<div class="DottedBorder"></div>
<div class="KampusRehberiList">

    <asp:HyperLink ID="hlUniversity" runat="server" CssClass="University" NavigateUrl='#'>-</asp:HyperLink>

    <div class="Address"> <asp:Literal runat="server" ID="ltlAddress"></asp:Literal> </div>

    <asp:HyperLink CssClass="WebPage" runat="server" ID="hlWeb" Target="_blank" NavigateUrl='#'>-</asp:HyperLink>

</div>
<div class="clear"></div><br />