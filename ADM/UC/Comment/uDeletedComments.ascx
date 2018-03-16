<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uDeletedComments.ascx.cs" Inherits="UC_Comment_uDeletedComments" %>
<%@ Register src="~/UC/Comment/uCommentList.ascx" tagname="uCommentList" tagprefix="uc1" %>

<h1>SİLİNMİŞ YORUMLAR</h1>

<uc1:uCommentList ID="uCommentList1" runat="server" />