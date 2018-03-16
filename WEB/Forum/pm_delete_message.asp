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


Dim laryMesageID 	'Holds the message id number




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



'If this is delete all then delete all messages
If Request.Form("delAll") <> "" Then
	
	'Delete the PM from the database	
	'Initalise the strSQL variable
	strSQL = "DELETE FROM " & strDbTable & "PMMessage " & _
	"WHERE (" & strDbTable & "PMMessage.Author_ID="  & lngLoggedInUserID & " );"
			
	'Delete the message from the database
	adoCon.Execute(strSQL)
	
End If


'If this is deleting only the selected ones then  do so
If Request.Form("delSel") <> "" Then
	
	'Run through till all checked messages are deleted
	For each laryMesageID in Request.Form("chkDelete")
	
		'Delete the PM from the database	
		'Initalise the strSQL variable
		strSQL = "DELETE FROM " & strDbTable & "PMMessage " & strRowLock & " " & _
		"WHERE (((" & strDbTable & "PMMessage.Author_ID)="  & lngLoggedInUserID & " ) " & _
			"AND ((" & strDbTable & "PMMessage.PM_ID)= " & CLng(laryMesageID) & "));"
				
		'Delete the message from the database
		adoCon.Execute(strSQL)
	Next
End If

'This delete is for the delete button on the show pm page
If Request.QueryString("pm_id") <> "" Then
	
	'Delete the topic from the database	
	'Initalise the strSQL variable with an SQL statement to get the topic from the database
	strSQL = "DELETE FROM " & strDbTable & "PMMessage " & strRowLock & " " & _
	"WHERE (((" & strDbTable & "PMMessage.Author_ID)="  & lngLoggedInUserID & " )  " & _
		"AND ((" & strDbTable & "PMMessage.PM_ID)= " & CLng(Request.QueryString("pm_id")) & "));"
			
	'Delete the message from the database
	adoCon.Execute(strSQL)
End If


'Update the number of unread PM's 
Call updateUnreadPM(lngLoggedInUserID)
	
	
'Update the notified PM session variable
If intNoOfPms = 0 Then
	Call saveSessionItem("PMN", "")
Else
	Call saveSessionItem("PMN", intNoOfPms)
End If


'Reset Server Objects
Call closeDatabase()


'Return to the page showing the threads
Response.Redirect("pm_inbox.asp?MSG=DEL" & strQsSID3)
%>