<% @ Language=VBScript %>
<% Option Explicit %>
<%

'Set the response buffer to true as we maybe redirecting and setting a cookie
Response.Buffer = False

'Set the script time out high enough for really large database (7200 = 2 hours)
Server.ScriptTimeout = 7200

%>
<!--#include file="database/database_connection.asp" -->
<!-- #include file="includes/version_inc.asp" -->
<!-- #include file="functions/functions_common.asp" -->
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





Dim strSetupType
Dim strPageName
Dim intBadWordLoopCounter	'Holds the bad word filter writing to db counter
Dim blnErrorOccured		'Set to true if an error occurs
Dim blnRead
Dim blnPost
Dim blnReply
Dim blnEdit
Dim blnDelete
Dim blnPriority
Dim blnPollCreate
Dim blnVote
Dim blnAttachments
Dim blnImageUpload
Dim blnCheckFirst
Dim blnEvents
Dim blnModerator
Dim iaryGroupID
Dim larryTopicID
Dim lngTopicLoopCounter	
Dim lngPermissionsLoopCounter
Dim lngStartThreadID
Dim lngLastThreadID
Dim intNoOfReplies
Dim iarryForumID
Dim intForumLoopCounter

'Read in what we are setting up
strSetupType = Request.QueryString("setup")


'Set the page name

'SQL Server new install
If Request.QueryString("setup") = "SqlServerNew" Then
	strPageName = "Web Wiz Forums Microsoft SQL Server Database Setup Wizard"

'mySQL new install
ElseIf Request.QueryString("setup") = "mySQLNew" Then
	strPageName = "Web Wiz Forums mySQL Database Setup Wizard"

'Access new install
ElseIf Request.QueryString("setup") = "AccessNew"Then
	strPageName = "Web Wiz Forums Access Database Setup Wizard"


'SQL Server update
ElseIf Request.QueryString("setup") = "SqlServer8Update" OR Request.QueryString("setup") = "SqlServer7Update" Then
	strPageName = "Web Wiz Forums Microsoft SQL Server Database Upgarde Wizard"

'mySQL update
ElseIf Request.QueryString("setup") = "mySQL8Update" Then
	strPageName = "Web Wiz Forums mySQL Database Upgrade Wizard"
	
'Access update
ElseIf Request.QueryString("setup") = "Access8Update" OR Request.QueryString("setup") = "Access7Update" Then
	strPageName = "Web Wiz Forums Access Database Upgrade Wizard"

'Else 9.x update
ElseIf Request.QueryString("setup") = "9Update" Then
	strPageName = "Web Wiz Forums Database Upgrade Wizard"

End If





%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" dir="ltr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><% = strPageName %></title>
<meta name="generator" content="Web Wiz Forums" />
<%

Response.Write(vbCrLf  & vbCrLf & "<!--//" & _
vbCrLf & "/* *******************************************************" & _
vbCrLf & "Software: Web Wiz Forums(TM) " & _
vbCrLf & "Info: http://www.webwizforums.com" & _
vbCrLf & "Copyright: (C)2001-2010 Web Wiz(TM). All rights reserved" & _
vbCrLf & "******************************************************* */" & _
vbCrLf & "//-->" & vbCrLf)
'***** END WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******

%>
<link href="css_styles/default/default_style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<table class="basicTable" cellspacing="0" cellpadding="3" align="center">
  <tr>
    <td><a href="http://www.webwizforums.com"><img src="forum_images/web_wiz_forums.png" border="0" alt="Web Wiz Forums Homepage" title="Web Wiz Forums Homepage" /><br />
      <br />
      </a>
      <h1><% = strPageName %></h1>
      <span class="smText"><br />
      The Web Wiz Forums Setup is now complete, please see below for important information regarding your installation.<br />
      <br />
    </td>
  </tr>
</table>
<br />
<table cellspacing="1" cellpadding="3" class="tableBorder" align="center">
  <tr class="tableLedger">
    <td>Database Setup Wizard</td>
  </tr>
  <tr>
    <td align="left"  class="tableRow">
     <br />
     <span id="displayState">Please be patient while the database is setup.</span>
     <br />
     <br />
    </td>
  </tr>
  <tr>
    <td class="tableBottomRow">&nbsp;</td>
  </tr>
</table>
<br />
<div align="center"><%
	
'***** START WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
Response.Write("<span class=""text"" style=""font-size:10px"">Bulletin Board Software by <a href=""http://www.webwizforums.com"" target=""_blank"" style=""font-size:10px"">Web Wiz Forums&reg;</a> version " & strVersion & "</span>")
Response.Write("<br /><span class=""text"" style=""font-size:10px"">Copyright &copy;2001-2010 <a href=""http://www.webwizguide.com"" target=""_blank"" style=""font-size:10px"">Web Wiz</a></span>")
'***** END WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******

%>
</div>
<br />
</body>
</html><%

'SQL Server new install
If Request.QueryString("setup") = "SqlServerNew" Then

	%><!-- #include file="setup_db/msSQL_server.asp" --><%

'mySQL new install
ElseIf Request.QueryString("setup") = "mySQLNew" Then
	%><!-- #include file="setup_db/mySQL_server.asp" --><%

'Access new install
ElseIf Request.QueryString("setup") = "AccessNew" OR Request.QueryString("setup") = "9Update" Then
	%><!-- #include file="setup_db/db_no_change.asp" --><%


'SQL Server 8x update
ElseIf Request.QueryString("setup") = "SqlServer8Update" Then
	%><!-- #include file="setup_db/msSQL_server_8x_update.asp" --><%

'mySQL 8x update
ElseIf Request.QueryString("setup") = "mySQL8Update" Then
	%><!-- #include file="setup_db/mySQL_server_8x_update.asp" --><%
	
'Access 8x update
ElseIf Request.QueryString("setup") = "Access8Update" Then
	%><!-- #include file="setup_db/access_8x_update.asp" --><%


'SQL Server 7x update
ElseIf Request.QueryString("setup") = "SqlServer7Update" Then
	%><!-- #include file="setup_db/msSQL_server_7x_update.asp" --><%
	
'Access 7x update
ElseIf Request.QueryString("setup") = "Access7Update" Then
	%><!-- #include file="setup_db/access_7x_update.asp" --><%	



End If




%>