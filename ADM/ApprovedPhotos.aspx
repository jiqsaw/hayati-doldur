<%@ Page Title="" Language="C#" MasterPageFile="~/Management.master" AutoEventWireup="true" CodeFile="ApprovedPhotos.aspx.cs" Inherits="ApprovedPhotos" %>
<%@ Register src="~/UC/Photo/uApprovedPhotos.ascx" tagname="uApprovedPhotos" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderManagement" Runat="Server">

    <uc1:uApprovedPhotos ID="uApprovedPhotos1" runat="server" />

</asp:Content>