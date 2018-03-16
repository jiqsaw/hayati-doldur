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
blnPrivateMessenger = CBool(Request.Form("privateMsg"))
intPrivateMessages = CInt(Request.Form("pmNo"))
intPmFlood = CInt(Request.Form("PmFlood"))


	
'Initialise the SQL variable with an SQL statement to get the configuration details from the database
strSQL = "SELECT " & strDbTable & "Configuration.* From " & strDbTable & "Configuration WHERE " & strDbTable & "Configuration.ID=1;"


'Set the cursor type property of the record set to Forward Only
rsCommon.CursorType = 0

'Set the Lock Type for the records so that the record set is only locked when it is updated
rsCommon.LockType = 3

	
'Query the database
rsCommon.Open strSQL, adoCon

If (blnACode AND NOT strInstallID = "Adware") Then intPrivateMessages = 5

'If the user is changing tthe colours then update the database
If Request.Form("postBack") Then
	
	'Check the form ID to prevent XCSRF
	Call checkFormID(Request.Form("formID"))
	
	'Update the recordset
	With rsCommon
		If blnDemoMode = False Then
			.Fields("Private_msg") = blnPrivateMessenger
			.Fields("No_of_priavte_msg") = intPrivateMessages
			.Fields("PM_Flood") = intPmFlood
					
			'Update the database with the new user's colours
			.Update
		End If
			
		'Re-run the query to read in the updated recordset from the database
		.Requery
	End With
	
	'Update variables
	Application.Lock
	
	Application(strAppPrefix & "blnPrivateMessages") = blnPrivateMessenger
	Application(strAppPrefix & "intNumPrivateMessages") = intPrivateMessages
	Application(strAppPrefix & "intPmFlood") = CInt(intPmFlood)	
	
	'Empty the application level variable so that the changes made are seen in the main forum
	Application(strAppPrefix & "blnConfigurationSet") = false
	
	Application.UnLock
End If

'Read in the forum colours from the database
If NOT rsCommon.EOF Then
	
	'Read in the colour info from the database
	blnPrivateMessenger = rsCommon.Fields("Private_msg")
	intPrivateMessages = rsCommon.Fields("No_of_priavte_msg")
	intPmFlood = Cint(rsCommon("PM_Flood"))
End If


If (blnACode AND NOT strInstallID = "Adware") Then intPrivateMessages = 5

'Reset Server Objects
rsCommon.Close
Call closeDatabase()
%>
<!-- #include file="includes/browser_page_encoding_inc.asp" -->
<title>Private Messaging Settings</title>
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
  <h1>Private Messaging  Settings </h1> 
  <br />
    <a href="admin_menu.asp<% = strQsSID1 %>">Control Panel Menu</a><br />
    <br />
    From here you can configure the Private Messaging system. <br />
    <br />
