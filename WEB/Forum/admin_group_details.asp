<% @ Language=VBScript %>
<% Option Explicit %>
<!--#include file="admin_common.asp" -->
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



'Dimension variables
Dim rsCommon2		'Holds a secound recordset for the page
Dim intUserGroupID	'Holds the group ID
Dim strGroupName	'Holds the name of the group
Dim lngMinimumPosts	'Holds the minimum amount of posts to be in that group
Dim blnSpecialGroup	'Set to true if a special group
Dim intStars		'Holds the number of stars for the group
Dim strCustomStars	'Holds the custom stars image if there is one fo0r this group
Dim intCatID		'Holds the cat ID
Dim sarryForums
Dim intCurrentRecord
Dim sarrySubForums
Dim intCurrentRecord2
Dim intSubForumID



'Initlise variables
lngMinimumPosts = 0
blnSpecialGroup = False
intStars = 1
intCatID = 0


'Read in the details
intUserGroupID = CInt(Request.QueryString("GID"))




'Intialise the ADO recordset object
Set rsCommon2 = Server.CreateObject("ADODB.Recordset")


'If this is a post back update the database
If Request.Form("postBack") AND blnDemoMode = False Then
	
	'Check the form ID to prevent XCSRF
	Call checkFormID(Request.Form("formID"))
	
	'Read the various groups from the database
	'Initalise the strSQL variable with an SQL statement to query the database
	If intUserGroupID = 0 Then
		strSQL = "SELECT " & strDbTable & "Group.* FROM " & strDbTable & "Group ORDER BY " & strDbTable & "Group.Group_ID DESC;"
	Else
		strSQL = "SELECT " & strDbTable & "Group.* FROM " & strDbTable & "Group WHERE " & strDbTable & "Group.Group_ID = " & intUserGroupID & ";"
	End If
	
	'Set the cursor type property of the record set to Forward Only
	rsCommon.CursorType = 0
	
	'Set the Lock Type for the records so that the record set is only locked when it is updated
	rsCommon.LockType = 3
	
	'Query the database
	rsCommon.Open strSQL, adoCon


	'Read in the group details
	strGroupName = Request.Form("GroupName")
	lngMinimumPosts = CLng(Request.Form("posts"))
	blnSpecialGroup = CBool(Request.Form("rank"))
	intStars = CInt(Request.Form("stars"))
	strCustomStars = Request.Form("custStars")


	'If this is a non ladder group place -1 into the minimum posts variable
	If blnSpecialGroup Then
		lngMinimumPosts = CInt("-1")
	End If


	With rsCommon
		'If this is a new one add new
		If intUserGroupID = 0 Then .AddNew

		'Update the recordset
		.Fields("Name") = strGroupName
		.Fields("Stars") = intStars
		.Fields("Custom_stars") = strCustomStars
		If intUserGroupID <> 1 AND intUserGroupID <> 2 Then 
			.Fields("Minimum_posts") = lngMinimumPosts
			.Fields("Special_rank") = blnSpecialGroup
		End If

		'Update the database with the group details
		.Update
	End With
	
	
	
	'Re-run the query to read in the updated recordset from the database
	'We need to do this to get the new Group ID
	rsCommon.Requery
	
	'Get the group ID from database
	intUserGroupID = CInt(rsCommon("Group_ID"))
	
	'Close RS
	rsCommon.Close
	
	

		
		
	
	'Read in the groups from db
	'Initalise the strSQL variable with an SQL statement to query the database
	strSQL = "SELECT " & strDbTable & "Forum.Forum_ID FROM " & strDbTable & "Forum ORDER BY " & strDbTable & "Forum.Forum_Order ASC;"
	
	'Query the database
	rsCommon.Open strSQL, adoCon
	
	'Loop through all the categories in the database
	Do while NOT rsCommon.EOF
	
	
		'Get the group ID
		intForumID = CInt(rsCommon("Forum_ID"))
	
		'Read in the permssions from the db for this group (not very efficient doing it this way, but this page won't be run often)
		'Initalise the strSQL variable with an SQL statement to query the database
		strSQL = "SELECT " & strDbTable & "Permissions.* FROM " & strDbTable & "Permissions WHERE " & strDbTable & "Permissions.Group_ID = " & intUserGroupID & " AND " & strDbTable & "Permissions.Forum_ID = " & intForumID & ";"
		
		'Set the cursor type property of the record set to Forward Only
		rsCommon2.CursorType = 0
		
		'Set the Lock Type for the records so that the record set is only locked when it is updated
		rsCommon2.LockType = 3
		
		'Query the database
		rsCommon2.Open strSQL, adoCon
		
		With rsCommon2
			'If no records are returned then add a new record to the database
			If .EOF Then .AddNew
			
			'Update the recordset
			.Fields("Group_ID") = intUserGroupID
			.Fields("Forum_ID") = intForumID
			.Fields("View_Forum") = CBool(Request.Form("read" & intForumID))
			.Fields("Post") = CBool(Request.Form("topic" & intForumID))
			.Fields("Priority_posts") = CBool(Request.Form("sticky" & intForumID))
			.Fields("Reply_posts") = CBool(Request.Form("reply" & intForumID))
			.Fields("Edit_posts") = CBool(Request.Form("edit" & intForumID))
			.Fields("Delete_posts") = CBool(Request.Form("delete" & intForumID))
			.Fields("Poll_create") = CBool(Request.Form("polls" & intForumID))
			.Fields("Vote") = CBool(Request.Form("vote" & intForumID))
			.Fields("Display_post") = CBool(Request.Form("approve" & intForumID))
			.Fields("Moderate") = CBool(Request.Form("moderator" & intForumID))
			.Fields("Calendar_event") = CBool(Request.Form("calEvent" & intForumID))
			.Fields("Attachments") = False
			.Fields("Image_upload") = False
	
			'Update the database
			.Update
		End With
		
		
		
		'Close rsCommon2
		rsCommon2.Close
	            
		'Move to the next record in the recordset
		rsCommon.MoveNext
	Loop
	
	rsCommon.Close
	
	
	

	'If this is a new forum go back to the main forums page
	If intUserGroupID = 0 Then

		'Release server varaibles
		Set rsCommon2 = Nothing
		Call closeDatabase()

		Response.Redirect("admin_view_groups.asp" & strQsSID1)
	End If
