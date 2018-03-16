<%@ Page Title="" Language="C#" MasterPageFile="~/Management.master" AutoEventWireup="true" CodeFile="NewsManagement.aspx.cs" Inherits="NewsManagement" %>
<%@ Register src="~/UC/News/uNewsManagement.ascx" tagname="uNewsManagement" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderManagement" Runat="Server">

    <uc1:uNewsManagement ID="uNewsManagement1" runat="server" />
    
</asp:Content>