<%@ Page Title="" Language="C#" MasterPageFile="~/Management.master" AutoEventWireup="true" CodeFile="AdminUserManagement.aspx.cs" Inherits="AdminUserManagement" %>
<%@ Register src="~/UC/AdminUserManagement/uAdminUserManagement.ascx" tagname="uAdminUserManagement" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderManagement" Runat="Server">

    <uc1:uAdminUserManagement ID="uAdminUserManagement1" runat="server" />

</asp:Content>