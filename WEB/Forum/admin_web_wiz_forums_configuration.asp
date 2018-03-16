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
Dim strThreadOrder		'Holds the order the threads are in
Dim blnAvatarImages		'Set to true if avatar images are on
Dim intRepliesPerPage		'Holds the number of replies per page
Dim intHotTopicViews		'Holds the number of views before a topic becomes hot
Dim intHotTopicReplies		'Holds the number of replies before a topic becomes hot
Dim strForumName 		'Holds the forum name
Dim blnProcessTime		'Set to true if the user wants the page genration time displayed
Dim blnAuthorEdited   		'Set to true if the user wants the name of a post editor displayed
Dim intPollChoice		'Holds the numebr of Poll Choices
      

'Read in the users details for the forum
strForumName = Request.Form("forumName")
strWebSiteName = Request.Form("siteName")
strWebsiteURL = Request.Form("siteURL")
strForumPath = Request.Form("forumPath")
blnTextLinks = CBool(Request.Form("textLinks"))
blnRTEEditor = CBool(Request.Form("IEEditor"))
intTopicPerPage	= CInt(Request.Form("topic"))
blnEmoticons = CBool(Request.Form("emoticons"))	
strThreadOrder = Request.Form("threadOrder")	
intPollChoice = CInt(Request.Form("pollChoice"))	
blnAvatarImages = CBool(Request.Form("avatar"))
intRepliesPerPage = CInt(Request.Form("threads"))
intHotTopicViews = CInt(Request.Form("hotViews"))
intHotTopicReplies = CInt(Request.Form("hotReplies"))
blnActiveUsers = CBool(Request.Form("activeUsers"))
blnProcessTime = CBool(Request.Form("processTime"))
blnAuthorEdited = CBool(Request.Form("edited"))
blnFlashFiles = CBool(Request.Form("flash"))
blnTopicIcon = CBool(Request.Form("TopicIcons"))
blnLongRegForm = CBool(Request.Form("reg"))
blnCAPTCHAsecurityImages = CBool(Request.Form("CAPTCHA"))
blnGuestSessions = CBool(Request.Form("GuestSID"))
blnRSS = CBool(Request.Form("RSS"))
strMode = Request.Form("mode")
blnWebWizNewsPad = CBool(Request.Form("NewsPad"))
strWebWizNewsPadURL = Request.Form("NewsPadURL")

	
'Initialise the SQL variable with an SQL statement to get the configuration details from the database
strSQL = "SELECT " & strDbTable & "Configuration.* From " & strDbTable & "Configuration WHERE " & strDbTable & "Configuration.ID=1;"


'Set the cursor type property of the record set to Forward Only
rsCommon.CursorType = 0

'Set the Lock Type for the records so that the record set is only locked when it is updated
rsCommon.LockType = 3

	
'Query the database
rsCommon.Open strSQL, adoCon

