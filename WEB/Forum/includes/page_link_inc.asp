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



'Classic page numbering with drop downs
If blnClassicPageNumbering Then

	'If there is more than 1 page of topics then dispaly drop down list to the other topics
	If lngTotalRecordsPages > 1 Then
		
		
		'See if there is a search order to include in the link
		If NOT Request.QueryString("SO") = "" AND InStr(1, strLinkPage, "SO", 1) = 0 Then strLinkPage = strLinkPage & "SO=" & Server.URLEncode(Request.QueryString("SO")) & "&amp;"
		If NOT Request.QueryString("OB") = "" AND InStr(1, strLinkPage, "OB", 1) = 0 Then strLinkPage = strLinkPage & "OB=" & Server.URLEncode(Request.QueryString("OB")) & "&amp;"
		
		
		'Display a prev link if previous pages are available
		If intRecordPositionPageNum > 1 Then Response.Write("<a href=""" & strLinkPage & "PN=" & intRecordPositionPageNum - 1 & strQsSID2 & strLinkPageTitle & """>&lt;&lt&nbsp;" & strTxtPrevious & "</a>&nbsp;")
			
		Response.Write (strTxtPage & "&nbsp;<select onchange=""linkURL(this)"" name=""pageJump"" id=""pageJump" & Timer() & """>")
	
		'Loop round to display links to all the other pages
		For intPageLinkLoopCounter = 1 to lngTotalRecordsPages
	
			'Display a link in the link list to the another topic page
			Response.Write (vbCrLf & "     <option value=""" & strLinkPage & "PN=" & intPageLinkLoopCounter & strQsSID2 & strLinkPageTitle & """")
	
			'If this page number to display is the same as the page being displayed then make sure it's selected
			If intPageLinkLoopCounter = intRecordPositionPageNum Then
				Response.Write (" selected=""selected""")
			End If
	
			'Display the link page number
			Response.Write (">" & intPageLinkLoopCounter & "</option>")
	
		Next
	
		'End the drop down list
		Response.Write (vbCrLf & "   </select>&nbsp;" & strTxtOf & "&nbsp;" & lngTotalRecordsPages)
		
		'Display a next link if needed
		If intRecordPositionPageNum <> lngTotalRecordsPages Then Response.Write("&nbsp;<a href=""" & strLinkPage & "PN=" & intRecordPositionPageNum + 1 & strQsSID2 & strLinkPageTitle & """>" & strTxtNext & "&nbsp;&gt;&gt;</a>")
			
	End If





'New version 9+ page numbers with links and drop down (best of both)
'MSIE 6 and below have drop downs disabled as they suffer from bugs when enabled (IE 6 SUCKS!!)
Else

	'See if there is a search order to include in the link
	If NOT Request.QueryString("SO") = "" AND InStr(1, strLinkPage, "SO", 1) = 0 Then strLinkPage = strLinkPage & "SO=" & Server.URLEncode(Request.QueryString("SO")) & "&amp;"
	If NOT Request.QueryString("OB") = "" AND InStr(1, strLinkPage, "OB", 1) = 0 Then strLinkPage = strLinkPage & "OB=" & Server.URLEncode(Request.QueryString("OB")) & "&amp;"
	
	'Write the word page
	If lngTotalRecordsPages > 1 Then Response.Write(strTxtPage & "&nbsp;")
	
	'If there are other pages display drop down (accept for MSIE 6 or below)
	If lngTotalRecordsPages > 1 AND strClientBrowserVersion <> "MSIE6-" Then	
		
		Response.Write ("<select onchange=""linkURL(this)"" name=""pageJump"" id=""pageJump" & Timer() & """>")
		
		'Loop round to display links to all the other pages
		For intPageLinkLoopCounter = 1 to lngTotalRecordsPages
		
			'Display a link in the link list to the another topic page
			Response.Write (vbCrLf & "     <option value=""" & strLinkPage & "PN=" & intPageLinkLoopCounter & strQsSID2 & strLinkPageTitle & """")
		
			'If this page number to display is the same as the page being displayed then make sure it's selected
			If intPageLinkLoopCounter = intRecordPositionPageNum Then
					Response.Write (" selected=""selected""")
			End If
		
			'Display the link page number
			Response.Write (">" & intPageLinkLoopCounter & "</option>")
		
		Next
		
		'End the drop down list
		Response.Write (vbCrLf & "   </select> ")
	End If
	
	
	'If the page number is higher than page 1 then display a back link    	
	If intRecordPositionPageNum > 1 Then Response.Write vbCrLf & ("<a href=""" & strLinkPage & "PN=" &  intRecordPositionPageNum - 1  & strQsSID2 & strLinkPageTitle & """ class=""pageLink"" title=""" & strTxtPrevious & " " & strTxtPage & """>&lt</a>")	     	
 	
	
	'Always display a link to page 1...
	If (lngTotalRecordsPages > 4 AND intRecordPositionPageNum > 3) OR intRecordPositionPageNum > 3 Then Response.Write("<a href=""" & strLinkPage & "PN=1" & strQsSID2 & strLinkPageTitle & """ class=""pageLink"" title=""" & strTxtFirstPage & """>1</a> ")
	
	'If there is more than 1 page to display, display links to other pages
	If lngTotalRecordsPages > 1 Then
		
		'Loop through and display links to the other pages (-3 and +3 current page)
		For intPageLinkLoopCounter = 1 to lngTotalRecordsPages
		
			'Show link if within 4 of the current page
			If  intPageLinkLoopCounter < intRecordPositionPageNum + 3 AND intPageLinkLoopCounter > intRecordPositionPageNum - 3 Then
				
				'Display static number for the page we are on
				If intPageLinkLoopCounter = intRecordPositionPageNum Then 
					Response.Write("<span class=""pageLink"" title=""" & strTxtCurrentPage & """>" & intPageLinkLoopCounter & "</span>") 
					
				'Display link if it is to another page
				Else 
					Response.Write("<a href=""" & strLinkPage & "PN=" &  intPageLinkLoopCounter & strQsSID2 & strLinkPageTitle & """ class=""pageLink"" title=""" & strTxtPage & " " & intPageLinkLoopCounter & """>" & intPageLinkLoopCounter & "</a>")	
				End If
			End If
		Next	
	End If
	
	'Always display a link to ...lastpage
	If lngTotalRecordsPages > 3 AND intRecordPositionPageNum < lngTotalRecordsPages-2 Then Response.Write(" <a href=""" & strLinkPage & "PN=" & lngTotalRecordsPages & strQsSID2 & strLinkPageTitle & """ class=""pageLink"" title=""" & strTxtLastPage & """>" & lngTotalRecordsPages & "</a>")
	
	'If it is Not the End of the guestbook entries then display a next link for the next guestbook page      	
	If lngTotalRecordsPages > intRecordPositionPageNum then Response.Write ("<a href=""" & strLinkPage & "PN=" &  intRecordPositionPageNum + 1  & strQsSID2 & strLinkPageTitle & """ class=""pageLink"" title=""" & strTxtNext & " " & strTxtPage & """>&gt;</a>")   	

	
End If
%>