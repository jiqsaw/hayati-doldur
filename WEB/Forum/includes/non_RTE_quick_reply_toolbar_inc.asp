<%
'****************************************************************************************
'**  Copyright Notice    
'**
'**  Web Wiz Rich Text Editor(TM)
'**  http://www.richtexteditor.org
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



'insert toolbar
'------------
If blnAdvAdddHyperlink OR blnAddHyperlink Or blnEmoticons Then Response.Write(vbCrLf & "	document.writeln('<img src=""" & strImagePath & "toolbar_separator.gif"" />")
'If hyperlink is enabled
If blnAdvAdddHyperlink OR blnAddHyperlink Then 
	Response.Write("<img src=""" & strImagePath & "post_button_hyperlink.gif"" onclick=""AddCode(\'URL\')"" title=""" & strTxtAddHyperlink & """ class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"" />")
	Response.Write("<img src=""" & strImagePath & "post_button_email.gif"" onclick=""AddCode(\'EMAIL\')"" title=""" & strTxtAddEmailLink & """ class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"" />")
End If
If blnEmoticons Then Response.Write("<img src=""" & strImagePath & "post_button_smiley.gif"" onclick=""winOpener(\'non_RTE_popup_emoticons.asp" & strQsSID1 & "\',\'emot\',0,0,650,340)"" title=""" & strTxtEmoticons & """ class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"" />")
If blnAdvAdddHyperlink OR blnAddHyperlink Or blnEmoticons Then Response.Write("');")


'Font style toolbar
'------------
If blnBold OR blnItalic OR blnUnderline Then Response.Write(vbCrLf & "	document.writeln('<img src=""" & strImagePath & "toolbar_separator.gif"" />")
If blnBold Then Response.Write("<img src=""" & strImagePath & "post_button_bold.gif"" title=""" & strTxtBold & """ onclick=""AddMessageCode(\'B\',\'" & strTxtEnterBoldText & "\', \'\')"" class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"" />")
If blnItalic Then Response.Write("<img src=""" & strImagePath & "post_button_italic.gif""  title=""" & strTxtItalic & """ onclick=""AddMessageCode(\'I\',\'" & strTxtEnterItalicText & "\', \'\')"" class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"" />")
If blnUnderline Then Response.Write("<img src=""" & strImagePath & "post_button_underline.gif"" title=""" & strTxtUnderline & """ onclick=""AddMessageCode(\'U\',\'" & strTxtEnterUnderlineText & "\', \'\')"" class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"" />")            
If blnBold OR blnItalic OR blnUnderline Then Response.Write("');")


'Quick reply to Full Reply
'------------
Response.Write(vbCrLf & "	document.writeln('<img src=""" & strImagePath & "toolbar_separator.gif"" />")
Response.Write("<img src=""" & strImagePath & "post_button_full_reply.gif"" title=""" & strTxtFullReplyEditor & """ onclick=""FullReply(document.frmMessageForm);"" class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"" />")
Response.Write("');")


'About toolbar
'------------
If blnLCode Then 
	Response.Write(vbCrLf & "	document.writeln('<img src=""" & strImagePath & "toolbar_separator.gif"" />")
	Response.Write("<img src=""" & strImagePath & "post_button_about.gif"" onclick=""winOpener(\'RTE_popup_about.asp" & strQsSID1 & "\',\'about\',0,0,415,187)"" title=""" & strTxtAboutRichTextEditor & """ class=""WebWizRTEbutton"" onmouseover=""overIcon(this)"" onmouseout=""outIcon(this)"" />")
	Response.Write("');")
End If

%>