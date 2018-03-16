<%@ Page Title="" Language="C#" MasterPageFile="~/Management.master" AutoEventWireup="true" CodeFile="ApprovedComments.aspx.cs" Inherits="ApprovedComments" %>
<%@ Register src="~/UC/Comment/uApprovedComments.ascx" tagname="uApprovedComments" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderManagement" Runat="Server">

    <uc1:uApprovedComments ID="uApprovedComments1" runat="server" />

</asp:Content>