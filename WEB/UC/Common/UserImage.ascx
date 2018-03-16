<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserImage.ascx.cs" Inherits="UC_Common_UserImage" %>

<asp:Panel runat="server" ID="pnlFacebookImg" style="cursor: pointer;">
    <fb:profile-pic uid="<%=this.uid.ToString() %>" size="<%=this.size.ToString() %>" linked="false" width="<%=this.width %>"></fb:profile-pic>
</asp:Panel>

<asp:HyperLink runat="server" ID="hlUser">
    <asp:Image runat="server" ID="imgPhoto" />
</asp:HyperLink>