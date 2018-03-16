<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="ActivityJoin.aspx.cs" Inherits="ActivityJoin" %>
<%@ Register src="~/UC/Activities/uActivityJoin.ascx" tagname="uActivityJoin" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:uActivityJoin ID="uActivityJoin" runat="server" />
    
</asp:Content>