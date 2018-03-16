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




'Set the response buffer to true
Response.Buffer = True


'If in demo mode redirect
If blnDemoMode Then
	
	Call closeDatabase()
	Response.Redirect("admin_web_wiz_forums_premium.asp" & strQsSID1)
End If


'Dimension variables
Dim blnLocked		'Set to true if the forums are locked

'Read in the details from the form
blnLocked = CBool(Request.Form("lock"))



'Initialise the SQL variable with an SQL statement to get the configuration details from the database
strSQL = "SELECT " & strDbTable & "Configuration.* From " & strDbTable & "Configuration WHERE " & strDbTable & "Configuration.ID = 1;"

'Set the cursor type property of the record set to Forward Only
rsCommon.CursorType = 0

'Set the Lock Type for the records so that the record set is only locked when it is updated
rsCommon.LockType = 3

'Query the database
rsCommon.Open strSQL, adoCon

'If the user is changing changing the lock status then update the database
If Request.Form("postBack") Then
	
	'Check the form ID to prevent XCSRF
	Call checkFormID(Request.Form("formID"))

	With rsCommon
		'Update the recordset
		.Fields("Forums_closed") = blnLocked	
	
		'Update the database
		.Update
	
		'Re-run the query to read in the updated recordset from the database
		.Requery
	End With
	
	'Update the application variable
	Application(strAppPrefix & "blnForumClosed") = blnLocked
	
	'Empty the application level variable so that the changes made are seen in the main forum
	Application(strAppPrefix & "blnConfigurationSet") = false
End If

'Read in the deatils from the database
If NOT rsCommon.EOF Then

	'Read in the open forum status from the db
	blnLocked = CBool(rsCommon("Forums_closed"))
End If


'Release Server Objects
rsCommon.Close
Call closeDatabase()
%>
<!-- #include file="includes/browser_page_encoding_inc.asp" -->
<title>Security Lock Down</title>
<meta name="generator" content="Web Wiz Forums" />
<%
'***** START WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
Response.Write("<!--//" & _
vbCrLf & "/* *******************************************************" & _
vbCrLf & "Software: Web Wiz Forums(TM) ver. " & strVersion & "" & _
vbCrLf & "Info: http://www.webwizforums.com" & _
vbCrLf & "Copyright: (C)2001-2010 Web Wiz(TM). All rights reserved" & _
vbCrLf & "******************************************************* */" & _
vbCrLf & "//-->" & vbCrLf & vbCrLf)
'***** END WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
%>
<!-- #include file="includes/admin_header_inc.asp" -->
<div align="center">
  <h1>Security Lock Down </h1>
  <br />
    <a href="admin_menu.asp<% = strQsSID1 %>">Control Panel Menu</a><br />
    <br />
From here you can Lock Down the Board, this is useful for maintenance or if your forum comes under attack.
</p>
<br />
<br />
<table border="0" align="center" cellpadding="4" cellspacing="1" class="tableBorder">
    <tr>
      <td align="center" class="tableLedger"> Important - Please Read First!</td>
    </tr>
    <tr>
      <td class="tableRow" align="left">If you Lock the Forums the entire board will be locked and anyone entering any part of the board will receive the message, <em>'Sorry, the forums are presently 
          closed for maintenance'</em>.<br />
          <br />
          This will mean no-one will be able to register, post messages, send private messages, or even login.<br />
          <br />
          This will also mean that if you logout of this admin area <span>you will NOT be able to login through the main forum</span>.<br />
          <br />
          To log back into the admin area to un-lock the forums, point your browser the <strong>admin.asp</strong> file to be able to login into this admin area. </td>
    </tr>
  </table>
</div>
<br />
<form action="admin_close_forums.asp<% = strQsSID1 %>" method="post" name="frmLock" id="frmLock">
  <table border="0" align="center" cellpadding="4" cellspacing="1" class="tableBorder">
    <tr align="left">
      <td colspan="2" class="tableLedger">Lock Forums </td>
    </tr>
    <tr>
      <td width="59%"  height="7" align="left" class="tableRow">Lock Forums<br />
      <span class="smText">Please read the instructions at the top of the page for further info on logging back in to un-lock the forums.</span></td>
      <td width="41%" height="7" valign="top" class="tableRow">Locked
        <input type="radio" name="lock" value="True" <% If blnLocked = True Then Response.Write "checked" %> />
        &nbsp; &nbsp;Un-Locked
        <input type="radio" name="lock" value="False" <% If blnLocked = False Then Response.Write "checked" %> />
      </td>
    </tr>
    <tr align="center">
      <td height="2" colspan="2" valign="top" class="tableBottomRow" >
          <input type="hidden" name="postBack" value="true" />
          <input type="hidden" name="formID" id="formID" value="<% = getSessionItem("KEY") %>" />
          <input type="submit" name="Submit" value="Submit" />
      </td>
    </tr>
  </table>
</form>
<br />
<br />
<!-- #include file="includes/admin_footer_inc.asp" -->
