<%@ Page Title="" Language="C#" MasterPageFile="~/Management.master" AutoEventWireup="true" CodeFile="Management.aspx.cs" Inherits="Management" ValidateRequest="false" %>
<%@ Register src="~/UC/Comment/uPendingComments.ascx" tagname="uPendingComments" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderManagement" Runat="Server">

<h1>HAYATI DOLDUR YÖNETİM PANELİ</h1>

    <uc1:uPendingComments ID="uPendingComments1" runat="server" />

</asp:Content>