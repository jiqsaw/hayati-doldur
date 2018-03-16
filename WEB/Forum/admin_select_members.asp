<% @ Language=VBScript %>
<% Option Explicit %>
<!--#include file="admin_common.asp" -->
<!--#include file="functions/functions_date_time_format.asp" -->
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



'Set the response buffer to true as we maybe redirecting
Response.Buffer = false

'Dimension variables
Dim strHomepage			'Holds the users homepage if they have one
Dim strEmail			'Holds the users e-mail address
Dim blnShowEmail		'Boolean set to true if the user wishes there e-mail address to be shown
Dim lngUserID			'Holds the new users ID number
Dim lngNumOfPosts		'Holds the number of posts the user has made
Dim intMemberGroupID		'Holds the users interger group ID
Dim strMemberGroupName		'Holds the umembers group name
Dim intRankStars		'holds the number of rank stars the user holds
Dim dtmRegisteredDate		'Holds the date the usre registered
Dim lngTotalRecordsPages	'Holds the total number of pages
Dim lngTotalRecords		'Holds the total number of forum members
Dim intRecordPositionPageNum	'Holds the page number we are on
Dim dtmLastPostDate		'Holds the date of the users las post
Dim intLinkPageNum		'Holds the page number to link to
Dim strSearchCriteria		'Holds the search critiria
Dim strSortBy			'Holds the way the records are sorted
Dim intGetGroupID		'Holds the group ID
Dim strRankCustomStars		'Holds custom stars for the user group
Dim sarryMembers		'Holds the getrows db call for members
Dim intPageSize			'Holds the number of memebrs shown per page
Dim intStartPosition		'Holds the start poition for records to be shown
Dim intEndPosition		'Holds the end poition for records to be shown
Dim intCurrentRecord		'Holds the current record position
Dim dtmLastActiveDate		'Holds the date this user was last active
Dim strSortDirection		'Holds the sort order
Dim intPageLinkLoopCounter	'Holds the loop counter for the page links
Dim strUsername			'Holds the users username
Dim strSearchBy
Dim strAuthorEmail


'Initalise variables
blnShowEmail = False
intGetGroupID = CInt(Request.QueryString("GID"))
intPageSize = 25


'If this is the first time the page is displayed then the members record position is set to page 1
If Request.QueryString("PN") = "" Then
	intRecordPositionPageNum = 1

'Else the page has been displayed before so the members page record postion is set to the Record Position number
Else
	intRecordPositionPageNum = CInt(Request.QueryString("PN"))
End If



'Get the what we are searching in email or username
If NOT Request.QueryString("SB") = "" Then
	strSearchBy = Trim(Mid(Request.QueryString("SB"), 1, 15))
End If

'Get the search critiria for the members to display
If NOT Request.QueryString("SF") = "" Then
	strSearchCriteria = Trim(Mid(Request.QueryString("SF"), 1, 40))
End If

'Get rid of milisous code
strSearchCriteria = formatSQLInput(strSearchCriteria)

'Get the sort critiria
Select Case Request.QueryString("SO")
	Case "PT"
		strSortBy = strDbTable & "Author.No_of_posts "
	Case "LU"
		strSortBy = strDbTable & "Author.Join_date "
	Case "OU"
		strSortBy = strDbTable & "Author.Join_date "
	Case "GP"
		strSortBy = strDbTable & "Group.Name "
	Case "LA"
		strSortBy = strDbTable & "Author.Last_visit "
	Case "EM"
		strSortBy = strDbTable & "Author.Author_email "
	Case Else
		strSortBy = strDbTable & "Author.Username "
End Select

'Sort the direction of db results
If Request.QueryString("OB") = "desc" Then
	strSortDirection = "asc"
	strSortBy = strSortBy & "DESC"
Else
	strSortDirection = "desc"
	strSortBy = strSortBy & "ASC"
End If



