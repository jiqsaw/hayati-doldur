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
Dim strMode			'Holds the mode of the page, set to true if changes are to be made to the database
Dim strAdminEmail 		'Holds the forum adminsters email
Dim blnEmailNotify		'Set to true to turn email notify on
Dim blnMailActivate		'Set to true if the user wants membership to be activated by email
Dim blnEmailClient		'set to true if the email client is enalbed

'Initialise variables
blnEmailNotify = False

'Read in the details from the form
strMailComponent = Request.Form("component")
strMailServer = Request.Form("mailServer")
strMailServerUser = Request.Form("mailServerUser")
strMailServerPass = Request.Form("mailServerPass")
strWebSiteName = Request.Form("siteName")
strForumPath = Request.Form("forumPath")
strAdminEmail = Request.Form("email")
blnEmailNotify = CBool(Request.Form("userNotify"))
blnSendPost = CBool(Request.Form("sendPost"))
blnMailActivate = CBool(Request.Form("mailActvate"))
blnEmailClient = CBool(Request.Form("client"))
blnMemberApprove = Cbool(Request.Form("adminApp"))



'Initialise the SQL variable with an SQL statement to get the configuration details from the database
strSQL = "SELECT " & strDbTable & "Configuration.* From " & strDbTable & "Configuration WHERE " & strDbTable & "Configuration.ID=1;"

'Set the cursor type property of the record set to Forward Only
rsCommon.CursorType = 0

'Set the Lock Type for the records so that the record set is only locked when it is updated
rsCommon.LockType = 3

'Query the database
rsCommon.Open strSQL, adoCon

'If the user is changing the email setup then update the database
If Request.Form("postBack") Then
	
	'Check the form ID to prevent XCSRF
	Call checkFormID(Request.Form("formID"))

	With rsCommon
		'Update the recordset
		If blnDemoMode = False Then
			.Fields("mail_component") = strMailComponent
			.Fields("mail_server") = strMailServer
			.Fields("website_name") = strWebSiteName
			.Fields("forum_path") = strForumPath
			.Fields("forum_email_address") = strAdminEmail
			.Fields("email_notify") = blnEmailNotify
			.Fields("Email_post") = blnSendPost
			.Fields("Email_activate") = blnMailActivate
			.Fields("Email_sys") = blnEmailClient
			.Fields("Mail_username") = strMailServerUser
			.Fields("Mail_password") = strMailServerPass
			.Fields("Member_approve") = blnMemberApprove
	
	
			'Update the database with the new user's details
			.Update
		End If
		
		'Re-run the query to read in the updated recordset from the database
		.Requery
		
	End With
	
	'Update variables
	Application(strAppPrefix & "strMailComponent") = strMailComponent
	Application(strAppPrefix & "strMailServer") = strMailServer
	Application(strAppPrefix & "strWebsiteName") = strWebSiteName
	Application(strAppPrefix & "strForumPath") = strForumPath
	Application(strAppPrefix & "strForumEmailAddress") = strAdminEmail
	Application(strAppPrefix & "blnEmail") = blnEmailNotify
	Application(strAppPrefix & "blnSendPost") = blnSendPost
	Application(strAppPrefix & "blnEmailActivation") = blnMailActivate
	Application(strAppPrefix & "blnEmailMessenger") = blnEmailClient
	Application(strAppPrefix & "strMailServerUser") = strMailServerUser
	Application(strAppPrefix & "strMailServerPass") = strMailServerPass
	Application(strAppPrefix & "blnMemberApprove") = blnMemberApprove
	
	'Empty the application level variable so that the changes made are seen in the main forum
	Application(strAppPrefix & "blnConfigurationSet") = false
End If

'Read in the deatils from the database
If NOT rsCommon.EOF Then

	'Read in the e-mail setup from the database
	strMailComponent = rsCommon("mail_component")
	strMailServer = rsCommon("mail_server")
	strWebSiteName = rsCommon("website_name")
	strForumPath = rsCommon("forum_path")
	strAdminEmail = rsCommon("forum_email_address")
	blnEmailNotify = CBool(rsCommon("email_notify"))
	blnSendPost = CBool(rsCommon("Email_post"))
	blnMailActivate = CBool(rsCommon("Email_activate"))
	blnEmailClient = CBool(rsCommon("Email_sys"))
	strMailServerUser = rsCommon("Mail_username")
	strMailServerPass = rsCommon("Mail_password")
	blnMemberApprove = CBool(rsCommon("Member_approve"))	
End If


'Release Server Objects
rsCommon.Close
Call closeDatabase()
%>
<!-- #include file="includes/browser_page_encoding_inc.asp" -->
<title>Email Settings</title>
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
<!-- Check the from is filled in correctly before submitting -->
<script  language="JavaScript" type="text/javascript">