End If 




'If this is an edit read in te group details
If intUserGroupID > 0 Then 
	
	'Initalise the strSQL variable with an SQL statement to query the database
	strSQL = "SELECT " & strDbTable & "Group.* FROM " & strDbTable & "Group WHERE " & strDbTable & "Group.Group_ID = " & intUserGroupID & ";"
	
	'Query the database
	rsCommon.Open strSQL, adoCon

	If NOT rsCommon.EOF Then

		'Get the category name from the database
		strGroupName = rsCommon("Name")
		lngMinimumPosts = CLng(rsCommon("Minimum_posts"))
		blnSpecialGroup = CBool(rsCommon("Special_rank"))
		intStars = CInt(rsCommon("Stars"))
		strCustomStars = rsCommon("Custom_stars")
	End If
	
	'Close the rs
	rsCommon.Close
End If


%>
<!-- #include file="includes/browser_page_encoding_inc.asp" -->
<title>Member Group Details</title>
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

<script  language="JavaScript" type="text/javascript">

//Function to check form is filled in correctly before submitting
function CheckForm () {

	//Check for a group name
	if (document.frmGroup.GroupName.value==""){
		alert("Please select the Name for this User Group");
		return false;
	}

	return true
}
</script>
<!-- #include file="includes/admin_header_inc.asp" -->
<div align="center"><h1>Member Group Details</h1><br />
  <a href="admin_menu.asp<% = strQsSID1 %>">Control Panel Menu</a><br />
  <a href="admin_view_groups.asp<% = strQsSID1 %>">Return to the Member Group Administration page</a><br />
</div>
<form action="admin_group_details.asp?GID=<% = intUserGroupID %><% = strQsSID2 %>" method="post" name="frmGroup" id="frmGroup" onsubmit="return CheckForm();">
  <br />
  <table border="0" align="center" cellpadding="4" cellspacing="1" class="tableBorder">
    <tr>
      <td colspan="2" class="tableLedger">Member Group Details</td>
    </tr>
    <tr>
      <td width="51%" class="tableRow">Group Name*:</td>
      <td width="49%" valign="top" class="tableRow"><input name="GroupName" type="text" id="GroupName2" value="<% = strGroupName %>" size="20" maxlength="39"<% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> />
      </td>
    </tr>
    <tr>
      <td class="tableRow">Number of Stars*:<br />
      <span class="smText">This is the number of stars displayed for this user group, unless you use your own custom stars/image.</span></td>
      <td valign="top" class="tableRow"><select name="stars" id="select">
          <option<% If intStars = 0 Then Response.Write " selected" %>>0</option>
          <option<% If intStars = 1 Then Response.Write " selected" %>>1</option>
          <option<% If intStars = 2 Then Response.Write " selected" %>>2</option>
          <option<% If intStars = 3 Then Response.Write " selected" %>>3</option>
          <option<% If intStars = 4 Then Response.Write " selected" %>>4</option>
          <option<% If intStars = 5 Then Response.Write " selected" %>>5</option>
      </select></td>
    </tr>
    <tr>
      <td class="tableRow">Custom Stars Image Link:<br />
      <span class="smText">If you wish to use your own custom stars/image for this group type the path in here to the image.</span></td>
      <td valign="top" class="tableRow"><input name="custStars" type="text" id="custStars2" value="<% = strCustomStars %>" size="30" maxlength="75"<% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> /></td>
    </tr>
    <%

