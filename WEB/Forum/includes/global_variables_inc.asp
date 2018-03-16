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




Dim strLoggedInUsername		'Holds a logged in users username
Dim intGroupID			'Holds the group ID number the member is a group of
Dim lngLoggedInUserID		'Holds a logged in users ID number
Dim blnActiveMember		'Set to false if the member is no longer allowed to post messages on the forum
Dim strDateFormat		'Holds the users date format
Dim strTimeOffSet		'Holds the users time offset in + or -
Dim intTimeOffSet		'Holds the users time offset
Dim blnReplyNotify		'Set to true if the user wants to be notified of replies to posts
Dim blnAttachSignature		'Set to true if the user always wants there signature attached
Dim blnWYSIWYGEditor		'Set to true if the user wants to use the IE WYSIWYG post editor
Dim strLoggedInUserEmail	'Holds the logged in users email address
Dim intNoOfPms			'Holds the number of PM's the user has
Dim dtmUserLastVisitDate	'Holds the last visit date of the user
Dim blnLoggedInUserSignature	'set to true if the user has enetered a signature
Dim blnLoggedInUserEmail	'Set to true if the user has entered there e-mail
Dim blnBanned			'Holds if the user is banned (suspended)
Dim blnGuest			'set to true for the Guest account (Group ID 2)
Dim dtmLastVisitDate		'Holds the last visit date for the user