//Function to check form is filled in correctly before submitting
function CheckForm () {

	//Check for a mail server
	if (((document.frmEmailsetup.component.value=="AspEmail") || (document.frmEmailsetup.component.value=="Jmail")) && (document.frmEmailsetup.mailServer.value=="")){
		alert("Please enter an working incoming mail server \nWithout one the Jmail/AspEmail component will fail");
		document.frmEmailsetup.mailServer.focus();
		return false;
	}

	//Check for a website name
	if (document.frmEmailsetup.siteName.value==""){
		alert("Please enter your Website Name");
		document.frmEmailsetup.siteName.focus();
		return false;
	}

	//Check for a path to the forum
	if (document.frmEmailsetup.forumPath.value==""){
		alert("Please enter the Web Address path to the Forum");
		document.frmEmailsetup.forumPath.focus();
		return false;
	}

	//Check for an email address
	if (document.frmEmailsetup.email.value==""){
		alert("Please enter your E-mail Address");
		document.frmEmailsetup.email.focus();
		return false;
	}

	//Check that the email address is valid
	if (document.frmEmailsetup.email.value.length>0&&(document.frmEmailsetup.email.value.indexOf("@",0)==-1||document.frmEmailsetup.email.value.indexOf(".",0)==-1)) {
		alert("Please enter your valid E-mail address\nWithout a valid email address the email notification will not work");
		document.frmEmailsetup.email.focus();
		return false;
	}

	return true
}	
	
//Function to test email window
function OpenTestEmailWin(formName){

	now = new Date; 
	submitAction = formName.action;
	submitTarget = formName.target;
	
	//Open the window first 	
   	winOpener('','testEmail',1,1,500,275)
   		
   	//Now submit form to the new window
   	formName.action = 'admin_email_test.asp?ID=' + now.getTime()<% = strQsSID2 %>;	
	formName.target = 'testEmail';
	formName.submit();
	
	//Reset submission
	formName.action = submitAction;
	formName.target = submitTarget;
}
</script>
<script language="javascript" src="includes/default_javascript_v9.js" type="text/javascript"></script>
<!-- #include file="includes/admin_header_inc.asp" -->
<div align="center">
 <h1>Email Settings </h1>
 <br />
  <a href="admin_menu.asp<% = strQsSID1 %>">Control Panel Menu</a><br />
  <br />
  <table border="0" cellpadding="4" cellspacing="1" class="tableBorder">
    <tr>
      <td align="center" class="tableLedger">Important - Please Read First!</td>
    </tr>
    <tr>
      <td class="tableRow" align="left">To be able to use the email notification you need to have either <span>CDONTS</span>, <span>CDOSYS</span>, <span>W3 JMail</span>, <span>Persists AspEmail</span>, or <span>SeverObject AspMail</span> component installed on the web server. <br />
          <br />
          Check with your web hosts or use the <a href="admin_server_test.asp">Server Compatibility Test</a> page to see which email components are installed on the server.<br />
          <br />
          <strong>Windows Windows 2000, Windows XP Pro and Windows 2003 users</strong> - CDOSYS comes installed on Windows 2000, Windows XP Pro, and Windows 2003.<br />
          <br />
          <strong>Windows NT4 and Windows 2000 users</strong> - IIS 4 and 5 on NT4 and Windows 2000 installs the CDONTS email component by default, but you need the SMTP server that comes with IIS installed on the web server as well 
          (This is the email component that most web hosts will use).<br />
          <br />
          <strong>Windows 9x users</strong> - Windows 9x does not support the CDOSYS or CDONTS email components so if you enable this feature and try to test it on a Windows 9x system the Forum will crash!!<br />
          <br />
          <span class="text">The personal version of the JMail email component is free and can run under Windows 2003,  Windows 2000 and Win XP, but you must install the component on the web server and requires that you enter the address 
          of a working SMTP server.</span><br />
          <br />
          If you find that you can not send emails, you may have the incorrect settings, check with your hosting company as to the correct settings. Some web hosts don't allow the sending of emails
  to non local email addresses.<br />
  <br />
  <strong>Outgoing SMTP Server Authentication</strong><br />
Some web hosts now require that you use authentication to login to  outgoing SMTP Servers to prevent spammers from abusing the servers. The following list tells you which supported components
     allow SMTP Server Authentication:- <br />
     <ul>
       <li><strong>CDOSYS</strong> - SMTP Server Authentication  supported</li>
       <li class="text"><strong>CDONTS</strong> - SMTP Server Authentication <strong>not</strong> supported</li>
       <li class="text"><strong>JMail</strong> - SMTP Server Authentication <strong>not</strong> supported</li>
       <li class="text"><strong>JMail ver.4+</strong> - SMTP Server Authentication  supported</li>
       <li class="text"><strong>AspEmail</strong> - SMTP Server Authentication  supported</li>
       <li class="text"><strong>AspMail</strong> - SMTP Server Authentication <strong>not</strong> supported</li>
     </ul></td>
    </tr>
  </table>
