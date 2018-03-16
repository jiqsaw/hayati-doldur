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



Dim strForumIconSrc
Dim strForumIconBgSrc
Dim strForumIconTitle

strForumIconSrc = "forum"
strForumIconBgSrc = ""
strForumIconTitle = ""



'No Access
If blnRead = False Then 
	strForumIconBgSrc = "forum_no_access"
	strForumIconTitle = strTxtForum & " " & strTxtNoAccess

'Password	
ElseIf strForumPassword <> "" Then
	strForumIconBgSrc = "forum_password_protected"
	strForumIconTitle = strTxtForum & " " & strTxtPasswordRequired

'Normal Forum
Else
	
	
	'Set up the background image
	If strSubForums <> "" Then 
		strForumIconBgSrc = "forum_sub"
		strForumIconTitle = strTxtForumWithSubForums
	Else	
		strForumIconBgSrc = "forum"
		strForumIconTitle = strTxtForum
	End If
	
	'If a locked forum
	If blnForumLocked Then 
		strForumIconSrc = strForumIconSrc & "_locked"
		strForumIconTitle =  strTxtLocked & " " & strForumIconTitle
	End If
	
	'If unread posts
	If intUnReadPostCount = 1 Then
		strForumIconSrc = strForumIconSrc & "_new"
		strForumIconTitle = strForumIconTitle & " [1 " & strTxtNewPost & "]"
	ElseIf intUnReadPostCount > 1 Then
		strForumIconSrc = strForumIconSrc & "_new"
		strForumIconTitle = strForumIconTitle & " [" & intUnReadPostCount & " " & strTxtNewPosts & "]"
	End If
End If


'If there is no extra icons to display with the topic overlay it with a blank image
If strForumIconSrc = "forum" Then strForumIconSrc = "forum_blank"
	
	



'Display the topic status icon
Response.Write("<div class=""topicIcon"" style=""background-image: url('" & strImagePath & strForumIconBgSrc & "." & strForumImageType & "');"">" & _
"<img src=""" & strImagePath & strForumIconSrc & "." & strForumImageType & """ border=""0"" alt=""" & strForumIconTitle & """ title=""" & strForumIconTitle & """ />" & _
"</div>")

%>