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
Dim strMode		'Holds the mode of the page, set to true if changes are to be made to the database
Dim blnSuspended	'Set to true if new registrations are suspended

'Read in the details from the form
blnSuspended = CBool(Request.Form("sus"))
strMode = Request.Form("mode")



'Initialise the SQL variable with an SQL statement to get the configuration details from the database
strSQL = "SELECT " & strDbTable & "Configuration.* From " & strDbTable & "Configuration WHERE " & strDbTable & "Configuration.ID = 1;"

'Set the cursor type property of the record set to Forward Only
rsCommon.CursorType = 0

'Set the Lock Type for the records so that the record set is only locked when it is updated
rsCommon.LockType = 3

'Query the database
rsCommon.Open strSQL, adoCon

'If the user is changing changing the lock status then update the database
If strMode = "postBack" Then
	
	'Check the form ID to prevent XCSRF
	Call checkFormID(Request.Form("formID"))

	With rsCommon
		'Update the recordset
		.Fields("Reg_closed") = blnSuspended	
	
		'Update the database
		.Update
	
		'Re-run the query to read in the updated recordset from the database
		.Requery
	End With
	
	'Update the application variable
	Application(strAppPrefix & "blnRegistrationSuspeneded") = blnSuspended	
	
	'Empty the application level variable so that the changes made are seen in the main forum
	Application(strAppPrefix & "blnConfigurationSet") = false
End If

'Read in the deatils from the database
If NOT rsCommon.EOF Then

	'Read in the reg suspend status form the db
	blnSuspended = CBool(rsCommon("Reg_closed"))
End If


'Release Server Objects
rsCommon.Close
Call closeDatabase()
%>
<!-- #include file="includes/browser_page_encoding_inc.asp" -->
<title>Suspend New Registrations</title>
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
 <h1>Suspend New Registrations</h1><br />
  <a href="admin_menu.asp<% = strQsSID1 %>">Control Panel Menu</a><br />
  <br>
  From here you suspend new sign up's so no new users can register to use the forum.</p>
  <br />
  <br />
</div>
<form method="post" name="frmSus" action="admin_suspend_registration.asp<% = strQsSID1 %>">
  <table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" class="tableBorder">
    <tr align="left">
      <td colspan="2" class="tableLedger">Suspend Registeration </td>
    </tr>
    <tr>
      <td width="59%"  height="7" align="left" class="tableRow">Suspend New Registrations</td>
      <td width="41%" height="7" valign="top" class="tableRow">Yes
        <input type="radio" name="sus" value="True" <% If blnSuspended = True Then Response.Write "checked" %> />
        &nbsp; No
        <input type="radio" name="sus" value="False" <% If blnSuspended = False Then Response.Write "checked" %> />
      </td>
    </tr>
    <tr align="center">
      <td height="2" colspan="2" valign="top" class="tableBottomRow" >
          <input type="hidden" name="mode" value="postBack" />
          <input type="hidden" name="formID" id="formID" value="<% = getSessionItem("KEY") %>" />
          <input type="submit" name="Submit" value="Submit" />
      </td>
    </tr>
  </table>
</form>
<br />
<!-- #include file="includes/admin_footer_inc.asp" -->