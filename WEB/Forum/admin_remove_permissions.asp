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


'Dimension variables
Dim lngMemberID		'Holds the member ID number
Dim strMode		'Hols the page mode


'Check the session key ID to prevent XCSRF
Call checkFormID(Request.QueryString("XID"))


'Read in the details
intForumID = CInt(Request("FID"))
lngMemberID = CLng(Request("UID"))


'User Permission only delete the user permimissons
'Delete the user permissions for forums form the database
strSQL = "DELETE FROM " & strDbTable & "Permissions WHERE " & strDbTable & "Permissions.Forum_ID=" & intForumID & " AND " & strDbTable & "Permissions.Author_ID = " & lngMemberID & ";"


'Write to database
adoCon.Execute(strSQL)
	



'Reset Server Objects
Call closeDatabase()


'Return to the forum user permisisons
Response.Redirect("admin_user_permissions.asp?UID=" & lngMemberID & strQsSID3)

%>