<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="UC_Login" %>
<%@ Register src="~/UC/User/uLogin.ascx" tagname="uLogin" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<uc1:uLogin ID="uLogin1" runat="server" />

</asp:Content>