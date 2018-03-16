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


Dim intCalJumpLoop
%>
   <form id="calJump" name="calJump" method="get" action="calendar.asp">
    <select name="M" id="M"><%
    
	'Loop through the months
	For intCalJumpLoop = 1 TO 12
    		Response.Write(VbCrLf & "      <option value=""" & intCalJumpLoop & """")
		If intMonth = intCalJumpLoop Then Response.Write("selected")
		Response.Write(">")
		
		'Display month name	
		Select Case intCalJumpLoop
			Case 1
				Response.Write(strTxtJanuary)
			Case 2
				Response.Write(strTxtFebruary)
			Case 3
				Response.Write(strTxtMarch)
			Case 4
				Response.Write(strTxtApril)
			Case 5
				Response.Write(strTxtMay)
			Case 6
				Response.Write(strTxtJune)
			Case 7
				Response.Write(strTxtJuly)
			Case 8
				Response.Write(strTxtAugust)
			Case 9
				Response.Write(strTxtSeptember)
			Case 10
				Response.Write(strTxtOctober)
			Case 11
				Response.Write(strTxtNovember)
			Case 12
				Response.Write(strTxtDecember)
		End Select
		 
		Response.Write("</option>")
	Next
%>
    </select>
    <select name="Y" id="Y"><%
      
      	'Loop through years
      	For intCalJumpLoop = 2002 to Year(Now())+1
		Response.Write(VbCrLf & "      <option value=""" & intCalJumpLoop & """")
		If intYear = intCalJumpLoop Then Response.Write("selected") 
		Response.Write(">" & intCalJumpLoop & "</option>")
	Next
%>
    </select>
    <select name="V" id="V">
      <option value="1"><% = strTxtMonthView %></option>>
      <option value="2"<% If intView = 2 Then Response.Write(" selected") %>><% = strTxtWeekView %></option>
      <option value="3"<% If intView = 3 Then Response.Write(" selected") %>><% = strTxtYearView %></option>
    </select><%

'If showing birthdays have drop down to hide them
If blnDisplayBirthdays Then
%>
    <select name="DB" id="DB"> 
      <option value="0"<% If blnShowBirthdays = False Then Response.Write(" selected") %>><% = strTxtHideBirthdays %></option>
      <option value="1"<% If blnShowBirthdays = True Then Response.Write(" selected") %>><% = strTxtShowBirthdays %></option>
    </select><%
End If

'If showing birthdays have drop down to hide them
If Request.QueryString("W") Then
%>
    <input name="W" type="hidden" id="W" value="<% = Request.QueryString("W") %>" /><%
End If


'If SID then have a hiddeb field for it
If strQsSID <> "" Then 
%>
    <input name="SID" type="hidden"  id="SID" value="<% = strQsSID %>" /><%
End If
%>
    <input name="submit" type="submit" id="submit" value="Go" />
   </form>