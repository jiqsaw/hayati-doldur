<%@ Page Title="" Language="C#" MasterPageFile="~/Management.master" AutoEventWireup="true" CodeFile="DeletedComments.aspx.cs" Inherits="DeletedComments" %>
<%@ Register src="~/UC/Comment/uDeletedComments.ascx" tagname="uDeletedComments" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderManagement" Runat="Server">

    <uc1:uDeletedComments ID="uDeletedComments1" runat="server" />

</asp:Content>