<%@ Page Title="" Language="C#" MasterPageFile="~/Management.master" AutoEventWireup="true" CodeFile="OrientationNew.aspx.cs" Inherits="OrientationNew" %>

<%@ Register src="~/UC/Orientation/uOrientationNew.ascx" tagname="uOrientationNew" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderManagement" Runat="Server">

    <uc1:uOrientationNew ID="uOrientationNew1" runat="server" />

</asp:Content>