<% @ Language=VBScript %>
<% Option Explicit %>
<!--#include file="common.asp" -->
<!--#include file="language_files/pm_language_file_inc.asp" -->
<!--#include file="functions/functions_edit_post.asp" -->
<!--#include file="functions/functions_date_time_format.asp" -->
<!--#include file="includes/emoticons_inc.asp" -->
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




'Set the buffer to true
Response.Buffer = True

'Make sure this page is not cached
Response.Expires = -1
Response.ExpiresAbsolute = Now() - 2
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "No-Store"

'Declare variables
Dim strMode 			'Holds the mode of the page
Dim strPostPage 		'Holds the page the form is posted to
Dim lngMessageID		'Holds the pm id
Dim strTopicSubject		'Holds the subject
Dim strBuddyName		'Holds the to username
Dim dtmReplyPMDate		'Holds the reply pm date
Dim strMessage			'Holds the post message
Dim intIndexPosition		'Holds the idex poistion in the emiticon array
Dim intNumberOfOuterLoops	'Holds the outer loop number for rows
Dim intLoop			'Holds the loop index position
Dim intInnerLoop		'Holds the inner loop number for columns
Dim strUploadedFiles		'Holds the names of any files or images uploaded
Dim blnFloodControl		'Set to tru if flood control has been exceeded
Dim dtmFloodControlDate		'Holds the flood control date for the database search
Dim intSentPMs 			'Holds the number of PM sent


'Set the mode of the page
strMode = "PM"
lngMessageID = 0
blnFloodControl = False


'If the user is user is using a banned IP redirect to an error page
If bannedIP() Then
	
	'Clean up
	Call closeDatabase()

	'Redirect
	Response.Redirect("insufficient_permission.asp?M=IP" & strQsSID3)

End If



'If Priavte messages are not on then send them away
If blnPrivateMessages = False Then
	
	'Clean up
	Call closeDatabase()

	'Redirect
	Response.Redirect("default.asp" & strQsSID1)
End If


'If the user is not allowed then send them away
If intGroupID = 2 OR blnActiveMember = False OR blnBanned Then
	
	'Clean up
	Call closeDatabase()

	'Redirect
	Response.Redirect("insufficient_permission.asp" & strQsSID1)
End If


'If there is a person who to send to then read in there name
'This is encoded before being displayed for security
strBuddyName = Trim(Mid(Request.QueryString("name"), 1, 25))



'If edit read in the detials
If Request.QueryString("code") = "edit" Then
	
	'Read in the details of the message to be edited
	strTopicSubject = Trim(Mid(Request.Form("subject"), 1, 41))
	strMessage = Request.Form("PmMessage")
	strBuddyName = Trim(Mid(Request.Form("Buddy"), 1, 25))
End If



'If this is a reply to a pm then get the details from the db
If Request.QueryString("code") = "reply" Then

	'Read in the pm mesage number to reply to
	lngMessageID = CLng(Request.QueryString("pm"))

	'Get the pm from the database

	'Initlise the sql statement
	strSQL = "SELECT " & strDbTable & "PMMessage.*, " & strDbTable & "Author.Username " & _
	"FROM " & strDbTable & "Author " & strDBNoLock & ", " & strDbTable & "PMMessage " & strDBNoLock & " " & _
	"WHERE " & strDbTable & "Author.Author_ID = " & strDbTable & "PMMessage.From_ID " & _
		"AND " & strDbTable & "PMMessage.PM_ID=" & lngMessageID & " " & _
		"AND " & strDbTable & "PMMessage.Author_ID=" & lngLoggedInUserID & ";"

	'Query the database
	rsCommon.Open strSQL, adoCon

	'Read in the date of the reply pm
	dtmReplyPMDate = CDate(rsCommon("PM_Message_date"))
	
	'Make sure that the time and date format function isn't effected by the server time off set
	If strTimeOffSet = "-" Then
		dtmReplyPMDate = DateAdd("h", + intTimeOffSet, dtmReplyPMDate)
	ElseIf strTimeOffSet = "+" Then
		dtmReplyPMDate = DateAdd("h", - intTimeOffSet, dtmReplyPMDate)
	End If    

	'Read in the username to be the pm is a reply to
	strBuddyName = rsCommon("Username")

	'Set up the pm title
	strTopicSubject = Replace(rsCommon("PM_Tittle"), "RE: ", "")
	strTopicSubject = "RE: " & strTopicSubject
	
	'Build up the reply pm
	strMessage = vbCrLf & vbCrLf & vbCrLf & "-- " & strTxtPreviousPrivateMessage & " --" & _
	vbCrLf & "[B]" & strTxtSentBy & " :[/B] " & strBuddyName & _
	vbCrLf & "[B]" & strTxtSent & " :[/B] " & stdDateFormat(dtmReplyPMDate, True) & " at " & TimeFormat(dtmReplyPMDate) & vbCrLf & vbCrLf
		
	'Read in the pm from the recordset
	strMessage = strMessage & rsCommon("PM_Message")
		
	'Apply BB Codes
	strMessage = EditPostConvertion (strMessage)

	'Close recordset
	rsCommon.Close
