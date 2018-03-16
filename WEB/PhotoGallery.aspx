<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="PhotoGallery.aspx.cs" Inherits="PhotoGallery" %>
<%@ Register src="~/UC/Photo/uPhotoGallery.ascx" tagname="uPhotoGallery" tagprefix="uc1" %>
<%@ Register src="~/UC/Common/Search.ascx" tagname="uSearch" tagprefix="uc4" %>
<%@ Register src="~/UC/Common/ActivityNews.ascx" tagname="ActivityNews" tagprefix="uc5" %>
<%@ Register src="~/UC/Common/btnPhotoAdd.ascx" tagname="btnPhotoAdd" tagprefix="uc7" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<uc1:uPhotoGallery ID="uPhotoGallery1" runat="server" />

<div class="right-block">

    <uc4:uSearch ID="uSearch1" runat="server" />
    
    <uc7:btnPhotoAdd ID="btnPhotoAdd1" runat="server" />
    
    <div class="clear"></div>
    
    <uc5:ActivityNews ID="uActivityNews1" runat="server" />
    
</div>

</asp:Content>