<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Error.ascx.cs" Inherits="UC_Common_Error" %>
<div class="Error">
    <img alt="" src="Images/Notices/Error/Icon.png" />
    <p>
        <asp:Literal runat="server" ID="ltlTitle"></asp:Literal>
        <asp:Label runat="server" ID="lblDesc"></asp:Label>
    </p>
</div>