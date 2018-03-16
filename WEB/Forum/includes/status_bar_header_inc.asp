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


'Make sure that the forum ID number has a number in it otherwise set it to 0
If isEmpty(intForumID) OR intForumID = "" Then intForumID = 0


'Don't display normal status bar if forum is locked as it will course a loop with the AJAX
If blnForumClosed Then

%>
<table cellspacing="1" cellpadding="3" align="center" class="tableBorder">
 <tr class="tableStatusBar"> 
  <td>
   <div style="float:left;"><% = strBreadCrumbTrail %></div>
   <div style="float:right;"><%

'If the user is admin display a link to the admin menu
If intGroupID = 1 Then Response.Write("&nbsp;&nbsp;<img src=""" & strImagePath & "admin_control_panel." & strForumImageType & """ title=""" & strTxtAdminControlPanel & """ alt=""" & strTxtAdminControlPanel & """ style=""vertical-align: text-bottom"" />&nbsp;<a href=""admin.asp" & strQsSID1 & """>" & strTxtAdmin & "</a>")
	

%></div>
  </td>
 </tr>
</table><%

'Else display the normal status bar
Else

%>
<iframe id="dropDownSearch" src="quick_search.asp?FID=<% = intForumID & strQsSID2 %>" class="dropDownSearch" frameborder="0" scrolling="no"></iframe>
<table cellspacing="1" cellpadding="3" align="center" class="tableBorder">
 <tr class="tableStatusBar"> 
  <td>
   <div style="float:left;"><% = strBreadCrumbTrail %></div>
   <div style="float:right;"><%

	'If the user is admin display a link to the admin menu
	If intGroupID = 1 Then Response.Write("&nbsp;&nbsp;<img src=""" & strImagePath & "admin_control_panel." & strForumImageType & """ title=""" & strTxtAdminControlPanel & """ alt=""" & strTxtAdminControlPanel & """ style=""vertical-align: text-bottom"" />&nbsp;<a href=""admin.asp" & strQsSID1 & """>" & strTxtAdmin & "</a>")
		
	'Display any status bar graphics or menus for this page
	Response.Write(strStatusBarTools)

%></div>
  </td>
 </tr>
 <tr class="tableStatusBar">
  <td><%
     
	'If the user has logged in then the Logged In User ID number will not be 0 and not 2 for the guest account
	If lngLoggedInUserID <> 0 AND lngLoggedInUserID <> 2 Then
			
		'Link to user cp
		Response.Write(vbCrLf & "   <div style=""float:left;"">")
		If blnBanned = False Then Response.Write ("<img src=""" & strImagePath & "member_control_panel." & strForumImageType & """ title=""" & strTxtMemberCPMenu & """ alt=""" & strTxtMemberCPMenu & """ style=""vertical-align: text-bottom"" />&nbsp;<a href=""member_control_panel.asp" & strQsSID1 & """>" & strTxtMemberCPMenu & "</a>")
		%><!-- #include file="pm_check_inc.asp" --><%
		Response.Write("</div>")
	End If
%>
   <div style="float:right;"><%
   
	'Display the other common buttons
	Response.Write ("&nbsp;&nbsp;<img src=""" & strImagePath & "FAQ." & strForumImageType & """ alt=""" & strTxtFAQ & """ title=""" & strTxtFAQ & """ style=""vertical-align: text-bottom"" /> <a href=""help.asp" & strQsSID1 & """>" & strTxtFAQ & "</a>")
	Response.Write ("&nbsp;&nbsp;<span id=""SearchLink"" onclick=""showDropDown('SearchLink', 'dropDownSearch', 230, 0);"" class=""dropDownPointer""><img src=""" & strImagePath & "search." & strForumImageType & """ alt=""" & strTxtSearchTheForum & """ title=""" & strTxtSearchTheForum & """ style=""vertical-align: text-bottom"" /> <script language=""JavaScript"" type=""text/javascript"">document.write('" & strTxtSearch & "')</script><noscript><a href=""search_form.asp" & strQsSID1 & """ rel=""nofollow"">" & strTxtSearch & "</a></noscript></span>")
	If blnCalendar AND (blnACode = False OR strInstallID = "Adware") Then Response.Write ("&nbsp;&nbsp;<span id=""CalLink"" onclick=""getAjaxData('ajax_calendar.asp" & strQsSID1 & "', 'showCalendar');showDropDown('CalLink', 'dropDownCalendar', 210, 0);"" class=""dropDownPointer""><img src=""" & strImagePath & "calendar." & strForumImageType & """ alt=""" & strTxtCalendar & """ title=""" & strTxtCalendar & """ style=""vertical-align: text-bottom"" /> <script language=""JavaScript"" type=""text/javascript"">document.write('" & strTxtCalendar & "')</script><noscript><a href=""calendar.asp" & strQsSID1 & """>" & strTxtCalendar & "</a></noscript></span>")
	
	     
	'If the user has logged in then the Logged In User ID number will not be 0 and not 2 for the guest account
	If lngLoggedInUserID <> 0 AND lngLoggedInUserID <> 2 Then
	
		Response.Write ("&nbsp;&nbsp;<img src=""" & strImagePath & "members." & strForumImageType & """ alt=""" & strTxtMembersList & """ title=""" & strTxtMembersList & """ style=""vertical-align: text-bottom"" /> <a href=""members.asp" & strQsSID1 & """ rel=""nofollow"">" & strTxtMemberlist & "</a>")
		'Don't display logout if windows authentication is enabled or member API
		If blnWindowsAuthentication = False AND (blnMemberAPIDisableAccountControl = False OR strMemberAPILogoutURL <> "") Then 
			Response.Write ("&nbsp;&nbsp;<img src=""" & strImagePath & "logout." & strForumImageType & """ alt=""" & strTxtLogOff & """ title=""" & strTxtLogOff & """ style=""vertical-align: text-bottom"" /> <a href=""log_off_user.asp?XID=" & getSessionItem("KEY") & strQsSID2 & """>" & strTxtLogOff & " [" & strLoggedInUsername & "]</a>")
		End If

	'Else if the member API is enabled and there are links to the websites on registration and login pages display the links to them
	ElseIf blnMemberAPI AND (strMemberAPIRegistrationURL <> "" OR strMemberAPILoginURL <> "") Then
		
		If strMemberAPIRegistrationURL <> "" Then Response.Write ("&nbsp;&nbsp;<img src=""" & strImagePath & "register." & strForumImageType & """ alt=""" & strTxtRegister & """ title=""" & strTxtRegister & """ style=""vertical-align: text-bottom"" /> <a href=""" & strMemberAPIRegistrationURL & """ rel=""nofollow"">" & strTxtRegister & "</a>")
		If strMemberAPILoginURL <> "" Then Response.Write ("&nbsp;&nbsp;<img src=""" & strImagePath & "login." & strForumImageType & """ alt=""" & strTxtLogin & """ title=""" & strTxtLogin & """ style=""vertical-align: text-bottom"" /> <a href=""" & strMemberAPILoginURL & """ rel=""nofollow"">" & strTxtLogin & "</a>")	
	
	'Else the user is not logged (Don't display logout if windows authentication is enabled or member API)
	ElseIf blnWindowsAuthentication = False AND (blnMemberAPI = False OR blnMemberAPIDisableAccountControl = False) Then
		
		Response.Write ("&nbsp;&nbsp;<img src=""" & strImagePath & "register." & strForumImageType & """ alt=""" & strTxtRegister & """ title=""" & strTxtRegister & """ style=""vertical-align: text-bottom"" /> <a href=""registration_rules.asp?FID=" & intForumID & strQsSID2 & """ rel=""nofollow"">" & strTxtRegister & "</a>")
	    	Response.Write ("&nbsp;&nbsp;<img src=""" & strImagePath & "login." & strForumImageType & """ alt=""" & strTxtLogin & """ title=""" & strTxtLogin & """ style=""vertical-align: text-bottom"" /> <a href=""login_user.asp?returnURL=" & strLinkPage & strQsSID2 & """ rel=""nofollow"">" & strTxtLogin & "</a>")
	End If

%></div>
  </td>
 </tr>
</table><%

	'Display hidden div for calandar
	'(AJAX used for this one so that the extra database hit is only performed if the user wants to view the calendar)
	If blnCalendar AND (blnACode = False OR strInstallID = "Adware") Then

%>
<div id="dropDownCalendar" class="dropDownCalendar"><span id="showCalendar"></span></div><%
	
	End If
End If

'***** START WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
If strInstallID = "Adware" Then
	Response.Write("<div align=""center"" style=""margin:5px;""><br />" & strSponsor1 & "</div>")
ElseIf strMyGoogleAdSenseID <> "pub-9026955576675812" Then
	Response.Write("<div align=""center"" style=""margin:5px;""><br />" & strAdSenseCodeHeader & "</div>")
End If
'***** END WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******

%>
<br />