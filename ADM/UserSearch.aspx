<%@ Page Title="" Language="C#" MasterPageFile="~/Management.master" AutoEventWireup="true" CodeFile="UserSearch.aspx.cs" Inherits="UserSearch" %>
<%@ Register src="~/UC/User/uUserSearch.ascx" tagname="uUserSearch" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderManagement" Runat="Server">

    <uc1:uUserSearch ID="uUserSearch1" runat="server" />

</asp:Content>