'If the user is changing tthe colours then update the database
If Request.Form("postBack") AND blnDemoMode = False Then
	
	'Check the form ID to prevent XCSRF
	Call checkFormID(Request.Form("formID"))
	
	'Update the recordset
	With rsCommon
		
		.Fields("forum_name") = strForumName
		.Fields("website_path") = strWebsiteURL 
		.Fields("IE_editor") = blnRTEEditor
		.Fields("Text_link") = blnTextLinks
		.Fields("Topics_per_page") = intTopicPerPage
		.Fields("website_name") = strWebSiteName
		.Fields("forum_path") = strForumPath
		.Fields("Emoticons") = blnEmoticons
		.Fields("Avatar") = blnAvatarImages
		.Fields("Threads_per_page") = intRepliesPerPage
		.Fields("Hot_views") = intHotTopicViews
		.Fields("Hot_replies") = intHotTopicReplies
		.Fields("Active_users") = blnActiveUsers
		.Fields("Process_time") = blnProcessTime
		.Fields("Show_edit") = blnAuthorEdited
		.Fields("Flash") = blnFlashFiles
		.Fields("Vote_choices") = intPollChoice
		.Fields("Topic_icon") = blnTopicIcon
		.Fields("Long_reg") = blnLongRegForm
		.Fields("CAPTCHA") = blnCAPTCHAsecurityImages
		.Fields("Guest_SID") = blnGuestSessions
		.Fields("RSS") = blnRSS
		.Fields("NewsPad") = blnWebWizNewsPad
		.Fields("NewsPad_URL") = strWebWizNewsPadURL

		
					
		'Update the database with the new user's colours
		.Update
		
		
			
		'Re-run the query to read in the updated recordset from the database
		.Requery
	End With
	
	'Update variables
	Application.Lock
	
	Application(strAppPrefix & "strMainForumName") = strForumName
	Application(strAppPrefix & "strWebsiteURL") = strWebsiteURL
	Application(strAppPrefix & "blnTextLinks") = blnTextLinks
	Application(strAppPrefix & "blnRTEEditor") = blnRTEEditor
	Application(strAppPrefix & "intTopicPerPage") = intTopicPerPage
	Application(strAppPrefix & "strWebsiteName") = strWebSiteName
	Application(strAppPrefix & "strForumPath") = strForumPath
	Application(strAppPrefix & "blnEmoticons") = blnEmoticons
	Application(strAppPrefix & "blnAvatar") = blnAvatarImages
	Application(strAppPrefix & "intThreadsPerPage") = intRepliesPerPage
	Application(strAppPrefix & "intNumHotViews") = intHotTopicViews
	Application(strAppPrefix & "intNumHotReplies") = intRepliesPerPage
	Application(strAppPrefix & "blnActiveUsers") = blnActiveUsers
	Application(strAppPrefix & "blnShowProcessTime") = blnProcessTime
	Application(strAppPrefix & "blnShowEditUser") = blnAuthorEdited
	Application(strAppPrefix & "blnFlashFiles") = blnFlashFiles
	Application(strAppPrefix & "intMaxPollChoices") = intPollChoice
	Application(strAppPrefix & "blnTopicIcon") = blnTopicIcon
	Application(strAppPrefix & "blnLongRegForm") = blnLongRegForm
	Application(strAppPrefix & "blnCAPTCHAsecurityImages") = blnCAPTCHAsecurityImages
	Application(strAppPrefix & "blnGuestSessions") = CBool(blnGuestSessions)
	Application(strAppPrefix & "blnRSS") = CBool(blnRSS)
	Application(strAppPrefix & "blnWebWizNewsPad") = CBool(blnWebWizNewsPad)
	Application(strAppPrefix & "strWebWizNewsPadURL") = strWebWizNewsPadURL
	
		
	
	'Empty the application level variable so that the changes made are seen in the main forum
	Application(strAppPrefix & "blnConfigurationSet") = false
	
	Application.UnLock
End If

'Read in the forum colours from the database
If NOT rsCommon.EOF Then
	
	'Read in the colour info from the database
	strForumName = rsCommon.Fields("forum_name")
	strWebsiteURL = rsCommon.Fields("website_path")
	blnTextLinks = rsCommon.Fields("Text_link")
	blnRTEEditor =  rsCommon.Fields("IE_editor")
	intTopicPerPage = CInt(rsCommon.Fields("Topics_per_page"))
	strWebSiteName = rsCommon("website_name")
	strForumPath = rsCommon("forum_path")
	blnEmoticons = rsCommon.Fields("Emoticons")
	blnAvatarImages = rsCommon.Fields("Avatar")
	intRepliesPerPage = rsCommon.Fields("Threads_per_page")
	intHotTopicViews = rsCommon.Fields("Hot_views")
	intHotTopicReplies = rsCommon.Fields("Hot_replies")
	blnActiveUsers = rsCommon.Fields("Active_users")
	blnProcessTime = rsCommon.Fields("Process_time")
	blnAuthorEdited = rsCommon.Fields("Show_edit")
	blnFlashFiles = rsCommon.Fields("Flash")
	intPollChoice = CInt(rsCommon.Fields("Vote_choices"))
	blnTopicIcon = CBool(rsCommon.Fields("Topic_icon"))
	blnLongRegForm = CBool(rsCommon.Fields("Long_reg"))
	blnCAPTCHAsecurityImages = CBool(rsCommon.Fields("CAPTCHA"))
	blnGuestSessions = CBool(rsCommon("Guest_SID"))
	blnRSS = CBool(rsCommon("RSS"))
	blnWebWizNewsPad = CBool(rsCommon("NewsPad"))
	strWebWizNewsPadURL = rsCommon("NewsPad_URL")