</div>
<br />
<form action="admin_email_notify_configure.asp<% = strQsSID1 %>" method="post" name="frmEmailsetup" id="frmEmailsetup" onsubmit="return CheckForm();">
  <table border="0" align="center" cellpadding="4" cellspacing="1" class="tableBorder">
    <tr align="left">
      <td colspan="2" class="tableLedger">Email Component Setup </td>
    </tr>
    <tr>
      <td width="59%" align="left" class="tableRow">Email Component to use:<br />
      <span class="smText">You must have the component you select installed on the web server.<br />You can use the <a href="admin_server_test.asp<% = strQsSID1 %>" class="smLink">Server Compatibility Test Tool</a> to see which components you have installed on the server.</span></td>
      <td width="41%" height="12" valign="top" class="tableRow"><select name="component"<% If blnDemoMode Then Response.Write(" disabled=""disabled""") %>>
       <option value="CDOSYS"<% If strMailComponent = "CDOSYS" Then Response.Write(" selected") %>>CDOSYS</option>
       <option value="CDOSYSp"<% If strMailComponent = "CDOSYSp" Then Response.Write(" selected") %>>CDOSYS (Pick Up - Used for localhost)</option>
       <option value="CDONTS"<% If strMailComponent = "CDONTS" Then Response.Write(" selected") %>>CDONTS</option>
          <option value="Jmail"<% If strMailComponent = "Jmail" Then Response.Write(" selected") %>>JMail</option>
          <option value="Jmail4"<% If strMailComponent = "Jmail4" Then Response.Write(" selected") %>>Jmail ver.4+</option>
          <option value="AspEmail"<% If strMailComponent = "AspEmail" Then Response.Write(" selected") %>>AspEmail</option>
          <option value="AspMail"<% If strMailComponent = "AspMail" Then Response.Write(" selected") %>>AspMail</option>
        </select>      </td>
    </tr>
    <tr>
      <td width="59%" align="left" class="tableRow">Outgoing SMTP Mail Server (<strong>NOT needed for CDONTS</strong>):<br />
      <span class="smText">You only need this if you are using an email component other than CDONTS. It must be a working mail server or the forum will crash.</span></td>
      <td width="41%" height="12" valign="top" class="tableRow"><input type="text" id="mailServer" name="mailServer" maxlength="50" value="<% If strMailServer <> "" Then Response.Write(strMailServer) Else Response.Write("localhost") %>" size="30"<% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> />
        <br />
      <span class="text">(eg. mail.myweb.com)</span></td>
    </tr>
    <tr class="tableRow">
      <td height="12" align="left">Outgoing SMTP Mail Server Username <br />
          <span class="smText">If the outgoing SMTP Server you are using requires  username authentication then specify it here.<br />
            Please see the list above for email components that support authentication. </span></td>
      <td height="12" valign="top"><input type="text" name="mailServerUser" id="mailServerUser" maxlength="50" value="<% = strMailServerUser %>" size="30"<% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> /></td>
    </tr>
    <tr class="tableRow">
      <td height="12" align="left">Outgoing SMTP Mail Server Password <br />
          <span class="smText">If the outgoing SMTP Server you are using requires password authentication then specify it here.<br />
            Please see the list above for email components that support authentication. </span></td>
      <td height="12" valign="top"><input type="password" name="mailServerPass" id="mailServerPass" maxlength="50" value="<% = strMailServerPass %>" size="30"<% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> /></td>
    </tr>
    
    <tr>
      <td height="12" colspan="2" align="left" class="tableLedger">Forum Email Details </td>
    </tr>
    <tr>
      <td width="59%" align="left" class="tableRow">Website name*<br />
        <span class="smText">The name of your website eg. My Website</span></td>
      <td width="41%" height="12" valign="top" class="tableRow"><input type="text" name="siteName" id="siteName" maxlength="50" value="<% = strWebsiteName %>" size="30"<% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> />      </td>
    </tr>
    <tr>
      <td width="59%"  height="2" align="left" class="tableRow">Web address path to forum*<br />
        <span class="smText">The web address that you would type into your web browsers address bar in order to get to the forum. <br />
      eg. http://www.mywebsite.com/forum </span></td>
      <td width="41%" height="2" valign="top" class="tableRow"><input type="text" name="forumPath" id="forumPath" maxlength="50" value="<% = strForumPath %>" size="30"<% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> />      </td>
    </tr>
    <tr>
      <td width="59%"  height="23" align="left" class="tableRow">Your Email Address* <br />
        <span class="smText">Without a valid email address you wont be able to send emails from the forum, receive email 
        notifications, activate forum memberships (if enabled), etc. </span><br />      </td>
      <td width="41%" height="23" valign="top" class="tableRow"><input type="text" name="email" id="email" maxlength="50" value="<% = strAdminEmail %>" size="30"<% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> />
      &nbsp;</td>
    </tr>
    
    <tr>
      <td height="12" colspan="2" align="left" class="tableLedger">Test Email Settings</td>
    </tr>
    <tr>
      <td width="59%" align="left" class="tableRow">Test Email Settings<br />
        <span class="smText">Use the button on the right to send a test email to the email address above to test if the settings are correct</span></td>
      <td width="41%" height="12" valign="top" class="tableRow"><input type="button" name="testEamil" id="testEamil" value="Test Email Settings" onclick="OpenTestEmailWin(document.frmEmailsetup)" />      </td>
    </tr>
    <tr>
    
    <tr>
      <td  height="7" colspan="2" align="left" class="tableLedger">Enable Email Features </td>
    </tr>
    <tr>
      <td width="59%"  height="7" align="left" class="tableRow">Email Notify<br />
      <span class="smText">Allows users to receive notification of replies to their posts or new posts in forums.</span></td>
      <td width="41%" height="7" valign="top" class="tableRow">On
        <input type="radio" name="userNotify" value="True" <% If blnEmailNotify = True Then Response.Write "checked" %><% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> />
        &nbsp;&nbsp;Off
        <input type="radio" name="userNotify" value="False" <% If blnEmailNotify = False Then Response.Write "checked" %><% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> />      </td>
    </tr>
    <tr>
      <td width="59%"  height="13" align="left" class="tableRow">Send Post with E-mail Notification<br />
        <span class="smText">Allow the full message that has been posted in the forum to be sent with the email 
      notification.</span></td>
      <td width="41%" height="13" valign="top" class="tableRow">On
        <input type="radio" name="sendPost" value="True" <% If blnSendPost = True Then Response.Write "checked" %><% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> />
        &nbsp;&nbsp;Off
        <input type="radio" name="sendPost" value="False" <% If blnSendPost = False Then Response.Write "checked" %><% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> />      </td>
    </tr>
    <tr>
      <td  height="13" align="left" class="tableRow">Email Activation of Membership<br />
        <span class="smText">With this option available new members will be required to activate their membership via a validation email (This option will not work if Administrator Member Activation</span> is enabled). </td>
      <td height="13" valign="top" class="tableRow">On
        <input type="radio" name="mailActvate" value="True" <% If blnMailActivate = True Then Response.Write "checked" %><% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> />
        &nbsp;&nbsp;Off
      <input type="radio" name="mailActvate" value="False" <% If blnMailActivate = False Then Response.Write "checked" %><% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> /></td>
    </tr>
    <tr>
     <td  height="13" align="left" class="tableRow">Administrator Member Activation<br />
      <span class="smText">New members will not be able to use their account till the admin activates their membership. An activation email will be sent to the forum email address entered above.</span></td>
     <td height="13" valign="top" class="tableRow">On
      <input type="radio" name="adminApp" value="True" <% If blnMemberApprove = True Then Response.Write "checked" %><% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> />
&nbsp;&nbsp;Off
<input type="radio" name="adminApp" value="False" <% If blnMemberApprove = False Then Response.Write "checked" %><% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> /></td>
    </tr>
    <tr>
      <td width="59%"  height="13" align="left" class="tableRow">Built in Email Client<br />
      <span class="smText">The built in email client allows members to send emails to other forum members directly from the forum, as long as both parties have a valid email address in their profile.</span></td>
      <td width="41%" height="13" valign="top" class="tableRow">On
        <input type="radio" name="client" value="True" <% If blnEmailClient = True Then Response.Write "checked" %><% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> />
        &nbsp;&nbsp;Off
        <input type="radio" name="client" value="False" <% If blnEmailClient = False Then Response.Write "checked" %><% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> />      </td>
    </tr>
    <tr align="center">
      <td height="2" colspan="2" valign="top" class="tableBottomRow" >
          <input type="hidden" name="postBack" value="true" />
          <input type="hidden" name="formID" id="formID" value="<% = getSessionItem("KEY") %>" />
          <input type="submit" name="Submit" value="Update Details" />
          <input type="reset" name="Reset" value="Reset Form" />      </td>
    </tr>
  </table>
</form>
<br />
<!-- #include file="includes/admin_footer_inc.asp" -->
