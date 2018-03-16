<%@ Page Title="" Language="C#" MasterPageFile="~/Management.master" AutoEventWireup="true" CodeFile="DeletedPhotos.aspx.cs" Inherits="DeletedPhotos" %>
<%@ Register src="~/UC/Photo/uDeletedPhotos.ascx" tagname="uDeletedPhotos" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderManagement" Runat="Server">

    <uc1:uDeletedPhotos ID="uDeletedPhotos1" runat="server" />

</asp:Content>