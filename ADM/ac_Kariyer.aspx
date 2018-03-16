<%@ Page Title="" Language="C#" MasterPageFile="~/Management.master" AutoEventWireup="true" CodeFile="ac_Kariyer.aspx.cs" Inherits="ac_Kariyer" %>
<%@ Register src="~/UC/Activity/uActivities.ascx" tagname="uActivities" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderManagement" Runat="Server">

    <h1>KARİYER ETKİNLİKLERİ (Son 100)</h1>
    <uc1:uActivities ID="uActivities1" runat="server" CategoryID="Kariyer" />

</asp:Content>