'Read in from db
If intGroupID <> 2 Then

	'If this is to show a group the query the database for the members of the group
	If intGetGroupID <> 0 Then
		'Initalise the strSQL variable with an SQL statement to query the database
		strSQL = "SELECT " & strDbTable & "Author.Author_ID, " & strDbTable & "Author.Username, " & strDbTable & "Author.Group_ID, " & strDbTable & "Author.Last_visit, " & strDbTable & "Author.No_of_posts, " & strDbTable & "Author.Join_date, " & strDbTable & "Author.Active, " & strDbTable & "Group.Name, " & strDbTable & "Group.Stars, " & strDbTable & "Group.Custom_stars, " & strDbTable & "Author.Author_email " & _
		"FROM " & strDbTable & "Author" & strDBNoLock & ", " & strDbTable & "Group" & strDBNoLock & " " & _
		"WHERE " & strDbTable & "Author.Group_ID = " & strDbTable & "Group.Group_ID AND " & strDbTable & "Author.Group_ID ="  & intGetGroupID & " " & _
		"ORDER BY " & strSortBy & ";"

	'Else get all the members from the database
	Else
		'Initalise the strSQL variable with an SQL statement to query the database
		strSQL = "SELECT " & strDbTable & "Author.Author_ID, " & strDbTable & "Author.Username, " & strDbTable & "Author.Group_ID, " & strDbTable & "Author.Last_visit, " & strDbTable & "Author.No_of_posts, " & strDbTable & "Author.Join_date, " & strDbTable & "Author.Active, " & strDbTable & "Group.Name, " & strDbTable & "Group.Stars, " & strDbTable & "Group.Custom_stars, " & strDbTable & "Author.Author_email " & _
		"FROM " & strDbTable & "Author " & strDBNoLock & ", " & strDbTable & "Group " & strDBNoLock & " " & _
		"WHERE " & strDbTable & "Author.Group_ID = " & strDbTable & "Group.Group_ID "
		If strSearchBy = "email" Then
			strSQL = strSQL & "AND " & strDbTable & "Author.Author_email LIKE '%" & strSearchCriteria & "%' "
		Else
			strSQL = strSQL & "AND " & strDbTable & "Author.Username LIKE '" & strSearchCriteria & "%' "
		End If
		strSQL = strSQL & "ORDER BY " & strSortBy & ";"
	End If

	'Query the database  
	rsCommon.Open strSQL, adoCon
	
	'If there are records get em from rs
	If NOT rsCommon.EOF Then
		
		'Read in the row from the db using getrows for better performance
		sarryMembers = rsCommon.GetRows()
		
		
		'Count the number of records
		lngTotalRecords = Ubound(sarryMembers,2) + 1
		
		'Count the number of pages for the topics using '\' so that any fraction is omitted 
		lngTotalRecordsPages = lngTotalRecords \ intPageSize
		
		'If there is a remainder or the result is 0 then add 1 to the total num of pages
		If lngTotalRecords Mod intPageSize > 0 OR lngTotalRecordsPages = 0 Then lngTotalRecordsPages = lngTotalRecordsPages + 1
		
		
		'Start position
		intStartPosition = ((intRecordPositionPageNum - 1) * intPageSize)	
		
		'End Position
		intEndPosition = intStartPosition + intPageSize
		
		'Get the start position
		intCurrentRecord = intStartPosition
	End If
	
	
	'Close the recordset as it is no longer needed
	rsCommon.Close

End If

'Page to link to for mutiple page (with querystrings if required)
strLinkPage = "admin_select_members.asp?SF=" & Server.URLEncode(Request.QueryString("SF")) & "&GID=" & intGetGroupID & "&SB=" & strSearchBy & "&"


%>
<!-- #include file="includes/browser_page_encoding_inc.asp" -->
<title>Forum Member Adminstration</title>
<meta name="generator" content="Web Wiz Forums" />

<%
'***** START WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
Response.Write("<!--//" & _
vbCrLf & "/* *******************************************************" & _
vbCrLf & "Software: Web Wiz Forums(TM) ver. " & strVersion & "" & _
vbCrLf & "Info: http://www.webwizforums.com" & _
vbCrLf & "Copyright: (C)2001-2010 Web Wiz(TM). All rights reserved" & _
vbCrLf & "******************************************************* */" & _
vbCrLf & "//-->")
'***** END WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
%>

