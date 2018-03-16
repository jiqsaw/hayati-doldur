<%@ Page Title="" Language="C#" MasterPageFile="~/Management.master" AutoEventWireup="true" CodeFile="AdminUserNew.aspx.cs" Inherits="AdminUserNew" %>
<%@ Register src="~/UC/AdminUserManagement/uAdminUserNew.ascx" tagname="uAdminUserNew" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderManagement" Runat="Server">

    <uc1:uAdminUserNew ID="uAdminUserNew1" runat="server" />

</asp:Content>