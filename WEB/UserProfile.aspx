<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="UserProfile.aspx.cs" Inherits="UserProfile" %>
<%@ Register src="UC/User/uUserProfile.ascx" tagname="uUserProfile" tagprefix="uc1" %>
<%@ Register src="~/UC/Common/ActivityNews.ascx" tagname="ActivityNews" tagprefix="uc2" %>
<%@ Register src="~/UC/Common/ActivityFollower.ascx" tagname="ActivityFollower" tagprefix="uc4" %>
<%@ Register src="~/UC/Common/Banner.ascx" tagname="uBanner" tagprefix="Banner" %>
<%@ Register src="~/UC/Common/Search.ascx" tagname="uSearch" tagprefix="Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:uUserProfile ID="uUserProfile1" runat="server" />

<div class="right-block">
	
	<Search:uSearch ID="uSearch1" runat="server" />
    
    <Banner:uBanner ID="uBanner1" runat="server" />
    
    <uc2:ActivityNews ID="ActivityNews1" runat="server" />
    
    <uc4:ActivityFollower ID="ActivityFollower1" runat="server" />
    
</div>

</asp:Content>