End If


'Reset Server Objects
rsCommon.Close
Call closeDatabase()
%>
<!-- #include file="includes/browser_page_encoding_inc.asp" -->
<title>Forum Configuration</title>
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
<!-- Hide from older browsers...

//Function to check form is filled in correctly before submitting
function CheckForm () {

	//Check for a name of the forum
	if (document.frmConfiguration.forumName.value==""){
		alert("Please enter the name of your Forum");
		document.frmConfiguration.forumName.focus();
		return false;
	}
	
	//Check for a site name
	if (document.frmConfiguration.siteName.value==""){
		alert("Please enter the name of your Website");
		document.frmConfiguration.siteName.focus();
		return false;
	}
	
	//Check for a URL to homepage
	if (document.frmConfiguration.siteURL.value==""){
		alert("Please enter the URL to your websites homepage");
		document.frmConfiguration.siteURL.focus();
		return false;
	}
	
	//Check for a path to the forum
	if (document.frmConfiguration.forumPath.value==""){
		alert("Please enter the URL to your Forum");
		document.frmConfiguration.forumPath.focus();
		return false;
	}
	return true;
}
// -->
</script>
<!-- #include file="includes/admin_header_inc.asp" -->
<div align="center">
  <h1> Web Wiz Forums Configuration</h1> 
  <br />
    <a href="admin_menu.asp<% = strQsSID1 %>">Control Panel Menu</a><br />
    <br />
    From here you can configure general options of the forum to customise the functions and look of your forum.</p>
    <br />
    <br />
</div>
<form action="admin_web_wiz_forums_configuration.asp<% = strQsSID1 %>" method="post" name="frmConfiguration" id="frmConfiguration" onsubmit="return CheckForm();">
  <table border="0" align="center" cellpadding="4" cellspacing="1" class="tableBorder">
    <tr>
      <td colspan="2" class="tableLedger">General Forum Settings</td>
    </tr>
    <tr>
      <td width="57%" class="tableRow">Forum name*<br />
      <span class="smText">This is the name of your forum. eg. My Website Forum </span></td>
      <td width="43%" valign="top" class="tableRow"><input name="forumName" type="text" id="forumName" value="<% = strForumName %>" size="30" maxlength="50"<% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> /></td>
    </tr>
    <tr>
      <td class="tableRow">Website name*<br />
        <span class="smText">The name of your website.  eg. My Website</span></td>
      <td valign="top" class="tableRow"><input type="text" name="siteName" maxlength="50" value="<% = strWebsiteName %>" size="30"<% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> />      </td>
    </tr>
    <tr>
      <td class="tableRow">Website Address*<br />
        <span class="smText">This is the URL to your website's homepage so that members can be taken to your homepage when exiting the forum, your domain name 
      is usually best here.</span></td>
      <td valign="top" class="tableRow"><input name="siteURL" type="text" id="siteURL" value="<% = strWebsiteURL %>" size="30" maxlength="70"<% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> /></td>
    </tr>
    <tr>
      <td class="tableRow">Web address path to forum*<br />
        <span class="smText">The web URL to your forum including your domain name and any folder the forum may be in. This is the address you would 
        type into the address bar on your browser to get to the forum.<br />
      eg. http://www.mywebsite.com/forum </span></td>
      <td valign="top" class="tableRow"><input type="text" name="forumPath" maxlength="70" value="<% = strForumPath %>" size="30"<% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> />      </td>
    </tr>
    <tr>
      <td class="tableRow">Powered by Web Wiz Link logo:<br />
      <span class="smText">If you enable this the text link to Web Wiz Forums&reg; at the bottom of the will be replaced with a graphic image.</span></td>
      <td valign="top" class="tableRow">On
        <input type="radio" name="textLinks" value="False" <% If blnTextLinks = False Then Response.Write "checked" %><% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> />
        &nbsp;&nbsp;Off
      <input type="radio" name="textLinks" value="True" <% If blnTextLinks = True Then Response.Write "checked" %><% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> /></td>
    </tr>
    <tr>
     <td class="tableRow">RSS Forum Feed:<br />
       <span class="smText">When enabled this allow an RSS Feed of the last 10 posts  across all forums or individual forums.<br />
      An RSS (Really Simple Syndication)  Feed will allow those using a RSS News Reader, like <a href="http://www.feeddemon.com/" target="_blank" class="smText">www.FeedDemon.com</a>, to have a feed of the latest posts posted in your forum.</span></td>
     <td valign="top" class="tableRow">On
      <input type="radio" name="RSS" value="True" <% If blnRSS = True Then Response.Write "checked" %><% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> />
