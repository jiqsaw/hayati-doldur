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


'dimension variables
Dim lngMemberID	'Holds the member Id to delete
Dim strReturn	'Holds the return page mode

'Check the session key ID to prevent XCSRF
Call checkFormID(Request.QueryString("XID"))

'Intilise variables
strReturn = "UPD"


'Read in the member ID to delete
lngMemberID = CLng(Request.QueryString("MID"))


'If the ID number passed across is numeric then delete the member
If isNumeric(lngMemberID) Then
	
	'Make sure we are not trying to delete the admin or guest account
	If lngMemberID > 2 Then
	
		'Delete the members buddy list
		'Initalise the strSQL variable with an SQL statement
		strSQL = "DELETE FROM " & strDbTable & "BuddyList WHERE (Author_ID = "  & lngMemberID & ") OR (Buddy_ID ="  & lngMemberID & ")"
		
		'Write to database
		adoCon.Execute(strSQL)	
		
		
		'Delete the members private msg's
		strSQL = "DELETE FROM " & strDbTable & "PMMessage WHERE (Author_ID ="  & lngMemberID & ")"
			
		'Write to database
		adoCon.Execute(strSQL)	
		
		
		'Delete the members private msg's
		strSQL = "DELETE FROM " & strDbTable & "PMMessage WHERE (From_ID = "  & lngMemberID & ")"
			
		'Write to database
		adoCon.Execute(strSQL)
		
		
		'Set all the users private messages to Guest account
		strSQL = "UPDATE " & strDbTable & "PMMessage SET From_ID = 2 WHERE (From_ID = "  & lngMemberID & ")"
			
		'Write to database
		adoCon.Execute(strSQL)
		
		
		'Set all the users posts to the Guest account
		strSQL = "UPDATE " & strDbTable & "Thread SET Author_ID = 2 WHERE (Author_ID = "  & lngMemberID & ")"
			
		'Write to database
		adoCon.Execute(strSQL)
		
		
		'Set froums stats to the Guest account
		strSQL = "UPDATE " & strDbTable & "Forum SET Last_post_author_ID = 2 WHERE (Last_post_author_ID = "  & lngMemberID & ")"
			
		'Write to database
		adoCon.Execute(strSQL)
				
		
		'Delete the user from the email notify table
		strSQL = "DELETE FROM " & strDbTable & "EmailNotify WHERE (Author_ID = "  & lngMemberID & ")"
			
		'Write to database
		adoCon.Execute(strSQL)
		
		
		'Delete the user from forum permissions table
		strSQL = "DELETE FROM " & strDbTable & "Permissions WHERE (Author_ID = "  & lngMemberID & ")"
			
		'Write to database
		adoCon.Execute(strSQL)
		
		
		'Finally we can now delete the member from the forum
		strSQL = "DELETE FROM " & strDbTable & "Author WHERE (Author_ID = "  & lngMemberID & ")"
			
		'Write to database
		adoCon.Execute(strSQL)
		
		'Return page mode
		strReturn = "DEL"
	End If	
End If

'Reset main server variables
Call closeDatabase()

'Return to forum
Response.Redirect("admin_select_members.asp" & strQsSID1)
%>