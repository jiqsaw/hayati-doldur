<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_DefAdmin" %>
<%@ Register src="~/UC/Default/uLogin.ascx" tagname="uLogin" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        
    <uc1:uLogin ID="uLogin1" runat="server" />
 
</asp:Content>