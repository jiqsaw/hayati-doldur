<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="MarkaElcileri.aspx.cs" Inherits="MarkaElcileri" %>
<%@ Register src="~/UC/Common/ActivityFollower.ascx" tagname="ActivityFollower" tagprefix="uc4" %>
<%@ Register src="~/UC/Common/Banner.ascx" tagname="uBanner" tagprefix="Banner" %>
<%@ Register src="~/UC/Common/Search.ascx" tagname="uSearch" tagprefix="Search" %>
<%@ Register src="~/UC/MarkaElcileri/uMarkaElcileri.ascx" tagname="uMarkaElcileri" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:uMarkaElcileri ID="uMarkaElcileri1" runat="server" />        

<div class="right-block">
	
	<Search:uSearch ID="uSearch1" runat="server" />
    
    <Banner:uBanner ID="uBanner1" runat="server" />
        
    <uc4:ActivityFollower ID="ActivityFollower1" runat="server" />
    
</div>

</asp:Content>
