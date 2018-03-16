<%@ Page Title="" Language="C#" MasterPageFile="~/Management.master" AutoEventWireup="true" CodeFile="NewsNew.aspx.cs" Inherits="NewsNew" %>
<%@ Register src="~/UC/News/uNewsNew.ascx" tagname="uNewsNew" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderManagement" Runat="Server">

    <uc1:uNewsNew ID="uNewsNew1" runat="server" />

</asp:Content>