<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="KampusRehberi.aspx.cs" Inherits="KampusRehberi" %>

<%@ Register src="~/UC/KampusRehberi/uKampusRehberi.ascx" tagname="uKampusRehberi" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <h1>Kampüs Rehberi</h1>
    
    <div class="clear"></div>
    <br />
    <uc1:uKampusRehberi ID="uKampusRehberi1" runat="server" />    

    <div class="clear"></div>
    
    <br /><br /><br />

</asp:Content>