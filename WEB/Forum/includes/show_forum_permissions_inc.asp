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




'Write what permissions the user has in the forum
Response.Write("<span id=""forumPermissions"" onclick=""showDropDown('forumPermissions', 'dropDownPermissions', 255, 140);"" class=""dropDownPointer""  title=""" & strTxtViewDropDown & """>" & strTxtForumPermissions & "  <img src=""" & strImagePath & "drop_down." & strForumImageType & """ alt=""" & strTxtViewDropDown & """ /></span>")
Response.Write("<div id=""dropDownPermissions"" class=""dropDownPermissions"">")


'Display the users new post permissions
Response.Write(strTxtYou & " <strong>")
If blnPost = True Then Response.Write(strTxtCan) Else Response.Write(strTxtCannot)
Response.Write("</strong> " & strTxtpostNewTopicsInThisForum & "<br />")


'Reply permisisons
Response.Write(strTxtYou & " <strong>")
If blnReply = True Then Response.Write(strTxtCan) Else Response.Write(strTxtCannot)
Response.Write("</strong> " & strTxtReplyToTopicsInThisForum & "<br />")


'Delete permssions
Response.Write(strTxtYou & " <strong>")
If blnDelete = True Then Response.Write(strTxtCan) Else Response.Write(strTxtCannot)
Response.Write("</strong> " & strTxtDeleteYourPostsInThisForum & "<br />")


'Edit permissions
Response.Write(strTxtYou & " <strong>")
If blnEdit = True Then Response.Write(strTxtCan) Else Response.Write(strTxtCannot)
Response.Write("</strong> " & strTxtEditYourPostsInThisForum & "<br />")
 
 
'Create poll permissions  
Response.Write(strTxtYou & " <strong>")
If blnPollCreate = True Then Response.Write(strTxtCan) Else Response.Write(strTxtCannot)
Response.Write("</strong> " & strTxtCreatePollsInThisForum & "<br />")


'Vote in poll permissions 
Response.Write(strTxtYou & " <strong>")
If blnVote = True Then Response.Write(strTxtCan) Else Response.Write(strTxtCannot)
Response.Write("</strong> " & strTxtVoteInPOllsInThisForum & "<br />")

Response.Write("</div>")
%>