Dim sarySessionData		'Holds the users session data
Dim strWebsiteName		'Holds the website name
Dim strMainForumName		'Holds the forum name
Dim strForumPath		'Holds the virtual path to the forum
Dim strForumEmailAddress	'Holds the forum e-mail address
Dim blnTextLinks		'Set to true if you want text links instead of the powered by logo
Dim blnRTEEditor		'Set to true if the Rich Text Editor(RTE) is enabled
Dim blnEmail			'Boolean set to true if e-mail is on
Dim strMailComponent		'Email coponent the forum useses
Dim strMailServer		'Forums incomming mail server
Dim strLoggedInUserCode		'Holds the user code of the user
Dim blnLCode			'set to true
Dim blnAdmin			'set to true if the user is a forum admininstrator (Group ID 1)
Dim blnModerator		'Set to true if the user is a forum moderator
Dim intTopicPerPage		'Holds the number of topics to show on each page
Dim strTitleImage		'Holds the path and name for the title image for the forum
Dim blnEmoticons		'Set to true if emoticons are turned on
Dim blnGuestPost		'Set to true if guests can post
Dim blnAvatar			'Set to true if the forum can use avatars
Dim blnEmailActivation		'Set to true if the e-mail activation is turned on
Dim blnSendPost			'Set to true if post is sent with e-mail notification
Dim intNumHotViews		'Holds the number of how many views a topic has before it becomes a hot topic
Dim intNumHotReplies		'Holds the number of replies before a topic becomes a hot topic
Dim blnPrivateMessages		'Set to true if private messages are allowed
Dim intNumPrivateMessages	'Holds the number of private messages allowed by each user
Dim intThreadsPerPage		'Holds the number of threads shown per page
Dim intSpamTimeLimitSeconds	'Holds the number of secounds between posts
Dim intSpamTimeLimitMinutes	'Holds the number of minutes the user can post five posts in
Dim intMaxPollChoices		'Holds the maximum allowed number of poll choices
Dim blnEmailMessenger		'Set to true if the email system is on
Dim blnActiveUsers		'Set to true if active users is enabled
Dim blnForumClosed		'Set to true of the forum is cloded for maintence
Dim blnShowEditUser		'Set to true if we are to show the username and time a post is edited
Dim blnShowProcessTime		'Set to true if we are to show how long the page took to be processed on the server
Dim dblStartTime		'Holds the start time for the page process
Dim blnDisplayForumClosed	'Set to true if we are looking at the closed forum page
Dim blnFlashFiles		'Set to true if Flash support is enabled
Dim strWebsiteURL 		'Holds the URL to the sites homepage
Dim blnShowMod			'Set to true if mod groups are shown on the main forum page
Dim blnAvatarUploadEnabled	'Set to true if avatars are enabled
Dim blnRegistrationSuspeneded	'Set to true if new registrations are suspended
Dim strImageTypes		'Holds the types of images allowed in the forum
Dim blnLongRegForm		'Set to true if the reg form is to be the long version
Dim blnCAPTCHAsecurityImages	'Set to true if the security code feature is required when logging in
Dim strPathToRTEFiles		'Holds the path to the RTE files
Dim saryPermissions		'Holds the array for permissions
Dim blnTopicIcon		'Holds if message icons are enabled
Dim strMailServerUser		'Holds the SMTP server username
Dim strMailServerPass		'Holds the SMTP server password
Dim strNavSpacer		'Navigation spacer
Dim strImagePath		'Image path
Dim strCSSfile			'Path and name of CSS skin file
Dim saryActiveUsers		'Holds the active users array
Dim strQsSID			'Holds the users session ID displayed in pages
Dim strSessionData		'Holds the users session data
Dim strSessionID		'Holds  the forums internal sesison ID
Dim strQsSID1			'Holds the session ID for ? URL links
Dim strQsSID2			'Holds the session ID for &amp; URL links
Dim strQsSID3			'Holds the session ID for & URL links in redirects
Dim blnCalendar			'Set to true if Calendar is enabled
Dim blnGuestSessions		'Set to true if guest sessions are enabled
Dim blnMemberApprove		'Set to true if new members need to be approved by forum admin
Dim intLoginAttempts		'Holds the number of login attempts by the user
Dim blnRSS			'Set to true if RSS feed is enabled
Dim strInstallID		'Holds the forums unique install ID
Dim intPmFlood			'PM Flood control amount
Dim blnACode			'Set to true
Dim blnCAPTCHAabout		'CAPTCHA about
Dim sarryUnReadPosts		'Array to hold un-read post ID's
Dim strSponsor1			'Holds the ads in the header
Dim strSponsor2			'Holds the ads placed in posts
Dim strBreadCrumbTrail		'New variable that holds the bread crumb trail for the page
Dim strStatusBarTools		'As is says on the tin (or variable in this case)
Dim intForumID			'Holds the ID number of the forum
Dim strLinkPage			'Holds the page to link to
Dim strLinkPageTitle		'Holds the page to link to's title
Dim strUploadComponent		'Holds upload component
Dim strUploadFileTypes		'Holds upload file types
Dim intUploadMaxImageSize	'Holds max upload image size
Dim intUploadMaxFileSize	'Holds upload max file size
Dim intUploadAllocatedSpace	'Holds upload allocated user space
Dim strUploadOriginalFilePath	'For security the users upload folder is set in the common.asp on each page, but for admin purposes may need to get the orginal upload path
Dim blnWebWizNewsPad		'Set to true if Web Wiz NewsPad integration is enabled
Dim strWebWizNewsPadURL		'URL to Web Wiz NewsPad
Dim strClientBrowserVersion	'Holds the browser version
Dim strForumImageType		'Holds the type of image to use (PNG or GIF)
Dim blnWindowsAuthentication	'Set to true if windows autrhntication is enabled
Dim strEmailErrorMessage	'Holds the error message if an error sending an email
Dim strOSType			'Holds the OS type



'***** START WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
Const strCAPTCHAversion = "4.0 wwf"
blnCAPTCHAabout = blnLCode  
strSponsor1 = (vbCrLf & " <script type=""text/javascript"" src=""http://syndication.webwizguide.com/pagead/?L=wffh""></script>")
strSponsor2 = (vbCrLf & " <script type=""text/javascript"" src=""http://syndication.webwizguide.com/pagead/?L=wffp1""></script>")
Const blnDemoMode = False
'***** END WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******   







'Forum Permissions (Forum Level)
Dim blnRead
Dim blnPost
Dim blnReply
Dim blnEdit
Dim blnDelete
Dim blnPriority
Dim blnPollCreate
Dim blnVote
Dim blnCheckFirst
Dim blnEvents

'Group Permissions (Group Level)
Dim blnAttachments
Dim blnImageUpload


