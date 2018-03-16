<%@ Page Title="" Language="C#" MasterPageFile="~/Management.master" AutoEventWireup="true" CodeFile="ac_Festival.aspx.cs" Inherits="ac_Festival" %>
<%@ Register src="~/UC/Activity/uActivities.ascx" tagname="uActivities" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderManagement" Runat="Server">

    <h1>FESTİVAL ETKİNLİKLERİ (Son 100)</h1>
    <uc1:uActivities ID="uActivities1" runat="server" CategoryID="Festival" />

</asp:Content>