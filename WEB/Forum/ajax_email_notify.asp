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


'Make sure this page is not cached
Response.Expires = -1
Response.ExpiresAbsolute = Now() - 2
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "No-Store"



Dim lngTopicID
Dim lngTotalRecordsPages



'If the user is not allowed then send them away
If intGroupID = 2 OR blnActiveMember = False Then 
	
	'Clean up
	Call closeDatabase()
	
	'Redirect
	Response.Redirect("insufficient_permission.asp" & strQsSID1)
End If


'Read in the required details
lngTopicID = CLng(Request.QueryString("TID"))
lngTotalRecordsPages = CLng(Request.QueryString("PN"))
intForumID = CInt(Request.QueryString("FID"))


'Display a link to watch or un-watch this topic if email notification is enabled
If blnEmail AND blnLoggedInUserEmail AND intGroupID <> 2 Then
	
	'If this is a topic run the code below
	If lngTopicID Then
	
		'Initalise the SQL string with a query to get the email notify topic details
		strSQL = "SELECT " & strDbTable & "EmailNotify.*  " & _
		"FROM " & strDbTable & "EmailNotify" & strRowLock & " " & _
		"WHERE " & strDbTable & "EmailNotify.Author_ID = " & lngLoggedInUserID & " AND " & strDbTable & "EmailNotify.Topic_ID = " & lngTopicID & ";"
		
		'Query the database
		rsCommon.Open strSQL, adoCon
		
		'If no record
		If rsCommon.EOF Then
			Response.Write("<a href=""email_notify.asp?TID=" & lngTopicID & "&PN=" & lngTotalRecordsPages & strQsSID2 & """><div>" & strTxtWatchThisTopic & "</div></a>")
		Else
			Response.Write("<a href=""email_notify.asp?TID=" & lngTopicID & "&PN=" & lngTotalRecordsPages & strQsSID2 & """><div>" & strTxtUn & strTxtWatchThisTopic & "</div></a>")
		End If
		
		'Close rs
		rsCommon.Close
	End If
	
	'If this is a forum run the code below
	If intForumID Then
	
		'Initalise the SQL string with a query to get the email notify forum details
		strSQL = "SELECT " & strDbTable & "EmailNotify.*  " & _
		"FROM " & strDbTable & "EmailNotify" & strRowLock & " " & _
		"WHERE " & strDbTable & "EmailNotify.Author_ID = " & lngLoggedInUserID & " AND " & strDbTable & "EmailNotify.Forum_ID = " & intForumID & ";"
	
		'Query the database
		rsCommon.Open strSQL, adoCon
		
		'If no record
		If rsCommon.EOF Then
			Response.Write("<a href=""email_notify.asp?FID=" & intForumID & "&PN=" & lngTotalRecordsPages & strQsSID2 & """><div>" & strTxtWatchThisForum & "</div></a>")
		Else
			Response.Write("<a href=""email_notify.asp?FID=" & intForumID & "&PN=" & lngTotalRecordsPages & strQsSID2 & """><div>" & strTxtUn & strTxtWatchThisForum & "</div></a>")
		End If
		
		'Close rs
		rsCommon.Close
	End If
End If
		
	
'Clean up
Call closeDatabase()


%>