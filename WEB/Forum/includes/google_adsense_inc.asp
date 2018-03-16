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



'Dimesion variables
Dim strAdSenseCodePost		
Dim strAdSenseCodeHeader


Dim strMyGoogleAdSenseID	'Holds your Google AdSense ID


'If you have purchased a license key from Web Wiz then enter your Google AdSense ID below to have your ads displayed in the forum

'*** Enter your Google AdSense ID below
strMyGoogleAdSenseID = "pub-9026955576675812"





'You can chnage the following to change the colours of the ads
'**************************************

Const strAdBorderColour = "F7F7F4"
Const strAdBackgroundColour = "FFFFFF"
Const strAdLinkColour = "0000FF"
Const strAdURLcolour = "0000FF"
Const strAdTextColour = "000000"

'**************************************





'Build Google AdSense Code (Header)

strAdSenseCodeHeader = ("" & _
vbCrLf & "<script type=""text/javascript""><!--" & _
vbCrLf & "google_ad_client = """ & strMyGoogleAdSenseID & """;" & _
vbCrLf & "google_ad_width = 728;" & _
vbCrLf & "google_ad_height = 90;" & _
vbCrLf & "google_ad_format = ""728x90_as"";" & _
vbCrLf & "google_ad_type = ""text"";" & _
vbCrLf & "google_ad_channel ="""";" & _
vbCrLf & "google_color_border = """ & strAdBorderColour & """;" & _
vbCrLf & "google_color_bg = """ & strAdBackgroundColour & """;" & _
vbCrLf & "google_color_link = """ & strAdLinkColour & """;" & _
vbCrLf & "google_color_url = """ & strAdURLcolour & """;" & _
vbCrLf & "google_color_text = """ & strAdTextColour & """;" & _
vbCrLf & "//--></script>" & _
vbCrLf & "<script type=""text/javascript"" src=""http://pagead2.googlesyndication.com/pagead/show_ads.js""></script>")



'Build Google AdSense Code (Within Posts)

strAdSenseCodePost = ("" & _
vbCrLf & "<script type=""text/javascript""><!--" & _
vbCrLf & "google_ad_client = """ & strMyGoogleAdSenseID & """;" & _
vbCrLf & "google_ad_width = 300;" & _
vbCrLf & "google_ad_height = 250;" & _
vbCrLf & "google_ad_format = ""300x250_as"";" & _
vbCrLf & "google_ad_type = ""text"";" & _
vbCrLf & "google_ad_channel ="""";" & _
vbCrLf & "google_color_border = """ & strAdBorderColour & """;" & _
vbCrLf & "google_color_bg = """ & strAdBackgroundColour & """;" & _
vbCrLf & "google_color_link = """ & strAdLinkColour & """;" & _
vbCrLf & "google_color_url = """ & strAdURLcolour & """;" & _
vbCrLf & "google_color_text = """ & strAdTextColour & """;" & _
vbCrLf & "//--></script>" & _
vbCrLf & "<script type=""text/javascript"" src=""http://pagead2.googlesyndication.com/pagead/show_ads.js""></script>")


%>