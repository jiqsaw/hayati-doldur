<% @ Language=VBScript %>
<% Option Explicit %>
<!--#include file="common.asp" -->
<!--#include file="functions/functions_send_mail.asp" -->
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



Response.Buffer = True


'Dimension variables
Dim strAuthorEmail	'Holds the users e-mail address
Dim strFormMessage	'Holds the message in the form
Dim strEmailBody	'Holds the body of the e-mail
Dim blnSentEmail	'Set to true when the e-mail is sent
Dim strSubject		'Holds the subject of the e-mail
Dim strRealName		'Holds the authors real name

'Initialise variables
blnSentEmail = False


'If the user is using a banned IP or the account has been deactivated redirect to an error page
If bannedIP() OR blnBanned Then
	
	'Clean up
	Call closeDatabase()
	
	'Redirect
	Response.Redirect("insufficient_permission.asp" & strQsSID1)

End If



'See if the user is allowed to get an email activation
If blnEmailActivation = False OR lngLoggedInUserID = 2 OR blnActiveMember OR blnLoggedInUserEmail = False Then 
	
	'Clean up
	Call closeDatabase()
	
	'Redirect
	Response.Redirect("default.asp" & strQsSID1)
End If



'Inititlaise the subject of the e-mail that may be sent in the next if/ifelse statements
strSubject = strMainForumName & " " & strTxtActivationEmail

'Send an e-mail to enable the users account to be activated
'Initailise the e-mail body variable with the body of the e-mail
strEmailBody = strTxtHi & " " & decodeString(strLoggedInUsername) & _
vbCrLf & vbCrLf & strTxtEmailThankYouForRegistering & " " & strMainForumName & "." & _
vbCrLf & vbCrLf & strTxtToActivateYourMembershipFor & " " & strMainForumName & " " & strTxtForumClickOnTheLinkBelow & ": -" & _
vbCrLf & vbCrLf & strForumPath & "activate.asp?ID=" & Server.URLEncode(strLoggedInUserCode) & "&USD=" & lngLoggedInUserID


'Send the e-mail using the Send Mail function created on the send_mail_function.inc file
blnSentEmail = SendMail(strEmailBody, decodeString(strLoggedInUsername), decodeString(strLoggedInUserEmail), strMainForumName, decodeString(strForumEmailAddress), strSubject, strMailComponent, false)


'Reset server objects
Call closeDatabase()
%>
<!-- #include file="includes/browser_page_encoding_inc.asp" -->
<meta name="generator" content="Web Wiz Forums" />
<title><% = strTxtResendActivationEmail %></title>

<%
'***** START WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
Response.Write("<!--//" & _
vbCrLf & "/* *******************************************************" & _
vbCrLf & "Software: Web Wiz Forums(TM) ver. " & strVersion & "" & _
vbCrLf & "Info: http://www.webwizforums.com" & _
vbCrLf & "Copyright: (C)2001-2010 Web Wiz(TM). All rights reserved" & _
vbCrLf & "******************************************************* */" & _
vbCrLf & "//-->" & vbCrLf & vbCrLf)
'***** END WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
%>

<link href="<% = strCSSfile %>default_style.css" rel="stylesheet" type="text/css" />
</head>
<body OnLoad="self.focus();">
<table class="basicTable" cellspacing="0" cellpadding="3" align="center">
  <tr>
    <td align="center"><h1><% = strTxtResendActivationEmail %></h1></td>
  </tr>
</table>
<br /><%
    
'If an error has occured display message
If blnSentEmail = False AND strEmailErrorMessage <> "" Then    	
%>
<table cellspacing="1" cellpadding="3" class="errorTable" align="center">
  <tr>
    <td><img src="<% = strImagePath %>error.png" alt="<% = strTxtError %>" /> <strong><% = strTxtError %></strong></td>
  </tr>
  <tr>
   <td>
    <% = strTxtTheEmailFailedToSendPleaseContactAdmin %>
    <br /><br /><strong>Server Error Message:-</strong>
    <br /><% = strEmailErrorMessage %>
    <br />
  </td>
 </tr>
</table><br /><%
     
     
'If the email is sent diaply a message
ElseIf blnSentEmail Then

%>
<table cellspacing="1" cellpadding="3" class="tableBorder" align="center" style="width: 425px;">
  <tr class="tableLedger">
   <td colspan="2"><% = strTxtResendActivationEmail %></td>
  </tr>
  <tr class="tableRow" align="center">
   <td><br /><% = strTxtYouShouldReceiveAnEmail %><br /><br /></td>
 </tr>
</table><%

End If

%>
<br />
<table class="basicTable" cellspacing="0" cellpadding="3" align="center">
  <tr>
    <td align="center"><input type="button" name="ok" onclick="javascript:window.close();" value="<% = strTxtCloseWindow %>"><br />
      <br /><% 
    
'***** START WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
If blnLCode = True Then
	If blnTextLinks = True Then
		Response.Write("<span class=""text"" style=""font-size:10px"">Bulletin Board Software by <a href=""http://www.webwizforums.com"" target=""_blank"" style=""font-size:10px"">Web Wiz Forums&reg;</a> version " & strVersion & "</span>")
		If blnACode Then Response.Write("<span class=""text"" style=""font-size:10px""> [Free Express Edition]")
	Else
  		Response.Write("<a href=""http://www.webwizforums.com"" target=""_blank""><img src=""webwizforums_image.asp"" border=""0"" title=""Bulletin Board Software by Web Wiz Forums&reg; version " & strVersion & """ alt=""Bulletin Board Software by Web Wiz Forums&reg; version " & strVersion& """ /></a>")
  		If blnACode Then Response.Write("<br /><span class=""text"" style=""font-size:10px"">Powered by Web Wiz Forums Free Express Edition</span>")
	End If
	
	Response.Write("<br /><span class=""text"" style=""font-size:10px"">Copyright &copy;2001-2010 <a href=""http://www.webwizguide.com"" target=""_blank"" style=""font-size:10px"">Web Wiz</a></span>")
End If
'***** END WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
%>
    </td>
  </tr>
</table>
</body>