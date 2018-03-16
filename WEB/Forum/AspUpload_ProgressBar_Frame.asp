<% @ EnableSessionState = False
Language=VBScript
%>
<% Option Explicit %>
<!-- #include file="language_files/RTE_language_file_inc.asp" -->
<%


'****************************************************************************************
'**  Copyright Notice    
'**
'**  Web Wiz Rich Text Editor(TM)
'**  http://www.richtexteditor.org
'**                                                              
'**  Copyright (C)2001-2010 Web Wiz(TM). All Rights Reserved. 
'**  
'**  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS UNDER LICENSE FROM 'WEB WIZ'.
'**  
'**  IF YOU DO NOT AGREE TO THE LICENSE AGREEMENT THEN 'WEB WIZ' IS UNWILLING TO LICENSE 
'**  THE SOFTWARE TO YOU, AND YOU SHOULD DESTROY ALL COPIES YOU HOLD OF 'WEB WIZ' SOFTWARE
'**  AND DERIVATIVE WORKS IMMEDIATELY.
'**  
'**  If you have not received a copy of the license with this work then a copy of the latest
'**  license contract can be found at:-
'**
'**  http://www.webwizguide.com/license
'**
'**  For more information about this software and for licensing information please contact
'**  'Web Wiz' at the address and website below:-
'**
'**  Web Wiz, Unit 10E, Dawkins Road Industrial Estate, Poole, Dorset, BH15 4JD, England
'**  http://www.webwizguide.com
'**
'**  Removal or modification of this copyright notice will violate the license contract.
'**
'****************************************************************************************



'*************************** SOFTWARE AND CODE MODIFICATIONS **************************** 
'**
'** MODIFICATION OF THE FREE EDITIONS OF THIS SOFTWARE IS A VIOLATION OF THE LICENSE  
'** AGREEMENT AND IS STRICTLY PROHIBITED
'**
'** If you wish to modify any part of this software a license must be purchased
'**
'****************************************************************************************



Response.AddHeader "pragma","cache"
Response.AddHeader "cache-control","public"
Response.CacheControl =	"Public"
Response.Expires = -1 

%>
<html>
<head>
<title><% = strTxtUploadingFiles %></title>
<style type="text/css">
<!--
html, body {
  background: ButtonFace;
  color: ButtonText;
  font: font-family: Verdana, Arial, Helvetica, sans-serif;
  font-size: 12px;
  margin: 0px;
  padding: 4px;
}
.text {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #000000;
}
-->
</style>
</head>
<body onload="self.focus();">
<table broder="0" width="100%" cellpadding="0" cellspacing="0">
  <tr>
   <td align="center" class="text">
    <img src="forum_images/upload_files.gif" alt="File Uploading Animation" />
    <br /><br />
    <iframe src="AspUpload_ProgressBar.asp?to=10&PID=<%= Request.QueryString("PID") %>" id="UploadProgress" noresize scrolling="0" frameborder="0" framespacing="0" width="369" height="100"></iframe>
  </td>
 </tr>
</table>
</body>
</html>