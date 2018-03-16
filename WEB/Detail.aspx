<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="Detail.aspx.cs" Inherits="Detail" %>
<%@ Register src="~/UC/Activities/uActivityDetail.ascx" tagname="uActivityDetail" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:uActivityDetail ID="uActivityDetail1" runat="server" />

</asp:Content>