<script  language="JavaScript">
function CheckForm () {

	//Check for a somthing to search for
	if (document.getElementById('frmMemberSearch').SF.value==""){

		msg = "_______________________________________________________________\n\n";
		msg += "The form has not been submitted because there are problem(s) with the form.\n";
		msg += "Please correct the problem(s) and re-submit the form.\n";
		msg += "_______________________________________________________________\n\n";
		msg += "The following field(s) need to be corrected: -\n";

		alert(msg + "\n\tMember Search\t- Enter a Members Username to search for\n\n");
		document.getElementById('frmMemberSearch').SF.focus();
		return false;
	}

	return true;
}
</script>

<!-- #include file="includes/admin_header_inc.asp" -->
<div align="center"> 
 <h1>Forum Member Administration</h1><br />
  <a href="admin_menu.asp<% = strQsSID1 %>">Control Panel Menu</a><br />
  <br />
  Click on the members name to administer their forum membership account, <br />
  from where you can, change their details, member group, reset password, suspend, delete, etc. from the Forum.<br />
 <br />
 <form name="frmMemberSearch" method="get" action="admin_select_members.asp" onSubmit="return CheckForm();">
   <table cellspacing="1" cellpadding="3" class="tableBorder" align="center">
     <tr class="tableLedger">
       <td colspan="2" align="left">Member Search </td>
     </tr>
     <tr class="tableRow">
       <td align="left">Member Search :
           <input name="SF" size="30" maxlength="40" value="<% = Server.HTMLEncode(Request.QueryString("SF")) %>" />
           <input type="hidden" name="SID" id="SID" value="<% = strQsSID %>" />
           <input type="submit" name="Submit" value="Search" />
           <br />
           Search By: 
           <input name="SB" type="radio" value="user"<% If strSearchBy = "user" OR strSearchBy = "" Then Response.Write(" checked=""checked""") %> />
        Username&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input name="SB" type="radio" value="email"<% If strSearchBy = "email" Then Response.Write(" checked=""checked""") %> />
        Email Address         <br />
         <br />
         <a href="admin_select_members.asp<% = strQsSID1 %>">#</a> <a href="admin_select_members.asp?SF=A<% = strQsSID2 %>">A</a> <a href="admin_select_members.asp?SF=B<% = strQsSID2 %>">B</a> <a href="admin_select_members.asp?SF=C<% = strQsSID2 %>">C</a> <a href="admin_select_members.asp?SF=D<% = strQsSID2 %>">D</a> <a href="admin_select_members.asp?SF=E<% = strQsSID2 %>">E</a> <a href="admin_select_members.asp?SF=F<% = strQsSID2 %>">F</a> <a href="admin_select_members.asp?SF=G<% = strQsSID2 %>">G</a> <a href="admin_select_members.asp?SF=H<% = strQsSID2 %>">H</a> <a href="admin_select_members.asp?SF=I<% = strQsSID2 %>">I</a> <a href="admin_select_members.asp?SF=J<% = strQsSID2 %>">J</a> <a href="admin_select_members.asp?SF=K<% = strQsSID2 %>">K</a> <a href="admin_select_members.asp?SF=L<% = strQsSID2 %>">L</a> <a href="admin_select_members.asp?SF=M<% = strQsSID2 %>">M</a> <a href="admin_select_members.asp?SF=N<% = strQsSID2 %>">N</a> <a href="admin_select_members.asp?SF=O<% = strQsSID2 %>">O</a> <a href="admin_select_members.asp?SF=P<% = strQsSID2 %>">P</a> <a href="admin_select_members.asp?SF=Q<% = strQsSID2 %>">Q</a> <a href="admin_select_members.asp?SF=R<% = strQsSID2 %>">R</a> <a href="admin_select_members.asp?SF=S<% = strQsSID2 %>">S</a> <a href="admin_select_members.asp?SF=T<% = strQsSID2 %>">T</a> <a href="admin_select_members.asp?SF=U<% = strQsSID2 %>">U</a> <a href="admin_select_members.asp?SF=V<% = strQsSID2 %>">V</a> <a href="admin_select_members.asp?SF=W<% = strQsSID2 %>">W</a> <a href="admin_select_members.asp?SF=X<% = strQsSID2 %>">X</a> <a href="admin_select_members.asp?SF=Y<% = strQsSID2 %>">Y</a> <a href="admin_select_members.asp?SF=Z<% = strQsSID2 %>">Z</a></td>
     </tr>
   </table>
 </form>
