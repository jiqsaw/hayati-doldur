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



Response.Write("<br />" & _
vbCrLf & "<form method=""post"" name=""frmMessageForm"" id=""frmMessageForm"" action=""new_post.asp" & strQsSID1 & """ onSubmit=""return CheckForm();"" onReset=""return clearForm();"" rel=""nofollow"">" & _
vbCrLf & "<table cellspacing=""1"" cellpadding=""2"" class=""tableBorder"" align=""center"">" & _
vbCrLf & " <tr class=""tableLedger"">" & _
vbCrLf & "  <td>" & strTxtQuickReply& "</td>" & _
vbCrLf & " </tr>" & _
vbCrLf & " <tr class=""tableRow"">" & _
vbCrLf & "  <td>" & _
vbCrLf & "   <table cellspacing=""0"" cellpadding=""2"" align=""center"">")

        
'If the poster is in a guest then get them to enter a name
If lngLoggedInUserID = 2 AND (strMode <> "edit" AND strMode <> "editTopic" AND strMode <> "editPoll") Then
	   
	Response.Write(vbCrLf & "    <tr>" & _
	vbCrLf & "     <td align=""right"" width=""10%"">" & strTxtName & ":</td>" & _
	vbCrLf & "     <td width=""90%"">" & _
	vbCrLf & "      <input type=""text"" name=""Gname"" id=""Gname"" size=""20"" maxlength=""20"" tabindex=""1"" />" & _
	vbCrLf & "     </td>" & _
	vbCrLf & "    </tr>")
End If



'The message textarea
Response.Write(vbCrLf & "    <tr class=""tableRow"">" & _
vbCrLf & "     <td valign=""top"" align=""right"" width=""15%""><br />" & strTxtMessage & ":" & _
vbCrLf & "     <td width=""85%"" valign=""top"">")


'***** START WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
Response.Write(vbCrLf & vbCrLf & "<!--//" & _
vbCrLf & "/* *******************************************************" & _
vbCrLf & "Software: Web Wiz Rich Text Editor(TM) " & _
vbCrLf & "Info: http://www.richtexteditor.org" & _
vbCrLf & "Copyright: (C)2001-2010 Web Wiz(TM). All rights reserved" & _
vbCrLf & "******************************************************* */" & _
vbCrLf & "//-->")
'***** END WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******



'Name of the HTML form the textarea is within
Const strFormName = "frmMessageForm"
	
'ID tag name of HTML textarea being replaced
Const strTextAreaName = "message"


'Load default CSS and Javascript
Response.Write(vbCrLf & vbCrLf & "     <script language=""JavaScript"" src=""RTE_javascript_common.asp"" type=""text/javascript""></script>")


'Javascript function to switch to full reply screen
Response.Write(vbCrLf & "     <script language=""JavaScript"">" & _
vbCrLf & "     function FullReply(formName){")

'If RTE enabled get the message content from the iframe
If RTEenabled() <> "false" AND blnRTEEditor AND blnWYSIWYGEditor Then
	Response.Write(vbCrLf & "     	document.getElementById('message').value=document.getElementById('WebWizRTE').contentWindow.document.body.innerHTML;")
Else
	Response.Write(vbCrLf & "     	document.getElementById('message').value=document.getElementById('message').value;")
End If

Response.Write(vbCrLf & "     	formName.action = 'new_reply_form.asp?TID=" & lngTopicID & "&PN=" & lngTotalRecordsPages & "&TR=" &  lngTotalRecords & strQsSID2 & "';" & _	
vbCrLf & "     	formName.submit();" & _
vbCrLf & "     }" & _
vbCrLf & "     </script>")


'If this is an RTE enabled web browser load in the RTE content
If RTEenabled() <> "false" AND blnRTEEditor AND blnWYSIWYGEditor Then
	
	'Load in Javascript for RTE browsers
	Response.Write(vbCrLf & "     <script language=""JavaScript"" src=""RTE_javascript.asp?textArea=" & Server.URLEncode(strTextAreaName) & "&QR=true" & strQsSID2 & """ type=""text/javascript""></script>")

	'Create IFrame with message for those with javascript disabled
	Response.Write(vbCrLf & "     <script language=""javascript"">" & _
	vbCrLf & "      WebWizRTEtoolbar('" & strFormName & "');" & _
	vbCrLf & "      document.write ('<iframe id=""WebWizRTE"" src=""RTE_textarea.asp?mode=reply&ID=" & CInt(RND * 2000) & strQsSID2 & """ width=""650"" height=""100"" style=""border: #A5ACB2 1px solid"" onLoad=""initialiseWebWizRTE();"" tabindex=""2""></iframe>');" & _
	vbCrLf & "     </script>" & _
	vbCrLf & "     <noscript><strong><br /><br />" & strTxtJavaScriptEnabled & "</strong></noscript>")

	'Create hidden inputs
	Response.Write(vbCrLf & "     <input type=""hidden"" name=""message"" id=""message"" value="""" />")
	Response.Write(vbCrLf & "     <input type=""hidden"" name=""browser"" id=""browser"" value=""RTE"" />")

'If this is not an RTE enabled web browser load in the NON-RTE content
Else
	
	'Load in Javascript for non-RTE browsers
	Response.Write(vbCrLf & "     <script language=""JavaScript"" src=""non_RTE_javascript.asp?textArea=" & Server.URLEncode(strTextAreaName) & "&QR=true" & strQsSID2 & """ type=""text/javascript""></script>")

	'Create Toolbar and Iframes
	Response.Write(vbCrLf & "     <script language=""JavaScript"">WebWizRTEtoolbar('" & strFormName & "');</script>")

	'Create the text area
	Response.Write(vbCrLf & "     <textarea name=""message"" id=""message"" rows=""7"" wrap=""virtual"" tabindex=""2"" style=""width:596px;"" />")
	Response.Write("</textarea>")
	
End If

'********************************************************************

Response.Write(vbCrLf & "     </td>" & _
vbCrLf & "    </tr>" & _
vbCrLf & "    <tr class=""tableRow"">" & _
vbCrLf & "     <td align=""right"" width=""92"">&nbsp;</td>" & _
vbCrLf & "     <td width=""508"" valign=""bottom"" class=""text"">&nbsp;<input type=""checkbox"" name=""forumCodes"" id=""forumCodes"" value=""True"" checked tabindex=""3"" />" & strTxtEnable & " <a href=""javascript:winOpener('BBcodes.asp','codes',1,1,610,500)"">" & strTxtForumCodes & "</a> " & strTxtToFormatPosts & _
vbCrLf & "     </td></tr>")




'If signature of e-mail notify then display row to show
If (blnLoggedInUserEmail = True AND blnEmail = True) OR blnLoggedInUserSignature = True Then

	Response.Write(vbCrLf & "    <tr class=""tableRow"">" & _
	vbCrLf & "    <td align=""right"" height=""7"" width=""92"">&nbsp;</td>" & _
	vbCrLf & "    <td height=""7"" width=""508"" valign=""bottom"" class=""text"">")

	'If the user has a signature offer them the chance to show it
	If blnLoggedInUserSignature Then

		Response.Write(vbCrLf & "      &nbsp;<input type=""checkbox"" name=""signature"" value=""True""")
		If blnAttachSignature = True Then Response.Write(" checked")
		Response.Write(" tabindex=""4"" />" & strTxtShowSignature & "&nbsp;")

	End If

	'Display e-mail notify of replies option
	If blnEmail AND blnLoggedInUserEmail Then

		Response.Write(vbCrLf & "     &nbsp;<input type=""checkbox"" name=""email"" value=""True""")
		If blnReplyNotify Then Response.Write(" checked")
		Response.Write(" tabindex=""5"" />" & strTxtEmailNotify & "&nbsp;")

	End If

		
Response.Write(vbCrLf & "    </td>" & _
vbCrLf & "    </tr>")


End If



'Display CAPTCHA images for Guest posting
If blnGuestPostingCAPTCHA AND lngLoggedInUserID = 2 Then 
	
	%>
 <tr>
  <td align="right" valign="top"><% = strTxtUniqueSecurityCode %>:</td>
  <td><!--#include file="CAPTCHA_form_inc.asp" --><span class="smText"><% = strTxtEnterCAPTCHAcode %></span></td>
 </tr><%
     
End If



Response.Write(vbCrLf & "     <tr class=""tableRow"">" & _
vbCrLf & "     <td>")

	
         Response.Write(vbCrLf & "      <input type=""hidden"" name=""mode"" id=""mode"" value=""" & strMode & """ />" & _
	 vbCrLf & "      <input type=""hidden"" name=""FID"" id=""FID"" value=""" & intForumID & """ />" & _
	 vbCrLf & "      <input type=""hidden"" name=""TID"" id=""TID"" value=""" & lngTopicID & """ />" & _
	 vbCrLf & "      <input type=""hidden"" name=""PN"" id=""PN"" value=""" & intRecordPositionPageNum & """ />" & _
         vbCrLf & "      <input type=""hidden"" name=""ThreadPos"" id=""ThreadPos"" value=""" & (lngTotalRecords + 1) & """ />"  & _
         vbCrLf & "      <input type=""hidden"" name=""QR"" id=""QR"" value=""1"" />" & _
	 vbCrLf & "      <input type=""hidden"" name=""formID"" id=""formID"" value="""" />"  & _
         vbCrLf & "      <input type=""hidden"" name=""pre"" id=""pre"" value="""" />&nbsp;"  & _
         vbCrLf & "     </td>" & _
         vbCrLf & "     <td width=""70%"">")
         


Response.Write(vbCrLf & "       <input type=""submit"" id=""Submit"" name=""Submit"" value=""" & strTxtPostReply & """")
'If RTE enabled then use javascript to submit the RTE data
If RTEenabled() <> "false" AND blnRTEEditor AND blnWYSIWYGEditor Then
	Response.Write("onclick=""document.getElementById('message').value=document.getElementById('WebWizRTE').contentWindow.document.body.innerHTML;""")
End If
Response.Write(" tabindex=""6"" />")  
   
                     
Response.Write(vbCrLf & "       <input type=""button"" name=""Preview"" value=""" & strTxtPreviewPost & """ onclick=""")
'If RTE enabled get the preview content from the iframe
If RTEenabled() <> "false" AND blnRTEEditor AND blnWYSIWYGEditor Then
	Response.Write("document.getElementById('pre').value=document.getElementById('WebWizRTE').contentWindow.document.body.innerHTML;")
Else
	Response.Write("document.getElementById('pre').value=document.getElementById('message').value;")
End If
Response.Write(" OpenPreviewWindow(document.frmMessageForm);"" tabindex=""7"" />" & _

vbCrLf & "       <input type=""reset"" name=""Reset"" value=""" & strTxtClearForm & """ tabindex=""8"" />" & _
vbCrLf & "      </td>" & _
vbCrLf & "     </tr>" & _
vbCrLf & "    </table>" & _
vbCrLf & "   </td>" & _
vbCrLf & "  </tr>" & _
vbCrLf & " </table>" & _
vbCrLf & "</form>")
%>