<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uDeletedPhotos.ascx.cs" Inherits="UC_Photo_uDeletedPhotos" %>
<%@ Register src="~/UC/Photo/uPhotoList.ascx" tagname="uPhotoList" tagprefix="uc1" %>

<script type="text/javascript">
    $(function() {
        $('a.lightbox').lightBox();
    });
</script>


<h1>SİLİNMİŞ FOTOĞRAFLAR</h1>

<uc1:uPhotoList ID="uPhotoList1" runat="server" />