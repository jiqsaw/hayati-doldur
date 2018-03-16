<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PhotoAdd.aspx.cs" Inherits="PhotoAdd" %>
<%@ Register src="~/UC/Photo/uPhotoAdd.ascx" tagname="uPhotoAdd" tagprefix="PhotoAdd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <title>HAYATI DOLDUR FOTOĞRAF EKLEME</title>
    
    <link rel="stylesheet" type="text/css" href="Styles/reset.css" />
    <link rel="stylesheet" type="text/css" href="Styles/popup.css" />
    <link rel="stylesheet" type="text/css" href="Styles/Warning.css" />
    
    <script type="text/javascript" src="Scripts/Util.js"></script>
    
</head>
<body>
    <form id="form1" runat="server">
    
    <PhotoAdd:uPhotoAdd ID="uPhotoAdd1" runat="server" />

    </form>
</body>
</html>