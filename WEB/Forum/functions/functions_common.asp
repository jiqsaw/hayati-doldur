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





'******************************************
'***  		Create Usercode	      *****
'******************************************

Private Function userCode(ByVal strUsername)

	Dim strUserCode

	'Randomise the system timer
	Randomize Timer

	'Calculate a code for the user
	strUserCode = strUsername & hexValue(12)

	'Make the usercode SQL safe
	strUserCode = formatSQLInput(strUserCode)

	'Replace double quote with single in this intance
	strUserCode = Replace(strUserCode, "''", "'", 1, -1, 1)
	
	'Remove ; from the usercode as this can course issues with the session tracking system (; is used as a seporator in teh session tracking system)
	strUserCode = Replace(strUserCode, ";", "", 1, -1, 1)
	
	'Repace space with underscore
	strUserCode = Replace(strUserCode, " ", "_", 1, -1, 1)

	'Return the function
	userCode = strUserCode
End Function






'*********************************************
'***  Browser Detection for Degradablity  ****
'*********************************************

'Ths function allows us to quickly detect the browser version so that some items can be disabled in browsers which have buggy support
Private Function browserDetect()

	Dim strUserAgent	'Holds info on the users browser

	'Get the users HTTP user agent (web browser)
	strUserAgent = Request.ServerVariables("HTTP_USER_AGENT")

	'MSIE
	If InStr(1, strUserAgent, "MSIE", 1) AND InStr(1, strUserAgent, "Opera", 1) = 0 Then
		
		'Check that we are dealing with a numeric number
		If isNumeric(Trim(Mid(strUserAgent, CInt(inStr(1, strUserAgent, "MSIE", 1)+5), 1))) Then
			'MSIE 6 or below
			If  CInt(Trim(Mid(strUserAgent, CInt(inStr(1, strUserAgent, "MSIE", 1)+5), 1))) <= 6 Then
				browserDetect = "MSIE6-"
			Else
				browserDetect = "MSIE"
			End If
		Else
			browserDetect = "MSIE"
		End If

	'Gekco
	ElseIf inStr(1, strUserAgent, "Gecko", 1) Then
		browserDetect = "Gecko"

	'Opera
	ElseIf inStr(1, strUserAgent, "Opera", 1) Then
		browserDetect = "opera"
		
	'Others
	Else
		browserDetect = "na"
	End If

End Function










'******************************************
'***  	   Random Hex Generator        ****
'******************************************

Private Function hexValue(ByVal intHexLength)

	Dim intLoopCounter
	Dim strHexValue

	'Randomise the system timer
	Randomize Timer()

	'Generate a hex value
	For intLoopCounter = 1 to intHexLength

		'Genreate a radom decimal value form 0 to 15
		intHexLength = CInt(Rnd * 1000) Mod 16

		'Turn the number into a hex value
		Select Case intHexLength
			Case 1
				strHexValue = "1"
			Case 2
				strHexValue = "2"
			Case 3
				strHexValue = "3"
			Case 4
				strHexValue = "4"
			Case 5
				strHexValue = "5"
			Case 6
				strHexValue = "6"
			Case 7
				strHexValue = "7"
			Case 8
				strHexValue = "8"
			Case 9
				strHexValue = "9"
			Case 10
				strHexValue = "A"
			Case 11
				strHexValue = "B"
			Case 12
				strHexValue = "C"
			Case 13
				strHexValue = "D"
			Case 14
				strHexValue = "E"
			Case 15
				strHexValue = "F"
			Case Else
				strHexValue = "Z"
		End Select

		'Place the hex value into the return string
		hexValue = hexValue & strHexValue
	Next
End Function




'********************************************
'***  Rich Text Compatible Browser type *****
'********************************************

Private Function RTEenabled()

	Dim strUserAgent	'Holds info on the users browser

	'Get the users HTTP user agent (web browser)
	strUserAgent = Request.ServerVariables("HTTP_USER_AGENT")


	'*************************************
	'***** Windows Internet Explorer *****
	'*************************************

	'See if the user agent is IE on Winows and not Opera trying to look like IE
	If InStr(1, strUserAgent, "MSIE", 1) > 0 AND InStr(1, strUserAgent, "Win", 1) > 0 AND InStr(1, strUserAgent, "Opera", 1) = 0 Then

		'Now we know this is Windows IE we need to see if the version number is 5.5
		If Trim(Mid(strUserAgent, inStr(1, strUserAgent, "MSIE", 1)+5, 3)) = "5.5" OR Trim(Mid(strUserAgent, inStr(1, strUserAgent, "MSIE", 1)+5, 3)) = "5,5" Then

			RTEenabled = "winIE"
		
		'Now we know this is Windows IE we need to see if the version number is 6+ (error handling to make sure number is numeric)
		ElseIf isNumeric(Trim(Mid(strUserAgent, CInt(inStr(1, strUserAgent, "MSIE", 1)+5), 1))) Then
			
			'Now check the version number is 6 or above
			If CInt(Trim(Mid(strUserAgent, CInt(inStr(1, strUserAgent, "MSIE", 1)+5), 1))) >= 6 Then
				RTEenabled = "winIE"
			'Else IE is below 5
			Else
				RTEenabled = "false"
			End If

		'Else the IE version is below 5 so return na
		Else

			RTEenabled = "false"
		End If


	'****************************
	'***** Mozilla Firebird *****
	'****************************

	'See if this is a version of Mozilla Firebird that supports Rich Text Editing under it's Midas API
	ElseIf inStr(1, strUserAgent, "Firebird", 1) Then

		'Now we know this is Mozilla Firebird we need to see if the version 0.6.1 or above; relase date is above 2003/07/28
		If CLng(Trim(Mid(strUserAgent, CInt(inStr(1, strUserAgent, "Gecko/", 1)+6), 8))) >= 20030728 Then

			RTEenabled = "Gecko"

		'Else the Mozilla Firebird version is below 1.5 so return false
		Else

			RTEenabled = "false"
		End If


	'**********************************************
	'***** Mozilla Firefox/Seamonkey/Netscape *****
	'**********************************************

	'See if this is a version of Mozilla/Netscape that supports Rich Text Editing under it's Midas API
	ElseIf inStr(1, strUserAgent, "Gecko", 1) > 0 AND inStr(1, strUserAgent, "Firebird", 1) = 0 AND isNumeric(Trim(Mid(strUserAgent, CInt(inStr(1, strUserAgent, "Gecko/", 1)+6), 8))) Then

		'Now we know this is Mozilla/Netscape we need to see if the version number is above 1.3 or above; relase date is above 2003/03/12
		If CLng(Trim(Mid(strUserAgent, CInt(inStr(1, strUserAgent, "Gecko/", 1)+6), 8))) => 20030312 Then

			RTEenabled = "Gecko"

		'Else the Mozilla version is below 1.3 or below 7.1 of Netscape so return false
		Else

			RTEenabled = "false"
		End If
		
		
	'**********************************************
	'***** 		Opera 9 		  *****
	'**********************************************
	
	'See if this is Opera that supports Rich Text (Opera 9 and above)
	ElseIf inStr(1, strUserAgent, "Opera", 1) AND InStr(1, strUserAgent, "Opera Mini", 1) = 0 Then
		
		'now we need to see what version of Opera we are using
		If isNumeric(Trim(Mid(strUserAgent, CInt(inStr(1, strUserAgent, "Opera/", 1)+6), 1))) Then
			
			If CLng(Trim(Mid(strUserAgent, CInt(inStr(1, strUserAgent, "Opera/", 1)+6), 1))) => 9 Then
				
				RTEenabled = "opera"
			
			'Else the Opera version is below 9 so return false
			Else
	
				RTEenabled = "false"
			End If
		
		'Else the Opera version is below 9 so return false
		Else
	
			RTEenabled = "false"
		End If
		
		
		
	'******************************
	'***** 	  Apple Safari	  *****
	'******************************
	
	'See if this is Safari that supports Rich Text (Safari 3.1 and above)
	ElseIf inStr(1, strUserAgent, "Safari", 1) Then
		
		'Javascript is not supported on the iPhone and iPod
		If inStr(1, strUserAgent, "iPhone", 1) OR inStr(1, strUserAgent, "iPod", 1) Then
			
			RTEenabled = "false"
		
		'See what everion we are using of Safari
		ElseIf isNumeric(Trim(Mid(strUserAgent, CInt(inStr(1, strUserAgent, "Safari/", 1)+7), 3))) Then
			
			'If the version number is 523 or above it is fully RTE enabled
			If CLng(Trim(Mid(strUserAgent, CInt(inStr(1, strUserAgent, "Safari/", 1)+7), 3))) => 523 Then
				
				'Safari works idenetically to Gekco so idenetify as Gecko
				RTEenabled = "Gecko"
			
			'Else the the version is older and not fully RTE enabled
			Else
	
				RTEenabled = "false"
			End If
		
		'Else the Safari version is below 3.0.4 so return false
		Else
	
			RTEenabled = "false"
		End If
	


	'***********************************
	'***** Non RTE Enabled Browser *****
	'***********************************

	'Else this is a browser that does not support Rich Text Editing
	Else
		'RTEenabled - false
		RTEenabled = "false"
	End If

End Function





'******************************************
'***    Get Web Browser Details	      *****
'******************************************

