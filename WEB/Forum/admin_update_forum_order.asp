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


'Update the category and forum order
If Request.Form("Submit") = "Update Order" Then
		
	'Initalise the strSQL variable with an SQL statement to query the database
	strSQL = "SELECT " & strDbTable & "Category.* From " & strDbTable & "Category ORDER BY " & strDbTable & "Category.Cat_order ASC;"
	
	'Query the database
	rsCommon.Open strSQL, adoCon
	
	'Loop through the rs to change the cat order
	Do While NOT rsCommon.EOF
	
		'Initilse sql statement
		 strSQL = "UPDATE " & strDbTable & "Category " & _
		"SET " & strDbTable & "Category.Cat_order = " & CInt(Request.Form("catOrder" & rsCommon("Cat_ID"))) & " " & _
		"WHERE " & strDbTable & "Category.Cat_ID=" & CInt(rsCommon("Cat_ID")) & ";"
		
		'Write to database
		adoCon.Execute(strSQL)
		
		'Move to the next record in the recordset
		rsCommon.MoveNext
	Loop
	
	'Close the recordset
	rsCommon.Close
	
	
	'Initalise the strSQL variable with an SQL statement to query the database
	strSQL = "SELECT " & strDbTable & "Forum.* From " & strDbTable & "Forum ORDER BY " & strDbTable & "Forum.Forum_Order ASC;"
	
	'Query the database
	rsCommon.Open strSQL, adoCon
	
	
	'Loop through rs to change the forums order
	Do While NOT rsCommon.EOF
		
		'Initilse sql statement
		 strSQL = "UPDATE " & strDbTable & "Forum " & _
		"SET " & strDbTable & "Forum.Forum_Order = " & CInt(Request.Form("forumOrder" & rsCommon("Forum_ID"))) & " " & _
		"WHERE " & strDbTable & "Forum.Forum_ID=" & CInt(rsCommon("Forum_ID")) & ";"
		
		'Write to database
		adoCon.Execute(strSQL)
		
		'Move to the next record in the recordset
		rsCommon.MoveNext
	Loop
	
	'Close the recordset
	rsCommon.Close	
End If
	
'Reset main server variables
Call closeDatabase()


'Return to the forum categories page
Response.Redirect("admin_view_forums.asp" & strQsSID1)
%>