'If this is the admin group or guest group then don't let em change anything else
If intUserGroupID <> 1 AND intUserGroupID <> 2 Then 
	
	%>
    <tr>
      <td class="tableRow"><p>Non Ladder Group:<span class="smText"><br />
          <a href="#lad" class="smLink">What is the Ladder System? </a></span><br />
      <span class="smText">If you check this box then this group will not be a part of the Ladder System. </span></p></td>
      <td valign="top" class="tableRow"><input name="rank" type="checkbox" id="rank2" value="true"<% If blnSpecialGroup OR intUserGroupID = 0 Then Response.Write " checked" %> /></td>
    </tr>
    <tr>
      <td class="tableRow">Ladder Group Minimum No. of Posts:<br />
      <span class="smText">This is the number of posts a user needs to post to automatically become a member of this group. This will not effect a Non Ladder Group. </span></td>
      <td valign="top" class="tableRow"><select name="posts" id="select2">
          <option<% If lngMinimumPosts = 0 Then Response.Write " selected" %>>0</option>
          <option<% If lngMinimumPosts = 1 Then Response.Write " selected" %>>1</option>
          <option<% If lngMinimumPosts = 10 Then Response.Write " selected" %>>10</option>
          <option<% If lngMinimumPosts = 20 Then Response.Write " selected" %>>20</option>
          <option<% If lngMinimumPosts = 30 Then Response.Write " selected" %>>30</option>
          <option<% If lngMinimumPosts = 40 Then Response.Write " selected" %>>40</option>
          <option<% If lngMinimumPosts = 50 Then Response.Write " selected" %>>50</option>
          <option<% If lngMinimumPosts = 60 Then Response.Write " selected" %>>60</option>
          <option<% If lngMinimumPosts = 70 Then Response.Write " selected" %>>70</option>
          <option<% If lngMinimumPosts = 80 Then Response.Write " selected" %>>80</option>
          <option<% If lngMinimumPosts = 90 Then Response.Write " selected" %>>90</option>
          <option<% If lngMinimumPosts = 100 Then Response.Write " selected" %>>100</option>
          <option<% If lngMinimumPosts = 125 Then Response.Write " selected" %>>125</option>
          <option<% If lngMinimumPosts = 150 Then Response.Write " selected" %>>150</option>
          <option<% If lngMinimumPosts = 200 Then Response.Write " selected" %>>200</option>
          <option<% If lngMinimumPosts = 250 Then Response.Write " selected" %>>250</option>
          <option<% If lngMinimumPosts = 300 Then Response.Write " selected" %>>300</option>
          <option<% If lngMinimumPosts = 350 Then Response.Write " selected" %>>350</option>
          <option<% If lngMinimumPosts = 400 Then Response.Write " selected" %>>400</option>
          <option<% If lngMinimumPosts = 450 Then Response.Write " selected" %>>450</option>
          <option<% If lngMinimumPosts = 500 Then Response.Write " selected" %>>500</option>
          <option<% If lngMinimumPosts = 750 Then Response.Write " selected" %>>750</option>
          <option<% If lngMinimumPosts = 1000 Then Response.Write " selected" %>>1000</option>
          <option<% If lngMinimumPosts = 1500 Then Response.Write " selected" %>>1500</option>
          <option<% If lngMinimumPosts = 2000 Then Response.Write " selected" %>>2000</option>
          <option<% If lngMinimumPosts = 2500 Then Response.Write " selected" %>>2500</option>
          <option<% If lngMinimumPosts = 3000 Then Response.Write " selected" %>>3000</option>
          <option<% If lngMinimumPosts = 5000 Then Response.Write " selected" %>>5000</option>
          <option<% If lngMinimumPosts = 7500 Then Response.Write " selected" %>>7500</option>
          <option<% If lngMinimumPosts = 10000 Then Response.Write " selected" %>>10000</option>
          <option<% If lngMinimumPosts = 15000 Then Response.Write " selected" %>>15000</option>
          <option<% If lngMinimumPosts = 20000 Then Response.Write " selected" %>>20000</option>
          <option<% If lngMinimumPosts = 30000 Then Response.Write " selected" %>>30000</option>
          <option<% If lngMinimumPosts = 40000 Then Response.Write " selected" %>>40000</option>
          <option<% If lngMinimumPosts = 50000 Then Response.Write " selected" %>>50000</option>
          <option<% If lngMinimumPosts = 75000 Then Response.Write " selected" %>>75000</option>
          <option<% If lngMinimumPosts = 100000 Then Response.Write " selected" %>>100000</option>
      </select></td>
    </tr>
    <%

