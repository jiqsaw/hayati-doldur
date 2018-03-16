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



Dim strReturnURL	'Holds the URL to return to


'Don't display the login if the forums account control is disabled through the member API
If blnMemberAPIDisableAccountControl = False OR blnMemberAPI = False Then



	'Get the URL to return to
	If Request("returnURL") <> "" Then
		strReturnURL = Request("returnURL")
	Else
		strReturnURL = Replace(Request.ServerVariables("script_name"), Left(Request.ServerVariables("script_name"), InstrRev(Request.ServerVariables("URL"), "/")), "") & "?" & Request.Querystring
	End If
	
	'For extra security make sure that someone is not trying to send the user to another web site
	strReturnURL = Replace(strReturnURL, "http", "",  1, -1, 1)
	strReturnURL = Replace(strReturnURL, ":", "",  1, -1, 1)
	strReturnURL = Replace(strReturnURL, "script", "",  1, -1, 1)
	
	'Clean up input
	strReturnURL = formatLink(strReturnURL)
	strReturnURL = removeAllTags(strReturnURL)
	
	'Replace &amp; with &
	strReturnURL = Replace(strReturnURL, "&amp;", "&",  1, -1, 1)

%>
<iframe width="200" height="110" id="progressBar" src="includes/progress_bar.asp" style="display:none; position:absolute; left:0px; top:0px;" frameborder="0" scrolling="no"></iframe>
<script  language="JavaScript">
function CheckForm () {

	var errorMsg = "";
	var formArea = document.getElementById('frmLogin');

	//Check for a Username
	if (formArea.name.value==""){
		errorMsg += "\n\t<% = strTxtErrorUsername %>";
	}

	//Check for a Password
	if (formArea.password.value==""){
		errorMsg += "\n\t<% = strTxtErrorPassword %>";
	}<%

	If intLoginAttempts => 3 Then 
	
	%>
	
	//Check for a security code
        if (formArea.securityCode.value == ''){
                errorMsg += "\n\t<% = strTxtErrorSecurityCode %>";
        }<%
	End If

%>

	//If there is aproblem with the form then display an error
	if (errorMsg != ""){
		msg = "<% = strTxtErrorDisplayLine %>\n\n";
		msg += "<% = strTxtErrorDisplayLine1 %>\n";
		msg += "<% = strTxtErrorDisplayLine2 %>\n";
		msg += "<% = strTxtErrorDisplayLine %>\n\n";
		msg += "<% = strTxtErrorDisplayLine3 %>\n";

		errorMsg += alert(msg + errorMsg + "\n\n");
		return false;
	}

	//Disable submit button
	document.getElementById('Submit').disabled=true;

	//Show progress bar
	var progressWin = document.getElementById('progressBar');
	var progressArea = document.getElementById('progressFormArea');
	progressWin.style.left = progressArea.offsetLeft + (progressArea.offsetWidth-210)/2 + 'px';
	progressWin.style.top = progressArea.offsetTop + (progressArea.offsetHeight-140)/2 + 'px';
	progressWin.style.display='inline'
	return true;
}
</script>
<br />
<div id="progressFormArea">
<form method="post" name="frmLogin" id="frmLogin" action="login_user.asp<% = strQsSID1 %>" onSubmit="return CheckForm();" onReset="return confirm('<% = strResetFormConfirm %>');">
<table cellspacing="1" cellpadding="3" class="tableBorder" align="center">
 <tr class="tableLedger">
  <td colspan="2" align="left"><% = strTxtLoginUser %></td>
 </tr>
 <tr class="tableRow">
  <td width="50%"><% = strTxtUsername %></td>
  <td width="50%"><input type="text" name="name" id="name" size="15" maxlength="20" value="<% = strUsername %>" tabindex="1" /> <a href="registration_rules.asp?FID=<% = intForumID & strQsSID2 %>"><% = strNotYetRegistered %></a></td>
 </tr>
 <tr class="tableRow">
  <td><% = strTxtPassword %></td>
  <td><input type="password" name="password" id="password" size="15" maxlength="15" value="<% = strPassword %>" tabindex="2" /><%
    	
	'If email notification is enabled then also show the forgotten password link
	If blnEmail = True Then
		
		%> <a href="forgotten_password.asp<% = strQsSID1 %>"><% = strTxtClickHereForgottenPass %></a><%
	      
	End If
	  
	  %></td>
 </tr>   
 <tr class="tableRow">
  <td><% = strTxtAutoLogin %></td>
  <td><% = strTxtYes %><input type="radio" name="AutoLogin" value="true" checked />&nbsp;&nbsp;<% = strTxtNo %><input type="radio" name="AutoLogin" value="false" /></td>
 </tr>
 <tr class="tableRow">
  <td><% = strTxtAddMToActiveUsersList %></td>
  <td><% = strTxtYes %><input type="radio" name="NS" value="true" checked />&nbsp;&nbsp;<% = strTxtNo %><input type="radio" name="NS" value="false" /></td>
 </tr><%

	'Display CAPTCHA images if login attempts is above 3       
	If intLoginAttempts => 3 Then 
	
	%>
 <tr class="tableLedger">
  <td colspan="2"><% = strTxtSecurityCodeConfirmation %></td>
  </tr>
 <tr  class="tableRow" colspan="2">
  <td valign="top"><% = strTxtUniqueSecurityCode %><br /><span class="smText"><% = strTxtEnterCAPTCHAcode %></span></td>
  <td><!--#include file="CAPTCHA_form_inc.asp" --></td><%
     
	End If

%>
 <tr class="tableBottomRow">
  <td colspan="2" align="center">
   <input type="hidden" name="returnURL" id="returnURL" value="<% = strReturnURL %>" tabindex="3" />
   <input type="submit" name="Submit" id="Submit" value="<% = strTxtLoginUser %>" tabindex="4" />
   <input type="reset" name="Reset" id="Reset" value="<% = strTxtResetForm %>" tabindex="5" />
  </td>
 </tr>
</table>
</form>
</div><%

End If

%>