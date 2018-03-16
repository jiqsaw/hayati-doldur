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



'Set the response buffer to true
Response.Buffer = True 




'If the user is user is using a banned IP redirect to an error page
If bannedIP() OR  blnActiveMember = False OR blnBanned Then
	'Clean up
	Call closeDatabase()

	'Redirect
	Response.Redirect("insufficient_permission.asp" & strQsSID3)
End If


'Call the moderator function and see if the user is a moderator
If blnAdmin = False Then blnModerator = isModerator(intForumID, intGroupID)


'If the user is not a moderator or admin then keck em
If blnAdmin = False AND blnModerator = False Then
	
	'Clean up
	Call closeDatabase()

	'Redirect
	Response.Redirect("insufficient_permission.asp" & strQsSID1)
End If



'Read in the forum ID
intForumID = IntC(Request.QueryString("FID"))



'Update topic and post count
updateForumStats(intForumID)
	


'Reset server objects
Call closeDatabase()


'Redierct back
Response.Redirect("forum_topics.asp?FID=" & intForumID & strQsSID3)
%>