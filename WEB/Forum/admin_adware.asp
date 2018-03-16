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
Dim blnAdware

If blnACode = False Then
	Call closeDatabase()
	Response.Redirect("admin_menu.asp" & strQsSID1)
End If
      

'Read in the users details for the forum
blnAdware = CBool(Request.Form("adware"))



	
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
	
	'Update the recordset
	With rsCommon
		If blnDemoMode = False Then
			If blnAdware Then 
				.Fields("Install_ID") = "Adware"
			Else
				.Fields("Install_ID") = ""
			End If
					
			'Update the database with the new user's colours
			.Update
		End If
			
		'Re-run the query to read in the updated recordset from the database
		.Requery
	End With
	
	'Update variables
	Application.Lock
	
	'Empty the application level variable so that the changes made are seen in the main forum
	Application(strAppPrefix & "blnConfigurationSet") = false
	
	Application.UnLock
End If


If NOT rsCommon.EOF Then
	If rsCommon("Install_ID") = "Adware" Then blnAdware = True Else blnAdware = False	
End If


'Reset Server Objects
rsCommon.Close
Call closeDatabase()
%>
<!-- #include file="includes/browser_page_encoding_inc.asp" -->
<title>Web Wiz Forums Adware Edition</title>
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
  <h1>Web Wiz Forums  Adware  Edition</h1> 
  <br />
    <a href="admin_menu.asp<% = strQsSID1 %>">Control Panel Menu</a><br />
    <br />
    <table border="0" cellpadding="4" cellspacing="1" bordercolor="#000000" class="tableBorder">
      <tr>
        <td align="left" class="tableLedger">Web Wiz Forums  Adware  Edition </td>
      </tr>
      <tr>
        <td class="tableRow">You can upgrade your Web Wiz Forums Express Edition to Web Wiz Forums Free Adware  Edition unlocking additional features normally only found in the paid Premium Edition 
    while at the same time displaying Adware Adverts within your forum system. This is a cost affective way for you to experience many of the additional features of the Premium Edition without the need to purchase a Premium Edition License.<br />
    <br />
    Once you upgrade to the Web Wiz Forums Free Adware  Edition <strong>you MUST leave the  Adverts in place and visible at all times </strong>as part of your license agreement for your use of this software. These adverts are what pay for you use of the additional Premium Edition features. If however you do not wish to display the Adware Adverts in your forum you can downgrade at anytime, or if you wish to continue using the Premium Edition features without Adware Adverts then you can purchase the Premium Edition license using the link below.<br />
          <br />
          <a href="http://www.webwizforums.com">More information on purchasing a Web Wiz Forums Premium Edition License.</a></td>
      </tr>
    </table>
    <br />
    <table border="0" cellpadding="4" cellspacing="1" bordercolor="#000000" class="tableBorder">
      <tr>
        <td align="left" class="tableLedger">Web Wiz Forums Adware  Edition Requirements Server Check </td>
      </tr>
      <tr>
        <td class="tableRow"><span class="text">Web Wiz Forums Adware  Edition requires that you are using a supported web host. Please use the button below to check that the web server you are using and your web host meet the requirements for running the Adware Edition.<br />
              <br />
          </span>
            <form id="frmTestSvr" name="frmTestSvr" method="post" action="admin_server_test.asp<% = strQsSID1 %>">
              <span class="text">
              <input name="testSvr" type="submit" id="testSvr" value="Web Wiz Forums Server Requirements Test" />
              </span>
          </form></td>
      </tr>
    </table>
    <br />
    <br />
</div>
<form action="admin_adware.asp<% = strQsSID1 %>" method="post" name="frmAdware" id="frmAdware">
  <table border="0" align="center" cellpadding="4" cellspacing="1" class="tableBorder">
    <tr>
      <td colspan="2" class="tableLedger">Web Wiz Forums  Adware  Edition</td>
    </tr>
    <tr>
     <td width="57%" class="tableRow">Web Wiz Forums  Adware  Edition:<br />
       <span class="smText">By checking this box you will upgrade your Web Wiz Forums Express Edition to the Adware  Edition.</span></td>
     <td width="43%" valign="top" class="tableRow">
      <input type="checkbox" name="adware" value="True"<% If blnAdware = True Then Response.Write " checked=""checked""" %><% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> /></td>
    </tr>
    <tr align="center">
      <td colspan="2" class="tableBottomRow">
          <input type="hidden" name="postBack" value="true" />
          <input type="submit" name="Submit" value="Update Settings" />
          <input type="reset" name="Reset" value="Reset Form" />      </td>
    </tr>
  </table>
</form>
<br />
<!-- #include file="includes/admin_footer_inc.asp" -->