End If

%>
  </table>
  <br />
  <br />
  <table width="100%" height="58" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td align="center" class="text"><span class="lgText">Group Permissions</span><br />
        Use the grid below to set Permissions for the this Member Group on various forums.<br />
        <a href="#per" class="smLink">What do the different permissions mean?</a><br />
        <br />
        <table border="0" cellpadding="2" cellspacing="1" class="tableBorder">
          <tr>
            <td width="194" class="tableLedger">Member Group</td>
            <td width="43" align="center" class="tableLedger">Access</td>
            <td width="43" align="center" class="tableLedger">New Topics</td>
            <td width="43" align="center" class="tableLedger">Sticky Topics</td>
            <td width="43" align="center" class="tableLedger">Post Reply</td>
            <td width="43" align="center" class="tableLedger">Edit Posts</td>
            <td width="43" align="center" class="tableLedger">Delete Posts</td>
            <td width="43" align="center" class="tableLedger">New Polls</td>
            <td width="43" align="center" class="tableLedger">Poll Vote</td>
            <td width="43" align="center" class="tableLedger">Calendar Event</td>
            <td width="43" align="center" class="tableLedger">Post Approval</td>
            <td width="43" align="center" class="tableLedger">Forum Moderator</td>
          </tr>
          <tr class="tableSubLedger">
           <td align="left">Check All</td>
           <td align="center"><input type="checkbox" name="chkAllread" id="chkAllread" onclick="checkAll('read');" /></td>
           <td align="center"><input type="checkbox" name="chkAlltopic" id="chkAlltopic" onclick="checkAll('topic');" /></td>
           <td align="center"><input type="checkbox" name="chkAllsticky" id="chkAllsticky" onclick="checkAll('sticky');" /></td>
           <td align="center"><input type="checkbox" name="chkAllreply" id="chkAllreply" onclick="checkAll('reply');" /></td>
           <td align="center"><input type="checkbox" name="chkAlledit" id="chkAlledit" onclick="checkAll('edit');" /></td>
           <td align="center"><input type="checkbox" name="chkAlldelete" id="chkAlldelete" onclick="checkAll('delete');" /></td>
           <td align="center"><input type="checkbox" name="chkAllpolls" id="chkAllpolls" onclick="checkAll('polls');" /></td>
           <td align="center"><input type="checkbox" name="chkAllvote" id="chkAllvote" onclick="checkAll('vote');" /></td>
           <td align="center"><input type="checkbox" name="chkAllcalEvent" id="chkAllcalEvent" onclick="checkAll('calEvent');" /></td>
           <td align="center"><input type="checkbox" name="chkAllapprove" id="chkAllapprove" onclick="checkAll('approve');" /></td>
           <td align="center">&nbsp;</td>
          </tr>
          <%

'Read in the groups from db
'Initalise the strSQL variable with an SQL statement to query the database
strSQL = "SELECT " & strDbTable & "Category.Cat_ID, " & strDbTable & "Category.Cat_name, " & strDbTable & "Forum.Forum_ID, " & strDbTable & "Forum.Forum_name FROM " & strDbTable & "Category, " & strDbTable & "Forum WHERE " & strDbTable & "Category.Cat_ID=" & strDbTable & "Forum.Cat_ID AND " & strDbTable & "Forum.Sub_ID=0 ORDER BY " & strDbTable & "Category.Cat_order ASC, " & strDbTable & "Category.Cat_ID ASC, " & strDbTable & "Forum.Forum_Order ASC;"

'Query the database
rsCommon.Open strSQL, adoCon

'Read in the row from the db using getrows for better performance
If NOT rsCommon.EOF Then 
	sarryForums = rsCommon.GetRows()
End If

'close
rsCommon.Close


'If no forums to set permisisons on display a message saying so
If NOT isArray(sarryForums) Then
%>
	  <tr>
            <td align="left" class="tableRow" colspan="14">There are presently no Forums created to set permissions on</td>
          </tr><%

