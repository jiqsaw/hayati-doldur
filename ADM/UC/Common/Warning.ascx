<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Warning.ascx.cs" Inherits="UC_Common_Warning" %>
<div class="Warning">
    <img alt="" src="Images/Notices/Warning/Icon.png" />
    <p>
        <asp:Literal runat="server" ID="ltlTitle"></asp:Literal>
        <asp:Label runat="server" ID="lblDesc"></asp:Label>
    </p>
</div>