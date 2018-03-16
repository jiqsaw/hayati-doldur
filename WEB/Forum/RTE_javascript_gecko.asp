<% @ Language=VBScript %>
<% Option Explicit %>
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


Response.AddHeader "pragma","cache"
Response.AddHeader "cache-control","public"
Response.CacheControl = "Public"



'***** START WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
Response.Write(vbCrLf & "<!--//" & _
vbCrLf & "/* *******************************************************" & _
vbCrLf & "Software: Web Wiz Rich Text Editor " & _
vbCrLf & "Info: http://www.richtexteditor.org" & _
vbCrLf & "Copyright: (C)2001-2010 Web Wiz(TM). All rights reserved" & _
vbCrLf & "******************************************************* */" & _
vbCrLf & "//-->")
'***** END WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******


'***********************************************************
'*** JavaScript inserting element in Mozilla and Opera *****
'***********************************************************

	%>
//Function to insert element in required position
function insertElementPosition(docWindow, insertElement){

      	var area = docWindow.getSelection();
      	var range = area.getRangeAt(0);
      	var editorPosition = range.startContainer;
      	var pos = range.startOffset;

      	area.removeAllRanges();
      	range.deleteContents();
      	range = document.createRange();

	if (editorPosition.nodeType==3 && insertElement.nodeType==3) {
	        	editorPosition.insertData(pos, insertElement.nodeValue);
	        	try{range.setEnd(editorPosition, pos + insertElement.length);}catch(exception){}
	        	try{range.setStart(editorPosition, pos + insertElement.length);}catch(exception){}

	}else{
	        	var afterElement;
	        	if (editorPosition.nodeType==3){

	          		var textElement = editorPosition;
	          		var text = textElement.nodeValue;
	          		var textBefore = text.substr(0,pos);
	          		var textAfter = text.substr(pos);
	          		var beforeNode = document.createTextNode(textBefore);
	          		var afterElement = document.createTextNode(textAfter);

				editorPosition = textElement.parentNode;
	          		editorPosition.insertBefore(afterElement, textElement);
	          		editorPosition.insertBefore(insertElement, afterElement);
	          		editorPosition.insertBefore(beforeNode, insertElement);
	          		editorPosition.removeChild(textElement);
	        	}else{
	          		afterElement = editorPosition.childNodes[pos];
	          		editorPosition.insertBefore(insertElement, afterElement);
	        	}
	        	try{range.setEnd(afterElement, 0);}catch(exception){}
	        	try{range.setStart(afterElement, 0);}catch(exception){}

      	}
      	area.removeAllRanges();
      	area.addRange(range);
}