<% @ Language=VBScript %>
<% Option Explicit %>
<!--#include file="admin_common.asp" -->
<!--#include file="functions/functions_common.asp" -->
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


'If in demo mode redirect
If blnDemoMode Then
	Call closeDatabase()
	Response.Redirect("admin_web_wiz_forums_premium.asp" & strQsSID1)
End If


Call closeDatabase()


'***** START WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******	

Dim objXMLHTTP, objXmlDoc
Dim strLiName, strLiEM, strLiURL, strXCode, strDataStream, strFID, strFID2
Dim strLicenseServerMsg
Dim intResponseCode
Dim blnUploadComponent
Dim objUpload



strLicenseServerMsg = ""
blnUploadComponent = False
	

	
'Set objXMLHTTP = Server.CreateObject("MSXML2.ServerXMLHTTP")
Set objXMLHTTP = Server.CreateObject("Microsoft.XMLHTTP")
On Error Resume Next
objXMLHTTP.Open "POST", "http://license.webwizguide.com/test.asp", False
objXMLHTTP.setRequestHeader "Content-Type", "application/x-www-form-urlencoded"
objXMLHTTP.Send("IP=" & Request.ServerVariables("LOCAL_ADDR"))
       If Err.Number <> 0 Then strLicenseServerMsg = "<strong>Fail:</strong><br />Error Connecting to License Server. <br /><br />If Web Wiz Forums is running on a server behind a Firewall check that TCP Port 80 is open and not using a proxy server."
If NOT objXMLHTTP.Status = 200 Then
  	strLicenseServerMsg = "<strong>Fail:</strong><br />Error Connecting to License Server. <br /><br />Server Response: " & objXMLHTTP.Status & " - " & objXMLHTTP.statusText & "<br /><br />If Web Wiz Forums is running on a server behind a Firewall check that TCP Port 80 is open is open and not using a proxy server."
	On Error goto 0
	Set objXMLHTTP = Nothing
Else
  	strDataStream = objXMLHTTP.ResponseText
	On Error goto 0
        Set objXMLHTTP = Nothing
       
        'Read in XML
        Set objXmlDoc = CreateObject("Msxml2.FreeThreadedDOMDocument")
	objXmlDoc.Async = False
	objXmlDoc.LoadXML(strDataStream)
	If objXmlDoc.parseError.errorCode <> 0 Then 
		strLicenseServerMsg = "<strong>Fail:</strong><br />XML Parse Error: " & objXmlDoc.parseError.reason & "<br /><br />If Web Wiz Forums is running on a server behind a Firewall check that TCP Port 80 is open."
      	Else
		intResponseCode = CInt(objXmlDoc.childNodes(1).childNodes(0).text)
		
		If intResponseCode = 200 Then 
			strLicenseServerMsg = objXmlDoc.childNodes(1).childNodes(1).text
			
		Else
			strLicenseServerMsg = objXmlDoc.childNodes(1).childNodes(1).text
			
		End If
	End If
        Set objXmlDoc = Nothing	
End If	
		

'Upload component check
Private Sub objectCheck(ByRef strComponentName, ByRef strComponent)

	On Error Resume Next
   
	'ASPupload
	Set objUpload = Server.CreateObject(strComponent)
	
	'If an error the componet is not installed
	If Err.Number <> 0 Then
		
		Response.Write(strComponentName & " - NOT Installed")
		
	'Else the component is installed
	Else
		Response.Write(strComponentName & " - <strong>Installed</strong>")
		blnUploadComponent = True
	End If

	'Realease Object
	Set objUpload = Nothing
	
	'Disable error handling
	On Error goto 0

End Sub



%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="copyright" content="Copyright (C) 2001-2010 Web Wiz" />
<title>Server Requirements Test</title>

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

<!-- #include file="includes/admin_header_inc.asp" -->
<h1>  Server Requirements Test</h1>
 <a href="admin_menu.asp<% = strQsSID1 %>" target="_self">Return to the the Admin Control Panel Menu</a><br />
 <br />
 <table border="0" cellpadding="4" cellspacing="1" bordercolor="#000000" class="tableBorder">
  <tr>
   <td align="left" class="tableLedger">License Sever Connection Response </td>
  </tr>
  <tr>
   <td class="tableRow">
    If Web Wiz Forums is unable to connect to the Web Wiz License Server you will not be able to run the Premium Edition.
    <br /><br />
    <% = strLicenseServerMsg %>
   </td>
  </tr>
 </table>
 <br />
 <table border="0" cellpadding="4" cellspacing="1" bordercolor="#000000" class="tableBorder">
  <tr>
   <td align="left" class="tableLedger">Upload Component Test </td>
  </tr>
  <tr>
   <td class="tableRow">
    The 'File System Object' needs to be installed on the server in combination with one of the components below in order for Upload Features to work.
    <br /><br /><%

Call objectCheck("File System Object (FSO)", "Scripting.FileSystemObject")
Response.Write("<br /><br />")

Call objectCheck("Persits AspUpload 3.x", "Persits.UploadProgress")
Response.Write("<br />")
Call objectCheck("Persits AspUpload", "Persits.Upload.1")
Response.Write("<br />")
Call objectCheck("Dundas Upload", "Dundas.Upload")
Response.Write("<br />")
Call objectCheck("SoftArtisans FileUp (SA FileUp)", "SoftArtisans.FileUp")
Response.Write("<br />")
Call objectCheck("aspSmartUpload", "aspSmartUpload.SmartUpload")
Response.Write("<br />")
Call objectCheck("AspSimpleUpload", "ASPSimpleUpload.Upload")
   
   
%>
   </td>
  </tr>
 </table>
 <br />
 <table border="0" cellpadding="4" cellspacing="1" bordercolor="#000000" class="tableBorder">
  <tr>
   <td align="left" class="tableLedger">Email Component Test </td>
  </tr>
  <tr>
   <td class="tableRow">One of the following components needs to be installed on the server in combination with an SMTP Server  for the Email Features to work.
    <br />
    <br /><%

Call objectCheck("CDOSYS", "CDO.Message")
Response.Write("<br />")
Call objectCheck("CDONTS", "CDONTS.NewMail")
Response.Write("<br />")
Call objectCheck("JMail", "JMail.SMTPMail")
Response.Write("<br />")
Call objectCheck("JMail ver.4+", "Jmail.Message")
Response.Write("<br />")
Call objectCheck("AspEmail", "Persits.MailSender")
Response.Write("<br />")
Call objectCheck("AspMail", "SMTPsvg.Mailer")
   
   
%></td>
  </tr>
 </table>
 <br />
 <br />
 <!-- #include file="includes/admin_footer_inc.asp" --><%

'***** END WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******

%>