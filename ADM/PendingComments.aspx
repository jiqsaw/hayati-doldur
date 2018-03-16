<%@ Page Title="" Language="C#" MasterPageFile="~/Management.master" AutoEventWireup="true" CodeFile="PendingComments.aspx.cs" Inherits="PendingComments" ValidateRequest="false" %>
<%@ Register src="~/UC/Comment/uPendingComments.ascx" tagname="uPendingComments" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderManagement" Runat="Server">

    <uc1:uPendingComments ID="uPendingComments1" runat="server" />

</asp:Content>