</div>
<br />
   <table cellspacing="1" cellpadding="3" class="tableBorder" align="center">
     <tr class="tableLedger">
       <td width="100"><a href="admin_select_members.asp?SF=<% = Server.URLEncode(Request.QueryString("SF")) %>&amp;GID=<% = intGetGroupID %>&amp;SO=UN<% = strQsSID2 %>">Username</a> <% If Request.QueryString("SO") = "UN" OR Request.QueryString("SO") = "" Then Response.Write(" <a href=""admin_select_members.asp?SF=" & Server.URLEncode(Request.QueryString("SF")) & "&GID=" & intGetGroupID & "&SO=UN&OB=" & strSortDirection & strQsSID2 & """><img src=""" & strImagePath & strSortDirection & "." & strForumImageType & """ alt=""Reverse Sort Order"" /></a>") %></td>
       <td width="120"><a href="admin_select_members.asp?SF=<% = Server.URLEncode(Request.QueryString("SF")) %>&amp;GID=<% = intGetGroupID %>&amp;SO=EM<% = strQsSID2 %>">Email Address</a> <% If Request.QueryString("SO") = "EM" OR Request.QueryString("SO") = "" Then Response.Write(" <a href=""admin_select_members.asp?SF=" & Server.URLEncode(Request.QueryString("SF")) & "&GID=" & intGetGroupID & "&SO=EM&OB=" & strSortDirection & strQsSID2 & """><img src=""" & strImagePath & strSortDirection & "." & strForumImageType & """ alt=""Reverse Sort Order"" /></a>") %></td>
       <td width="100"><a href="admin_select_members.asp?SF=<% = Server.URLEncode(Request.QueryString("SF")) %>&amp;GID=<% = intGetGroupID %>&amp;SO=GP<% = strQsSID2 %>">Group</a> <% If Request.QueryString("SO") = "GP" Then Response.Write(" <a href=""admin_select_members.asp?SF=" & Server.URLEncode(Request.QueryString("SF")) & "&GID=" & intGetGroupID & "&SO=GP&OB=" & strSortDirection & strQsSID2 & """><img src=""" & strImagePath & strSortDirection & "." & strForumImageType & """ alt=""Reverse Sort Order"" /></a>") %></td>
       <td width="100"><a href="admin_select_members.asp?SF=<% = Server.URLEncode(Request.QueryString("SF")) %>&amp;GID=<% = intGetGroupID %>&amp;SO=LU<% = strQsSID2 %>">Registered</a> <% If Request.QueryString("SO") = "LU" Then Response.Write(" <a href=""admin_select_members.asp?SF=" & Server.URLEncode(Request.QueryString("SF")) & "&GID=" & intGetGroupID & "&SO=LU&OB=" & strSortDirection & strQsSID2 & """><img src=""" & strImagePath & strSortDirection & "." & strForumImageType & """ alt=""Reverse Sort Order"" /></a>") %></td>
       <td width="64" align="center"><a href="admin_select_members.asp?SF=<% = Server.URLEncode(Request.QueryString("SF")) %>&amp;GID=<% = intGetGroupID %>&amp;SO=PT<% = strQsSID2 %>">Posts</a> <% If Request.QueryString("SO") = "PT" Then Response.Write(" <a href=""admin_select_members.asp?SF=" & Server.URLEncode(Request.QueryString("SF")) & "&GID=" & intGetGroupID & "&SO=PT&OB=" & strSortDirection & strQsSID2 & """><img src=""" & strImagePath & strSortDirection & "." & strForumImageType & """ alt=""Reverse Sort Order"" /></a>") %></td>
       <td width="100"><a href="admin_select_members.asp?SF=<% = Server.URLEncode(Request.QueryString("SF")) %>&amp;GID=<% = intGetGroupID %>&amp;SO=LA<% = strQsSID2 %>">Last Active</a> <% If Request.QueryString("SO") = "LA" Then Response.Write(" <a href=""admin_select_members.asp?SF=" & Server.URLEncode(Request.QueryString("SF")) & "&GID=" & intGetGroupID & "&SO=LA&OB=" & strSortDirection & strQsSID2 & """><img src=""" & strImagePath & strSortDirection & "." & strForumImageType & """ alt=""Reverse Sort Order"" /></a>") %></td>
       <td width="10" align="center">Delete&nbsp;Member</td>
     </tr><%
         
         
	'If there are no search results display an error msg
	If lngTotalRecords <= 0 Then
		
		'If there are no search results to display then display the appropriate error message
		Response.Write vbCrLf & "    <tr class=""tableRow""><td colspan=""7"" align=""center""><br />Your search has found no results<br /><br /></td></tr>"
	
	
	
	
	'Disply any search results in the forum
	Else
			
			
		

		'Do....While Loop to loop through the recorset to display the forum members
		Do While intCurrentRecord < intEndPosition

			'If there are no member's records left to display then exit loop
			If intCurrentRecord >= lngTotalRecords Then Exit Do
			
			'Initialise varibles
			dtmLastPostDate = ""

			'Read in the profile from the recordset
			lngUserID = CLng(sarryMembers(0,intCurrentRecord))
			strUsername = sarryMembers(1,intCurrentRecord)
			If isDate(sarryMembers(3,intCurrentRecord)) Then dtmLastActiveDate = CDate(sarryMembers(3,intCurrentRecord)) Else dtmLastActiveDate = Now()
			lngNumOfPosts = CLng(sarryMembers(4,intCurrentRecord))
			dtmRegisteredDate = CDate(sarryMembers(5,intCurrentRecord))
			intMemberGroupID = CInt(sarryMembers(2,intCurrentRecord))
			strMemberGroupName = sarryMembers(7,intCurrentRecord)
			intRankStars = CInt(sarryMembers(8,intCurrentRecord))
			strRankCustomStars = sarryMembers(9,intCurrentRecord)
			strAuthorEmail = sarryMembers(10,intCurrentRecord)
			
			

			'If the users account is not active make there account level guest
			If CBool(sarryMembers(6,intCurrentRecord)) = False Then intMemberGroupID = 0

			'Write the HTML of the Topic descriptions as hyperlinks to the Topic details and message
			%>
     <tr class="<% If (intCurrentRecord MOD 2 = 0 ) Then Response.Write("evenTableRow") Else Response.Write("oddTableRow") %>">
       <td><a href="admin_register.asp?PF=<% = lngUserID & strQsSID2 %>"><% = strUsername %></a></td>
       <td><% = strAuthorEmail %></td>
       <td class="smText"><% = strMemberGroupName %><br /><img src="<% If strRankCustomStars <> "" Then Response.Write(strRankCustomStars) Else Response.Write(strImagePath & intRankStars & "_star_rating.png") %>" alt="<% = strMemberGroupName %>" /></td>
       <td class="smText"><% = DateFormat(dtmRegisteredDate) %></td>
       <td  align="center"><% = lngNumOfPosts %></td>
       <td class="smText"><% = DateFormat(dtmLastActiveDate) %></td>
       <td align="center"><% If lngUserID > 2 Then %><a href="admin_delete_member.asp?MID=<% = lngUserID & "&amp;XID=" & getSessionItem("KEY") & strQsSID2 %>" onclick="return confirm('Are you sure you want to permanently delete this Forum Member?\n\nWARNING: Do not delete members unless you really have to. Ideally you should suspend members accounts instead.')"><img src="<% = strImagePath %>delete.png" border="0" title="Delete Member" /></a><% End If %></td>
      </tr><%
			
			'Move to the next record
			intCurrentRecord = intCurrentRecord + 1
					
		'Loop back round
		Loop
	End If	
			%>
   </table>
   <%
	


'Page to link to for mutiple page (with querystrings if required)
strLinkPage = "admin_select_members.asp?SF=" & Server.URLEncode(Request.QueryString("SF")) & "&GID=" & intGetGroupID & "&"
%>
   <table class="basicTable" cellspacing="0" cellpadding="4" align="center">
     <tr>
       <td align="right" nowrap="nowrap"><!-- #include file="includes/page_link_inc.asp" -->
       </td>
     </tr>
   </table>
   <%


'Reset Server Objects
Call closeDatabase()

%>
<br />
<!-- #include file="includes/admin_footer_inc.asp" -->