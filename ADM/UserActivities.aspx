<%@ Page Title="" Language="C#" MasterPageFile="~/Management.master" AutoEventWireup="true" CodeFile="UserActivities.aspx.cs" Inherits="UserActivities" %>
<%@ Register src="~/UC/User/uUserActivities.ascx" tagname="uUserActivities" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderManagement" Runat="Server">

    <uc1:uUserActivities ID="uUserActivities1" runat="server" />

</asp:Content>