'If there are results show them
Else

	'Loop round to read in all the forums in the database
	Do While intCurrentRecord <= Ubound(sarryForums,2)
	
		'Get the forum ID
		intForumID = CInt(sarryForums(2,intCurrentRecord))
		
		'If this is a different cat display the cat ID
		If intCatID <> CInt(sarryForums(0,intCurrentRecord)) Then 
				
			'Change the cat ID
			intCatID = CInt(sarryForums(0,intCurrentRecord))
			
			%>
          <tr>
            <td class="tableSubLedger" colspan="14"><% = sarryForums(1,intCurrentRecord) %></td>
          </tr>
          <%
       
		End If
		
	
		'Read in the permssions from the db for this group (not very efficient doing it this way, but this page won't be run often)
		'Initalise the strSQL variable with an SQL statement to query the database
		strSQL = "SELECT " & strDbTable & "Permissions.* FROM " & strDbTable & "Permissions WHERE " & strDbTable & "Permissions.Group_ID = " & intUserGroupID & " AND " & strDbTable & "Permissions.Forum_ID = " & intForumID & ";"
			
		'Query the database
		rsCommon.Open strSQL, adoCon
			
		'If no records are returned use default values
		If rsCommon.EOF OR intUserGroupID = 0 Then		

%>
          <tr>
            <td class="tableRow"><% = sarryForums(3,intCurrentRecord) %></td>
            <td align="center" class="tableRow"><input name="read<% = intForumID %>" type="checkbox" id="read" value="true" checked="checked" /></td>
            <td align="center" class="tableRow"><input name="topic<% = intForumID %>" type="checkbox" id="topic" value="true" checked="checked" /></td>
            <td align="center" class="tableRow"><input name="sticky<% = intForumID %>" type="checkbox" id="sticky" value="true"<% If intUserGroupID = 1 Then Response.Write(" checked") %><% If intUserGroupID = 2 Then Response.Write(" disabled=true") %> /></td>
            <td align="center" class="tableRow"><input name="reply<% = intForumID %>" type="checkbox" id="reply" value="true" checked="checked" /></td>
            <td align="center" class="tableRow"><input name="edit<% = intForumID %>" type="checkbox" id="edit" value="true" checked="checked" /></td>
            <td align="center" class="tableRow"><input name="delete<% = intForumID %>" type="checkbox" id="delete" value="true" checked="checked" /></td>
            <td align="center" class="tableRow"><input name="polls<% = intForumID %>" type="checkbox" id="polls" value="true" /></td>
            <td align="center" class="tableRow"><input name="vote<% = intForumID %>" type="checkbox" id="vote" value="true" /></td>
            <td align="center" class="tableRow"><input name="calEvent<% = intForumID %>" type="checkbox" id="calEvent" value="true" /></td>
            <td align="center" class="tableRow"><input name="approve<% = intForumID %>" type="checkbox" id="approve" value="true" /></td>
            <td align="center" class="tableRow"><input name="moderator<% = intForumID %>" type="checkbox" id="moderator" value="true"<% If intUserGroupID = 2 Then Response.Write(" disabled=true") %> /></td>
          </tr>
          <%
      
		'Else display the values for this group
		 Else
