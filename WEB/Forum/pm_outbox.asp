<% @ Language=VBScript %>
<% Option Explicit %>
<!--#include file="common.asp" -->
<!--#include file="language_files/pm_language_file_inc.asp" -->
<!--#include file="functions/functions_date_time_format.asp" -->
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
Dim sarryPmMessage		'Holds the recordset in an array
Dim intRecordPositionPageNum	'Holds the recorset page number to show the other pm message
Dim lngTotalRecordsPages	'Holds the total number of pages in the recordset
Dim intRecordLoopCounter	'Holds the loop counter numeber
Dim intPageLoopCounter		'Holds the number of pages there are of pm messages
Dim intNumOfPMs			'Holds the number of private messages the user has
Dim intPageSize			'Holds the number of memebrs shown per page
Dim intStartPosition		'Holds the start poition for records to be shown
Dim intEndPosition		'Holds the end poition for records to be shown
Dim intCurrentRecord		'Holds the current record position
Dim intPageLinkLoopCounter	'Holds the loop counter for mutiple page links

'Initilise varaibles
intPageSize = 10
intNumOfPMs = 0
intNumOfPMs = 0

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


'If this is the first time the page is displayed then the pm message record position is set to page 1
If Request.QueryString("PN") = 0 Then
	intRecordPositionPageNum = 1

'Else the page has been displayed before so the pm message record postion is set to the Record Position number
Else
	intRecordPositionPageNum = CInt(Request.QueryString("PN"))
End If	


'Initlise the sql statement
strSQL = "SELECT " & strDbTable & "PMMessage.PM_ID, " & strDbTable & "PMMessage.Author_ID, " & strDbTable & "PMMessage.PM_Tittle, " & strDbTable & "PMMessage.PM_Message_Date," & strDbTable & "PMMessage.Read_Post, " & strDbTable & "Author.Username " & _ 
"FROM " & strDbTable & "Author" & strDBNoLock & ", " & strDbTable & "PMMessage" & strDBNoLock & " " & _ 
"WHERE " & strDbTable & "Author.Author_ID=" & strDbTable & "PMMessage.Author_ID " & _ 
	"AND " & strDbTable & "PMMessage.From_ID=" & lngLoggedInUserID & " " & _
"ORDER BY " & strDbTable & "PMMessage.PM_Message_date DESC;"

'Query the database  
rsCommon.Open strSQL, adoCon

'If not eof then get some details
If NOT rsCommon.EOF Then 
	
	'Read in the row from the db using getrows for better performance
	sarryPmMessage = rsCommon.GetRows()
	
	'Close rs
	rsCommon.Close
	
	'Count the number of records
	intNumOfPMs = Ubound(sarryPmMessage,2) + 1
	
	'Count the number of pages for the topics using '\' so that any fraction is omitted 
	lngTotalRecordsPages = intNumOfPMs \ intPageSize
	
	'If there is a remainder or the result is 0 then add 1 to the total num of pages
	If intNumOfPMs Mod intPageSize > 0 OR lngTotalRecordsPages = 0 Then lngTotalRecordsPages = lngTotalRecordsPages + 1
	
	
	'Start position
	intStartPosition = ((intRecordPositionPageNum - 1) * intPageSize)	
	
	'End Position
	intEndPosition = intStartPosition + intPageSize
	
	'Get the start position
	intCurrentRecord = intStartPosition
Else

	'Close rs
	rsCommon.Close
End If

'If there are no records on this page and it's above the frist page then set the page position to 1
If intNumOfPMs = 0 AND intRecordPositionPageNum > 1 Then Response.Redirect("pm_outbox.asp?PN=1" & strQsSID3)



'If active users is enabled update the active users application array
If blnActiveUsers Then
	'Call active users function
	saryActiveUsers = activeUsers(strTxtPrivateMessenger & " " & strTxtOutbox, "", "", 0)
End If



'SQL Query Array Look Up table
'0 = PM_ID
'1 = Author_ID
'2 = PM_Tittle
'3 = PM_Message_Date
'4 = Read_Post
'5 = Username



'Page to link to for mutiple page (with querystrings if required)
strLinkPage = "pm_outbox.asp?"


