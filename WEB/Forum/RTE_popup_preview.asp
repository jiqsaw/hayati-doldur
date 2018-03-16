<% @ Language=VBScript %>
<% Option Explicit %>
<!--#include file="common.asp" -->
<!--#include file="functions/functions_format_post.asp" -->
<!--#include file="includes/emoticons_inc.asp" -->
<!--#include file="RTE_configuration/RTE_setup.asp" -->
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



'Set the response buffer to true as we maybe redirecting
Response.Buffer = True


Dim strPreviewTextarea 			'Holds the Users Message


'Make sure this page is not cached
Response.Expires = -1
Response.ExpiresAbsolute = Now() - 2
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "No-Store"

'Read in the message to be previewed
strPreviewTextarea = Request.Form("pre")



'Place format posts posted with the WYSIWYG Editor (RTE)
If Request.Form("browser") = "RTE" Then 
	
	'Call the function to format WYSIWYG posts
	strPreviewTextarea = WYSIWYGFormatPost(strPreviewTextarea)

'Else standrd editor is used so convert forum codes
Else
	'Call the function to format posts
	strPreviewTextarea = FormatPost(strPreviewTextarea)
End If


'If the user wants forum codes enabled then format the post using them
If Request.Form("forumCodes") Then strPreviewTextarea = FormatForumCodes(strPreviewTextarea)

'Check the message for malicious HTML code
strPreviewTextarea = HTMLsafe(strPreviewTextarea)
strPreviewTextarea = formatInput(strPreviewTextarea)

'If the post contains a Flash or YouTube
If blnFlashFiles Then
	If InStr(1, strPreviewTextarea, "[FLASH", 1) > 0 AND InStr(1, strPreviewTextarea, "[/FLASH]", 1) > 0 Then strPreviewTextarea = formatFlash(strPreviewTextarea)
	If InStr(1, strPreviewTextarea, "[TUBE]", 1) > 0 AND InStr(1, strPreviewTextarea, "[/TUBE]", 1) > 0 Then strPreviewTextarea = formatYouTube(strPreviewTextarea)
End If

'Reset server objects
Call closeDatabase()


%>
<!-- #include file="includes/browser_page_encoding_inc.asp" -->
<meta name="copyright" content="Copyright (C) 2001-2010 Web Wiz" />
<title>Preview</title>
<HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE" /> 

<%
'***** START WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
Response.Write(vbCrLf & "<!--//" & _
vbCrLf & "/* *******************************************************" & _
vbCrLf & "Software: Web Wiz Rich Text Editor(TM) ver. " & strRTEversion & "" & _
vbCrLf & "Info: http://www.richtexteditor.org" & _
vbCrLf & "Copyright: (C)2001-2010 Web Wiz(TM). All rights reserved" & _
vbCrLf & "******************************************************* */" & _
vbCrLf & "//-->" & vbCrLf)
'***** END WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
%>

<link href="<% = strCSSfile %>default_style.css" rel="stylesheet" type="text/css" />

<%
'If the post contains a quote or code block then format it
'Needs to be called after the skin file include so that colours etc. are carried across
If InStr(1, strPreviewTextarea, "[QUOTE=", 1) > 0 AND InStr(1, strPreviewTextarea, "[/QUOTE]", 1) > 0 Then strPreviewTextarea = formatUserQuote(strPreviewTextarea)
If InStr(1, strPreviewTextarea, "[QUOTE]", 1) > 0 AND InStr(1, strPreviewTextarea, "[/QUOTE]", 1) > 0 Then strPreviewTextarea = formatQuote(strPreviewTextarea)
If InStr(1, strPreviewTextarea, "[CODE]", 1) > 0 AND InStr(1, strPreviewTextarea, "[/CODE]", 1) > 0 Then strPreviewTextarea = formatCode(strPreviewTextarea)


'If there is nothing to preview then say so
If strPreviewTextarea = "" OR IsNull(strPreviewTextarea) OR (InStr(1, strPreviewTextarea, "<br>", 1) = 1 AND Len(strPreviewTextarea) = 8) Then
	strPreviewTextarea = "<br /><br /><div align=""center"">" & strTxtThereIsNothingToPreview & "</div><br /><br />"
End If
%>
</head>
<body  style="margin:0px;" OnLoad="self.focus();">
<table width="100%"  border="0" cellpadding="3" cellspacing="0" class="RTEtableTopRow">
    <tr class="RTEtableTopRow">
      <td><h1><% = strTxtPreview %></h1></td>
    </tr>
    <tr>
      <td class="RTEtableRow"><br />
        <table width="98%" border="0" cellspacing="0" cellpadding="1" align="center">
          <tr>
            <td>
              <table width="100%" border="0" cellspacing="0" cellpadding="2" height="250">
                <tr>
                  <td class="text" valign="top">
                    <!--// /* Message body -->
                    <% = strPreviewTextarea %>
                    <!-- Message body ''"" */ //-->
                  </td>
                </tr>
            </table></td>
          </tr>
        </table>
      <br>      </td>
    </tr>
    <tr>
      <td align="center" class="RTEtableBottomRow">
        <input type="button" name="ok" onclick="javascript:window.close();" value="     <% = strTxtCloseWindow %>     ">
        <br>
        <br>
        <% 
'***** START WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
If blnLCode Then
	Response.Write("<span class=""text"" style=""font-size:10px""><a href=""http://www.richtexteditor.org"" target=""_blank"" style=""font-size:10px"">Web Wiz Rich Text Editor</a> version " & strRTEversion & "</span>")
	Response.Write("<br /><span class=""text"" style=""font-size:10px"">Copyright &copy;2001-2010 <a href=""http://www.webwizguide.com"" target=""_blank"" style=""font-size:10px"">Web Wiz</a></span>")
End If 
'***** END WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
%>
      <br><br>
      </td>
    </tr>
</table>
</body>
</html>