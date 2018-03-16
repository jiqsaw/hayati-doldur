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




'******************************************
'***  	  	 Setup options        ****
'******************************************


'Set up the Cookie ID Name
'(This is useful if you run multiple copies of Web Wiz Forums on the same site so that cookies don't interfer with each other)
Const strCookiePrefix = "WWF9"

'Set the Cookie Path
'If you have issues with cookies for your users you may want to change the path set for your cookies
Dim strCookiePath
'strCookiePath = "/" 
strCookiePath = LCase(Left(Request.ServerVariables("HTTP_URL"), InstrRev(Request.ServerVariables("HTTP_URL"), "/")))



'Set up application variables prefix
'This can be useful if you are running mutiple installations of Web Wiz Forums on the same site or if you are using free web where you share your application object with others
Const strAppPrefix = "WWF9"


'Set if Application variables are used to improve performance
Const blnUseApplicationVariables = true



'Tracking/Session Data
'Set this to true if you wish to store user tracking/session data in the database or false if you wish use application variables
'You may need to set this to 'True' if you are expericing login/session issues, or using a web garden or multiple load balanced web servers
'There is a small impact on performance by using the database to store session data. If using Access you should not use the database to store session data
Const blnDatabaseHeldSessions = True




'Logging
'Web Wiz Forums is able to create log files of actions, activity, and errors. However this WILL effect performance so be careful what you enable logging for.
'Logging requires that the folder storing log files has read, write, and modify permissions for the IUSR account in order for Web Wiz Forums to create and write to log files.
'SECURITY ALERT: MAKE SURE THAT YOU MOVE THE LOG FILE LOCATION TO A FOLDER NOT ACCESSIBLE TO THE PUBLIC.
Const blnLoggingEnabled = False		'Enable logging
Dim strLogFileLocation
strLogFileLocation = Server.MapPath("log_files") 	'Default log file folder, change this to a folder outside your website root if you don't want logs files to be public

Const blnModeratorLogging = True 	'Log the actions of moderators
Const blnErrorLogging = True		'Log error messages
Const blnNewRegistrationLogging = True 	'Log new registrations

Const blnCreatePostLogging = False 	'Log the creating of new topics and posts (Don't enable this on busy forums)
Const blnEditPostLogging = False 	'Log the editing of topics and posts (Don't enable this on busy forums)
Const blnDeletePostLogging = False 	'Log the deletion of topics and posts






'Set Encrypted passwords (ignore unless you don't wish to use Encrypted passwords in your forum)
'This will make your forum unsecure from hackers if you disable this!!!!!
'This can NOT be changed once your forum is in use!!!
'If you do disable Encrypted Passwords - You will also need to directly edit the database to type in the admin password to the Password field in the " & strDbTable & "Author table at record position 1 also edit both common.asp files to change this variable
Const blnEncryptedPasswords = True 'True = Encrypted Passwords Enabled  -  Flase = Encrypted Passwords Disabled





'Other options
Const blnForumViewing = True 'Displays how many users are viewing a forum
Const blnDisplayBirthdays = True 'Displays birthdays in the calendar system
Const blnDetailedErrorReporting = True 'Set this to false if you do not want detailed server error messages when server error occur
Const blnNoFollowTagInLinks = False 'To prevent search engine spiders/bots following links from posts to other sites etc. then set this to true so that links get the re="no follow" tag
Const intRSSLinkDisplayWeeks = 2 'This is the length of time to show RSS Feeds for posts for since they where last posted in, to high and you will consume to much bandwidth
Const blnModeratorProfileEdit = True 'Set this to False if you do not want moderators to edit the profiles of forum members
Const blnGuestPostingCAPTCHA = True 'Spam prevention, means that Guest need to enter CAPTCHA security image code before posting
Const blnClassicPageNumbering = False 'Set this to true if you like the old pre version 9 drop down page numbering
Const blnNewUserCode = False 'Create new user code on logging into the forum, improves security, but will loose auto-login status if you login from mulktiple computers
Const blnHttpXmlApi = True 'Set to false if you want to disable the HTTP XML API
Const blnBoldToday = True 'Set to false if you do not want 'Today' date shown in bold
Const blnBoldNewTopics = True 'Set to false if you do not want new posts shown in bold
Dim blnDynamicMetaTags
blnDynamicMetaTags = True 'Set to false if you do not want dynamic meta tags in your forum
Const blnUploadSecurityCheck = False 'Set to false if you do not want file and image uploads parsed for malicous code
Dim blnSeoTitleQueryStrings
blnSeoTitleQueryStrings = True 'Set to false if you do not want SEO Friendly Titles added to your URL's

'Upload folder path, DO NOT CHANGE as it may break your forums upload tools
Dim strUploadFilePath
strUploadFilePath = "uploads" 'This is the upload folder





'******************************************
'***  	  Browser Page Encoding        ****
'******************************************


'This is set to 'ltr' (Left to Right) by default can be be chnaged to 'rtl' (Right to Left) for other charactersets
Const strTextDirection = "ltr"



'Uncomment the character set you require 
'(uncomment means remove the (') single quote from infront of the line)

'Unicode UTF-8
'Const strPageEncoding = "utf-8"

'Western European ISO
'Const strPageEncoding = "iso-8859-1"

'Arabic ISO
'Const strPageEncoding = "iso-8859-6"

'Arabic Windows
'Const strPageEncoding = "windows-1256"

'Baltic Windows
'Const strPageEncoding = "windows-1257"

'Central European DOS
'Const strPageEncoding = "ibm852"

'Central European ISO
'Const strPageEncoding = "iso-8859-2"

'Central European Windows
'Const strPageEncoding = "windows-1250"

'Chinese Simplified
'Const strPageEncoding = "gb2312"

'Chinese Simplified
'Const strPageEncoding = "hz-gb-2312"

'Chinese Traditional
'Const strPageEncoding = "big5"

'Cyrillic ISO
'Const strPageEncoding = "iso-8859-5"

'Cyrillic KOI8-R
'Const strPageEncoding = "koi8-r"

'Cyrillic KOI8-U
'Const strPageEncoding = "koi8-ru"

'Cyrillic Windows
'Const strPageEncoding = "windows-1251"

'Greek ISO
'Const strPageEncoding = "iso-8859-7"

'Greek Windows
'Const strPageEncoding = "windows-1253"

'Hebrew ISO-Logical
'Const strPageEncoding = "iso-8859-8-i"

'Hebrew ISO-Visual
'Const strPageEncoding = "iso-8859-8"

'Hebrew Windows
'Const strPageEncoding = "windows-1255"

'Japanese EUC
'Const strPageEncoding = "euc-jp"

'Japanese Shift-JIS
'Const strPageEncoding = "shift-jis"

'Korean
'Const strPageEncoding = "euc-kr"

'Thai Windows
'Const strPageEncoding = "windows-874"

'Turkish ISO
Const strPageEncoding = "iso-8859-9"

'Vietnamese
'Const strPageEncoding = "windows-1258"
%>