%>
          <tr>
            <td class="tableRow"><% = sarryForums(3,intCurrentRecord) %></td>
            <td align="center" class="tableRow"><input name="read<% = intForumID %>" type="checkbox" id="read" value="true"<% If CBool(rsCommon("View_Forum")) Then Response.Write(" checked") %> /></td>
            <td align="center" class="tableRow"><input name="topic<% = intForumID %>" type="checkbox" id="topic" value="true"<% If CBool(rsCommon("Post")) Then Response.Write(" checked") %> /></td>
            <td align="center" class="tableRow"><input name="sticky<% = intForumID %>" type="checkbox" id="sticky" value="true"<% If CBool(rsCommon("Priority_posts")) Then Response.Write(" checked") %><% If intUserGroupID = 2 Then Response.Write(" disabled=true") %> /></td>
            <td align="center" class="tableRow"><input name="reply<% = intForumID %>" type="checkbox" id="reply" value="true"<% If CBool(rsCommon("Reply_posts")) Then Response.Write(" checked") %> /></td>
            <td align="center" class="tableRow"><input name="edit<% = intForumID %>" type="checkbox" id="edit"<% If intUserGroupID = 2 Then Response.Write(" disabled=true") %> value="true"<% If CBool(rsCommon("Edit_posts")) Then Response.Write(" checked") %> /></td>
            <td align="center" class="tableRow"><input name="delete<% = intForumID %>" type="checkbox" id="delete"<% If intUserGroupID = 2 Then Response.Write(" disabled=true") %> value="true"<% If CBool(rsCommon("Delete_posts")) Then Response.Write(" checked") %> /></td>
            <td align="center" class="tableRow"><input name="polls<% = intForumID %>" type="checkbox" id="polls" value="true"<% If CBool(rsCommon("Poll_create")) Then Response.Write(" checked") %> /></td>
            <td align="center" class="tableRow"><input name="vote<% = intForumID %>" type="checkbox" id="vote" value="true"<% If CBool(rsCommon("Vote")) Then Response.Write(" checked") %> /></td>
            <td align="center" class="tableRow"><input name="calEvent<% = intForumID %>" type="checkbox" id="calEvent" value="true"<% If CBool(rsCommon("Calendar_event")) Then Response.Write(" checked") %> /></td>
            <td align="center" class="tableRow"><input name="approve<% = intForumID %>" type="checkbox" id="approve" value="true"<% If CBool(rsCommon("Display_post")) Then Response.Write(" checked") %> /></td>
            <td align="center" class="tableRow"><input name="moderator<% = intForumID %>" type="checkbox" id="moderator" value="true"<% If CBool(rsCommon("Moderate")) Then Response.Write(" checked") %><% If intUserGroupID = 2 Then Response.Write(" disabled=true") %> /></td>
          </tr>
          <%
		End If
		
		'Close rsCommon
		rsCommon.Close
	        
	        
	        
	        '********* check for sub forums *****************
	        
	        'Reset intCurrentRecord2
		intCurrentRecord2 = 0
	        
	        'Read in the groups from db
		'Initalise the strSQL variable with an SQL statement to query the database
		strSQL = "SELECT " & strDbTable & "Forum.Forum_ID, " & strDbTable & "Forum.Forum_name FROM " & strDbTable & "Forum WHERE " & strDbTable & "Forum.Sub_ID= " & intForumID & " ORDER BY " & strDbTable & "Forum.Forum_Order ASC;"
		
		'Query the database
		rsCommon.Open strSQL, adoCon
		
		'Place rs in array
		If NOT rsCommon.EOF Then 
			sarrySubForums = rsCommon.GetRows()
		Else
			sarrySubForums = null
		End If
			
		'close
		rsCommon.Close
		
		'Read in the row from the db using getrows for better performance
		If isArray(sarrySubForums) Then
		
			'Loop round to read in all the forums in the database
			Do While intCurrentRecord2 <= Ubound(sarrySubForums,2)
		
				'Get the forum ID
				intSubForumID = CInt(sarrySubForums(0,intCurrentRecord2))
			
			
				'Read in the permssions from the db for this group (not very efficient doing it this way, but this page won't be run often)
				'Initalise the strSQL variable with an SQL statement to query the database
				strSQL = "SELECT " & strDbTable & "Permissions.* FROM " & strDbTable & "Permissions WHERE " & strDbTable & "Permissions.Group_ID = " & intUserGroupID & " AND " & strDbTable & "Permissions.Forum_ID = " & intSubForumID & ";"
					
				'Query the database
				rsCommon.Open strSQL, adoCon
					
				'If no records are returned use default values
				If rsCommon.EOF OR intUserGroupID = 0 Then		

%>
          <tr>
            <td class="tableRow">&nbsp;<img src="<% = strImagePath %>arrow.gif" />&nbsp;
            <% = sarrySubForums(1,intCurrentRecord2) %></td>
            <td align="center" class="tableRow"><input name="read<% = intSubForumID %>" type="checkbox" id="read" value="true" checked="checked" /></td>
            <td align="center" class="tableRow"><input name="topic<% = intSubForumID %>" type="checkbox" id="topic" value="true" checked="checked" /></td>
            <td align="center" class="tableRow"><input name="sticky<% = intSubForumID %>" type="checkbox" id="sticky" value="true"<% If intUserGroupID = 1 Then Response.Write(" checked") %><% If intUserGroupID = 2 Then Response.Write(" disabled=true") %> /></td>
            <td align="center" class="tableRow"><input name="reply<% = intSubForumID %>" type="checkbox" id="reply" value="true" checked="checked" /></td>
            <td align="center" class="tableRow"><input name="edit<% = intSubForumID %>" type="checkbox" id="edit" value="true" checked="checked" /></td>
            <td align="center" class="tableRow"><input name="delete<% = intSubForumID %>" type="checkbox" id="delete" value="true" checked="checked" /></td>
            <td align="center" class="tableRow"><input name="polls<% = intSubForumID %>" type="checkbox" id="polls" value="true" /></td>
            <td align="center" class="tableRow"><input name="vote<% = intSubForumID %>" type="checkbox" id="vote" value="true" /></td>
            <td align="center" class="tableRow"><input name="calEvent<% = intSubForumID %>" type="checkbox" id="calEvent" value="true" /></td>
            <td align="center" class="tableRow"><input name="approve<% = intSubForumID %>" type="checkbox" id="approve" value="true" /></td>
            <td align="center" class="tableRow"><input name="moderator<% = intSubForumID %>" type="checkbox" id="moderator" value="true"<% If intUserGroupID = 2 Then Response.Write(" disabled=true") %> /></td>
          </tr>
          <%
      
				'Else display the values for this group
	 			Else
