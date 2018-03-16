<%
'****************************************************************************************
'**  Copyright Notice    
'**
'**  Web Wiz CAPTCHA
'**  http://www.webwizCAPTCHA.com
'**                                                              
'**  Copyright ©2005-2008 Web Wiz(TM). All rights reserved.   
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




'***** START WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
Response.Write(vbCrLf & vbCrLf & "<!--//" & _
vbCrLf & "/* *******************************************************" & _
vbCrLf & "Software: Web Wiz CAPTCHA ver. " & strCAPTCHAversion & "" & _
vbCrLf & "Info: http://www.webwizCAPTCHA.com" & _
vbCrLf & "Copyright: (C)2005-2008 Web Wiz(TM). All rights reserved" & _
vbCrLf & "******************************************************* */" & _
vbCrLf & "//-->")
'***** END WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******              


%>  
<script language="javaScript">
function reloadCAPTCHA() {
	document.getElementById('CAPTCHA').src='CAPTCHA_image.asp?SID=<% = strSessionID %>&'+Date();
}
</script>            
  <table width="100%" border="0" cellspacing="1" cellpadding="3">
   <tr>
    <td><img src="CAPTCHA_image.asp?SID=<% = strSessionID %>" alt="Code Image - Please contact webmaster if you have problems seeing this image code" id="CAPTCHA" />&nbsp;<a href="javascript:reloadCAPTCHA();"><% = strTxtLoadNewCode %></a></td>
   </tr>
   <tr>
    <td><input type="text" name="securityCode" id="securityCode" size="12" maxlength="12" autocomplete="off" /></td>
   </tr><%

'***** START WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
If blnCAPTCHAabout Then
	Response.Write("<tr><td><span style=""font-size: 10px; font-family: Arial, Helvetica, sans-serif;"">CAPTCHA Software by <a href=""http://www.webwizcaptcha.com"" target=""_blank"" style=""font-size:10px"">Web Wiz CAPTCHA </a> version " & strCAPTCHAversion & "<br />Copyright &copy;2005-2008 <a href=""http://www.webwizguide.com"" target=""_blank"" style=""font-size:10px"">Web Wiz</a></span></td></tr>")
End If 
'***** END WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******      
      
      %>
  </table>