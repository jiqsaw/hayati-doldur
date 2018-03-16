<%@ Page Title="" Language="C#" MasterPageFile="~/Management.master" AutoEventWireup="true" CodeFile="ActivityNew.aspx.cs" Inherits="ActivityNew" ValidateRequest="false" %>
<%@ Register src="UC/Activity/uActivityNewHolder.ascx" tagname="uActivityNewHolder" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderManagement" Runat="Server">    
        
    <uc1:uActivityNewHolder ID="uActivityNewHolder1" runat="server" />
    
</asp:Content>