'Set bread crumb trail
strBreadCrumbTrail = strBreadCrumbTrail & strNavSpacer & "<a href=""pm_welcome.asp" & strQsSID1 & """>" & strTxtPrivateMessenger & "</a>" & strNavSpacer & strTxtOutbox


%>
<!-- #include file="includes/browser_page_encoding_inc.asp" -->
<meta name="generator" content="Web Wiz Forums" />
<title><% = strTxtPrivateMessenger & ": " & strTxtOutbox %></title>

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

<link href="<% = strCSSfile %>default_style.css" rel="stylesheet" type="text/css" />
<!-- #include file="includes/header.asp" -->
<!-- #include file="includes/status_bar_header_inc.asp" -->
<table class="basicTable" cellspacing="0" cellpadding="3" align="center">
 <tr>
  <td align="left"><h1><% = strTxtPrivateMessenger & ": " & strTxtOutbox %></h1></td>
 </tr>
</table>
<br />
<table class="basicTable" cellspacing="0" cellpadding="0" align="center"> 
 <tr> 
  <td class="tabTable">
   <a href="pm_welcome.asp<% = strQsSID1 %>" title="<% = strTxtPrivateMessenger %>" class="tabButton">&nbsp;<img src="<% = strImagePath %>messenger.<% = strForumImageType %>" border="0" alt="<% = strTxtPrivateMessenger %>" /> <% = strTxtMessenger %></a>
   <a href="pm_inbox.asp<% = strQsSID1 %>" title="<% = strTxtPrivateMessenger & " " & strTxtInbox %>" class="tabButton">&nbsp;<img src="<% = strImagePath %>inbox_messages.<% = strForumImageType %>" border="0" alt="<% = strTxtPrivateMessenger & " " & strTxtInbox %>" /> <% = strTxtInbox %></a>
   <a href="pm_outbox.asp<% = strQsSID1 %>" title="<% = strTxtPrivateMessenger & " " & strTxtOutbox %>" class="tabButtonActive">&nbsp;<img src="<% = strImagePath %>sent_messages.<% = strForumImageType %>" border="0" alt="<% = strTxtPrivateMessenger & " " & strTxtOutbox %>" /> <% = strTxtOutbox %></a>
   <a href="pm_new_message_form.asp<% = strQsSID1 %>" title="<% = strTxtNewPrivateMessage %>" class="tabButton">&nbsp;<img src="<% = strImagePath %>new_message.<% = strForumImageType %>" border="0" alt="<% = strTxtNewPrivateMessage %>" /> <% = strTxtNewMessage %></a>
  </td>
 </tr>
</table>
<table class="basicTable" cellspacing="0" cellpadding="3" align="center">
 <tr>
  <td align="right">&nbsp;<!-- #include file="includes/page_link_inc.asp" --></td>
 </tr>
</table>
<table cellspacing="1" cellpadding="3" class="tableBorder" align="center">
    <tr class="tableLedger">
     <td width="3%" align="center"><% = strTxtRead %></td>
     <td width="39%"><% = strTxtMessageTitle %></td>
     <td width="22%"><% = strTxtMessageTo %></td>
     <td width="31%"><% = strTxtDate %></td>
    </tr><%
    
'Check there are PM messages to display
If intNumOfPMs = 0 Then

	'If there are no pm messages to display then display the appropriate error message
	Response.Write(vbCrLf & "    <tr class=""tableRow""><td colspan=""4"" align=""center""><br />" & strTxtNoPrivateMessages & " " & strTxtOutbox & "<br /><br /></td></tr>")

'Else there the are topic's so write the HTML to display the topic names and a discription
Else 
	
	'Do....While Loop to loop through the recorset to display the forum members
	Do While intCurrentRecord < intEndPosition

		'If there are no member's records left to display then exit loop
		If intCurrentRecord >= intNumOfPMs Then Exit Do
			
			
			'SQL Query Array Look Up table
			'0 = PM_ID
			'1 = Author_ID
			'2 = PM_Tittle
			'3 = PM_Message_Date
			'4 = Read_Post
			'5 = Username
	%>
    <tr class="<% If (intCurrentRecord MOD 2 = 0 ) Then Response.Write("evenTableRow") Else Response.Write("oddTableRow") %>"> 
     <td align="center"><% 
      
     		If CBool(sarryPmMessage(4,intCurrentRecord)) = False Then
     			Response.Write("<img src=""" & strImagePath & "unread_mail." & strForumImageType & """ alt=""" & strTxtUnreadMessage & """ title=""" & strTxtUnreadMessage & """ />")
     		Else
     			Response.Write("<img src=""" & strImagePath & "read_mail." & strForumImageType & """ alt=""" & strTxtReadMessage & """ title=""" & strTxtReadMessage & """ />")
     		End If
     
     %></td>
     <td><% Response.Write("<a href=""pm_message.asp?ID=" & sarryPmMessage(0,intCurrentRecord) & "&M=OB" & strQsSID2 & """>" & formatInput(sarryPmMessage(2,intCurrentRecord)) & "</a>") %></td>
     <td><a href="member_profile.asp?PF=<% = sarryPmMessage(1,intCurrentRecord) & strQsSID2 %>" rel="nofollow"><% = sarryPmMessage(5,intCurrentRecord) %></a></td>
     <td nowrap><% Response.Write(DateFormat(sarryPmMessage(3,intCurrentRecord)) & " " & strTxtAt & " " & TimeFormat(sarryPmMessage(3,intCurrentRecord))) %></td>
    </tr><%
		
		'Move to the next record
		intCurrentRecord = intCurrentRecord + 1
					
	'Loop back round
	Loop
End If
%>
</table>
<table class="basicTable" cellspacing="0" cellpadding="3" align="center">
  <tr>
   <td><% Response.Write(strTxtMessagesInOutBox) %></td>
   <td align="right" nowrap><!-- #include file="includes/page_link_inc.asp" --></td>
  </tr>
  <tr>
   <td colspan="2"><img src="<% = strImagePath %>unread_mail.<% = strForumImageType %>" alt="<% = strTxtUnreadMessage %>" title="<% = strTxtUnreadMessage %>" /> <% = strTxtUnreadMessage %>&nbsp;&nbsp;<img src="<% = strImagePath %>read_mail.<% = strForumImageType %>" alt="<% = strTxtReadMessage %>" title="<% = strTxtReadMessage %>" /> <% = strTxtReadMessage %></td>
  </tr>
</table>
<br />
<table class="basicTable" cellspacing="0" cellpadding="3" align="center">
  <tr>
   <td><!-- #include file="includes/forum_jump_inc.asp" --></td>
  </tr>
</table>
<div align="center"><br /><%
 
'Clear server objects
Call closeDatabase()

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