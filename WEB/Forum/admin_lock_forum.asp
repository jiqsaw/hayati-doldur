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



'Set the response buffer to true as we maybe redirecting
Response.Buffer = True 



'If in demo mode redirect
If blnDemoMode Then
	Call closeDatabase()
	Response.Redirect("admin_web_wiz_forums_premium.asp" & strQsSID1)
End If


'Dimension variables
Dim strMode


'Check the session key ID to prevent XCSRF
Call checkFormID(Request.QueryString("XID"))


strMode = Request.QueryString("mode")


'Read in the message ID number to be deleted
intForumID = CLng(Request.QueryString("FID"))


'Get the Forum from the database to be locked
If strMode = "Lock" Then
	strSQL = "UPDATE " & strDbTable & "Forum" & strRowLock & " " & _
	"SET " & strDbTable & "Forum.Locked = " & strDBTrue & " " & _
	"WHERE " & strDbTable & "Forum.Forum_ID ="  & intForumID & ";"
'Unlock forum
ElseIf strMode = "UnLock" Then
	strSQL = "UPDATE " & strDbTable & "Forum" & strRowLock & " " & _
	"SET " & strDbTable & "Forum.Locked = " & strDBFalse & " " & _
	"WHERE " & strDbTable & "Forum.Forum_ID ="  & intForumID & ";"
End If

'Write to the database
adoCon.Execute(strSQL)



'Reset Server Objects
Call closeDatabase()


Response.Redirect("admin_view_forums.asp" & strQsSID1)
%>