Private Function BrowserType()

	Dim strUserAgent	'Holds info on the users browser and os
	Dim strBrowserUserType	'Holds the users browser type

	'Get the users HTTP user agent (web browser)
	strUserAgent = Request.ServerVariables("HTTP_USER_AGENT")

	'Get the uesrs web browser
	'Opera Mini
	If InStr(1, strUserAgent, "Opera Mini", 1) Then
		strBrowserUserType = "Opera Mini"
	
	'Opera
	ElseIf InStr(1, strUserAgent, "Opera 5", 1) Then
		strBrowserUserType = "Opera 5"
	ElseIf InStr(1, strUserAgent, "Opera 6", 1) Then
		strBrowserUserType = "Opera 6"
	ElseIf InStr(1, strUserAgent, "Opera 7", 1) Then
		strBrowserUserType = "Opera 7"
	ElseIf InStr(1, strUserAgent, "Opera 8", 1) Then
		strBrowserUserType = "Opera 8"
	ElseIf InStr(1, strUserAgent, "Opera 9", 1) Then
		strBrowserUserType = "Opera 9"
	ElseIf InStr(1, strUserAgent, "Opera 10", 1) Then
		strBrowserUserType = "Opera 10"
	ElseIf InStr(1, strUserAgent, "Opera", 1) Then
		strBrowserUserType = "Opera"

	'AOL
	ElseIf inStr(1, strUserAgent, "AOL", 1) Then
		strBrowserUserType = "AOL"

	'Konqueror
	ElseIf inStr(1, strUserAgent, "Konqueror", 1) Then
		strBrowserUserType = "Konqueror"

	'EudoraWeb
	ElseIf inStr(1, strUserAgent, "EudoraWeb", 1) Then
		strBrowserUserType = "EudoraWeb"

	'Dreamcast
	ElseIf inStr(1, strUserAgent, "Dreamcast", 1) Then
		strBrowserUserType = "Dreamcast"
		
	'Google Chrome
	ElseIf inStr(1, strUserAgent, "Chrome", 1) Then
		strBrowserUserType = "Google Chrome"
	
	'Safari
	ElseIf inStr(1, strUserAgent, "Safari", 1) AND inStr(1, strUserAgent, "Version/1", 1) Then
		strBrowserUserType = "Safari 1"
	ElseIf inStr(1, strUserAgent, "Safari", 1) AND inStr(1, strUserAgent, "Version/2", 1) Then
		strBrowserUserType = "Safari 2"
	ElseIf inStr(1, strUserAgent, "Safari", 1) AND inStr(1, strUserAgent, "Version/3", 1) Then
		strBrowserUserType = "Safari 3"
	ElseIf inStr(1, strUserAgent, "Safari", 1) AND inStr(1, strUserAgent, "Version/4", 1) Then
		strBrowserUserType = "Safari 4"
	ElseIf inStr(1, strUserAgent, "Safari", 1) Then
		strBrowserUserType = "Safari"

	'Lynx
	ElseIf inStr(1, strUserAgent, "Lynx", 1) Then
		strBrowserUserType = "Lynx"

	'ICE
	ElseIf inStr(1, strUserAgent, "ICE", 1) Then
		strBrowserUserType = "ICE"

	'iCab
	ElseIf inStr(1, strUserAgent, "iCab", 1) Then
		strBrowserUserType = "iCab"

	'HotJava
	ElseIf inStr(1, strUserAgent, "Sun", 1) AND inStr(1, strUserAgent, "Mozilla/3", 1) Then
		strBrowserUserType = "HotJava"

	'Galeon
	ElseIf inStr(1, strUserAgent, "Galeon", 1) Then
		strBrowserUserType = "Galeon"

	'Epiphany
	ElseIf inStr(1, strUserAgent, "Epiphany", 1) Then
		strBrowserUserType = "Epiphany"

	'DocZilla
	ElseIf inStr(1, strUserAgent, "DocZilla", 1) Then
		strBrowserUserType = "DocZilla"

	'Camino
	ElseIf inStr(1, strUserAgent, "Chimera", 1) OR inStr(1, strUserAgent, "Camino", 1) Then
		strBrowserUserType = "Camino"

	'Dillo
	ElseIf inStr(1, strUserAgent, "Dillo", 1) Then
		strBrowserUserType = "Dillo"

	'amaya
	ElseIf inStr(1, strUserAgent, "amaya", 1) Then
		strBrowserUserType = "Amaya"

	'NetCaptor
	ElseIf inStr(1, strUserAgent, "NetCaptor", 1) Then
		strBrowserUserType = "NetCaptor"


	'Twiceler
	ElseIf inStr(1, strUserAgent, "Twiceler", 1) Then
		strBrowserUserType = "Twiceler"

	'LookSmart search engine robot
	ElseIf inStr(1, strUserAgent, "ZyBorg", 1) Then
		strBrowserUserType = "LookSmart"

	'Googlebot search engine robot
	ElseIf inStr(1, strUserAgent, "Googlebot", 1) Then
		strBrowserUserType = "Google"

	 'Google/AdSense search engine robot
    	ElseIf inStr(1, strUserAgent, "Mediapartners-Google", 1) Then
        	strBrowserUserType = "Google/AdSense"

	'MSN  search engine robot
	ElseIf inStr(1, strUserAgent, "msnbot", 1) Then
		strBrowserUserType = "MSN"

	'inktomi search engine robot
	ElseIf inStr(1, strUserAgent, "slurp", 1) Then
		strBrowserUserType = "Yahoo"

	'AltaVista search engine robot
	ElseIf inStr(1, strUserAgent, "Scooter", 1) Then
		strBrowserUserType = "AltaVista"

	'DMOZ search engine robot
	ElseIf inStr(1, strUserAgent, "Robozilla", 1) Then
		strBrowserUserType = "DMOZ"

	'Ask Jeeves search engine robot
	ElseIf inStr(1, strUserAgent, "Ask Jeeves", 1) OR inStr(1, strUserAgent, "Ask+Jeeves", 1) Then
		strBrowserUserType = "Ask Jeeves"

	'Lycos search engine robot
	ElseIf inStr(1, strUserAgent, "lycos", 1) Then
		strBrowserUserType = "Lycos"

	'Excite search engine robot
	ElseIf inStr(1, strUserAgent, "ArchitextSpider", 1) Then
		strBrowserUserType = "Excite"

	'Northernlight search engine robot
	ElseIf inStr(1, strUserAgent, "Gulliver", 1) Then
		strBrowserUserType = "Northernlight"

	'AllTheWeb search engine robot
	ElseIf inStr(1, strUserAgent, "crawler@fast", 1) Then
		strBrowserUserType = "AllTheWeb"

	'Turnitin search engine robot
	ElseIf inStr(1, strUserAgent, "TurnitinBot", 1) Then
		strBrowserUserType = "Turnitin"

	'InternetSeer search engine robot
	ElseIf inStr(1, strUserAgent, "internetseer", 1) Then
		strBrowserUserType = "InternetSeer"

	'NameProtect Inc. search engine robot
	ElseIf inStr(1, strUserAgent, "nameprotect", 1) Then
		strBrowserUserType = "NameProtect"

	'PhpDig search engine robot
	ElseIf inStr(1, strUserAgent, "PhpDig", 1) Then
		strBrowserUserType = "PhpDig"

	'Rambler search engine robot
	ElseIf inStr(1, strUserAgent, "StackRambler", 1) Then
		strBrowserUserType = "Rambler"

	'UbiCrawler search engine robot
	ElseIf inStr(1, strUserAgent, "UbiCrawler", 1) Then
		strBrowserUserType = "UbiCrawler"

	'entireweb search engine robot
	ElseIf inStr(1, strUserAgent, "Speedy+Spider", 1) Then
		strBrowserUserType = "entireweb"

	'Alexa.com search engine robot
	ElseIf inStr(1, strUserAgent, "ia_archiver", 1) Then
		strBrowserUserType = "Alexa"

	'Arianna/Libero search engine robot
	ElseIf inStr(1, strUserAgent, "arianna.libero.it", 1) Then
		strBrowserUserType = "Arianna/Libero"

	'y2bot/1.0 (+http://bot.y2crack4.com) search engine robot
	ElseIf inStr(1, strUserAgent, "y2bot", 1) Then
		strBrowserUserType = "y2bot"
		
	'Amazon robot checking their affiliate sites 
	ElseIf inStr(1, strUserAgent, "aranhabot", 1) Then
		strBrowserUserType = "Amazon.com"



	'Internet Explorer
	ElseIf inStr(1, strUserAgent, "MSIE 9", 1) Then
		strBrowserUserType = "IE 9"
	ElseIf inStr(1, strUserAgent, "MSIE 8", 1) Then
		strBrowserUserType = "IE 8"
	ElseIf inStr(1, strUserAgent, "MSIE 7", 1) Then
		strBrowserUserType = "IE 7"
	ElseIf inStr(1, strUserAgent, "MSIE 6", 1) Then
		strBrowserUserType = "IE 6"
	ElseIf inStr(1, strUserAgent, "MSIE 5", 1) Then
		strBrowserUserType = "IE 5"
	ElseIf inStr(1, strUserAgent, "MSIE 4", 1) Then
		strBrowserUserType = "IE 4"
	ElseIf inStr(1, strUserAgent, "MSIE", 1) Then
		strBrowserUserType = "IE"


	'Pocket Internet Explorer
	ElseIf inStr(1, strUserAgent, "MSPIE", 1) Then
		strBrowserUserType = "Pocket IE"


	'Firefox
	ElseIf inStr(1, strUserAgent, "Firefox/1", 1) Then
		strBrowserUserType = "Firefox 1"
	ElseIf inStr(1, strUserAgent, "Firefox/2", 1) Then
		strBrowserUserType = "Firefox 2"
	ElseIf inStr(1, strUserAgent, "Firefox/3", 1) Then
		strBrowserUserType = "Firefox 3"
	ElseIf inStr(1, strUserAgent, "Firefox/4", 1) Then
		strBrowserUserType = "Firefox 4"
	ElseIf inStr(1, strUserAgent, "Firefox/5", 1) Then
		strBrowserUserType = "Firefox 5"
	ElseIf inStr(1, strUserAgent, "Firefox", 1) Then
		strBrowserUserType = "Firefox"
		
	
	'Netscape
	ElseIf inStr(1, strUserAgent, "Netscape/9", 1) Then
		strBrowserUserType = "Netscape 9"
	ElseIf inStr(1, strUserAgent, "Netscape/8", 1) Then
		strBrowserUserType = "Netscape 8"
	ElseIf inStr(1, strUserAgent, "Netscape/7", 1) Then
		strBrowserUserType = "Netscape 7"
	ElseIf inStr(1, strUserAgent, "Netscape6", 1) Then
		strBrowserUserType = "Netscape 6"
	ElseIf inStr(1, strUserAgent, "Mozilla/4", 1) Then
		strBrowserUserType = "Netscape 4"
	

	'Mozilla
	ElseIf inStr(1, strUserAgent, "Gecko", 1) AND inStr(1, strUserAgent, "rv:2", 1) Then
		strBrowserUserType = "Mozilla 2"
	ElseIf inStr(1, strUserAgent, "Gecko", 1) AND inStr(1, strUserAgent, "rv:1", 1) Then
		strBrowserUserType = "Mozilla 1"
	ElseIf inStr(1, strUserAgent, "Gecko", 1) AND inStr(1, strUserAgent, "rv:0", 1) Then
		strBrowserUserType = "Mozilla"


	'Else unknown or robot
	Else
		strBrowserUserType = "Unknown"
	End If

	'Return function
	BrowserType = strBrowserUserType
End Function






'******************************************
'***          Get OS Type   	      *****
'******************************************

