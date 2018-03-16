<%@ Page Title="" Language="C#" MasterPageFile="~/Management.master" AutoEventWireup="true" CodeFile="ac_Spor.aspx.cs" Inherits="ac_Spor" %>
<%@ Register src="~/UC/Activity/uActivities.ascx" tagname="uActivities" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderManagement" Runat="Server">

    <h1>SPOR ETKİNLİKLERİ (Son 100)</h1>
    <uc1:uActivities ID="uActivities1" runat="server" CategoryID="Spor" />

</asp:Content>