End If




'PM Flood control, make sure the user has not sent to many PM's
If blnAdmin = False Then
	
	'Get the date with 1 hour taken off
	dtmFloodControlDate = internationalDateTime(DateAdd("h", -1, now()))
	
	'SQL Server doesn't like ISO dates with '-' in them, so remove the '-' part
	If strDatabaseType = "SQLServer" Then dtmFloodControlDate = Replace(dtmFloodControlDate, "-", "", 1, -1, 1)
	
	'Place the date in SQL safe # or '
	If strDatabaseType = "Access" Then
		dtmFloodControlDate = "#" & dtmFloodControlDate & "#"
	Else
		dtmFloodControlDate = "'" & dtmFloodControlDate & "'"
	End If

	'Initalise the SQL string with a query to read count the number of pm's the user has recieved
	strSQL = "SELECT Count(" & strDbTable & "PMMessage.PM_ID) AS CountOfSentPM " & _
	"FROM " & strDbTable & "PMMessage" & strDBNoLock & " " & _
	"WHERE " & strDbTable & "PMMessage.From_ID = " & lngLoggedInUserID & " " & _
		"AND " & strDbTable & "PMMessage.PM_Message_Date >= " & dtmFloodControlDate & ";"

	'Open the recordset
	rsCommon.Open strSQL, adoCon

	'If the user has exceeded the number of sent PM's in this hour don't let them send the PM
	If NOT rsCommon.EOF Then
		intSentPMs = CInt(rsCommon("CountOfSentPM"))
		
		If intSentPMs >= intPmFlood Then blnFloodControl = True
	End If

	'Relese sever objects
	rsCommon.Close
End If




'If active users is enabled update the active users application array
If blnActiveUsers Then
	'Call active users function
	saryActiveUsers = activeUsers(strTxtWritingPrivateMessage, "", "", 0)
End If


'Set FID to -1 to let the RTE windows konw this is a PM
If IntC(getSessionItem("FID")) <> "-1" Then Call saveSessionItem("FID", "-1")

'Decode buddy name to display within the text area
strBuddyName = decodeString(strBuddyName)

'Strip any scriptintg to prevent XSS
strBuddyName = removeAllTags(strBuddyName)


