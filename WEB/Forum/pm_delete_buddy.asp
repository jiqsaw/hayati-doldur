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

'Clean up
Set rsCommon = Nothing

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

'Delete the topic from the database	
'Initalise the strSQL variable with an SQL statement to get the topic from the database
strSQL = "DELETE FROM " & strDbTable & "BuddyList " & strRowLock & " " & _
"WHERE (((" & strDbTable & "BuddyList.Author_ID)="  & lngLoggedInUserID & " ) " & _
	" AND ((" & strDbTable & "BuddyList.Address_ID)= " & CLng(Request.QueryString("pm_id")) & "));"
		
'Delete the message from the database
adoCon.Execute(strSQL)

'Reset Server Objects
Call closeDatabase()

'Return to the page showing the threads
Response.Redirect("pm_buddy_list.asp" & strQsSID1)
%>