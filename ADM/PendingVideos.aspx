<%@ Page Title="" Language="C#" MasterPageFile="~/Management.master" AutoEventWireup="true" CodeFile="PendingVideos.aspx.cs" Inherits="PendingVideos" %>
<%@ Register src="~/UC/Video/uPendingVideos.ascx" tagname="uPendingVideos" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderManagement" Runat="Server">

    <uc1:uPendingVideos ID="uPendingVideos1" runat="server" />

</asp:Content>