Private Function OSType ()

	Dim strUserAgent	'Holds info on the users browser and os
	Dim strOS		'Holds the users OS

	'Get the users HTTP user agent (web browser)
	strUserAgent = Request.ServerVariables("HTTP_USER_AGENT")
	
	'Get users OS
	'Windows
	'Windows 7 and Windows 2008 R2 (both NT6.1)
	If inStr(1, strUserAgent, "Windows 7", 1) OR inStr(1, strUserAgent, "NT 6.1", 1) Then
		strOS = "Windows 7" 'Only show windows 7 even if Windows 2008 R2
	'Windows Vista and Windows Server 2008 (both NT6.0)
	ElseIf inStr(1, strUserAgent, "Windows Vista", 1) OR inStr(1, strUserAgent, "NT 6.0", 1) Then
		strOS = "Windows Vista"  
	ElseIf inStr(1, strUserAgent, "Windows 2003", 1) OR inStr(1, strUserAgent, "NT 5.2", 1) Then
		strOS = "Windows 2003"
	ElseIf inStr(1, strUserAgent, "Windows XP", 1) OR inStr(1, strUserAgent, "NT 5.1", 1) Then
		strOS = "Windows XP"
	ElseIf inStr(1, strUserAgent, "NT 5.01", 1) Then
		strOS = "Windows 2000 SP1"
	ElseIf inStr(1, strUserAgent, "Windows 2000", 1) OR inStr(1, strUserAgent, "NT 5", 1) Then
		strOS = "Windows 2000"
	ElseIf inStr(1, strUserAgent, "Windows NT", 1) OR inStr(1, strUserAgent, "WinNT", 1) Then
		strOS = "Windows  NT 4"
	ElseIf inStr(1, strUserAgent, "Windows 95", 1) OR inStr(1, strUserAgent, "Win95", 1) Then
		strOS = "Windows 95"
	ElseIf inStr(1, strUserAgent, "Windows ME", 1) OR inStr(1, strUserAgent, "Win 9x 4.90", 1) Then
		strOS = "Windows ME"
	ElseIf inStr(1, strUserAgent, "Windows 98", 1) OR inStr(1, strUserAgent, "Win98", 1) Then
		strOS = "Windows 98"
	ElseIf Instr(1, strUserAgent, "Windows CE", 1) Then
		strOS = "Windows CE"

	'PalmOS
	ElseIf inStr(1, strUserAgent, "PalmOS", 1) Then
		strOS = "Palm OS"

	'PalmPilot
	ElseIf inStr(1, strUserAgent, "Elaine", 1) Then
		strOS = "PalmPilot"

	'Nokia
	ElseIf inStr(1, strUserAgent, "Nokia", 1) Then
		strOS = "Nokia"
		 
	'Ubuntu
	ElseIf inStr(1, strUserAgent, "Ubuntu", 1) Then
		strOS = "Ubuntu"

	'Linux
	ElseIf inStr(1, strUserAgent, "Linux", 1) Then
		strOS = "Linux"

	'Amiga
	ElseIf inStr(1, strUserAgent, "Amiga", 1) Then
		strOS = "Amiga"

	'Solaris
	ElseIf inStr(1, strUserAgent, "Solaris", 1) Then
		strOS = "Solaris"

	'SunOS
	ElseIf inStr(1, strUserAgent, "SunOS", 1) Then
		strOS = "Sun OS"

	'BSD
	ElseIf inStr(1, strUserAgent, "BSD", 1) or inStr(1, strUserAgent, "FreeBSD", 1) Then
		strOS = "Free BSD"

	'Unix
	ElseIf inStr(1, strUserAgent, "Unix", 1) OR inStr(1, strUserAgent, "X11", 1) Then
		strOS = "Unix"

	'AOL webTV
	ElseIf inStr(1, strUserAgent, "AOLTV", 1) OR inStr(1, strUserAgent, "AOL_TV", 1) Then
		strOS = "AOL TV"
	ElseIf inStr(1, strUserAgent, "WebTV", 1) Then
		strOS = "Web TV"
		
	'iPhone
	ElseIf inStr(1, strUserAgent, "iPhone", 1) Then
		strOS = "iPhone"
		
	'iPod
	ElseIf inStr(1, strUserAgent, "iPod", 1) Then
		strOS = "iPod"

	'Machintosh
	ElseIf inStr(1, strUserAgent, "Mac OS X", 1) Then
		strOS = "Mac OS X"
	ElseIf inStr(1, strUserAgent, "Mac_PowerPC", 1) or Instr(1, strUserAgent, "PPC", 1) Then
		strOS = "Mac PowerPC"
	ElseIf inStr(1, strUserAgent, "Mac", 1) or inStr(1, strUserAgent, "apple", 1) Then
		strOS = "Macintosh"

	'OS/2
	ElseIf inStr(1, strUserAgent, "OS/2", 1) Then
		strOS = "OS/2"


	'Search Robot
	ElseIf inStr(1, strUserAgent, "Googlebot", 1) OR inStr(1, strUserAgent, "Mediapartners-Google", 1) OR inStr(1, strUserAgent, "ZyBorg", 1) OR inStr(1, strUserAgent, "slurp", 1) OR inStr(1, strUserAgent, "Scooter", 1) OR inStr(1, strUserAgent, "Robozilla", 1) OR inStr(1, strUserAgent, "Jeeves", 1) OR inStr(1, strUserAgent, "lycos", 1) OR inStr(1, strUserAgent, "ArchitextSpider", 1) OR inStr(1, strUserAgent, "Gulliver", 1) OR inStr(1, strUserAgent, "crawler@fast", 1) OR inStr(1, strUserAgent, "TurnitinBot", 1) OR inStr(1, strUserAgent, "internetseer", 1) OR inStr(1, strUserAgent, "nameprotect", 1) OR inStr(1, strUserAgent, "PhpDig", 1) OR inStr(1, strUserAgent, "StackRambler", 1) OR inStr(1, strUserAgent, "UbiCrawler", 1) OR inStr(1, strUserAgent, "Spider", 1) OR inStr(1, strUserAgent, "ia_archiver", 1) OR inStr(1, strUserAgent, "msnbot", 1) OR inStr(1, strUserAgent, "arianna.libero.it", 1) OR inStr(1, strUserAgent, "y2bot", 1) OR inStr(1, strUserAgent, "Twiceler", 1) Then
		strOS = "Search Robot"

	Else
		strOS = "Unknown"
	End If
	

	'Return function
	OSType = strOS
End Function





'******************************************
'***     DB Topic/Post Count Update   *****
'******************************************

Private Function updateForumStats(ByVal intForumID)

	Dim rsStats		'Database recordset
	Dim lngNumberOfTopics	'Holds the number of topics
	Dim lngNumberOfPosts	'Holds the number of posts
	Dim lngLastPostAuthorID	'Holds the last post author ID
	Dim dtmLastPostPostDate	'Holds the last post date
	Dim strDate		'Holds the date for SQL Server
	Dim lngLastTopicID	'Holds the last topic ID

	'Intilaise variables
	lngNumberOfTopics = 0
	lngNumberOfPosts = 0
	lngLastPostAuthorID = 1
	dtmLastPostPostDate = "2001-01-01 00:00:00"
	lngLastTopicID = 0


	'Intialise the ADO recordset object
	Set rsStats = Server.CreateObject("ADODB.Recordset")

	With rsStats

		'Get the number of Topics
		'Initalise the strSQL variable with an SQL statement to query the database to count the number of topics in the forums
		strSQL = "SELECT Count(" & strDbTable & "Topic.Forum_ID) AS Topic_Count " & _
		"From " & strDbTable & "Topic " & strDBNoLock & " " & _
		"WHERE " & strDbTable & "Topic.Forum_ID = " & intForumID & " " & _
			"AND " & strDbTable & "Topic.Hide = " & strDBFalse & ";"


		'Query the database
		.Open strSQL, adoCon

		'Read in the number of Topics
		If NOT .EOF Then lngNumberOfTopics = CLng(.Fields("Topic_Count"))

		'Close the rs
		.Close



		'Get the number of Posts
		'Initalise the strSQL variable with an SQL statement to query the database to count the number of posts in the forums
		strSQL = "SELECT Count(" & strDbTable & "Thread.Thread_ID) AS Thread_Count " & _
		"FROM " & strDbTable & "Topic" & strDBNoLock & ", " & strDbTable & "Thread" & strDBNoLock & " " & _
		"WHERE "  & strDbTable & "Topic.Topic_ID = " & strDbTable & "Thread.Topic_ID " & _
			"AND " & strDbTable & "Topic.Forum_ID = " & intForumID & " " & _
			"AND " & strDbTable & "Thread.Hide = " & strDBFalse & ";"

		'Query the database
		.Open strSQL, adoCon

		'Get the thread count
		If NOT .EOF Then lngNumberOfPosts = CLng(.Fields("Thread_Count"))

		'Reset server variables
		.Close



		'Get the last post author ID and post date
		strSQL = "SELECT" & strDBTop1 & " " & strDbTable & "Topic.Topic_ID, " & strDbTable & "Thread.Author_ID, " & strDbTable & "Thread.Message_date " & _
		"FROM " & strDbTable & "Topic" & strDBNoLock & ", " & strDbTable & "Thread" & strDBNoLock & " " & _
		"WHERE " & strDbTable & "Topic.Topic_ID = " & strDbTable & "Thread.Topic_ID " & _
			"AND " & strDbTable & "Topic.Forum_ID = " & intForumID & " " & _
			"AND " & strDbTable & "Topic.Hide = " & strDBFalse & " " & _
			"AND " & strDbTable & "Thread.Hide = " & strDBFalse & " " & _
		"ORDER BY " & strDbTable & "Thread.Message_date DESC" & strDBLimit1 & ";"

		'Query the database
		.Open strSQL, adoCon

		'Get the thread count
		If NOT .EOF Then
			lngLastTopicID = CLng(.Fields("Topic_ID"))
			lngLastPostAuthorID = CLng(.Fields("Author_ID"))
			dtmLastPostPostDate = CDate(.Fields("Message_date"))
		End If

		'Reset server variables
		.Close

		
		'Get the date of last post in correct format
		strDate = internationalDateTime(dtmLastPostPostDate)
		
		'Remove '-' from SQL Server date for backward compatibility with SQL 2000
		If strDatabaseType = "SQLServer" Then strDate = Replace(strDate, "-", "", 1, -1, 1)
			
		'Place the date in SQL safe # or '
		If strDatabaseType = "Access" Then
			strDate = "#" & strDate & "#"
		Else
			strDate = "'" & strDate & "'"
		End If

		'Update the database with the new forum statistics

		strSQL = "UPDATE " & strDbTable & "Forum" & strRowLock & " " & _
		"SET " & strDbTable & "Forum.No_of_topics = " & lngNumberOfTopics & ", " & _
			 strDbTable & "Forum.No_of_posts = " & lngNumberOfPosts & ", " & _
			 strDbTable & "Forum.Last_post_author_ID = " & lngLastPostAuthorID & ", " & _
			 strDbTable & "Forum.Last_post_date = " & strDate & ", " & _
			  strDbTable & "Forum.Last_topic_ID = " & lngLastTopicID & " " & _
		"WHERE " & strDbTable & "Forum.Forum_ID = " & intForumID & ";"

		'Write the updated date	of last	post to	the database
		adoCon.Execute(strSQL)

	End With

	'Clean up
	Set rsStats = Nothing