&nbsp;&nbsp;Off
<input type="radio" name="RSS" value="False" <% If blnRSS = False Then Response.Write "checked" %><% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> /></td>
    </tr>
    <tr>
      <td class="tableRow">Active Users List<br />
      <span class="smText">This will display the names of all the active users in the forum on the main homepage.</span></td>
      <td valign="top" class="tableRow">On
        <input type="radio" name="activeUsers" value="True" <% If blnActiveUsers = True Then Response.Write "checked" %><% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> />
        &nbsp;&nbsp;Off
      <input type="radio" value="False" <% If blnActiveUsers = False Then Response.Write "checked" %><% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> name="activeUsers" /></td>
    </tr>
    <tr>
      <td class="tableRow"><a href="http://www.webwizcaptcha.com" target="_blank">Web Wiz CAPTCHA</a>:<br />
      <span class="smText">This displays security images on some forms within the forum. This is used to prevent dictionary hacking, remote form submission, etc. (For security reasons this can not be disabled for logins) </span></td>
      <td valign="top" class="tableRow">On
        <input type="radio" name="CAPTCHA" value="True" <% If blnCAPTCHAsecurityImages = True Then Response.Write "checked" %><% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> />
        &nbsp;&nbsp;Off
      <input type="radio" value="False" <% If blnCAPTCHAsecurityImages = False Then Response.Write "checked" %> name="CAPTCHA"<% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> /></td>
    </tr>
    <tr>
      <td class="tableRow">Long Registration Form:<br />
      This changes the registration form so that if turned off new registrations will only see the mandatory fields. </td>
      <td valign="top" class="tableRow">On
        <input type="radio" name="reg" value="True" <% If blnLongRegForm = True Then Response.Write "checked" %><% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> />
