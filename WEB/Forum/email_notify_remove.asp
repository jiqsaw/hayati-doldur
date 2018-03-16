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

'Declare variables
Dim laryWatchID		'Array to hold the ID number for each email noti to be deleted
Dim strMode		'Holds the mode of the page
Dim lngEmailUserID		'Holds the user ID to look at email notification for

'Read in the mode of the page
strMode = Trim(Mid(Request.QueryString("M"), 1, 1))


'If this is not an admin but in admin mode then see if the user is a moderator
If blnAdmin = False AND strMode = "A" AND blnModeratorProfileEdit Then
	
	'Initalise the strSQL variable with an SQL statement to query the database
        strSQL = "SELECT " & strDbTable & "Permissions.Moderate " & _
        "FROM " & strDbTable & "Permissions" & strDBNoLock & " " & _
        "WHERE " & strDbTable & "Permissions.Group_ID = " & intGroupID & " AND  " & strDbTable & "Permissions.Moderate = " & strDBTrue & ";"
               

        'Query the database
         rsCommon.Open strSQL, adoCon

        'If a record is returned then the user is a moderator in one of the forums
        If NOT rsCommon.EOF Then blnModerator = True

        'Clean up
        rsCommon.Close
End If


'Get the user ID of the email notifications to look at
If (blnAdmin OR (blnModerator AND CLng(Request.QueryString("PF")) > 2)) AND strMode = "A" Then
	
	lngEmailUserID = CLng(Request.QueryString("PF"))

'Get the logged in ID number
Else
	lngEmailUserID = lngLoggedInUserID
End If



'Run through till all checked email notifications are deleted
For each laryWatchID in Request.Form("chkDelete")
	
	'Delete
	strSQL = "DELETE FROM " & strDbTable & "EmailNotify " & strRowLock & " " & _
	"WHERE " & strDbTable & "EmailNotify.Watch_ID =" & CLng(laryWatchID) & " " & _
		"AND " & strDbTable & "EmailNotify.Author_ID=" & lngEmailUserID & ";"

	'Delete the threads
	adoCon.Execute(strSQL)
Next
	 
'Reset Server Variables
Call closeDatabase()

'Redirect back
Response.Redirect("email_notify_subscriptions.asp?" & Request.QueryString)
%>