End Function







'********************************************
'***    DB Topic Reply Details Update   *****
'********************************************

Private Function updateTopicStats(ByVal lngTopicID)

		Dim intReplyCount
		Dim lngStartPostID
		Dim lngLastPostID
		
		
		'Get the start and last post ID's from the database
		strSQL = "SELECT " & strDbTable & "Thread.Thread_ID " & _
		"FROM " & strDbTable & "Thread" & strDBNoLock & " " & _
		"WHERE " & strDbTable & "Thread.Topic_ID = "  & lngTopicID & " " & _
			"AND " & strDbTable & "Thread.Hide = " & strDBFalse & " " & _
		"ORDER BY " & strDbTable & "Thread.Thread_ID ASC;"
		
		'Set the cursor type property of the record set to Dynamic so we navigate through the recordset
		rsCommon.CursorType = 2
		
		'Set set the lock type of the recordset to adLockReadOnly 
		rsCommon.LockType = 1
		
		'Query the database
		rsCommon.Open strSQL, adoCon
		
		
		'If there are posts left in the database for this topic get some details for them
		If NOT rsCommon.EOF Then
			
			'Get the post ID of the first post
			lngStartPostID = CLng(rsCommon("Thread_ID"))
			
			'Move to the last message in the topic to get the details of the last post
			rsCommon.MoveLast
			
			'Get the post ID of the last post
			lngLastPostID = CLng(rsCommon("Thread_ID"))
		End If
		
		'Close the recordset
		rsCommon.Close
		

		'Count the number of replies
		strSQL = "SELECT Count(" & strDbTable & "Thread.Topic_ID) AS ReplyCount " & _
		"From " & strDbTable & "Thread" & strDBNoLock & " " & _
		"WHERE " & strDbTable & "Thread.Hide = " & strDBFalse & " " & _
			"AND " & strDbTable & "Thread.Topic_ID = " & lngTopicID & ";"
		
		'Set the cursor type to static	
		rsCommon.CursorType = 3
		
		'Set set the lock type of the recordset to adLockReadOnly 
		rsCommon.LockType = 1

		'Query the database
		rsCommon.Open strSQL, adoCon

		'Read in the thread count
		If NOT rsCommon.EOF Then
			If CLng(rsCommon("ReplyCount")) > 0 Then intReplyCount = CLng(rsCommon("ReplyCount")) - 1 Else intReplyCount = 0
		End If

		'Close rs
		rsCommon.Close


		'Initalise the SQL string with an SQL update command to	update the no. of replies and last author
		strSQL = "UPDATE " & strDbTable & "Topic " & strRowLock & " " & _
		"SET " & strDbTable & "Topic.Start_Thread_ID = " & lngStartPostID & ", " & _
			strDbTable & "Topic.Last_Thread_ID = " & lngLastPostID & ", " & _
			strDbTable & "Topic.No_of_replies = " & intReplyCount & " " & _
		"WHERE " & strDbTable & "Topic.Topic_ID = " & lngTopicID & ";"

		'Set error trapping
		On Error Resume Next

		'Write the updated date	of last	post to	the database
		If lngStartPostID <> "" Then adoCon.Execute(strSQL)

		'If an error has occurred write an error to the page
		If Err.Number <> 0 Then Call errorMsg("An error has occurred while writing to the database.", "updateTopicStats()_update_reply_count", "functions_common.asp")

		'Disable error trapping
		On Error goto 0
End Function







'******************************************
'***  	    Forum Permissions         *****
'******************************************
Public Function forumPermissions(ByVal intForumID, ByVal intGroupID)

	'Declare variables
	Dim rsPermissions	'Holds the permissions recordset
	Dim intCurrentPerRecord	'Holds the current record position
	Dim intPermssionRec	'Holds the permission record to check

	'Initilise variables
	blnRead = False
	blnPost = False
	blnReply = False
	blnEdit = False
	blnDelete = False
	blnPriority = False
	blnPollCreate = False
	blnVote = False
	blnModerator = False
	blnCheckFirst = False
	blnEvents = False


	'If the permissions array is not yet filled run the following (should only run once per page to increase performance) All forums read into the array
	If IsArray(saryPermissions) = false Then

		'Intialise the ADO recordset object
		Set rsPermissions = Server.CreateObject("ADODB.Recordset")

		'Get the users group permissions from the db if there are any
		'Initalise the strSQL variable with an SQL statement to query the database
		strSQL = "SELECT " & strDbTable & "Permissions.Group_ID, " & strDbTable & "Permissions.Author_ID, " & strDbTable & "Permissions.Forum_ID, " & strDbTable & "Permissions.View_Forum, " & strDbTable & "Permissions.Post, " & strDbTable & "Permissions.Reply_posts, " & strDbTable & "Permissions.Edit_posts, " & strDbTable & "Permissions.Delete_posts, " & strDbTable & "Permissions.Priority_posts, " & strDbTable & "Permissions.Poll_create, " & strDbTable & "Permissions.Vote, " & strDbTable & "Permissions.Moderate, " & strDbTable & "Permissions.Display_post, " & strDbTable & "Permissions.Calendar_event " & _
		"FROM " & strDbTable & "Permissions" & strDBNoLock & " " & _
		"WHERE " & strDbTable & "Permissions.Group_ID = " & intGroupID & " OR " & strDbTable & "Permissions.Author_ID = " & lngLoggedInUserID & " " & _
		"ORDER BY " & strDbTable & "Permissions.Author_ID DESC;"

		'Query the database
		rsPermissions.Open strSQL, adoCon

		'Raed the recordset into an array for better performance
		If NOT rsPermissions.EOF Then saryPermissions = rsPermissions.GetRows()

		'Clean up
		rsPermissions.Close
		Set rsPermissions = Nothing
	End If

	'Read in the permissions for the group the member is part of if there are any
	If IsArray(saryPermissions) Then

		'Intilise variable
		intPermssionRec = -1

		'Loop through the records to see if there is one for this forum
		For intCurrentPerRecord = 0 to UBound(saryPermissions,2)
			'See if this record is for this forum
			If CInt(saryPermissions(2,intCurrentPerRecord)) = intForumID Then
				'Get the record number and exit loop
				intPermssionRec = intCurrentPerRecord
				Exit For
			End If
		Next

		'If a record is found read in the details
		If intPermssionRec => 0 Then


			blnRead = CBool(saryPermissions(3,intPermssionRec))
			blnPost = CBool(saryPermissions(4,intPermssionRec))
			blnReply = CBool(saryPermissions(5,intPermssionRec))
			blnEdit = CBool(saryPermissions(6,intPermssionRec))
			blnDelete = CBool(saryPermissions(7,intPermssionRec))
			blnPriority = CBool(saryPermissions(8,intPermssionRec))
			blnPollCreate = CBool(saryPermissions(9,intPermssionRec))
			blnVote = CBool(saryPermissions(10,intPermssionRec))
			blnModerator = CBool(saryPermissions(11,intPermssionRec))
			blnCheckFirst = CBool(saryPermissions(12,intPermssionRec))
			blnEvents = CBool(saryPermissions(13,intPermssionRec))
		End If
	End If
End Function






'******************************************
'***  	        Is Moderator	      *****
'******************************************

'Although the above permissions function can work out if the user is a moderator sometimes we only need to know if the user is a moderator or not

Private Function isModerator(ByVal intForumID, ByVal intGroupID)

	'Declare variables
	Dim rsPermissions	'Holds the permissions recordset
	Dim blnModerator	'Set to true if the user is a moderator

	'Initilise vairiables
	blnModerator = False

	'Intialise the ADO recordset object
	Set rsPermissions = Server.CreateObject("ADODB.Recordset")

	'Get the users group permissions from the db if there are any
	'Initalise the strSQL variable with an SQL statement to query the database to count the number of topics in the forums
	strSQL = "SELECT " & strDbTable & "Permissions.Moderate " & _
	"FROM " & strDbTable & "Permissions" & strDBNoLock & " " & _
	"WHERE (" & strDbTable & "Permissions.Group_ID = " & intGroupID & " OR " & strDbTable & "Permissions.Author_ID = " & lngLoggedInUserID & ") AND " & strDbTable & "Permissions.Forum_ID = " & intForumID & " " & _
	"ORDER BY " & strDbTable & "Permissions.Author_ID DESC;"

	'Query the database
	rsPermissions.Open strSQL, adoCon

	'If there is a result returned by the db set it to the blnModerator variable
	If NOT rsPermissions.EOF Then blnModerator = CBool(rsPermissions("Moderate"))

	'Clean up
	rsPermissions.Close
	Set rsPermissions = Nothing

	'Return the function
	isModerator = blnModerator
End Function








'******************************************
'****     	 Banned IP's  	      *****
'******************************************
Private Function bannedIP()

	

	'Declare variables
	Dim rsIPAddr
	Dim strCheckIPAddress
	Dim strUserIPAddress
	Dim blnIPMatched
	Dim strTmpUserIPAddress
	Dim saryDbIPRange
	Dim intIPLoop

	'Intilise variable
	blnIPMatched = False
	intIPLoop = 0

	'Exit if in demo mode
	If blnDemoMode Then Exit Function

	'Get the users IP
	strUserIPAddress = getIP()


	'Intialise the ADO recordset object
	Set rsIPAddr = Server.CreateObject("ADODB.Recordset")

	'Get any banned IP address from the database
	'Initalise the strSQL variable with an SQL statement to query the database to count the number of topics in the forums
	strSQL = "SELECT " & strDbTable & "BanList.IP " & _
	"FROM " & strDbTable & "BanList" & strDBNoLock & " "  & _
	"WHERE " & strDbTable & "BanList.IP Is Not Null;"

	'Query the database
	rsIPAddr.Open strSQL, adoCon

	'If results are returned check 'em out
	If NOT rsIPAddr.EOF Then

		'Place the recordset into array
		saryDbIPRange = rsIPAddr.GetRows()

		'Loop round to show all the categories and forums
		Do While intIPLoop =< Ubound(saryDbIPRange, 2)

			'Get the IP address to check from the recordset
			strCheckIPAddress = saryDbIPRange(0, intIPLoop)

			'See if we need to check the IP range or just one IP address
			'If the last character is a * then this is a wildcard range to be checked
			If Right(strCheckIPAddress, 1) = "*" Then

				'Remove the wildcard charcter form the IP
				strCheckIPAddress = Replace(strCheckIPAddress, "*", "", 1, -1, 1)

				'Trim the users IP to the same length as the IP range to check
				strTmpUserIPAddress = Mid(strUserIPAddress, 1, Len(strCheckIPAddress))

				'See if whats left of the IP matches
				If strCheckIPAddress = strTmpUserIPAddress Then blnIPMatched = True

			'Else check the IP address matches
			Else
				'Else check to see if the IP address match
				If strCheckIPAddress = strUserIPAddress Then blnIPMatched = True

			End If

			'Move to the next record
			intIPLoop = intIPLoop + 1
		Loop
	End If

	'Clean up
	rsIPAddr.Close
	Set rsIPAddr = Nothing

	'Return the function
	bannedIP = blnIPMatched
