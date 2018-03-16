<%@ Page Title="" Language="C#" MasterPageFile="~/Management.master" AutoEventWireup="true" CodeFile="MarkaElcileri.aspx.cs" Inherits="MarkaElcileri" %>
<%@ Register src="~/UC/MarkaElcileri/uMarkaElcileri.ascx" tagname="uMarkaElcileri" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderManagement" Runat="Server">

    <uc1:uMarkaElcileri ID="uMarkaElcileri1" runat="server" />

</asp:Content>