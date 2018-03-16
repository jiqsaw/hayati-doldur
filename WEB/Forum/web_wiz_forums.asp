<% @ Language=VBScript %>
<% Option Explicit %>
<!--#include file="admin_common.asp" -->
<%
'****************************************************************************************
'**  Copyright Notice    
'**
'**  Web Wiz Forums(TM)
'**  http://www.webwizforums.com
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



''If the user has accepted then set the session variable
If Request.Form("postBack") Then
	
	'Set the session variable to true
	Call saveSessionItem("WWFP", "1")
	
	'Clean up
	Call closeDatabase()
	
	'Redirect to admin section
	Response.Redirect("admin_menu.asp" & strQsSID1)
	
End If


'Clean up
Call closeDatabase()

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Web Wiz Forums Administration</title>
<!--#include file="includes/browser_page_encoding_inc.asp" -->
<meta name="copyright" content="Copyright (C) 2001-2010 Web Wiz" />
<%
'***** START WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
Response.Write("<!--//" & _
vbCrLf & "/* *******************************************************" & _
vbCrLf & "Software: Web Wiz Web Wiz Forums" & _
vbCrLf & "Info: http://www.webwizforums.com" & _
vbCrLf & "Copyright: (C)2001-2010 Web Wiz(TM). All rights reserved" & _
vbCrLf & "******************************************************* */" & _
vbCrLf & "//-->")
'***** END WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
%>
<style type="text/css">
<!--

body{
	background-color: #FFFFFF;
	background: url(forum_images/bg_web_wiz_forums_ad.gif) repeat-x;
	margin-left: 5px;
	margin-top: 5px;
	margin-right: 5px;
	margin-bottom: 5px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	color : #000000;
	font-weight: normal;
	font-size: 12px;
	text-align: left;
}

.AdTable {
	width: 720px;
	border: 1px solid #E7E7E7;
	background-color: #FFFFFF;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	color : #000000;
	font-weight: normal;
	font-size: 12px;
	text-align: left;
	
}

.AdHeading {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 18px;
	margin-bottom: 3px;
	margin-top: 0px;
}

-->
</style>
</head>
<body>
<br />
<br />
<br />
<!--#include file="includes/webwizforums_premium_edition_inc.asp" -->
<div align="center"><br />
 <br />
 <form id="form1" name="form1" method="post" action="web_wiz_forums.asp?WWFP=1<% = strQsSID2 %>">
  <input type="hidden" name="postBack" id="postBack" value="true" />
  <input type="submit" name="Submit" id="button" value="Continue to Web Wiz Forums Admin Control Panel &gt;&gt;" />
 </form>
<a href="http://www.webwizguide.com/license/" target="_blank"></a></div>
</body>
</html>
