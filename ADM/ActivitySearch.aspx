<%@ Page Title="" Language="C#" MasterPageFile="~/Management.master" AutoEventWireup="true" CodeFile="ActivitySearch.aspx.cs" Inherits="ActivitySearch" %>
<%@ Register src="UC/Activity/uActivitySearch.ascx" tagname="uActivitySearch" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderManagement" Runat="Server">    
        
    <uc1:uActivitySearch ID="uActivitySearch1" runat="server" />
    
</asp:Content>