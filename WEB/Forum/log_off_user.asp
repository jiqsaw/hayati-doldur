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




Response.Buffer = True

Dim strUserCode		'Holds the users usercode

'If the user is logged in run the code below
If lngLoggedInUserID > 0 AND Request.QueryString("XID") = getSessionItem("KEY") Then
	
	'Clear the forum cookie on the users system so the user is no longer logged in
	clearCookie()
	Call saveSessionItem("UID", "")
	Call saveSessionItem("AID", "")
	
	
	
	'For extra security create a new user code for the user (if member account is active and windows authentication is disabled)
	If blnActiveMember AND blnWindowsAuthentication = False Then
	
		'Initalise the strSQL variable with an SQL statement to query the database
		strSQL = "SELECT " & strDbTable & "Author.User_code " & _
		"FROM " & strDbTable & "Author" & strRowLock & " " & _
		"WHERE " & strDbTable & "Author.Author_ID = " & lngLoggedInUserID & ";"
		
		'Set the Lock Type for the records so that the record set is only locked when it is updated
		rsCommon.LockType = 3
		
		'Query the database
		rsCommon.Open strSQL, adoCon
		
		'Get the present usercode
		strUserCode = rsCommon("User_code")
			
		'For extra security create a new user code for the user
		strUserCode = userCode(strLoggedInUsername)
		
					
		'Save the new usercode back to the database
		rsCommon.Fields("User_code") = strUserCode
		rsCommon.Update
		
		'Close recordset
		rsCommon.Close
	End If
	
	
	'If the members API is active
	If blnMemberAPI = True Then
		
		'Destroy member API login variables
		Session("USER") = ""
		Session("PASSWORD") = ""
		Session("EMAIL") = ""
		
		'If a logout URL has been enetered for the websites onw logout system redirect to it
		If strMemberAPILogoutURL <> "" Then Response.Redirect(strMemberAPILogoutURL)
	End If
End If


'Reset Server Objects
Call closeDatabase()


'Redirect using 301 Moved Permanently header so that search engines do not index this file
Response.Status = "301 Moved Permanently"
Response.AddHeader "Location", "default.asp"
Response.End


%>