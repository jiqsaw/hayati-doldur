<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uApprovedComments.ascx.cs" Inherits="UC_Comment_uApprovedComments" %>
<%@ Register src="~/UC/Comment/uCommentList.ascx" tagname="uCommentList" tagprefix="uc1" %>

<h1>ONAYLANMIŞ YORUMLAR</h1>

<uc1:uCommentList ID="uCommentList1" runat="server" />