&nbsp;&nbsp;Off
<input type="radio" value="False" <% If blnLongRegForm = False Then Response.Write "checked" %> name="reg"<% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> /></td>
    </tr>
    <tr>
      <td class="tableRow">Display Server Processing Time for Page:<br />
      <span class="smText"> Display the number of seconds it has taken the server to generate the page on the bottom of forum pages.</span></td>
      <td valign="top" class="tableRow">On
        <input type="radio" name="processTime" value="True" <% If blnProcessTime = True Then Response.Write "checked" %><% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> />
        &nbsp;&nbsp;Off
        <input type="radio" name="processTime" value="False" <% If blnProcessTime = False Then Response.Write "checked" %><% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> />      </td>
    </tr>
    <tr>
      <td colspan="2" class="tableLedger">User and Forum Posts Settings</td>
    </tr>
    <tr>
      <td class="tableRow">Avatar Images:<br />
        <span class="smText">If you wish to also allow users to upload their own avatars you will need to also <a href="admin_upload_configure.asp<% = strQsSID1 %>" class="smLink">setup the upload component</a>.<br />
      For extra security users can only upload avatars once registered by editing their profile.</span></td>
      <td valign="top" class="tableRow">On
        <input type="radio" name="avatar" value="True" <% If blnAvatarImages = True Then Response.Write "checked" %><% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> />
        &nbsp;&nbsp;Off
        <input type="radio" name="avatar" value="False" <% If blnAvatarImages = False Then Response.Write "checked" %><% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> />      </td>
    </tr>
    <tr>
      <td class="tableRow">Emoticon Smiley Images:</td>
      <td valign="top" class="tableRow">On
        <input type="radio" name="emoticons" value="True" <% If blnEmoticons = True Then Response.Write "checked" %><% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> />
        &nbsp;&nbsp;Off
      <input type="radio" name="emoticons" value="False" <% If blnEmoticons = False Then Response.Write "checked" %><% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> /></td>
    </tr>
    <tr>
      <td class="tableRow">Display Edited Author:<br />
        <span class="smText">Display the name of person who edited a posts and the date the post was edited on the bottom of edited 
        posts.</span><br />      </td>
      <td valign="top" class="tableRow">On
        <input type="radio" name="edited" value="True" <% If blnAuthorEdited = True Then Response.Write "checked" %><% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> />
        &nbsp;&nbsp;Off
      <input type="radio" name="edited" value="False" <% If blnAuthorEdited = False Then Response.Write "checked" %><% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> /></td>
    </tr>
    <tr>
      <td class="tableRow">Adobe Flash and YouTube Content:<br />
        <span class="smText">If you enable this then users will be able to display Flash and YouTube content  in their posts and signatures, using BBcode [FLASH] [/FLASH] and [TUBE] [/TUBE] </span></td>
      <td valign="top" class="tableRow">On
        <input type="radio" name="flash" value="True" <% If blnFlashFiles = True Then Response.Write "checked" %><% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> />
        &nbsp;&nbsp;Off
      <input type="radio" name="flash" value="False" <% If blnFlashFiles = False Then Response.Write "checked" %><% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> /></td>
    </tr>
    <tr>
      <td class="tableRow"><a href="http://www.richtexteditor.org">Web Wiz Rich Text Editor</a> (WYSIWYG):<br />
        <span class="smText">This is the type of editor you use to post messages if you are using a Rich Text Enabled web browser, currently Windows IE5+, Netscape 7.1+, Mozilla 1.3+,   Firebird 0.6.1+, 
        and Opera 9, support this feature.<br />
If you turn this function off everyone will use the Basic message editor.<br />
If you want greater security turn this feature off, but you will lose functionality.</span></td>
      <td valign="top" class="tableRow">On
        <input type="radio" name="IEEditor" value="True" <% If blnRTEEditor = True Then Response.Write "checked" %><% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> />
&nbsp;&nbsp;Off
<input type="radio" name="IEEditor" value="False" <% If blnRTEEditor = False Then Response.Write "checked" %><% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> /></td>
    </tr>
    <tr>
      <td class="tableRow">Guest Sessions:<br />
       <span class="smText">If this is disabled it could help with Search Engine Indexing, but will mean that Guests will not be able to use many tools and features within the forum.</span></td>
      <td valign="top" class="tableRow">On
        <input type="radio" name="GuestSID" value="True" <% If blnGuestSessions = True Then Response.Write "checked" %><% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> />
&nbsp;&nbsp;Off
<input type="radio" name="GuestSID" value="False" <% If blnGuestSessions = False Then Response.Write "checked" %><% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> /></td>
    </tr>
    <tr>
      <td colspan="2" class="tableLedger">Forum Posts and Topic Page Display Settings</td>
    </tr>
    <tr>
      <td class="tableRow">Topic Icons:<br />
      These are the small icons shown next to topics. </td>
      <td valign="top" class="tableRow">On
        <input type="radio" name="TopicIcons" value="True" <% If blnTopicIcon = True Then Response.Write "checked" %><% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> />