'Set bread crumb trail
strBreadCrumbTrail = strBreadCrumbTrail & strNavSpacer & "<a href=""pm_welcome.asp" & strQsSID1 & """>" & strTxtPrivateMessenger & "</a>" & strNavSpacer & strTxtSendPrivateMessage


%>
<!-- #include file="includes/browser_page_encoding_inc.asp" -->
<meta name="generator" content="Web Wiz Forums" />
<title><% = strTxtPrivateMessenger & ": " & strTxtSendPrivateMessage %></title>

<%
'***** START WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
Response.Write("<!--//" & _
vbCrLf & "/* *******************************************************" & _
vbCrLf & "Software: Web Wiz Forums(TM) ver. " & strVersion & "" & _
vbCrLf & "Info: http://www.webwizforums.com" & _
vbCrLf & "Copyright: (C)2001-2010 Web Wiz(TM). All rights reserved" & _
vbCrLf & "******************************************************* */" & _
vbCrLf & "//-->")
'***** END WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
%>

<!-- Check the from is filled in correctly before submitting -->
<script  language="JavaScript">

//Function to check form is filled in correctly before submitting
function CheckForm () {

	var errorMsg = "";
	var formArea = document.getElementById('frmMessageForm');

<%
'If Gecko Madis API (RTE) need to strip default input from the API
If RTEenabled = "Gecko" Then Response.Write("	//For Gecko Madis API (RTE)" & vbCrLf & "	if (formArea.message.value.indexOf('<br>') > -1 && formArea.message.value.length==5) formArea.message.value = '';" & vbCrLf)

%>
	//Check for a member name
	if ((formArea.member.value=="") && (formArea.selectMember.value=="")){
		errorMsg += "\n\t<% = strTxtNoToUsernameErrorMsg %>";
	}

	//Check for a subject
	if (formArea.subject.value==""){
		errorMsg += "\n\t<% = strTxtNoPMSubjectErrorMsg %>";
	}

	//Check for message
	if (formArea.message.value==""){
		errorMsg += "\n\t<% = strTxtNoPMErrorMsg %>";
	}

	//If there is aproblem with the form then display an error
	if (errorMsg != ""){
		msg = "<% = strTxtErrorDisplayLine %>\n\n";
		msg += "<% = strTxtErrorDisplayLine1 %>\n";
		msg += "<% = strTxtErrorDisplayLine2 %>\n";
		msg += "<% = strTxtErrorDisplayLine %>\n\n";
		msg += "<% = strTxtErrorDisplayLine3 %>\n";

		errorMsg += alert(msg + errorMsg + "\n\n");
		return false;
	}

	return true;
}
</script>
<link href="<% = strCSSfile %>default_style.css" rel="stylesheet" type="text/css" />
<!-- #include file="includes/header.asp" -->
<!-- #include file="includes/status_bar_header_inc.asp" -->
<table class="basicTable" cellspacing="0" cellpadding="3" align="center">
 <tr>
  <td align="left"><h1><% = strTxtPrivateMessenger & ": " & strTxtSendPrivateMessage %></h1></td>
 </tr>
</table>
<br />
<table class="basicTable" cellspacing="0" cellpadding="0" align="center"> 
 <tr> 
  <td class="tabTable">
   <a href="pm_welcome.asp<% = strQsSID1 %>" title="<% = strTxtPrivateMessenger %>" class="tabButton">&nbsp;<img src="<% = strImagePath %>messenger.<% = strForumImageType %>" border="0" alt="<% = strTxtPrivateMessenger %>" /> <% = strTxtMessenger %></a>
   <a href="pm_inbox.asp<% = strQsSID1 %>" title="<% = strTxtPrivateMessenger & " " & strTxtInbox %>" class="tabButton">&nbsp;<img src="<% = strImagePath %>inbox_messages.<% = strForumImageType %>" border="0" alt="<% = strTxtPrivateMessenger & " " & strTxtInbox %>" /> <% = strTxtInbox %></a>
   <a href="pm_outbox.asp<% = strQsSID1 %>" title="<% = strTxtPrivateMessenger & " " & strTxtOutbox %>" class="tabButton">&nbsp;<img src="<% = strImagePath %>sent_messages.<% = strForumImageType %>" border="0" alt="<% = strTxtPrivateMessenger & " " & strTxtOutbox %>" /> <% = strTxtOutbox %></a>
   <a href="pm_new_message_form.asp<% = strQsSID1 %>" title="<% = strTxtNewPrivateMessage %>" class="tabButtonActive">&nbsp;<img src="<% = strImagePath %>new_message.<% = strForumImageType %>" border="0" alt="<% = strTxtNewPrivateMessage %>" /> <% = strTxtNewMessage %></a>
  </td>
 </tr>
</table>
<br /><%

'Flood Control is active show an error message
If blnFloodControl Then

%>
<form method="post" name="frmEditMessage" id="frmEditMessage" action="pm_new_message_form.asp?code=edit<% = strQsSID2 %>" onSubmit="return CheckForm();" onReset="return ResetForm();">
<table class="errorTable" cellspacing="1" cellpadding="3" align="center">
  <tr>
    <td><img src="<% = strImagePath %>error.png" alt="<% = strTxtError %>" /> <strong><% = strTxtError %></strong></td>
  </tr>
  <tr>
    <td><%
	'Display an error message
	Response.Write("<br />" & strTxtYouAreOnlyPerToSend & " " & intPmFlood & " " & strTxtYouHaveExceededLimit & ".")
%></td>
  </tr>
</table>
</form><%


'Else all is well so display the message area
Else

%>
<table cellspacing="1" cellpadding="3" class="tableBorder" align="center">
 <tr class="tableLedger">
  <td align="left"><% = strTxtSendPrivateMessage %></td>
 </tr>
 <tr class="tableRow">
  <td align="left">
   <!--#include file="includes/message_form_inc.asp" -->
  </td>
 </tr>
</table><%

End If

'Reset server variables
Call closeDatabase()

%><br />
<div align="center">
<%
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

'Display the process time
If blnShowProcessTime Then Response.Write "<span class=""smText""><br /><br />" & strTxtThisPageWasGeneratedIn & " " & FormatNumber(Timer() - dblStartTime, 3) & " " & strTxtSeconds & "</span>"
%>
</div>
<!-- #include file="includes/footer.asp" -->