</div>
<form action="admin_pm_configuration.asp<% = strQsSID1 %>" method="post" name="frmPMCal" id="frmPMCal">
  <table border="0" align="center" cellpadding="4" cellspacing="1" class="tableBorder">
    <tr>
      <td colspan="2" class="tableLedger">Private Messenger</td>
    </tr>
    <tr>
      <td width="57%" class="tableRow">Private Messenger:<br />
      <span class="smText">If this is disabled your members will no longer be able to use the Private Messenger to send and receive Private Messages.</span></td>
      <td width="43%" valign="top" class="tableRow">On
        <input type="radio" name="privateMsg" value="True" <% If blnPrivateMessenger = True Then Response.Write "checked" %><% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> />
        &nbsp;&nbsp;Off
        <input type="radio" value="False" <% If blnPrivateMessenger = False Then Response.Write "checked" %> name="privateMsg"<% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> />      </td>
    </tr>
    <tr>
     <td class="tableRow">Number of Private Messages Per Member:<br />
      <span class="smText">This is the number of Private Messages a member can have in there 'inbox' at any one time.</span></td>
     <td valign="top" class="tableRow"><select name="pmNo" id="pmNo"<% If blnDemoMode OR (blnACode AND NOT strInstallID = "Adware") Then Response.Write(" disabled=""disabled""") %>>
      <option<% If intPrivateMessages = 5 Then Response.Write(" selected") %>>5</option>
      <option<% If intPrivateMessages = 10 Then Response.Write(" selected") %>>10</option>
      <option<% If intPrivateMessages = 15 Then Response.Write(" selected") %>>15</option>
      <option<% If intPrivateMessages = 20 Then Response.Write(" selected") %>>20</option>
      <option<% If intPrivateMessages = 25 Then Response.Write(" selected") %>>25</option>
      <option<% If intPrivateMessages = 30 Then Response.Write(" selected") %>>30</option>
      <option<% If intPrivateMessages = 35 Then Response.Write(" selected") %>>35</option>
      <option<% If intPrivateMessages = 40 Then Response.Write(" selected") %>>40</option>
      <option<% If intPrivateMessages = 45 Then Response.Write(" selected") %>>45</option>
      <option<% If intPrivateMessages = 50 Then Response.Write(" selected") %>>50</option>
      <option<% If intPrivateMessages = 60 Then Response.Write(" selected") %>>60</option>
      <option<% If intPrivateMessages = 70 Then Response.Write(" selected") %>>70</option>
      <option<% If intPrivateMessages = 80 Then Response.Write(" selected") %>>80</option>
      <option<% If intPrivateMessages = 90 Then Response.Write(" selected") %>>90</option>
      <option<% If intPrivateMessages = 100 Then Response.Write(" selected") %>>100</option>
      <option<% If intPrivateMessages = 150 Then Response.Write(" selected") %>>150</option>
      <option<% If intPrivateMessages = 200 Then Response.Write(" selected") %>>200</option>
      <option<% If intPrivateMessages = 250 Then Response.Write(" selected") %>>250</option>
      <option<% If intPrivateMessages = 500 Then Response.Write(" selected") %>>500</option>
      <option<% If intPrivateMessages = 1000 Then Response.Write(" selected") %>>1000</option>
      <option<% If intPrivateMessages = 2000 Then Response.Write(" selected") %>>2000</option>
      <option<% If intPrivateMessages = 5000 Then Response.Write(" selected") %>>5000</option>
      <option<% If intPrivateMessages = 10000 Then Response.Write(" selected") %>>10000</option>
     </select>
     <% If (blnACode AND NOT strInstallID = "Adware") Then Response.Write("<span class=""smText"">Can not be changed in Free Express Edition</span>") %></td>
    </tr>
    <tr>
      <td class="tableRow">Private Messager Flood Control :<br />
        <span class="smText">This is the number of Private Messages a member can send within an hour. This prevents a member sending 100's of spam Private Messages to other members. </span></td>
      <td valign="top" class="tableRow"><select name="PmFlood" id="PmFlood"<% If blnDemoMode Then Response.Write(" disabled=""disabled""") %>>
       <option<% If intPmFlood = 1 Then Response.Write(" selected") %>>1</option>
       <option<% If intPmFlood = 2 Then Response.Write(" selected") %>>2</option>
       <option<% If intPmFlood = 3 Then Response.Write(" selected") %>>3</option>
       <option<% If intPmFlood = 4 Then Response.Write(" selected") %>>4</option>
       <option<% If intPmFlood = 5 Then Response.Write(" selected") %>>5</option>
       <option<% If intPmFlood = 6 Then Response.Write(" selected") %>>6</option>
       <option<% If intPmFlood = 7 Then Response.Write(" selected") %>>7</option>
       <option<% If intPmFlood = 8 Then Response.Write(" selected") %>>8</option>
       <option<% If intPmFlood = 9 Then Response.Write(" selected") %>>9</option>
       <option<% If intPmFlood = 10 Then Response.Write(" selected") %>>10</option>
       <option<% If intPmFlood = 15 Then Response.Write(" selected") %>>15</option>
       <option<% If intPmFlood = 20 Then Response.Write(" selected") %>>20</option>
       <option<% If intPmFlood = 25 Then Response.Write(" selected") %>>25</option>
       <option<% If intPmFlood = 30 Then Response.Write(" selected") %>>30</option>
       <option<% If intPmFlood = 35 Then Response.Write(" selected") %>>35</option>
       <option<% If intPmFlood = 40 Then Response.Write(" selected") %>>40</option>
       <option<% If intPmFlood = 50 Then Response.Write(" selected") %>>50</option>
       <option<% If intPmFlood = 75 Then Response.Write(" selected") %>>75</option>
       <option<% If intPmFlood = 100 Then Response.Write(" selected") %>>100</option>
       <option<% If intPmFlood = 150 Then Response.Write(" selected") %>>150</option>
       <option<% If intPmFlood = 200 Then Response.Write(" selected") %>>200</option>
      </select>
       per hour </td>
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
