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


'Dimension variables				
Dim strMode			'holds the mode of the page, set to true if changes are to be made to the database
Dim blnPrivateMessenger		'Set to true if the private messenger is on
Dim intPrivateMessages		'Holds the number of private msg's a user can have in there inbox
      

'Read in the users details for the forum
blnCalendar = CBool(Request.Form("calendar"))



If blnACode AND NOT strInstallID = "Adware" Then
	Call closeDatabase()
	Response.Redirect("admin_web_wiz_forums_premium.asp" & strQsSID1)
End If


	
'Initialise the SQL variable with an SQL statement to get the configuration details from the database
strSQL = "SELECT " & strDbTable & "Configuration.* From " & strDbTable & "Configuration WHERE " & strDbTable & "Configuration.ID=1;"


'Set the cursor type property of the record set to Forward Only
rsCommon.CursorType = 0

'Set the Lock Type for the records so that the record set is only locked when it is updated
rsCommon.LockType = 3

	
'Query the database
rsCommon.Open strSQL, adoCon

'If the user is changing tthe colours then update the database
If Request.Form("postBack") Then
	
	'Check the form ID to prevent XCSRF
	Call checkFormID(Request.Form("formID"))
	
	'Update the recordset
	With rsCommon
		If blnDemoMode = False Then
			.Fields("Calendar") = blnCalendar
					
			'Update the database with the new user's colours
			.Update
		End If
			
		'Re-run the query to read in the updated recordset from the database
		.Requery
	End With
	
	'Update variables
	Application.Lock
	
	Application(strAppPrefix & "blnCalendar") = CBool(blnCalendar)	
	
	'Empty the application level variable so that the changes made are seen in the main forum
	Application(strAppPrefix & "blnConfigurationSet") = false
	
	Application.UnLock
End If

'Read in the forum colours from the database
If NOT rsCommon.EOF Then
	
	'Read in the colour info from the database
	blnCalendar = CBool(rsCommon("Calendar"))
End If


'Reset Server Objects
rsCommon.Close
Call closeDatabase()
%>
<!-- #include file="includes/browser_page_encoding_inc.asp" -->
<title>Calendar Settings</title>
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
  <h1>Calendar Settings </h1> 
  <br />
    <a href="admin_menu.asp<% = strQsSID1 %>">Control Panel Menu</a><br />
    <br />
    From here you can  enable the Events Calendar. <br />
    <br />
</div>
<form action="admin_calendar_configuration.asp<% = strQsSID1 %>" method="post" name="frmPMCal" id="frmPMCal">
  <table border="0" align="center" cellpadding="4" cellspacing="1" class="tableBorder">
    <tr>
      <td colspan="2" class="tableLedger">Events Calendar </td>
    </tr>
    <tr>
     <td width="57%" class="tableRow">Events Calendar:<br />
       <span class="smText">This allows enables the 'Events Calendar' within your forum, to display community events.</span></td>
     <td width="43%" valign="top" class="tableRow">On
      <input type="radio" name="calendar" value="True" <% If blnCalendar = True Then Response.Write "checked" %><% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> />
      &nbsp;&nbsp;Off
      <input type="radio" value="False" <% If blnCalendar = False Then Response.Write "checked" %> name="calendar"<% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> /></td>
    </tr>
    <tr align="center">
      <td colspan="2" class="tableBottomRow">
          <input type="hidden" name="postBack" value="true" />
          <input type="hidden" name="formID" id="formID" value="<% = getSessionItem("KEY") %>" />
          <input type="submit" name="Submit" value="Update Settings" />
          <input type="reset" name="Reset" value="Reset Form" />      </td>
    </tr>
  </table>
</form>
<br />
<!-- #include file="includes/admin_footer_inc.asp" -->
