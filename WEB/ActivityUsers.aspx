<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="ActivityUsers.aspx.cs" Inherits="ActivityUsers" %>
<%@ Register src="~/UC/Activities/uActivityUsers.ascx" tagname="uActivityUsers" tagprefix="uc1" %>
<%@ Register src="~/UC/Common/Banner.ascx" tagname="uBanner" tagprefix="Banner" %>
<%@ Register src="~/UC/Common/Search.ascx" tagname="uSearch" tagprefix="Search" %>
<%@ Register src="~/UC/Common/ActivityNews.ascx" tagname="ActivityNews" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:uActivityUsers ID="uActivityUsers" runat="server" />
    
    <div class="right-block">
    	
    	<Search:uSearch ID="uSearch1" runat="server" />
        
        <Banner:uBanner ID="uBanner1" runat="server" />
        
        <uc2:ActivityNews ID="ActivityNews1" runat="server" />        
        
    </div>
    
</asp:Content>