'Initialise variables
strLoggedInUsername = strTxtGuest
blnActiveMember = true
blnBanned = false
blnLoggedInUserEmail = false
blnLoggedInUserSignature = false
intGroupID = 2
lngLoggedInUserID = 2
blnAdmin = false
blnModerator = false
blnGuest = true
intTimeOffSet = 0
strTimeOffSet = "+"
blnWYSIWYGEditor = True
strPathToRTEFiles = ""
dblStartTime = Timer()
If Request.QueryString("01202233450") Then Server.Execute("includes/egg_inc.asp")



'Force Global Veriable Reload
If Request.QueryString("reload") Then
	Application.Lock
	Application(strAppPrefix & "blnConfigurationSet") = false
	Application(strAppPrefix & "saryAppDateTimeFormatData") = false
	Application.UnLock
End If




'******************************************
'***    Read in Configuration Data     ****
'******************************************

'This function when called with load in the global variables at application level 
'(application level variables are used for improved performance and less database hits)
Public Sub getForumConfigurationData()

	'Read in the Forum configuration
	If isEmpty(Application(strAppPrefix & "blnConfigurationSet")) OR isNull(Application(strAppPrefix & "blnConfigurationSet")) OR NOT Application(strAppPrefix & "blnConfigurationSet") = True Then
	
		'Initialise the SQL variable with an SQL statement to get the configuration details from the database
		strSQL = "SELECT " & strDbTable & "Configuration.* " & _
		"FROM " & strDbTable & "Configuration" &  strDBNoLock & " " & _
		"WHERE " & strDbTable & "Configuration.ID = 1;"
		
		'Set error trapping
		On Error Resume Next
	
		'Query the database
		rsCommon.Open strSQL, adoCon
		
		'If an error has occurred write an error to the page
		If Err.Number <> 0 Then	Call errorMsg("An error initialising Global Variables from database.", "getForumConfigurationData()_read_global_variables", "global_variables_inc.asp")
				
		
		'If there is config deatils in the recordset then read them in
		If NOT rsCommon.EOF Then
		
			'read in the configuration details from the recordset
			strWebsiteName = rsCommon("website_name")
			strMainForumName = rsCommon("forum_name")
			strWebsiteURL = rsCommon("website_path")
			strForumPath = rsCommon("forum_path")
			strMailComponent = rsCommon("mail_component")
			strMailServer = rsCommon("mail_server")
			strForumEmailAddress = rsCommon("forum_email_address")
			blnLCode = CBool(rsCommon("L_Code"))
			blnEmail = CBool(rsCommon("email_notify"))
			blnTextLinks = rsCommon("Text_link")
			blnRTEEditor = CBool(rsCommon("IE_editor"))
			intTopicPerPage = CInt(rsCommon("Topics_per_page"))
			strTitleImage = rsCommon("Title_image")
			blnEmoticons = CBool(rsCommon("Emoticons"))
			blnAvatar = CBool(rsCommon("Avatar"))
			blnEmailActivation = CBool(rsCommon("Email_activate"))
		 	intNumHotViews = CInt(rsCommon("Hot_views"))
			intNumHotReplies = CInt(rsCommon("Hot_replies"))
			blnSendPost = CBool(rsCommon("Email_post"))
			blnPrivateMessages = CBool(rsCommon("Private_msg"))
			intNumPrivateMessages = CInt(rsCommon("No_of_priavte_msg"))
			intThreadsPerPage = CInt(rsCommon("Threads_per_page"))
			intSpamTimeLimitSeconds = CInt(rsCommon("Spam_seconds"))
			intSpamTimeLimitMinutes = CInt(rsCommon("Spam_minutes"))
			intMaxPollChoices = CInt(rsCommon("Vote_choices"))
			blnEmailMessenger = CBool(rsCommon("Email_sys"))
			blnActiveUsers = CBool(rsCommon("Active_users"))
			blnForumClosed = CBool(rsCommon("Forums_closed"))
			blnShowEditUser = CBool(rsCommon("Show_edit"))
			blnShowProcessTime = CBool(rsCommon("Process_time"))
			blnFlashFiles = CBool(rsCommon("Flash"))
			blnShowMod = CBool(rsCommon("Show_mod"))
			blnAvatarUploadEnabled = CBool(rsCommon("Upload_avatar"))
			blnRegistrationSuspeneded = CBool(rsCommon("Reg_closed"))
			strUploadComponent = rsCommon("Upload_component")
			strImageTypes = rsCommon("Upload_img_types")
			intUploadMaxImageSize = CInt(rsCommon("Upload_img_size"))
			strUploadFileTypes = rsCommon("Upload_files_type")
			intUploadMaxFileSize = CInt(rsCommon("Upload_files_size"))
			intUploadAllocatedSpace = CInt(rsCommon("Upload_allocation"))
			strMailServerUser = rsCommon("Mail_username")
			strMailServerPass = rsCommon("Mail_password")
			strCSSfile = rsCommon("Skin_file")
			strImagePath = rsCommon("Skin_image_path")
			strNavSpacer = rsCommon("Skin_nav_spacer")
			blnTopicIcon = CBool(rsCommon("Topic_icon"))
			blnLongRegForm = CBool(rsCommon("Long_reg"))
			blnCAPTCHAsecurityImages = CBool(rsCommon("CAPTCHA"))
			blnCalendar = CBool(rsCommon("Calendar"))
			blnGuestSessions = CBool(rsCommon("Guest_SID"))
			blnMemberApprove = CBool(rsCommon("Member_approve"))
			blnRSS = CBool(rsCommon("RSS"))	
			strInstallID = rsCommon("Install_ID")
			intPmFlood = CInt(rsCommon("PM_Flood"))
			blnACode = CBool(rsCommon("A_code"))
			blnWebWizNewsPad = CBool(rsCommon("NewsPad"))
			strWebWizNewsPadURL = rsCommon("NewsPad_URL")
			
			
			
			
			'If we are using application level variables the configuration into the application level variables
			If blnUseApplicationVariables AND strCSSfile <> "" Then
				
				'Lock the application so only one user updates it at a time
				Application.Lock
				
				'read in the configuration details from the recordset
				Application(strAppPrefix & "strWebsiteName") = strWebsiteName
				Application(strAppPrefix & "strMainForumName") = strMainForumName
				Application(strAppPrefix & "strWebsiteURL") = strWebsiteURL
				Application(strAppPrefix & "strForumPath") = strForumPath
				Application(strAppPrefix & "strMailComponent") = strMailComponent
				Application(strAppPrefix & "strMailServer") = strMailServer
				Application(strAppPrefix & "strForumEmailAddress") = strForumEmailAddress
				Application(strAppPrefix & "blnLCode") = CBool(blnLCode)
				Application(strAppPrefix & "blnEmail") = CBool(blnEmail)
				Application(strAppPrefix & "blnTextLinks") = blnTextLinks
				Application(strAppPrefix & "blnRTEEditor") = CBool(blnRTEEditor)
				Application(strAppPrefix & "intTopicPerPage") = CInt(intTopicPerPage)
				Application(strAppPrefix & "strTitleImage") = strTitleImage
				Application(strAppPrefix & "blnEmoticons") = CBool(blnEmoticons)
				Application(strAppPrefix & "blnAvatar") = CBool(blnAvatar)
				Application(strAppPrefix & "blnEmailActivation") = CBool(blnEmailActivation)
			 	Application(strAppPrefix & "intNumHotViews") = CInt(intNumHotViews)
				Application(strAppPrefix & "intNumHotReplies") = CInt(intNumHotReplies)
				Application(strAppPrefix & "blnSendPost") = CBool(blnSendPost)
				Application(strAppPrefix & "blnPrivateMessages") = CBool(blnPrivateMessages)
				Application(strAppPrefix & "intNumPrivateMessages") = CInt(intNumPrivateMessages)
				Application(strAppPrefix & "intThreadsPerPage") = CInt(intThreadsPerPage)
				Application(strAppPrefix & "intSpamTimeLimitSeconds") = CInt(intSpamTimeLimitSeconds)
				Application(strAppPrefix & "intSpamTimeLimitMinutes") = CInt(intSpamTimeLimitMinutes)
				Application(strAppPrefix & "intMaxPollChoices") = CInt(intMaxPollChoices)
				Application(strAppPrefix & "blnEmailMessenger") = CBool(blnEmailMessenger)
				Application(strAppPrefix & "blnActiveUsers") = CBool(blnActiveUsers)
				Application(strAppPrefix & "blnForumClosed") = CBool(blnForumClosed)
				Application(strAppPrefix & "blnShowEditUser") = CBool(blnShowEditUser)
				Application(strAppPrefix & "blnShowProcessTime") = CBool(blnShowProcessTime)
				Application(strAppPrefix & "blnFlashFiles") = CBool(blnFlashFiles)
				Application(strAppPrefix & "blnShowMod") = CBool(blnShowMod)
				Application(strAppPrefix & "blnAvatarUploadEnabled") = CBool(blnAvatarUploadEnabled)
				Application(strAppPrefix & "blnRegistrationSuspeneded") = CBool(blnRegistrationSuspeneded)
				Application(strAppPrefix & "strUploadComponent") = strUploadComponent
				Application(strAppPrefix & "strImageTypes") = strImageTypes
				Application(strAppPrefix & "intUploadMaxImageSize") = CInt(intUploadMaxImageSize)
				Application(strAppPrefix & "strUploadFileTypes") = strUploadFileTypes
				Application(strAppPrefix & "intUploadMaxFileSize") = CInt(intUploadMaxFileSize)
				Application(strAppPrefix & "intUploadAllocatedSpace") = CInt(intUploadAllocatedSpace)
				Application(strAppPrefix & "strMailServerUser") = strMailServerUser
				Application(strAppPrefix & "strMailServerPass") = strMailServerPass
				Application(strAppPrefix & "strCSSfile") = strCSSfile
				Application(strAppPrefix & "strNavSpacer") = strNavSpacer
				Application(strAppPrefix & "strImagePath") = strImagePath
				Application(strAppPrefix & "blnTopicIcon") = CBool(blnTopicIcon)
				Application(strAppPrefix & "blnLongRegForm") = CBool(blnLongRegForm)
				Application(strAppPrefix & "blnCAPTCHAsecurityImages") = CBool(blnCAPTCHAsecurityImages)
				Application(strAppPrefix & "blnCalendar") = CBool(blnCalendar)
				Application(strAppPrefix & "blnGuestSessions") = CBool(blnGuestSessions)
				Application(strAppPrefix & "blnMemberApprove") = CBool(blnMemberApprove)	
				Application(strAppPrefix & "blnRSS") = CBool(blnRSS)
				Application(strAppPrefix & "strInstallID") = strInstallID
				Application(strAppPrefix & "intPmFlood") = CInt(intPmFlood)
				Application(strAppPrefix & "blnACode") = CBool(blnACode)
				Application(strAppPrefix & "blnWebWizNewsPad") = CBool(blnWebWizNewsPad)
				Application(strAppPrefix & "strWebWizNewsPadURL") = strWebWizNewsPadURL
				
				
				
				'Set the configuartion set application variable to true
				Application(strAppPrefix & "blnConfigurationSet") = True
				
				'Unlock the application
				Application.UnLock
			
			End If
			
			
		End If
		
		'Close the recordset
		rsCommon.Close
		
		'If an error has occurred write an error to the page
		If Err.Number <> 0 Then	Call errorMsg("An error initialising Global Variables from database.", "getForumConfigurationData()_get_global_variables", "global_variables_inc.asp")
					
		'Disable error trapping
		On Error goto 0	
	
	
	'If we are using application level variables for the forum configuration then load in the variables from the application variables.
	ElseIf blnUseApplicationVariables Then	
			
			'read in the configuration details from the application varaibales
			strWebsiteName = Application(strAppPrefix & "strWebsiteName")
			strMainForumName = Application(strAppPrefix & "strMainForumName")
			strWebsiteURL = Application(strAppPrefix & "strWebsiteURL")
			strForumPath = Application(strAppPrefix & "strForumPath")
			strMailComponent = Application(strAppPrefix & "strMailComponent")
			strMailServer = Application(strAppPrefix & "strMailServer")
			strForumEmailAddress = Application(strAppPrefix & "strForumEmailAddress")
			blnLCode = CBool(Application(strAppPrefix & "blnLCode"))
			blnEmail = CBool(Application(strAppPrefix & "blnEmail"))
			blnTextLinks = Application(strAppPrefix & "blnTextLinks")
			blnRTEEditor = CBool(Application(strAppPrefix & "blnRTEEditor"))
			intTopicPerPage = CInt(Application(strAppPrefix & "intTopicPerPage"))
			strTitleImage = Application(strAppPrefix & "strTitleImage")
			blnEmoticons = CBool(Application(strAppPrefix & "blnEmoticons"))
			blnAvatar = CBool(Application(strAppPrefix & "blnAvatar"))
			blnEmailActivation = CBool(Application(strAppPrefix & "blnEmailActivation"))
		 	intNumHotViews = CInt(Application(strAppPrefix & "intNumHotViews"))
			intNumHotReplies = CInt(Application(strAppPrefix & "intNumHotReplies"))
			blnSendPost = CBool(Application(strAppPrefix & "blnSendPost"))
			blnPrivateMessages = CBool(Application(strAppPrefix & "blnPrivateMessages"))
			intNumPrivateMessages = CInt(Application(strAppPrefix & "intNumPrivateMessages"))
			intThreadsPerPage = CInt(Application(strAppPrefix & "intThreadsPerPage"))
			intSpamTimeLimitSeconds = CInt(Application(strAppPrefix & "intSpamTimeLimitSeconds"))
			intSpamTimeLimitMinutes = CInt(Application(strAppPrefix & "intSpamTimeLimitMinutes"))
			intMaxPollChoices = CInt(Application(strAppPrefix & "intMaxPollChoices"))
			blnEmailMessenger = CBool(Application(strAppPrefix & "blnEmailMessenger"))
			blnActiveUsers = CBool(Application(strAppPrefix & "blnActiveUsers"))
			blnForumClosed = CBool(Application(strAppPrefix & "blnForumClosed"))
			blnShowEditUser = CBool(Application(strAppPrefix & "blnShowEditUser"))
			blnShowProcessTime = CBool(Application(strAppPrefix & "blnShowProcessTime"))
			blnFlashFiles = CBool(Application(strAppPrefix & "blnFlashFiles"))
			blnShowMod = CBool(Application(strAppPrefix & "blnShowMod"))
			blnAvatarUploadEnabled = CBool(Application(strAppPrefix & "blnAvatarUploadEnabled"))
			blnRegistrationSuspeneded = CBool(Application(strAppPrefix & "blnRegistrationSuspeneded"))
			strImageTypes = Application(strAppPrefix & "strImageTypes")
			strUploadComponent = Application(strAppPrefix & "strUploadComponent")
			intUploadMaxImageSize = Cint(Application(strAppPrefix & "intUploadMaxImageSize"))
			strUploadFileTypes = Application(strAppPrefix & "strUploadFileTypes")
			intUploadMaxFileSize = CInt(Application(strAppPrefix & "intUploadMaxFileSize"))
			intUploadAllocatedSpace = CInt(Application(strAppPrefix & "intUploadAllocatedSpace"))	
			strMailServerUser = Application(strAppPrefix & "strMailServerUser")
			strMailServerPass = Application(strAppPrefix & "strMailServerPass")
			strCSSfile = Application(strAppPrefix & "strCSSfile")
			strNavSpacer = Application(strAppPrefix & "strNavSpacer")
			strImagePath = Application(strAppPrefix & "strImagePath")
			blnTopicIcon = CBool(Application(strAppPrefix & "blnTopicIcon"))
			blnLongRegForm = CBool(Application(strAppPrefix & "blnLongRegForm"))
			blnCAPTCHAsecurityImages = CBool(Application(strAppPrefix & "blnCAPTCHAsecurityImages"))
			blnCalendar = CBool(Application(strAppPrefix & "blnCalendar"))
			blnGuestSessions = CBool(Application(strAppPrefix & "blnGuestSessions"))
			blnMemberApprove = CBool(Application(strAppPrefix & "blnMemberApprove"))
			blnRSS = CBool(Application(strAppPrefix & "blnRSS"))
			strInstallID = Application(strAppPrefix & "strInstallID")
			intPmFlood = CInt(Application(strAppPrefix & "intPmFlood"))
			blnACode = CBool(Application(strAppPrefix & "blnACode"))
			blnWebWizNewsPad = CBool(Application(strAppPrefix & "blnWebWizNewsPad"))
			strWebWizNewsPadURL = Application(strAppPrefix & "strWebWizNewsPadURL")
	End If


	'***** START WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
	'*** MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT AND COULD LEAD TO LEGAL ACTION BEING TAKEN!! ***
	blnCAPTCHAabout = blnLCode 
	If (strInstallID = "" OR isNull(strInstallID)) AND blnDemoMode = False Then 
		strInstallID = "Free Express Edition Install"
		blnACode = True
		blnLCode = True
	End If
	'*** MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT AND COULD LEAD TO LEGAL ACTION BEING TAKEN!! ***
	If blnACode AND blnDemoMode = False AND NOT strInstallID = "Adware" Then
		strUploadComponent = "none"
		intUploadMaxFileSize = 0
		intUploadMaxImageSize = 0
		intUploadAllocatedSpace = 0
		intNumPrivateMessages = 5
		blnCalendar = False
		blnRSS = False
		blnAttachments = False
		blnImageUpload = False
		blnWindowsAuthentication = False
		blnDynamicMetaTags = False
		blnSeoTitleQueryStrings = False
	End If
	'***** END WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
	
	'If someone has placed the default.asp in the path to the forum then remove it as it's not needed
	strForumPath = Replace(strForumPath, "default.asp", "")
	
	'Make sure the web address has a / on the end
	If strForumPath <> "" AND isNull(strForumPath) = False Then
		If Mid(strForumPath, len(strForumPath), 1) <> "/" Then  strForumPath = strForumPath & "/"
	End If
	'Make sure the image path has a / on the end
	If strImagePath <> "" AND isNull(strImagePath) = False Then
		If Mid(strImagePath, len(strImagePath), 1) <> "/" Then  strImagePath = strImagePath & "/"
	End If
		
	'If Web Wiz NewsPad is enabled make sure we have the correct path	
	If isNull(strWebWizNewsPadURL) = False AND NOT strWebWizNewsPadURL = "" Then 
		strWebWizNewsPadURL = Replace(strWebWizNewsPadURL, "default.asp", "")
	
		'Make sure the web addresses has a / on the end
		If Mid(strWebWizNewsPadURL, len(strWebWizNewsPadURL), 1) <> "/" Then  strWebWizNewsPadURL = strWebWizNewsPadURL & "/"
	End If 
	
	'Make sure the CSS path has / on the end
	If strCSSfile <> "" AND isNull(strCSSfile) = False Then 
		If Mid(strCSSfile, len(strCSSfile), 1) <> "/" Then  strCSSfile = strCSSfile & "/"
	End If
	
	
	'Check the client browser version
	strClientBrowserVersion = browserDetect()
	
	'If the cleint browser is IE 6 of below then display GIF's for some of the images
	If strClientBrowserVersion = "MSIE6-" Then 
		strForumImageType = "gif"
	Else
		strForumImageType = "png"
	End If
	
	'Read in the OS Type
	strOSType = OSType
	
		
	'If the admin needs to approve the membership, disable email activation for the user
	If blnMemberApprove Then blnEmailActivation = false

	'For demo mode
	If blnDemoMode Then
		strInstallID = "Demo Mode"
		blnSendPost = False
		strMailComponent = ""
		blnEmailActivation = False
		strForumEmailAddress = ""
		blnEmailMessenger = False
		blnAvatarUploadEnabled = False
		blnRegistrationSuspeneded = False
		strUploadComponent = "AspUpload"
		intUploadMaxFileSize = 10240
		intUploadMaxImageSize = 500
		intUploadAllocatedSpace = 25
		blnForumClosed = False
		blnMemberApprove = False
		blnPrivateMessages = True
		blnCalendar = True
		blnEmail = False
		blnRSS = True
		intNumPrivateMessages = 100
	End If
End Sub




%>