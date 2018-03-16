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



      

'Read in the users colours for the forum
intSpamTimeLimitSeconds = CInt(Request.Form("seconds"))
intSpamTimeLimitMinutes = CInt(Request.Form("minutes"))

	
'Initalise the strSQL variable with an SQL statement to query the database
strSQL = "SELECT " & strDbTable & "Configuration.* From " & strDbTable & "Configuration WHERE " & strDbTable & "Configuration.ID = 1;"

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
	rsCommon.Fields("Spam_seconds") = intSpamTimeLimitSeconds
	rsCommon.Fields("Spam_minutes") = intSpamTimeLimitMinutes
				
	'Update the database with the new user's colours
	rsCommon.Update
		
	'Re-run the query to read in the updated recordset from the database
	rsCommon.Requery
	
	'Empty the application level variable so that the changes made are seen in the main forum
	Application(strAppPrefix & "blnConfigurationSet") = false	
End If

'Read in the forum colours from the database
If NOT rsCommon.EOF Then
	
	'Read in the colour info from the database
	intSpamTimeLimitSeconds = CInt(rsCommon.Fields("Spam_seconds"))
	intSpamTimeLimitMinutes = CInt(rsCommon.Fields("Spam_minutes"))
End If


'Reset Server Objects
rsCommon.Close
Call closeDatabase()
%>
<!-- #include file="includes/browser_page_encoding_inc.asp" -->
<title>Flood Control Configuration</title>
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
<div align="center"><h1>Flood Control Configuration</h1><br />
  <a href="admin_menu.asp<% = strQsSID1 %>">Control Panel Menu</a><br />
  <br />
  <span class="text">The Flood Control measures are to stop a spammer going on a spree and posting thousands of useless or abusive messages on your forum in a matter of minutes. The higher you set these times 
  the harder it is for a spammer, but bewared set them to high and you may block legitimate forum users.</span></div>
<br />
<form action="admin_spam_configure.asp<% = strQsSID1 %>" method="post" name="frmConfiguration" id="frmConfiguration">
  <table border="0" align="center" cellpadding="4" cellspacing="1" class="tableBorder">
    <tr>
      <td colspan="2" align="left" class="tableLedger">Flood Control  Configuration</td>
    </tr>
    <tr>
      <td align="left" class="tableRow">Time Interval Between Posts:<br />
        <span class="smText">This how long a forum member needs to wait before posting a new post.<br />
        If this is set to high it will stop forum members from posting another post straight after their last post if they suddenly realize they forgot to mention something.</span></td>
      <td valign="top" class="tableRow"><select name="seconds">
          <option value="0" <% If intSpamTimeLimitSeconds = 0 Then Response.Write("selected") %>>Off</option>
          <option value="10" <% If intSpamTimeLimitSeconds = 10 Then Response.Write("selected") %>>10 Seconds</option>
          <option value="15" <% If intSpamTimeLimitSeconds = 15 Then Response.Write("selected") %>>15 Seconds</option>
          <option value="20" <% If intSpamTimeLimitSeconds = 20 Then Response.Write("selected") %>>20 Seconds</option>
          <option value="25" <% If intSpamTimeLimitSeconds = 25 Then Response.Write("selected") %>>25 Seconds</option>
          <option value="30" <% If intSpamTimeLimitSeconds = 30 Then Response.Write("selected") %>>30 Seconds</option>
          <option value="45" <% If intSpamTimeLimitSeconds = 45 Then Response.Write("selected") %>>45 Seconds</option>
          <option value="60" <% If intSpamTimeLimitSeconds = 60 Then Response.Write("selected") %>>1 minute</option>
        </select>
      </td>
    </tr>
    <tr>
      <td align="left" class="tableRow">A Forum Member can Post a Maximum of 5 Posts In:<br />
        <span class="smText">This is the amount of time a Forum Member can post 5 Posts, once this is reached the forum member will have to wait till at least one of their 5 posts is is no longer in this time 
        limit.</span></td>
      <td valign="top" class="tableRow"><select name="minutes">
          <option value="0" <% If intSpamTimeLimitMinutes = 0 Then Response.Write(" selected") %>>Off</option>
          <option value="1" <% If intSpamTimeLimitMinutes = 1 Then Response.Write(" selected") %>>1 minute</option>
          <option value="2" <% If intSpamTimeLimitMinutes = 2 Then Response.Write(" selected") %>>2 minutes</option>
          <option value="3" <% If intSpamTimeLimitMinutes = 3 Then Response.Write(" selected") %>>3 minutes</option>
          <option value="4" <% If intSpamTimeLimitMinutes = 4 Then Response.Write(" selected") %>>4 minutes</option>
          <option value="5" <% If intSpamTimeLimitMinutes = 5 Then Response.Write(" selected") %>>5 minutes</option>
          <option value="6" <% If intSpamTimeLimitMinutes = 6 Then Response.Write(" selected") %>>6 minutes</option>
          <option value="7" <% If intSpamTimeLimitMinutes = 7 Then Response.Write(" selected") %>>7 minutes</option>
          <option value="8" <% If intSpamTimeLimitMinutes = 8 Then Response.Write(" selected") %>>8 minutes</option>
          <option value="9" <% If intSpamTimeLimitMinutes = 9 Then Response.Write(" selected") %>>9 minutes</option>
          <option value="10" <% If intSpamTimeLimitMinutes = 10 Then Response.Write(" selected") %>>10 minutes</option>
          <option value="15" <% If intSpamTimeLimitMinutes = 15 Then Response.Write(" selected") %>>15 minutes</option>
          <option value="20" <% If intSpamTimeLimitMinutes = 20 Then Response.Write(" selected") %>>20 minutes</option>
          <option value="25" <% If intSpamTimeLimitMinutes = 25 Then Response.Write(" selected") %>>25 minutes</option>
          <option value="30" <% If intSpamTimeLimitMinutes = 30 Then Response.Write(" selected") %>>30 minutes</option>
          <option value="40" <% If intSpamTimeLimitMinutes = 40 Then Response.Write(" selected") %>>40 minutes</option>
          <option value="50" <% If intSpamTimeLimitMinutes = 50 Then Response.Write(" selected") %>>50 minutes</option>
          <option value="60" <% If intSpamTimeLimitMinutes = 60 Then Response.Write(" selected") %>>1 hour</option>
        </select>
      </td>
    </tr>
    <tr align="center">
      <td colspan="2" valign="top" class="tableBottomRow">
          <input type="hidden" name="postBack" value="true" />
          <input type="submit" name="Submit" value="Update Flood Control" />
          <input type="hidden" name="formID" id="formID" value="<% = getSessionItem("KEY") %>" />
          <input type="reset" name="Reset" value="Reset Form" />
      </td>
    </tr>
  </table>
</form>
<br />
<table border="0" align="center" cellpadding="4" cellspacing="1" class="tableBorder">
    <tr>
      <td colspan="2" align="left" class="tableLedger">Please Note</td>
    </tr>
    <tr>
      <td align="left" class="tableRow">
      The Flood Control measures do not affect the admin accounts, so you can still post as many messages as you like.<br />
  <br />
  <strong>Guest Account Enabled: -</strong> If you have Guest posting enabled then you have no protection against a spammer.<br />
  <br />
  <strong>These measures are not fool proof but should make it harder for a spammer to attack your forum.</strong><br />
      </td>
    </tr>
  </table>
 <br />
<!-- #include file="includes/admin_footer_inc.asp" -->
