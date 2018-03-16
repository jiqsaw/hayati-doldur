<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewsDetail.aspx.cs" Inherits="NewsDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <title>Hayatidoldur.com</title>
    
<link rel="stylesheet" type="text/css" href="Styles/reset.css" />

<style type="text/css">
.clear {clear:both;}

.detail-container {height:271px;width:461px;overflow:auto}

.detail-header {background-image:url(images/detail-header.png);background-repeat:no-repeat;padding:20px 0 30px 20px;}

.detail-left {float:left;}
.detail-left span {display:block;font-family:Arial, Helvetica, sans-serif;letter-spacing:-1px;}
.detail-first {color:#b45516;font-size:18px;font-weight:bold;}
.detail-second {color:#8ba0b0;font-size:14px;margin:3px 0 0;}

.detail-right {float:right;width:46px;text-align:left;}
.detail-right a {color:#668f2a;font-family:Tahoma, Geneva, sans-serif;font-size:11px;}

.detail-txt {color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:18px;letter-spacing:-1px;padding:0 20px 0}
</style>

</head>
<body>
    <form id="form1" runat="server">
	<div class="detail-container">
    	<div class="detail-header">
        	<div class="detail-left">
        	
        	    <asp:Label runat="server" ID="lblTitle" CssClass="detail-first"></asp:Label>
        	
        	    <asp:Label runat="server" ID="lblSubTitle" CssClass="detail-second"></asp:Label>

            </div>
            <div class="detail-right"><a href="javascript:window.close()" title="Kapat">Kapat</a></div>
            <div class="clear"></div>
        </div>
        <div class="detail-txt">
        
            <asp:Literal runat="server" ID="ltlDetail"></asp:Literal>
        
        </div>
    </div>
    </form>
</body>
</html>