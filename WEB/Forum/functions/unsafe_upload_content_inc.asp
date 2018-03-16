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



'Dimension variables
Dim saryUnSafeHTMLtags(42)	 'If the following contents is found inside an allowed file type that is not text/HTML based then it could be XSS

'Initalise array values
saryUnSafeHTMLtags(0) = "javascript"
saryUnSafeHTMLtags(1) = "vbscript"
saryUnSafeHTMLtags(2) = "jscript"
saryUnSafeHTMLtags(3) = "object"
saryUnSafeHTMLtags(4) = "applet"
saryUnSafeHTMLtags(5) = "embed"
saryUnSafeHTMLtags(6) = "event"
saryUnSafeHTMLtags(7) = "script"
saryUnSafeHTMLtags(8) = "function"	
saryUnSafeHTMLtags(9) = "document"
saryUnSafeHTMLtags(10) = "cookie"
saryUnSafeHTMLtags(11) = "style"
saryUnSafeHTMLtags(12) = "msgbox"
saryUnSafeHTMLtags(13) = "alert"
saryUnSafeHTMLtags(14) = "object"
saryUnSafeHTMLtags(15) = "create"
saryUnSafeHTMLtags(16) = "hover"
saryUnSafeHTMLtags(17) = "onload"
saryUnSafeHTMLtags(18) = "onclick"
saryUnSafeHTMLtags(19) = "ondblclick"
saryUnSafeHTMLtags(20) = "onkeyup"
saryUnSafeHTMLtags(21) = "onkeydown"
saryUnSafeHTMLtags(22) = "onkeypress"
saryUnSafeHTMLtags(23) = "onkey"
saryUnSafeHTMLtags(24) = "onmouseenter"
saryUnSafeHTMLtags(25) = "onmouseleave"
saryUnSafeHTMLtags(26) = "onmousemove"
saryUnSafeHTMLtags(27) = "onmouseout"
saryUnSafeHTMLtags(28) = "onmouseover"
saryUnSafeHTMLtags(29) = "onrollover"
saryUnSafeHTMLtags(30) = "onmouse"
saryUnSafeHTMLtags(31) = "onchange"
saryUnSafeHTMLtags(32) = "onunloadhave"
saryUnSafeHTMLtags(33) = "onunload"
saryUnSafeHTMLtags(34) = "onsubmit"
saryUnSafeHTMLtags(35) = "onselect"
saryUnSafeHTMLtags(36) = "accesskey"
saryUnSafeHTMLtags(37) = "tabindex"
saryUnSafeHTMLtags(38) = "onfocus"
saryUnSafeHTMLtags(39) = "onblur"
saryUnSafeHTMLtags(40) = "onsubmit"
saryUnSafeHTMLtags(41) = "onreset"
saryUnSafeHTMLtags(42) = "mocha"




'If you add more don't forget to increase the number in the Dim statement at the top!
%>