End Function







'******************************************
'***	  Check submission ID		***
'******************************************

Private Function checkFormID(strFormID)

	'Check to see if the form ID's match if they don't send the user away
	If strFormID <> getSessionItem("KEY") Then

		'Clean up before redirecting
	        Call closeDatabase()

	       'Redirect to insufficient permissions page
	       Response.Redirect("insufficient_permission.asp?M=sID" & strQsSID3)
	End If
End Function






'******************************************
'***	 Get users IP address		***
'******************************************

Private Function getIP()

	Dim strIPAddr

	'If they are not going through a proxy get the IP address
	If Request.ServerVariables("HTTP_X_FORWARDED_FOR") = "" OR InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), "unknown") > 0 Then

		strIPAddr = Request.ServerVariables("REMOTE_ADDR")

	'If they are going through multiple proxy servers only get the fisrt IP address in the list (,)
	ElseIf InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), ",") > 0 Then

		strIPAddr = Mid(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), 1, InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), ",")-1)

	'If they are going through multiple proxy servers only get the fisrt IP address in the list (;)
	ElseIf InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), ";") > 0 Then

		strIPAddr = Mid(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), 1, InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), ";")-1)

	'Get the browsers IP address not the proxy servers IP
	Else
		strIPAddr = Request.ServerVariables("HTTP_X_FORWARDED_FOR")
	End If

	'Remove all tags in IP string
	strIPAddr =  removeAllTags(strIPAddr)

	'Place the IP address back into the returning function
	getIP = Trim(Mid(strIPAddr, 1, 30))
End Function






'**************************************************
'***	Web Wiz Forums About for debugging	***
'**************************************************

'***** START WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******	

Private Sub about()

	'Reset server objects
	Call closeDatabase()
	
	Dim strFreeEdition
	Dim strBranding
	Dim strPaging
	
	If blnACode Then strFreeEdition = "Yes" Else strFreeEdition = "No"
	If blnLCode Then strBranding = "Yes" Else strBranding = "No"
	If blnSqlSvrAdvPaging Then strPaging = "Yes" Else strPaging = "No"

	Response.Write("" & _
	vbCrLf & "<pre>" & _
	vbCrLf & "*********************************************************" & _
	vbCrLf & _
	vbCrLf & "Software: Web Wiz Forums(TM)" & _
	vbCrLf & "Version: " & strVersion & _
	vbCrLf & _
	vbCrLf & "Installation ID: " & strInstallID & _
	vbCrLf & "Free Edition: " & strFreeEdition & _
	vbCrLf & "Web Wiz Branding: " & strBranding & _
	vbCrLf & _
	vbCrLf & "Database: " & strDatabaseType & _
	vbCrLf & "Database Paging: " & strPaging & _
	vbCrLf & _
	vbCrLf & "Author: Web Wiz." & _
	vbCrLf & "Address: Unit 10E, Dawkins Road Ind Est, Poole, Dorset, UK" & _
	vbCrLf & "Info: http://www.webwizforums.com" & _
	vbCrLf & "Copyright: (C)2001-2010 Web Wiz. All rights reserved" & _
	vbCrLf & _
	vbCrLf & "This Software is protected by copyright and other intellectual property laws and treaties." & _
	vbCrLf & _
	vbCrLf & "*********************************************************" & _
	vbCrLf & "</pre>")
	
	Response.Flush
	Response.End
End Sub

'***** END WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******




'******************************************
'***	 Count Unread Private Msg's    ****
'******************************************

'Function to count and update the number of private messages
Private Function updateUnreadPM(ByVal lngMemID)

	Dim intRecievedPMs

	'Initlise the sql statement
	strSQL = "SELECT Count(" & strDbTable & "PMMessage.PM_ID) AS CountOfPM FROM " & strDbTable & "PMMessage " & _
	"WHERE " & strDbTable & "PMMessage.Read_Post = " & strDBFalse & " " & _
		"AND " & strDbTable & "PMMessage.Author_ID = " & lngMemID & ";"

	'Query the database
	rsCommon.Open strSQL, adoCon

	'Get the number of new pm's this user has
	intRecievedPMs = CInt(rsCommon("CountOfPM"))

	'Update the number of unread PM's the user has
	intNoOfPms = CInt(rsCommon("CountOfPM"))

	'Close the recordset
	rsCommon.Close



	'Update database
	strSQL = "UPDATE " & strDbTable & "Author " & strRowLock & " " & _
	"SET " & strDbTable & "Author.No_of_PM = " & intRecievedPMs & " " & _
	"WHERE " & strDbTable & "Author.Author_ID=" & lngMemID & ";"

	'Write the updated no. of PM's to the database
	adoCon.Execute(strSQL)

End Function





'******************************************
'***  	   Unsafe character Strip      ****
'******************************************

'Function to strip non alphanumeric characters email addresses
Private Function characterStrip(ByVal strTextInput)

	'Dimension variable
	Dim intLoopCounter 	'Holds the loop counter

	'Loop through the ASCII characters
	For intLoopCounter = 0 to 31
		strTextInput = Replace(strTextInput, CHR(intLoopCounter), "", 1, -1, 0)
	Next

	'Loop through the ASCII characters
	For intLoopCounter = 33 to 37
		strTextInput = Replace(strTextInput, CHR(intLoopCounter), "", 1, -1, 0)
	Next

	'Loop through the ASCII characters
	For intLoopCounter = 39 to 44
		strTextInput = Replace(strTextInput, CHR(intLoopCounter), "", 1, -1, 0)
	Next

	'Loop through the ASCII characters
	For intLoopCounter = 58 to 65
		strTextInput = Replace(strTextInput, CHR(intLoopCounter), "", 1, -1, 0)
	Next

	'Loop through the ASCII characters numeric characters
	For intLoopCounter = 91 to 94
		strTextInput = Replace(strTextInput, CHR(intLoopCounter), "", 1, -1, 0)
	Next

	'Loop through the extended ASCII characters
	For intLoopCounter = 123 to 125
		strTextInput = Replace(strTextInput, CHR(intLoopCounter), "", 1, -1, 0)
	Next

	'Loop through the extended ASCII characters
	For intLoopCounter = 127 to 255
		strTextInput = Replace(strTextInput, CHR(intLoopCounter), "", 1, -1, 0)
	Next

	'Strip individul ASCII characters left out from above
	strTextInput = Replace(strTextInput, CHR(59), "", 1, -1, 0)
	strTextInput = Replace(strTextInput, CHR(60), "", 1, -1, 0)
	strTextInput = Replace(strTextInput, CHR(62), "", 1, -1, 0)
	strTextInput = Replace(strTextInput, CHR(96), "", 1, -1, 0)


	'Return the string
	characterStrip = strTextInput

End Function




'**********************************************
'***  Format ISO International Date/Time   ****
'**********************************************

'Function to format the present date and time into international formats to prevent systems crashes on foriegn servers
Private Function internationalDateTime(dtmDate)

	Dim strYear
	Dim strMonth
	Dim strDay
	Dim strHour
	Dim strMinute
	Dim strSecound

	strYear = Year(dtmDate)
	strMonth = Month(dtmDate)
	strDay = Day(dtmDate)
	strHour = Hour(dtmDate)
	strMinute = Minute(dtmDate)
	strSecound = Second(dtmDate)

	'Place 0 infront of minutes under 10
	If strMonth < 10 then strMonth = "0" & strMonth
	If strDay < 10 then strDay = "0" & strDay
	If strHour < 10 then strHour = "0" & strHour
	If strMinute < 10 then strMinute = "0" & strMinute
	If strSecound < 10 then strSecound = "0" & strSecound

	'This function returns the ISO internation date and time formats:- yyyy-mm-dd hh:mm:ss
	'Dashes prevent systems that use periods etc. from crashing
	internationalDateTime = strYear & "-" & strMonth & "-" & strDay & " " & strHour & ":" & strMinute& ":" & strSecound
End Function







'*******************************************
'***  		Error Message   	****
'*******************************************

'Function to to dsiplay server error message
Private Function errorMsg(strErrorText, strErrCode, strFileName)
	

	Response.Write("<br /><strong>Server Error in Forum Application</strong>" & _
	"<br />" & strErrorText & _
	"<br />Please contact the forum administrator." & _
	"<br /><br /><strong>Support Error Code:-</strong> err_" & strDatabaseType & "_" & strErrCode & _
	"<br /><strong>File Name:-</strong> " & strFileName)
	
	'If detailed error messaging is enabled, display an error message
	If blnDetailedErrorReporting Then
		Response.Write("<br /><br /><strong>Error details:-</strong>" & _
		"<br />" & Err.Source & _
		"<br />" & Err.Description & "<br /><br />")
	End If
	
	
	'Report error to Web Wiz Engineers
	'For premium support subscribers only with Web Wiz Hosted solutions
	Call reportErrorToWebWiz(strLoggedInUsername, strFileName, "Error details:-<br />err_" & strDatabaseType & "_" & strErrCode & "<br />" & Err.Source & "<br />" & Err.Description)
	
	'If error logging is enabled
	If blnLoggingEnabled AND blnErrorLogging Then Call logAction(strLoggedInUsername, "ERROR - File: " & strFileName & " - Error Details: err_" & strDatabaseType & "_" & strErrCode & " - " & Err.Source & " - " & Err.Description)
	
	'End Server Response
	Response.Flush
	Response.End

End Function









'******************************************
'***  	     Active Users Array        ****
'******************************************