%>
          <tr>
            <td class="tableRow">&nbsp;<img src="<% = strImagePath %>arrow.gif" />&nbsp;
            <% = sarrySubForums(1,intCurrentRecord2) %></td>
            <td align="center" class="tableRow"><input name="read<% = intSubForumID %>" type="checkbox" id="read" value="true"<% If CBool(rsCommon("View_Forum")) Then Response.Write(" checked") %> /></td>
            <td align="center" class="tableRow"><input name="topic<% = intSubForumID %>" type="checkbox" id="topic" value="true"<% If CBool(rsCommon("Post")) Then Response.Write(" checked") %> /></td>
            <td align="center" class="tableRow"><input name="sticky<% = intSubForumID %>" type="checkbox" id="sticky" value="true"<% If CBool(rsCommon("Priority_posts")) Then Response.Write(" checked") %><% If intUserGroupID = 2 Then Response.Write(" disabled=true") %> /></td>
            <td align="center" class="tableRow"><input name="reply<% = intSubForumID %>" type="checkbox" id="reply" value="true"<% If CBool(rsCommon("Reply_posts")) Then Response.Write(" checked") %> /></td>
            <td align="center" class="tableRow"><input name="edit<% = intSubForumID %>" type="checkbox" id="edit"<% If intUserGroupID = 2 Then Response.Write(" disabled=true") %> value="true"<% If CBool(rsCommon("Edit_posts")) Then Response.Write(" checked") %> /></td>
            <td align="center" class="tableRow"><input name="delete<% = intSubForumID %>" type="checkbox" id="delete"<% If intUserGroupID = 2 Then Response.Write(" disabled=true") %> value="true"<% If CBool(rsCommon("Delete_posts")) Then Response.Write(" checked") %> /></td>
            <td align="center" class="tableRow"><input name="polls<% = intSubForumID %>" type="checkbox" id="polls" value="true"<% If CBool(rsCommon("Poll_create")) Then Response.Write(" checked") %> /></td>
            <td align="center" class="tableRow"><input name="vote<% = intSubForumID %>" type="checkbox" id="vote" value="true"<% If CBool(rsCommon("Vote")) Then Response.Write(" checked") %> /></td>
            <td align="center" class="tableRow"><input name="calEvent<% = intSubForumID %>" type="checkbox" id="calEvent" value="true"<% If CBool(rsCommon("Calendar_event")) Then Response.Write(" checked") %> /></td>
            <td align="center" class="tableRow"><input name="approve<% = intSubForumID %>" type="checkbox" id="approve" value="true"<% If CBool(rsCommon("Display_post")) Then Response.Write(" checked") %> /></td>
            <td align="center" class="tableRow"><input name="moderator<% = intSubForumID %>" type="checkbox" id="moderator" value="true"<% If CBool(rsCommon("Moderate")) Then Response.Write(" checked") %><% If intUserGroupID = 2 Then Response.Write(" disabled=true") %> /></td>
          </tr>
          <%
				End If
		
				'Close rsCommon
				rsCommon.Close
			
				'Move to the next record in the recordset
				intCurrentRecord2 = intCurrentRecord2 + 1
			Loop
		End If
	        
		'Move to the next record in the recordset
		intCurrentRecord = intCurrentRecord + 1
	Loop
End If


'Reset Server Objects
Set rsCommon2 = Nothing
Call closeDatabase()

%>
        </table></td>
    </tr>
  </table>
  <div align="center"><br />
    <input type="hidden" name="postBack" value="true" />
    <input type="hidden" name="formID" id="formID" value="<% = getSessionItem("KEY") %>" />
    <input type="submit" name="Submit" value="Submit Member Group Details"<% If blnDemoMode Then Response.Write(" disabled=""disabled""") %> />
    <input type="reset" name="Reset" value="Reset Form" />
    <br />
  </div>
