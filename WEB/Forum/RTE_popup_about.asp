<% @ Language=VBScript %>
<% Option Explicit %>
<!--#include file="common.asp" -->
<!--#include file="RTE_configuration/RTE_setup.asp" -->
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




'Reset Server Objects
Call closeDatabase()


%>
<!-- #include file="includes/browser_page_encoding_inc.asp" -->
<title>About Web Wiz Rich Text Editor</title>

<%
'***** START WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
Response.Write(vbCrLf & "<!--//" & _
vbCrLf & "/* *******************************************************" & _
vbCrLf & "Software: Web Wiz Rich Text Editor(TM) ver. " & strRTEversion & "" & _
vbCrLf & "Info: http://www.richtexteditor.org" & _
vbCrLf & "Copyright: (C)2001-2010 Web Wiz(TM). All rights reserved" & _
vbCrLf & "******************************************************* */" & _
vbCrLf & "//-->")
'***** END WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
%>

<link href="<% = strCSSfile %>default_style.css" rel="stylesheet" type="text/css" />
</head>
<body style="margin:0px;" OnLoad="self.focus();">
<table width="100%"  border="0" cellpadding="3" cellspacing="0" class="RTEtableTopRow">
  <form method="post">
    <tr class="RTEtableTopRow">
      <td align="center"><h1>Web Wiz Rich Text Editor&trade; ver. <% = strRTEversion %></h1></td>
    </tr>
    <tr>
    <tr>
      <td align="center" class="RTEtableRow">
      	<span class="text"><br /><strong>Free replacement WYSIWYG Editor for text areas</strong><br />
	<br />
	Information and download available from: -<br />
	<a href="http://www.richtexteditor.org" target="_blank">www.richtexteditor.org</a><br />
	<span class="smText">
	<br />
	Copyright &copy;2001-2010 <a href="http://www.webwizguide.com" target="_blank" class="smLink">Web Wiz.</a> All rights reserved.</span><br>
	<br>
	</span>
     </td>
    </tr>
    <tr>
      <td align="center" class="RTEtableBottomRow"><input type="button" name="ok" onclick="javascript:window.close();" value="     <% = strTxtOK %>     ">
      <br /><br />
     </td>
    </tr>
  </form>
</table>
</body>
</html>