<%@ Page Title="" Language="C#" MasterPageFile="~/Management.master" AutoEventWireup="true" CodeFile="PendingPhotos.aspx.cs" Inherits="PendingPhotos" %>
<%@ Register src="~/UC/Photo/uPendingPhotos.ascx" tagname="uPendingPhotos" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderManagement" Runat="Server">

    <uc1:uPendingPhotos ID="uPendingPhotos1" runat="server" />

</asp:Content>