</form>
<br />
<br />
<span><b><a name="per" id="per"></a></b></span><br />
<span></span>
<table border="0" align="center" cellpadding="4" cellspacing="1" class="tableBorder">
    <tr>
     <td colspan="2" class="tableLedger">Forum Permissions Table </td>
    </tr>
    <tr>
     <td width="24%" align="right" valign="top"  class="tableRow"><strong>Access:</strong></td>
     <td width="76%" valign="top"  class="tableRow">Allows the Group access to the forum </td>
    </tr>
    <tr>
     <td width="24%" align="right" valign="top"  class="tableRow"><strong>New Topics:</strong></td>
     <td width="76%" valign="top"  class="tableRow">Allows the Group to post new topics </td>
    </tr>
    <tr>
     <td align="right" valign="top"  class="tableRow"><strong>Sticky Topics:</strong></td>
     <td valign="top"  class="tableRow">Allows the Group to post sticky topics that remain at the top of the forum </td>
    </tr>
    <tr>
     <td width="24%" align="right" valign="top"  class="tableRow"><strong>Post Reply:<br />
      </strong></td>
     <td width="76%" valign="top"  class="tableRow">Allows the Group to reply to posts </td>
    </tr>
    <tr>
     <td align="right" valign="top"  class="tableRow"><strong>Edit Posts:</strong></td>
     <td valign="top"  class="tableRow">Allows the Group to edit their posts </td>
    </tr>
    <tr>
     <td align="right" valign="top"  class="tableRow"><strong>Delete Posts:</strong></td>
     <td valign="top"  class="tableRow">Allows the Group to delete their posts, but only if no-one has posted a reply </td>
    </tr>
    <tr>
     <td align="right" valign="top"  class="tableRow"><strong>New Polls:</strong></td>
     <td valign="top"  class="tableRow">Allows the Group to create new polls </td>
    </tr>
    <tr>
     <td align="right" valign="top"  class="tableRow"><strong>Poll Vote:</strong></td>
     <td valign="top"  class="tableRow">Allows the Group to vote in polls <br />
      <span class="smText">If you allow Guest Groups to vote in Polls, only cookies prevent Guests from multiple voting.</span></td>
    </tr>
    <tr>
     <td align="right" valign="top"  class="tableRow"><strong>Calendar Event:</strong></td>
     <td valign="top"  class="tableRow">Allows the Group to enter Topics into the Calendar system as an event to be displayed in the Calendar.<br />
      <span class="smText">The Calendar System needs to be enabled from the '<a href="admin_calendar_configuration.asp<% = strQsSID1 %>" class="smLink">Calendar Settings</a>' Page </span></td>
    </tr>
    <tr>
     <td align="right" valign="top"  class="tableRow"><strong>Post Approval:<br /></strong></td>
     <td valign="top" class="tableRow"><span class="text">Requires that posts for this Group need to be  approved before they are displayed <span class="smText"><br />
      If you choose to not let users have there posts displayed, then their posts will first need to be approved by the forum admin/moderator.</span> </span> </td>
    </tr>
    <tr>
     <td align="right" valign="top"  class="tableRow"><strong>Forum Moderator:<br />
      </strong></td>
     <td valign="top" class="tableRow"><span class="text">Allows the Group to have Moderator rights in this forum<br />
      </span><span class="smText">This will allow the group to be able to delete, edit, move, etc. all posts in this forum, and edit user profiles etc. across the entire board </span></td>
    </tr>
   </table>
<div align="center"><br />
  <span class="text">Please be aware that the Group Permissions can be over ridden by setting permissions on this forum for individual members.<br />
  <br />
  <br />
  <a name="lad" id="lad"></a><br />
  </span>
  <table width="100%" border="0" cellpadding="2" cellspacing="1" class="tableBorder">
    <tr>
      <td align="center" class="tableLedger">What is the Ladder System?</td>
    </tr>
    <tr>
      <td class="tableRow">The Ladder system enables your members to move up forum groups automatically depending on the number of posts they make. Once a member has made the minimum amount of posts for a Ladder User Group that member will be moved up to that user group.<br />
        <br />
      If you select that a user group is a Non Ladder Group, any member of the group will not be effected by the ladder system, this is useful if you wish not to use the Ladder System or for special groups like moderator groups.</td>
    </tr>
  </table>
  <span class="text"> </span></div>
<br />
<!-- #include file="includes/admin_footer_inc.asp" -->
