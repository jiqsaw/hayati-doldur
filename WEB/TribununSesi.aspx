<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="TribununSesi.aspx.cs" Inherits="TribununSesi" %>

<%@ Register src="~/UC/TribunSesi/uTribunSesi.ascx" tagname="uTribunSesi" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:uTribunSesi ID="uTribunSesi1" runat="server" />    

</asp:Content>