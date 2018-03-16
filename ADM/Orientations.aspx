<%@ Page Title="" Language="C#" MasterPageFile="~/Management.master" AutoEventWireup="true" CodeFile="Orientations.aspx.cs" Inherits="Orientations" %>

<%@ Register src="~/UC/Orientation/uOrientations.ascx" tagname="uOrientations" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderManagement" Runat="Server">

    <uc1:uOrientations ID="uOrientations1" runat="server" />

</asp:Content>