'Function to populate and update the active users application array
Private Function activeUsers(ByVal strPageName, ByVal strLocation, ByVal strURL, ByVal intFID)


	'Array dimension lookup table
	' 0 = IP
	' 1 = Author ID
	' 2 = Username
	' 3 = Login Time
	' 4 = Last Active Time
	' 5 = OS/Browser
	' 6 = Location
	' 7 = URL
	' 8 = Hides user details (Anonymous)
	' 9 = Forum ID


	'Dimension variables
	Dim strIPAddress 		'Holds the uesrs IP address to keep track of em with
	Dim strOS			'Holds the users OS
	Dim strBrowserUserType		'Holds the users browser type
	Dim blnHideActiveUser 		'Holds if the user wants to be shown in the active users list
	Dim saryActiveUsers		'Holds the active users array
	Dim intArrayPass		'Holds array iteration possition
	Dim blnIPFound			'Set to true if the users IP is found
	Dim intActiveUserArrayPos	'Holds the possition in the array the user is found
	Dim intActiveUsersDblArrayPos	'Holds the array position if the user is found more than once in the array
	Dim strLocationURL		'Holds the built up location URL
	Dim intLastArrayPostionPointer	'Holds the last array postion pointer
	Dim lngTotalActiveUsers		'Holds the total active users


	'******************************************
	'***   	Initialise  variables		***
	'******************************************

	'Initialise  variables
	blnIPFound = False
	intLastArrayPostionPointer = 0
	intActiveUsersDblArrayPos = -1

	'Get the users IP address
	strIPAddress = getIP()


	'Build the location URL
	If strLocation <> "" AND strURL <> "" Then
		strLocationURL = "<a href=""" & strURL & """>" & strLocation & "</a>"
	End If

	'Get if the user wants to be shown in the active users list
	If getCookie("sLID", "NS") = "1" OR getSessionItem("NS") = "1" Then
		blnHideActiveUser = 1
	Else
		blnHideActiveUser = 0
	End If


	'******************************************
	'***   	Initialise  array		***
	'******************************************

	'Initialise  the array from the application veriable
	If isArray(Application(strAppPrefix & "saryAppActiveUsersTable")) Then

		'Place the application level active users array into a temporary dynaimic array
		saryActiveUsers = Application(strAppPrefix & "saryAppActiveUsersTable")

	'Else Initialise the an empty array
	Else
		ReDim saryActiveUsers(9,0)
	End If

	'Array dimension lookup table
	' 0 = IP
	' 1 = Author ID
	' 2 = Username
	' 3 = Login Time
	' 4 = Last Active Time
	' 5 = OS/Browser
	' 6 = Location Page Name
	' 7 = URL
	' 8 = Hids user details
	' 9 = Forum ID


	'******************************************
	'***   	Get users array position	***
	'******************************************

	'Iterate through the array to see if the user is already in the array
	For intArrayPass = 1 To UBound(saryActiveUsers, 2)

		'Check the IP address
		If saryActiveUsers(0, intArrayPass) = strIPAddress Then

			intActiveUserArrayPos = intArrayPass
			blnIPFound = True

		'Else check a logged in member is not a double entry if they have an active user array postion not related to their IP
		ElseIf saryActiveUsers(1, intArrayPass) = lngLoggedInUserID AND saryActiveUsers(1, intArrayPass) <> 2 Then

			intActiveUsersDblArrayPos = intArrayPass
		End If
	Next


	'******************************************
	'***   	Update users array position	***
	'******************************************

	'If the user is found in the array update the array position
	If blnIPFound Then

		saryActiveUsers(1, intActiveUserArrayPos) = lngLoggedInUserID
		saryActiveUsers(2, intActiveUserArrayPos) = strLoggedInUsername
		saryActiveUsers(4, intActiveUserArrayPos) = internationalDateTime(Now())
		saryActiveUsers(6, intActiveUserArrayPos) = strPageName
		saryActiveUsers(7, intActiveUserArrayPos) = strLocationURL
		saryActiveUsers(8, intActiveUserArrayPos) = blnHideActiveUser
		saryActiveUsers(9, intActiveUserArrayPos) = intFID


	'******************************************
	'***   	Add new user to array		***
	'******************************************

	'Else the user is not in the array so create a new array psition
	Else
		'Get the uesrs web browser
		strBrowserUserType = BrowserType()

		'Get the OS type
		strOS = OSType()


		'ReDimesion the array
		ReDim Preserve saryActiveUsers(9, UBound(saryActiveUsers, 2) + 1)

		'Update the new array position which will be the last one
		saryActiveUsers(0, UBound(saryActiveUsers, 2)) = strIPAddress
		saryActiveUsers(1, UBound(saryActiveUsers, 2)) = lngLoggedInUserID
		saryActiveUsers(2, UBound(saryActiveUsers, 2)) = strLoggedInUsername
		saryActiveUsers(3, UBound(saryActiveUsers, 2)) = internationalDateTime(Now())
		saryActiveUsers(4, UBound(saryActiveUsers, 2)) = internationalDateTime(Now())
		saryActiveUsers(5, UBound(saryActiveUsers, 2)) = strOS & " " & strBrowserUserType
		saryActiveUsers(6, UBound(saryActiveUsers, 2)) = strPageName
		saryActiveUsers(7, UBound(saryActiveUsers, 2)) = strLocationURL
		saryActiveUsers(8, UBound(saryActiveUsers, 2)) = blnHideActiveUser
		saryActiveUsers(9, UBound(saryActiveUsers, 2)) = intFID
	End If


	'******************************************
	'***   	Remove unactive users		***
	'******************************************
	
	'Intiliase the last array pointer variable
	intLastArrayPostionPointer = CInt(UBound(saryActiveUsers, 2))

	'Iterate through the array to remove old entires and double entries
	For intArrayPass = 1 To UBound(saryActiveUsers, 2)

		'Check the IP address and last active time less than 20 minutes
		If (CDate(saryActiveUsers(4, intArrayPass)) < DateAdd("n", -20, Now()) AND intArrayPass < intLastArrayPostionPointer) OR (intActiveUsersDblArrayPos = intArrayPass) Then
			
			'Check that the last array postion pointer is not for an outdated session
			If CDate(saryActiveUsers(4, intArrayPass)) < DateAdd("n", -20, Now()) AND intLastArrayPostionPointer > 0 Then intLastArrayPostionPointer = intLastArrayPostionPointer - 1

			'Swap this array postion with the last in the array
			saryActiveUsers(0, intArrayPass) = saryActiveUsers(0, intLastArrayPostionPointer)
			saryActiveUsers(1, intArrayPass) = saryActiveUsers(1, intLastArrayPostionPointer)
			saryActiveUsers(2, intArrayPass) = saryActiveUsers(2, intLastArrayPostionPointer)
			saryActiveUsers(3, intArrayPass) = saryActiveUsers(3, intLastArrayPostionPointer)
			saryActiveUsers(4, intArrayPass) = saryActiveUsers(4, intLastArrayPostionPointer)
			saryActiveUsers(5, intArrayPass) = saryActiveUsers(5, intLastArrayPostionPointer)
			saryActiveUsers(6, intArrayPass) = saryActiveUsers(6, intLastArrayPostionPointer)
			saryActiveUsers(7, intArrayPass) = saryActiveUsers(7, intLastArrayPostionPointer)
			saryActiveUsers(8, intArrayPass) = saryActiveUsers(8, intLastArrayPostionPointer)
			saryActiveUsers(9, intArrayPass) = saryActiveUsers(9, intLastArrayPostionPointer)

			'Decrement the last array pointer
			If intLastArrayPostionPointer > 0 Then intLastArrayPostionPointer = intLastArrayPostionPointer - 1
		End If
	Next

	'Remove old array positions
	If UBound(saryActiveUsers, 2) > intLastArrayPostionPointer Then ReDim Preserve saryActiveUsers(9, intLastArrayPostionPointer)



	'******************************************
	'***   Update Most Ever Active Users	***
	'******************************************

	'This will see if the present number of users is the most ever, if it is then they are added to the database

	'Get total active users
	lngTotalActiveUsers = UBound(saryActiveUsers, 2)
	
	
	


	'******************************************
	'***   Update application level array	***
	'******************************************

	'Update the application level variable holding the active users array

	'Lock the application so that no other user can try and update the application level variable at the same time
	Application.Lock

	'Update the application level variable
	Application(strAppPrefix & "saryAppActiveUsersTable") = saryActiveUsers

	'Unlock the application
	Application.UnLock



	'Return function
	activeUsers = saryActiveUsers
End Function







'******************************************
'***	Sort Active Users List		***
'******************************************

'Sub procedure to sort the array using a Bubble Sort to place highest matches first
Private Sub SortActiveUsersList(ByRef saryActiveUsers)

	'Dimension variables
	Dim intArrayGap 		'Holds the part of the array being sorted
	Dim intIndexPosition		'Holds the Array index position being sorted
	Dim intPassNumber		'Holds the pass number for the sort
	Dim saryTempStringStore(9)	'Array to temparily store the position being sorted

	'Loop round to sort each result found
	For intPassNumber = 1 To UBound(saryActiveUsers, 2)

		'Shortens the number of passes
		For intIndexPosition = 1 To (UBound(saryActiveUsers, 2) - intPassNumber)

			'If the Result being sorted is a less time than the next result in the array then swap them
			If saryActiveUsers(4,intIndexPosition) < saryActiveUsers(4,(intIndexPosition+1)) Then


				'Place the Result being sorted in a temporary array variable
				saryTempStringStore(0) = saryActiveUsers(0, intIndexPosition)
				saryTempStringStore(1) = saryActiveUsers(1, intIndexPosition)
				saryTempStringStore(2) = saryActiveUsers(2, intIndexPosition)
				saryTempStringStore(3) = saryActiveUsers(3, intIndexPosition)
				saryTempStringStore(4) = saryActiveUsers(4, intIndexPosition)
				saryTempStringStore(5) = saryActiveUsers(5, intIndexPosition)
				saryTempStringStore(6) = saryActiveUsers(6, intIndexPosition)
				saryTempStringStore(7) = saryActiveUsers(7, intIndexPosition)
				saryTempStringStore(8) = saryActiveUsers(8, intIndexPosition)
				saryTempStringStore(9) = saryActiveUsers(9, intIndexPosition)


				'*** Do the array position swap ***

				'Move the next Result with a higher match rate into the present array location
				saryActiveUsers(0, intIndexPosition) = saryActiveUsers(0, (intIndexPosition+1))
				saryActiveUsers(1, intIndexPosition) = saryActiveUsers(1, (intIndexPosition+1))
				saryActiveUsers(2, intIndexPosition) = saryActiveUsers(2, (intIndexPosition+1))
				saryActiveUsers(3, intIndexPosition) = saryActiveUsers(3, (intIndexPosition+1))
				saryActiveUsers(4, intIndexPosition) = saryActiveUsers(4, (intIndexPosition+1))
				saryActiveUsers(5, intIndexPosition) = saryActiveUsers(5, (intIndexPosition+1))
				saryActiveUsers(6, intIndexPosition) = saryActiveUsers(6, (intIndexPosition+1))
				saryActiveUsers(7, intIndexPosition) = saryActiveUsers(7, (intIndexPosition+1))
				saryActiveUsers(8, intIndexPosition) = saryActiveUsers(8, (intIndexPosition+1))
				saryActiveUsers(9, intIndexPosition) = saryActiveUsers(9, (intIndexPosition+1))

				'Move the Result from the teporary holding variable into the next array position
				saryActiveUsers(0, (intIndexPosition+1)) = saryTempStringStore(0)
				saryActiveUsers(1, (intIndexPosition+1)) = saryTempStringStore(1)
				saryActiveUsers(2, (intIndexPosition+1)) = saryTempStringStore(2)
				saryActiveUsers(3, (intIndexPosition+1)) = saryTempStringStore(3)
				saryActiveUsers(4, (intIndexPosition+1)) = saryTempStringStore(4)
				saryActiveUsers(5, (intIndexPosition+1)) = saryTempStringStore(5)
				saryActiveUsers(6, (intIndexPosition+1)) = saryTempStringStore(6)
				saryActiveUsers(7, (intIndexPosition+1)) = saryTempStringStore(7)
				saryActiveUsers(8, (intIndexPosition+1)) = saryTempStringStore(8)
				saryActiveUsers(9, (intIndexPosition+1)) = saryTempStringStore(9)
			End If
		Next
	Next
End Sub







'******************************************
'***	No. Active Users Viewing Forum	***
'******************************************

'function to get the number of users viewing a forum
Private Function viewingForum(ByVal intForumID)

	'Dimension variables
	Dim intIndexPosition	'Loop position
	Dim intViewing		'No. viewing	
	
	'Intiliase variables
	intViewing = 0

	'Check to make sure that we are dealing with an array before using UBound to prevent errors
	If isArray(saryActiveUsers) Then
		'Loop round to sort each result found
		For intIndexPosition = 1 To UBound(saryActiveUsers, 2)
			
			'If Forum ID'match increment by 1
			If saryActiveUsers(9, intIndexPosition) = intForumID Then intViewing = intViewing + 1
		Next
	End If

	'Return the numnber of users viewing forum
	viewingForum = intViewing
End Function







'******************************************
'***  	Function to trim strings	***
'******************************************

'Function to chop down the length of a string and add '...'
Private Function TrimString(strInputString, intStringLength)

	Dim intTrimLentgh

	'Trim the string down
	strInputString = Trim(strInputString) & " "

	'If the length of the text is longer than the max then cut it and place '...' at the end
	If CLng(Len(strInputString)) > intStringLength Then
		
		'Get the part in the string to trim it from
		intTrimLentgh = InStr(intStringLength, strInputString, " ", vbTextCompare)
		
		'If intTrimLentgh = 0 then set it to the default passed to the function (Error handling, should never be used)
		If intTrimLentgh = 0 Then intTrimLentgh = intStringLength
		
		'Trim the number of characters down to the required amount, but try not to chop words in half
		strInputString = Mid(strInputString, 1, intTrimLentgh)

		'Make sure the user hasn't entered a long line of text with no break (most words won't be over 30 chars
		If CLng(Len(strInputString)) => intStringLength + 30 Then
			strInputString = Mid(Trim(strInputString), 1, intStringLength)
		End If

		'Place '...' at the end
		 strInputString = Trim(strInputString) & "..."
	End If

	'Return string
	TrimString = strInputString
End Function







'******************************************
'***  	Function to get unread posts	***
'******************************************

'Function to get any unread posts for the unread post notification
Private Function UnreadPosts()

	'Array positions
	'0 = Thread_ID
	'1 = Topic_ID
	'2 = Forum_ID
	'3 = UnRead 1/0
	
	Dim dtmUnReadPostLastVisitDate
	Dim sarryTmp2UnReadPosts	'Array holding the orrgial session array
	Dim sarryTmp1UnReadPosts 	'Temporary store for unread posts array
	Dim intUnReadPostArrayPass1	'Loop
	Dim intUnReadPostArrayPass2	'Loop
	
	
	'Initliae variables
	dtmUnReadPostLastVisitDate = dtmLastVisitDate
	
	

	'See if the unread posts array exists at application level
	If isArray(Application("sarryUnReadPosts" & strSessionID)) Then  
		sarryTmp2UnReadPosts = Application("sarryUnReadPosts" & strSessionID)
	'See if a session array already esists for this user, if so read it in
	ElseIf isArray(Session("sarryUnReadPosts")) Then 
		sarryTmp2UnReadPosts = Session("sarryUnReadPosts")
	End If
	
	
	
		
	'Read in and clean up the last visit date, need to make it compatble with different database systems and locals
	dtmUnReadPostLastVisitDate = internationalDateTime(dtmUnReadPostLastVisitDate)
	
	'If SQL server remove dash (-) from the ISO international date to make SQL Server safe
	If strDatabaseType = "SQLServer" Then dtmUnReadPostLastVisitDate = Replace(dtmUnReadPostLastVisitDate, "-", "", 1, -1, 1)
	
	'If Access use # around date
	If strDatabaseType = "Access" Then
		dtmUnReadPostLastVisitDate = "#" & dtmUnReadPostLastVisitDate & "#"
	
	'SQL server and mySQL place ' around date
	Else
		dtmUnReadPostLastVisitDate = "'" & dtmUnReadPostLastVisitDate & "'"
	End If
	

	'Intilise SQL to get unread posts from database 
	'(limit set to 1000 unread posts as anymore would effect performance and how many people will want to know about 200+ unread posts? although someone will still complain)
	'1 As Unread is added to the select statement to make a dummy field in the recordset which can be used for storing if the post is read
	strSQL = "" & _
	"SELECT "
	If strDatabaseType = "SQLServer" OR strDatabaseType = "Access" Then
		strSQL = strSQL & " TOP 4000 "
	End If
	strSQL = strSQL & _
	strDbTable & "Thread.Thread_ID, " & strDbTable & "Topic.Topic_ID, " & strDbTable & "Topic.Forum_ID, 1 As Unread " & _
	"FROM " & strDbTable & "Topic" & strDBNoLock & ", " & strDbTable & "Thread" & strDBNoLock & " " &_
	"WHERE " & strDbTable & "Topic.Topic_ID = " & strDbTable & "Thread.Topic_ID " & _
		"AND " & strDbTable & "Thread.Message_date > " & dtmUnReadPostLastVisitDate & " "
		'Only get hidden posts if this is the admin or moderator
		If blnModerator = false AND blnAdmin = false Then
			strSQL = strSQL & _
			"AND " & strDbTable & "Topic.Hide = " & strDBFalse & " " & _
			"AND " & strDbTable & "Thread.Hide = " & strDBFalse & " "
		End If
	strSQL = strSQL & _
	"ORDER BY " & strDbTable & "Thread.Thread_ID ASC"
	
	'mySQL limit operator
	If strDatabaseType = "mySQL" Then
		strSQL = strSQL & " LIMIT 4000"
	End If
	strSQL = strSQL & ";"
	
	
	'Set error trapping
	On Error Resume Next
	
	'Query the database
	rsCommon.Open strSQL, adoCon
	
	'If an error has occurred write an error to the page
	If Err.Number <> 0 Then	Call errorMsg("An error has occurred while executing SQL query on database.", "UnreadPosts()", "functions_common.asp")
	
	'Disable error trapping
	On Error goto 0
	
	'If there are records returned add them to the end of the array
	If NOT rsCommon.EOF Then

		'Array positions
		'0 = Thread_ID
		'1 = Topic_ID
		'2 = Forum_ID
		'3 = UnRead 1/0

		'Read in the recordset into the array
		sarryTmp1UnReadPosts = rsCommon.GetRows()
				
		
		'Loop through the original array (if exists) and mark any posts down as being read which have been read
		If isArray(sarryTmp2UnReadPosts) Then
			
			'Loop through new array
			For intUnReadPostArrayPass1 = 0 to UBound(sarryTmp1UnReadPosts,2)
			
				'Loop through original array looking for match
				For intUnReadPostArrayPass2 = 0 to UBound(sarryTmp2UnReadPosts,2)
				
					'If match found 
					If CLng(sarryTmp1UnReadPosts(0,intUnReadPostArrayPass1)) = CLng(sarryTmp2UnReadPosts(0,intUnReadPostArrayPass2)) Then

						'If marked as read, also mark as read in new array
						If sarryTmp2UnReadPosts(3,intUnReadPostArrayPass2) = "0" Then sarryTmp1UnReadPosts(3,intUnReadPostArrayPass1) = "0"
					
						'Exit Loop
						Exit For
					End If
				Next
			Next				
		End If				

		
		
		'Place the array into the web servers application memory pool if the user has a session ID
		If strSessionID <> "" Then
			Application.Lock
			Application("sarryUnReadPosts" & strSessionID) = sarryTmp1UnReadPosts
			Application("sarryUnReadPosts2" & strSessionID) = strSessionID
			Application.UnLock
		'Else the user doesn't have a session ID so use the session instead
		Else
			Session("sarryUnReadPosts") = sarryTmp1UnReadPosts
		End If
	End If
	
	'Close RS
	rsCommon.Close
	
	'Set a variable with the time and date now, so we know when this was last checked
	Session("dtmUnReadPostCheck") = internationalDateTime(Now())
	
	
	'Read in the unread posts array	
	'Read in array if at application level
	If isArray(Application("sarryUnReadPosts" & strSessionID)) Then  
		sarryUnReadPosts = Application("sarryUnReadPosts" & strSessionID)
	'Read in if at sesison level
	ElseIf isArray(Session("sarryUnReadPosts")) Then 
		sarryUnReadPosts = Session("sarryUnReadPosts")
	
	End If
End Function






'******************************************
'***  	Cookie Management	 	***
'******************************************

'Functions and subs for handling cookies

'Set Cookie
Sub setCookie(strCookieName, strCookieKey, strValue, blnStore)
    	'Write Cookie
	Response.Cookies(strCookiePrefix & strCookieName)(strCookieKey) = strValue
	Response.Cookies(strCookiePrefix & strCookieName).Path = strCookiePath
	If blnStore Then
		Response.Cookies(strCookiePrefix & strCookieName).Expires = DateAdd("yyyy", 1, Now())
	End If
End Sub


'Get Cookie
Function getCookie(strCookieName, strCookieKey)  
	'Read in the cookie
	getCookie = Request.Cookies(strCookiePrefix & strCookieName)(strCookieKey)
End Function


'Clear Cookie
Sub clearCookie()  
	'Clear the cookie
	Response.Cookies(strCookiePrefix & "sID") = ""
	Response.Cookies(strCookiePrefix & "sID").Path = strCookiePath
	Response.Cookies(strCookiePrefix & "sLID") = ""
	Response.Cookies(strCookiePrefix & "sLID").Path = strCookiePath
	Response.Cookies(strCookiePrefix & "lVisit") = ""
	Response.Cookies(strCookiePrefix & "lVisit").Path = strCookiePath
	Response.Cookies(strCookiePrefix & "fID") = ""
	Response.Cookies(strCookiePrefix & "fID").Path = strCookiePath
	'This one stops user voting in polls so doesn't really want to be cleared
	'Response.Cookies(strCookiePrefix & "pID") = ""
	'Response.Cookies(strCookiePrefix & "pID").Path = strCookiePath
	
End Sub





'******************************************
'***  	Convertion Functions	 	***
'******************************************

'CInt Handling Integers to 32,768
Private Function IntC(strExpression) 

	'Set error trapping
	On Error Resume Next
	
	'Converts the string data to an Integer Number
	IntC = CInt(strExpression)
	
	'If an error has occurred write an error to the page
	If Err.Number <> 0 Then	Call errorMsg("Number handling error; The data being converted is not within range; -32,768 to 32,768.", "IntC()", "functions_common.asp")
	
	'Disable error trapping
	On Error goto 0

End Function


'CLng Handling Integers to 2,147,483,648
Private Function LngC(strExpression) 

	'Set error trapping
	On Error Resume Next
	
	'Converts the string data to an Integer Number
	LngC = CLng(strExpression)
	
	'If an error has occurred write an error to the page
	If Err.Number <> 0 Then	Call errorMsg("Number handling error; The data being converted is not within range; -2,147,483,648 to 2,147,483,648.", "LngC()", "functions_common.asp")
	
	'Disable error trapping
	On Error goto 0

End Function


'CDbl Handling Floating Point Numbers
Private Function DblC(strExpression) 

	'Set error trapping
	On Error Resume Next
	
	'Converts the string data to an Integer Number
	DblC = CDbl(strExpression)
	
	'If an error has occurred write an error to the page
	If Err.Number <> 0 Then	Call errorMsg("Number handling error; The data being converted is not a valid Floating Point Number.", "DblC()", "functions_common.asp")
	
	'Disable error trapping
	On Error goto 0

End Function


'CBool Handling True and False
Private Function BoolC(strExpression) 

	'Set error trapping
	On Error Resume Next
	
	'Converts the string data to an Boolen value
	BoolC = CBool(strExpression)
	
	'If an error has occurred write an error to the page
	If Err.Number <> 0 Then	Call errorMsg("Expression handling error; The data being converted is not a valid Boolean Subtype.", "BoolC()", "functions_common.asp")
	
	'Disable error trapping
	On Error goto 0

End Function


'CDate Handling Date Subtypes
Private Function DateC(strExpression) 

	'Set error trapping
	On Error Resume Next
	
	'Converts the string data to an Integer Number
	DateC = CDate(strExpression)
	
	'If an error has occurred write an error to the page
	If Err.Number <> 0 Then	Call errorMsg("Expression handling error; The data being converted is not a valid Date.", "DateC()", "functions_common.asp")
	
	'Disable error trapping
	On Error goto 0

End Function



'isBool checks if a Boolean value
Private Function isBool(strExpression) 

	'Convert to lower case string (less work to do later)
	strExpression = CStr(LCase(strExpression))
	
	'See if value is a booleon or not
	Select Case strExpression
		Case "true", "false", "1", "0", "-1"
			isBool = True
		Case Else
			isBool = False
	End Select

End Function





'*************************************
'*** 	Database Boolen Value     *****
'**************************************

Private Function CDbBool(ByVal blnBoolVal)

	If CBool(blnBoolVal) Then
		CDbBool = strDBTrue
	Else
		CDbBool = strDBFalse
	End If

End Function





'*************************************
'*** 	Dynamic Keywords	  *****
'**************************************

Private Function dynamicKeywords(ByVal strKeywords)

	Dim sarryKeyword
	Dim intKeywordLoop 

	'Convert to lower case, and trim
	strKeywords = LCase(strKeywords)
	
	'Remove any commas (prevents double commas later on)
	strKeywords = Replace(strKeywords, ",", " ")
	
	'Remove some wording
	strKeywords = Replace(strKeywords, " and ", " ", 1, -1, 1)
	strKeywords = Replace(strKeywords, " or ", " ", 1, -1, 1)
	strKeywords = Replace(strKeywords, " in ", " ", 1, -1, 1)
	strKeywords = Replace(strKeywords, " for ", " ", 1, -1, 1)
	strKeywords = Replace(strKeywords, " the ", " ", 1, -1, 1)
	strKeywords = Replace(strKeywords, " where ", " ", 1, -1, 1)
	strKeywords = Replace(strKeywords, " how ", " ", 1, -1, 1)
	strKeywords = Replace(strKeywords, " to ", " ", 1, -1, 1)
	strKeywords = Replace(strKeywords, " that ", " ", 1, -1, 1)
	strKeywords = Replace(strKeywords, " is ", " ", 1, -1, 1)
	strKeywords = Replace(strKeywords, " if ", " ", 1, -1, 1)
	strKeywords = Replace(strKeywords, " as ", " ", 1, -1, 1)
	strKeywords = Replace(strKeywords, " a ", " ", 1, -1, 1)
	strKeywords = Replace(strKeywords, " I ", " ", 1, -1, 1)
	strKeywords = Replace(strKeywords, "&amp;", " ", 1, -1, 1)
	strKeywords = Replace(strKeywords, "&quot;", " ", 1, -1, 1)
	strKeywords = Replace(strKeywords, "&", " ", 1, -1, 1)
	strKeywords = Replace(strKeywords, "?", " ", 1, -1, 1)
	strKeywords = Replace(strKeywords, "-", " ", 1, -1, 1)
	strKeywords = Replace(strKeywords, "=", " ", 1, -1, 1)
	strKeywords = Replace(strKeywords, "(", " ", 1, -1, 1)
	strKeywords = Replace(strKeywords, ")", " ", 1, -1, 1)
	strKeywords = Replace(strKeywords, "+", " ", 1, -1, 1)
	strKeywords = Replace(strKeywords, "{", " ", 1, -1, 1)
	strKeywords = Replace(strKeywords, "}", " ", 1, -1, 1)
	strKeywords = Replace(strKeywords, "@", " ", 1, -1, 1)
	strKeywords = Replace(strKeywords, "~", " ", 1, -1, 1)
	strKeywords = Replace(strKeywords, "#", " ", 1, -1, 1)
	strKeywords = Replace(strKeywords, "_", " ", 1, -1, 1)
	strKeywords = Replace(strKeywords, "*", " ", 1, -1, 1)
	strKeywords = Replace(strKeywords, "^", " ", 1, -1, 1)
	strKeywords = Replace(strKeywords, "!", " ", 1, -1, 1)
	strKeywords = Replace(strKeywords, "|", " ", 1, -1, 1)
	strKeywords = Replace(strKeywords, ".", " ", 1, -1, 1)
	strKeywords = Replace(strKeywords, "'", "", 1, -1, 1)
	strKeywords = Replace(strKeywords, """", "", 1, -1, 1)
	strKeywords = Replace(strKeywords, ":", " ", 1, -1, 1)
	strKeywords = Replace(strKeywords, ";", " ", 1, -1, 1)
	strKeywords = Replace(strKeywords, "<", " ", 1, -1, 1)
	strKeywords = Replace(strKeywords, ">", " ", 1, -1, 1)
	strKeywords = Replace(strKeywords, "\", " ", 1, -1, 1)
	strKeywords = Replace(strKeywords, "/", " ", 1, -1, 1)
	
	
	'Split the keywords into an array
	sarryKeyword = Split(strKeywords, " ")
	
	'Clear
	strKeywords = ""
	
	'Loop through all the keywords to check lentgh etc.
	For intKeywordLoop = 0 To UBound(sarryKeyword)
	
		'Trim any trailimng spaces from keyword
		sarryKeyword(intKeywordLoop) = Trim(sarryKeyword(intKeywordLoop))
		
		'Keep keyword lengths to 15 chars
		If Len(sarryKeyword(intKeywordLoop)) > 15 Then sarryKeyword(intKeywordLoop) = Left(sarryKeyword(intKeywordLoop), 15)
		
		'Add the keywords back into the strKeywords variable
		If Len(sarryKeyword(intKeywordLoop)) > 1 Then 
			If Len(strKeywords) > 0 Then strKeywords = strKeywords & ", "
			strKeywords = strKeywords & sarryKeyword(intKeywordLoop)
		End If
	Next
	
	'Return result
	dynamicKeywords = strKeywords
End Function






'******************************************
'***	  Logging Function             ****
'******************************************

'Sub to upload a file
Private Sub logAction(ByRef strUsername, ByVal strLogData)

	'Dimension variables
	Dim objFSO
	Dim objTextStream
	Dim strLogFileName
	Dim dtmDate
	Dim strYear
	Dim strMonth
	Dim strDay
	Const fsoForAppend = 8

	'Get the Now() date
	dtmDate = Now()
	
	'Log file name
	strYear = Year(dtmDate)
	strMonth = Month(dtmDate)
	strDay = Day(dtmDate)
	
	'Place 0 infront of months and dates under 10
	If strMonth < 10 then strMonth = "0" & strMonth
	If strDay < 10 then strDay = "0" & strDay
		
	'Create log file name
	strLogFileName = "wwf_" & strYear & "-" & strMonth & "-" & strDay & ".log"
	
	
	
	'Set error trapping
	On Error Resume Next
	
	'Creat an instance of the FSO object
	Set objFSO = Server.CreateObject("Scripting.FileSystemObject")
	
	'Check to see if an error has occurred
	'If an error has occurred write an error to the page
	If Err.Number <> 0 Then	Call errorMsg("An error has occurred during logging.<br />Please check the File System Object (FSO) is installed on the server.", "logAction()_create_FSO_object", "functions_commin.asp")

	'Disable error trapping
	On Error goto 0
		
		
	'See if the folder and file exist, if not create them
	If Not objFSO.FolderExists(strLogFileLocation) Then objFSO.CreateFolder(strLogFileLocation)
			
	'Open log file
	Set objTextStream = objFSO.OpenTextFile(strLogFileLocation & "\" & strLogFileName, fsoForAppend, True)	
		
	'Write to the a new line to the log file
	objTextStream.WriteLine(internationalDateTime(Now()) & " - " & getIP() & " - " & strUsername & " - " & strLogData)
	
	
	'Close the file and clean up
	objTextStream.Close
	Set objTextStream = Nothing
	Set objFSO = Nothing

End Sub


%>