&nbsp;&nbsp;Off
<input type="radio" name="TopicIcons" value="False" <% If blnTopicIcon = False Then Response.Write "checked" %><% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> /></td>
    </tr>
    <tr>
      <td class="tableRow">Topics Per Page:<br />
      <span class="smText">This is the number of Topics shown on each page.</span></td>
      <td valign="top" class="tableRow"><select name="topic"<% If blnDemoMode Then Response.Write(" disabled=""disabled""") %>>
          <option <% If intTopicPerPage = 10 Then Response.Write("selected") %>>10</option>
          <option <% If intTopicPerPage = 12 Then Response.Write("selected") %>>12</option>
          <option <% If intTopicPerPage = 14 Then Response.Write("selected") %>>14</option>
          <option <% If intTopicPerPage = 16 Then Response.Write("selected") %>>16</option>
          <option <% If intTopicPerPage = 18 Then Response.Write("selected") %>>18</option>
          <option <% If intTopicPerPage = 20 Then Response.Write("selected") %>>20</option>
          <option <% If intTopicPerPage = 22 Then Response.Write("selected") %>>22</option>
          <option <% If intTopicPerPage = 24 Then Response.Write("selected") %>>24</option>
          <option <% If intTopicPerPage = 26 Then Response.Write("selected") %>>26</option>
          <option <% If intTopicPerPage = 28 Then Response.Write("selected") %>>28</option>
          <option <% If intTopicPerPage = 30 Then Response.Write("selected") %>>30</option>
          <option <% If intTopicPerPage = 32 Then Response.Write("selected") %>>32</option>
          <option <% If intTopicPerPage = 34 Then Response.Write("selected") %>>34</option>
        </select>      </td>
    </tr>
    <tr>
      <td class="tableRow">Posts Per Page:<br />
      <span class="smText">This is the number of Posts shown on each page of a Topic.</span></td>
      <td valign="top" class="tableRow"><select name="threads"<% If blnDemoMode Then Response.Write(" disabled=""disabled""") %>>
          <option<% If intRepliesPerPage = 10 Then Response.Write(" selected") %>>3</option>
          <option<% If intRepliesPerPage = 4 Then Response.Write(" selected") %>>4</option>
          <option<% If intRepliesPerPage = 5 Then Response.Write(" selected") %>>5</option>
          <option<% If intRepliesPerPage = 6 Then Response.Write(" selected") %>>6</option>
          <option<% If intRepliesPerPage = 7 Then Response.Write(" selected") %>>7</option>
          <option<% If intRepliesPerPage = 8 Then Response.Write(" selected") %>>8</option>
          <option<% If intRepliesPerPage = 9 Then Response.Write(" selected") %>>9</option>
          <option<% If intRepliesPerPage = 10 Then Response.Write(" selected") %>>10</option>
          <option<% If intRepliesPerPage = 12 Then Response.Write(" selected") %>>12</option>
          <option<% If intRepliesPerPage = 14 Then Response.Write(" selected") %>>14</option>
          <option<% If intRepliesPerPage = 16 Then Response.Write(" selected") %>>16</option>
          <option<% If intRepliesPerPage = 18 Then Response.Write(" selected") %>>18</option>
          <option<% If intRepliesPerPage = 20 Then Response.Write(" selected") %>>20</option>
          <option<% If intRepliesPerPage = 25 Then Response.Write(" selected") %>>25</option>
          <option<% If intRepliesPerPage = 30 Then Response.Write(" selected") %>>30</option>
          <option<% If intRepliesPerPage = 35 Then Response.Write(" selected") %>>35</option>
          <option<% If intRepliesPerPage = 40 Then Response.Write(" selected") %>>40</option>
          <option<% If intRepliesPerPage = 45 Then Response.Write(" selected") %>>45</option>
          <option<% If intRepliesPerPage = 50 Then Response.Write(" selected") %>>50</option>
          <option<% If intRepliesPerPage = 75 Then Response.Write(" selected") %>>75</option>
          <option<% If intRepliesPerPage = 100 Then Response.Write(" selected") %>>100</option>
          <option<% If intRepliesPerPage = 150 Then Response.Write(" selected") %>>150</option>
          <option<% If intRepliesPerPage = 200 Then Response.Write(" selected") %>>200</option>
          <option<% If intRepliesPerPage = 250 Then Response.Write(" selected") %>>250</option>
          <option<% If intRepliesPerPage = 300 Then Response.Write(" selected") %>>300</option>
          <option<% If intRepliesPerPage = 500 Then Response.Write(" selected") %>>500</option>
          <option<% If intRepliesPerPage = 999 Then Response.Write(" selected") %>>999</option>
        </select>      </td>
    </tr>
    <tr>
      <td class="tableRow">Hot Topic Number of Views:<br />
      <span class="smText">This is the number of times a Topic is viewed before it is shown as a Hot Topic.</span></td>
      <td valign="top" class="tableRow"><select name="hotViews"<% If blnDemoMode Then Response.Write(" disabled=""disabled""") %>>
          <option<% If intHotTopicViews = 5 Then Response.Write(" selected") %>>5</option>
          <option<% If intHotTopicViews = 10 Then Response.Write(" selected") %>>10</option>
          <option<% If intHotTopicViews = 20 Then Response.Write(" selected") %>>20</option>
          <option<% If intHotTopicViews = 30 Then Response.Write(" selected") %>>30</option>
          <option<% If intHotTopicViews = 40 Then Response.Write(" selected") %>>40</option>
          <option<% If intHotTopicViews = 50 Then Response.Write(" selected") %>>50</option>
          <option<% If intHotTopicViews = 60 Then Response.Write(" selected") %>>60</option>
          <option<% If intHotTopicViews = 70 Then Response.Write(" selected") %>>70</option>
          <option<% If intHotTopicViews = 80 Then Response.Write(" selected") %>>80</option>
          <option<% If intHotTopicViews = 90 Then Response.Write(" selected") %>>90</option>
          <option<% If intHotTopicViews = 100 Then Response.Write(" selected") %>>100</option>
          <option<% If intHotTopicViews = 110 Then Response.Write(" selected") %>>110</option>
          <option<% If intHotTopicViews = 120 Then Response.Write(" selected") %>>120</option>
          <option<% If intHotTopicViews = 130 Then Response.Write(" selected") %>>130</option>
          <option<% If intHotTopicViews = 140 Then Response.Write(" selected") %>>140</option>
          <option<% If intHotTopicViews = 150 Then Response.Write(" selected") %>>150</option>
          <option<% If intHotTopicViews = 200 Then Response.Write(" selected") %>>200</option>
          <option<% If intHotTopicViews = 250 Then Response.Write(" selected") %>>250</option>
          <option<% If intHotTopicViews = 300 Then Response.Write(" selected") %>>300</option>
          <option<% If intHotTopicViews = 400 Then Response.Write(" selected") %>>400</option>
          <option<% If intHotTopicViews = 500 Then Response.Write(" selected") %>>500</option>
        </select>      </td>
    </tr>
    <tr>
      <td class="tableRow">Hot Topic Number or Replies:<br />
      <span class="smText">This is the number of Replies a Topic must have to be shown as a Hot Topic.</span></td>
      <td valign="top" class="tableRow"><select name="hotReplies"<% If blnDemoMode Then Response.Write(" disabled=""disabled""") %>>
          <option<% If intHotTopicReplies = 3 Then Response.Write(" selected") %>>3</option>
          <option<% If intHotTopicReplies = 4 Then Response.Write(" selected") %>>4</option>
          <option<% If intHotTopicReplies = 5 Then Response.Write(" selected") %>>5</option>
          <option<% If intHotTopicReplies = 6 Then Response.Write(" selected") %>>6</option>
          <option<% If intHotTopicReplies = 7 Then Response.Write(" selected") %>>7</option>
          <option<% If intHotTopicReplies = 8 Then Response.Write(" selected") %>>8</option>
          <option<% If intHotTopicReplies = 9 Then Response.Write(" selected") %>>9</option>
          <option<% If intHotTopicReplies = 10 Then Response.Write(" selected") %>>10</option>
          <option<% If intHotTopicReplies = 15 Then Response.Write(" selected") %>>15</option>
          <option<% If intHotTopicReplies = 20 Then Response.Write(" selected") %>>20</option>
          <option<% If intHotTopicReplies = 25 Then Response.Write(" selected") %>>25</option>
          <option<% If intHotTopicReplies = 30 Then Response.Write(" selected") %>>30</option>
          <option<% If intHotTopicReplies = 35 Then Response.Write(" selected") %>>35</option>
          <option<% If intHotTopicReplies = 40 Then Response.Write(" selected") %>>40</option>
          <option<% If intHotTopicReplies = 45 Then Response.Write(" selected") %>>45</option>
          <option<% If intHotTopicReplies = 50 Then Response.Write(" selected") %>>50</option>
          <option<% If intHotTopicReplies = 60 Then Response.Write(" selected") %>>60</option>
          <option<% If intHotTopicReplies = 75 Then Response.Write(" selected") %>>75</option>
          <option<% If intHotTopicReplies = 100 Then Response.Write(" selected") %>>100</option>
      </select></td>
    </tr>
    <tr>
      <td class="tableRow">Number of Poll Choices:<br />
      <span class="smText">This is the maximum number of Choices allowed in a Forum Polls.</span></td>
      <td valign="top" class="tableRow"><select name="pollChoice" id="pollChoice"<% If blnDemoMode Then Response.Write(" disabled=""disabled""") %>>
          <option<% If intPollChoice = 3 Then Response.Write(" selected") %>>3</option>
          <option<% If intPollChoice = 4 Then Response.Write(" selected") %>>4</option>
          <option<% If intPollChoice = 5 Then Response.Write(" selected") %>>5</option>
          <option<% If intPollChoice = 6 Then Response.Write(" selected") %>>6</option>
          <option<% If intPollChoice = 7 Then Response.Write(" selected") %>>7</option>
          <option<% If intPollChoice = 8 Then Response.Write(" selected") %>>8</option>
          <option<% If intPollChoice = 9 Then Response.Write(" selected") %>>9</option>
          <option<% If intPollChoice = 10 Then Response.Write(" selected") %>>10</option>
          <option<% If intPollChoice = 11 Then Response.Write(" selected") %>>11</option>
          <option<% If intPollChoice = 12 Then Response.Write(" selected") %>>12</option>
          <option<% If intPollChoice = 13 Then Response.Write(" selected") %>>13</option>
          <option<% If intPollChoice = 14 Then Response.Write(" selected") %>>14</option>
          <option<% If intPollChoice = 15 Then Response.Write(" selected") %>>15</option>
          <option<% If intPollChoice = 16 Then Response.Write(" selected") %>>16</option>
          <option<% If intPollChoice = 17 Then Response.Write(" selected") %>>17</option>
          <option<% If intPollChoice = 18 Then Response.Write(" selected") %>>18</option>
          <option<% If intPollChoice = 19 Then Response.Write(" selected") %>>19</option>
          <option<% If intPollChoice = 20 Then Response.Write(" selected") %>>20</option>
          <option<% If intPollChoice = 25 Then Response.Write(" selected") %>>25</option>
        </select>      </td>
    </tr>
    <tr>
     <td colspan="2" class="tableLedger">Web Wiz NewsPad Integration </td>
     </tr>
    <tr>
     <td class="tableRow"><a href="http://www.webwiznewspad.com" target="_blank">Web Wiz NewsPad</a> Integration<br />
     <span class="smText"> By enabling Web Wiz NewsPad integration, your members can select when registering or in their forum profile to signup to Newsletters and News Bulletins sent using Web Wiz NewsPad </span></td>
     <td valign="top" class="tableRow">On
      <input type="radio" name="NewsPad" id="NewsPad" value="True" <% If blnWebWizNewsPad = True Then Response.Write "checked" %><% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> />
&nbsp;&nbsp;Off
<input type="radio" value="False" <% If blnWebWizNewsPad = False Then Response.Write "checked" %> name="NewsPad" id="NewsPad"<% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> /></td>
    </tr>
    <tr>
     <td class="tableRow">Web Wiz NewsPad URL <br />
      <span class="smText">If you type in the URL to NewsPad it will use the RSS Feed available in Web Wiz NewsPad to display links to Newsletters and News Bulletins on your forums index page. </span><br />
      <span class="smText">eg. http://www.mywebsite.com/NewsPad</span></td>
     <td valign="top" class="tableRow"><input name="NewsPadURL" type="text" id="NewsPadURL" value="<% = strWebWizNewsPadURL %>" size="35" maxlength="75"<% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> /></td>
    </tr>
    <tr align="center">
      <td colspan="2" class="tableBottomRow">
          <input type="hidden" name="postBack" value="true" />
          <input type="hidden" name="formID" id="formID" value="<% = getSessionItem("KEY") %>" />
          <input type="submit" name="Submit" value="Update Forum Configuration" />
          <input type="reset" name="Reset" value="Reset Form" />      </td>
    </tr>
  </table>
</form>
<br />
<!-- #include file="includes/admin_footer_inc.asp" -->
