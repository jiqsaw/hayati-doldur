<% @ Language=VBScript %>
<% Option Explicit %>
<!--#include file="common.asp" -->
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



'Set the response buffer to true as we maybe redirecting
Response.Buffer = True

Dim lngTopicID


'Get the forum ID
lngTopicID = CLng(Request.QueryString("TID"))

'Clean up
Call closeDatabase()

%>
<!-- #include file="includes/browser_page_encoding_inc.asp" -->
<link href="<% = strCSSfile %>default_style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
body{
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
</style>
</head>
<body>
<form action="<% If intGroupID = 2 Then Response.Write("search_form.asp") Else Response.Write("search_process.asp") %><% = strQsSID1 %>" method="post" name="dropDownTopicSearch" target="_parent" id="dropDownTopicSearch">
<table width="100%"  border="0" cellpadding="3" cellspacing="0">
 <tr class="tableTopRow">
  <td><span class="lgText"><% = strTxtTopic & " " & strTxtSearch %></a></td>
 </tr>
  <tr class="tableRow">
   <td><input name="KW" id="KW" type="text" maxlength="35" style="width: 155px;" />
    <input type="submit" name="Submit" value="<% = strTxtGo %>" />
    <input name="TID" type="hidden" id="TID" value="<% = lngTopicID %>" />
    <input name="qTopic" type="hidden" id="qTopic" value="1" />
   </td>
  </tr>
  <tr class="tableBottomRow">
   <td align="left" height="55" valign="top"><a href="search_form.asp?TID=<% = lngTopicID & strQsSID2 %>" target="_parent"><% = strTxtAdvancedSearch %></a></td>
  </tr>
</table>
</form>
</body>
</html>