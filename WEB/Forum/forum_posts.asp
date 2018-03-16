<% @ Language=VBScript %>
<% Option Explicit %>
<!--#include file="common.asp" -->
<!--#include file="functions/functions_date_time_format.asp" -->
<!--#include file="functions/functions_format_post.asp" -->
<!--#include file="includes/emoticons_inc.asp" -->
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




Response.Buffer = True

'Make sure this page is not cached
Response.Expires = -1
Response.ExpiresAbsolute = Now() - 2
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "No-Store"





'Dimension variables
Dim sarryPosts			'Holds the posts recordset
Dim strForumName		'Holds the forum name
Dim intCatID			'Holds the cat ID
Dim strCatName			'Holds the cat name
Dim intMasterForumID		'Holds the main forum ID
Dim strMasterForumName		'Holds the main forum name
Dim lngTopicID			'Holds the topic number
Dim strSubject			'Holds the topic subject
Dim strUsername 		'Holds the Username of the thread
Dim lngUserID			'Holds the ID number of the user
Dim dtmPostDate			'Holds the date the thread was made
Dim strMessage			'Holds the post to display
Dim strTopicIcon		'Holds the topic icon
Dim lngMessageID		'Holds the message ID number
Dim strAuthorHomepage		'Holds the homepage of the Username if it is given
Dim strAuthorLocation		'Holds the location of the user if given
Dim strAuthorAvatar		'Holds the authors avatar
Dim strAuthorSignature		'Holds the authors signature
Dim lngAuthorNumOfPosts		'Holds the number of posts the user has made to the forum
Dim dtmAuthorRegistration	'Holds the registration date of the user
Dim lngNumberOfViews		'Holds the number of times the topic has been viewed to save back to the database
Dim intStatus			'Holds the users interger status
Dim strStatus			'Holds the users status
Dim strMode			'Holds the mode of the page that is being passed
Dim intTopicPageNumber		'Holds the topic page position to link back to
Dim blnIsModerator		'Set to true if the user who posted the message is a forum moderator
Dim blnForumLocked		'Set to true if the forum is locked
Dim blnTopicLocked		'set to true if the topic is locked
Dim intThreadNo			'Holds the number of threads in the topic
Dim intPriority			'Holds the priority level of the topic
Dim intRecordPositionPageNum	'Holds the recorset page number to show the Threads for
Dim lngTotalRecordsPages	'Holds the number of pages
Dim intTopicPageLoopCounter	'Loop counter for other thread page link
Dim lngTotalRecords		'Holds the total number of therads in this topic
Dim strAuthorIP			'Holds the authors IP
Dim strSearchKeywords		'Holds the keywords to search for
Dim sarySearchWord		'Array to hold the search words
Dim strGroupName		'Holds the authors group name
Dim intRankStars		'Holds the number of stars for the group
Dim strRankCustomStars		'Holds custom stars for the user group
Dim lngPollID			'Holds the poll ID
Dim blnPollNoReply		'Set to true if users can't reply to a poll
Dim blnBannedIP			'Set to true if the user is using a banned IP
Dim dtmLastEntryDate		'Holds the date of the last post entry to the topic
Dim intIndexPosition		'Holds the idex poistion in the emiticon array
Dim intNumberOfOuterLoops	'Holds the outer loop number for rows
Dim intLoop			'Holds the loop index position
Dim intInnerLoop		'Holds the inner loop number for columns
Dim strMemberTitle		'Holds the members title
Dim blnIsUserOnline		'Set to true if the user is online
Dim blnHidePost			'Set to true if post is hidden
Dim strPostTableRowClass	'Post row colour
Dim intStartPosition		'Holds the start poition for records to be shown
Dim intEndPosition		'Holds the end poition for records to be shown
Dim intCurrentRecord		'Holds the current records for the posts
Dim strGuestUsername		'Holds the Guest Username if it is a guest posting
Dim blnHideTopic		'Set to true if topic is hidden
Dim lngGetPostID		'Holds the post to go straight to
Dim strSortBy			'Holds the direction the posts are listed in
Dim strPostTableSideClass	'Holds the post message side column css class
Dim strPostTableTopClass	'Holds the post table top details
Dim dtmEventDate		'Holds the date if this is a calendar event
Dim dtmEventDateEnd		'Holds the date if this is a calendar event
Dim intPageLinkLoopCounter	'Loop counter for page links include
Dim intPostRowsSpan		'Holds the rowspam number for post table formatting
Dim strForumPassword		'Holds the forum password
Dim intUnReadForumPostsLoop	'Loop counter for unread loop array
Dim intAutoLockTopicsAmount	'Holds the amount topics are auto closed at
Dim blnUnreadPost		'Set to true if the post is un-read
Dim strMetaDescription		'Used for meta tags
Dim lngAuthorNumOfPoints	'Number of points for each user
Dim strSQLFromWhere		'Used for the From where clause
Dim lngPrePostCount		'Used to count the number of posts before the post we want to display
Dim dblTopicRating		'Holds the rating for a topic
Dim lngTopicVotes		'Number of votes a topic receives
Dim strDynamicKeywords		'Holds the keywords for the page
Dim strPageQueryString		'Holds the querystring for the page
Dim intUnReadPostCount		'Holds the unread post count	
Dim lngFirstUnreadPostID	'Holds the ID of the first unread post in the topic



'Initialise variables
strMode = "reply"
lngMessageID = 0
lngGetPostID = 0
intForumID = 0
lngTopicID = 0
intThreadNo = 0
blnIsModerator = False
blnPollNoReply = False
blnBannedIP = False
blnHidePost = False
intPriority = 0
blnHideTopic = False
blnUnreadPost = False
lngFirstUnreadPostID = 0


'Read in the querystrings for the page
strPageQueryString = Request.QueryString()



'Read in the keywords if comming from a search
strSearchKeywords = Trim(Mid(Request.QueryString("KW"), 1, 35))
strSearchKeywords = Replace(strSearchKeywords, ";", " ")
'Split up the keywords to be searched
sarySearchWord = Split(Trim(strSearchKeywords), " ")



'Remove the page title from the querystring beofre doing the sql injection test
If Request.QueryString("title") <> "" Then strPageQueryString = Replace(strPageQueryString, Request.QueryString("title"), "")

'Remove the keyword from the querystring before sql injection test
For intLoop = 0 to UBound(sarySearchWord)
	strPageQueryString = Replace(strPageQueryString, sarySearchWord(intLoop), "")
Next



'Test querystrings for any SQL Injection keywords
Call SqlInjectionTest(strPageQueryString)




'See if the user is using a banned IP address
If bannedIP() Then
	'If the user is using a banned IP then set the banned IP variable to true and active member variable to false
	blnBannedIP = True
End If


'If this is the first time the page is displayed then the Forum Thread record position is set to page 1
If isNumeric(Request.QueryString("PN")) = false Then
	intRecordPositionPageNum = 1
ElseIf Request.QueryString("PN") < 1 Then
	intRecordPositionPageNum = 1
'Else the page has been displayed before so the Forum Thread record postion is set to the Record Position number
Else
	intRecordPositionPageNum = IntC(Request.QueryString("PN"))
End If


'Read in the Topic ID for the topic to display
If isNumeric(Request.QueryString("TID")) Then lngTopicID = LngC(Request.QueryString("TID")) Else lngTopicID = 0

'If there is no Topic ID then redirect the user to the main forum page
If lngTopicID = 0 Then

	'Clean up
	Call closeDatabase()

	'Redirect
	Response.Redirect("default.asp" & strQsSID1)
End If




'Read in the post ID if we are going straight to a post
If isNumeric(Request.QueryString("PID")) Then lngGetPostID = LngC(Request.QueryString("PID"))
	
'Fix for stupid IE 6 redirect bug (IE SUCKS!!!) MS have fixed this for IE7
If lngGetPostID = 0 AND Request.QueryString("PID") <> "" Then
	'Remove the '#' hash anchor mark IE 6 includes in the string when doing a redirect (IE SUCKS!!)
	If InStr(Request.QueryString("PID"), "#") Then lngGetPostID = CLng(Mid(Request.QueryString("PID"), 1, InStr(Request.QueryString("PID"), "#")-1))
End If






'Sort the direction of db results from session
If UCase(Request.QueryString("OB")) = "DESC" Then
	strSortBy = "DESC"
ElseIf UCase(Request.QueryString("OB")) = "ASC" Then
	strSortBy = "ASC"
ElseIf getSessionItem("OB") = "DESC" Then
	strSortBy = "DESC"
Else
	strSortBy = "ASC"
End If

'Save the sort results order to app session
If Request.QueryString("OB") <> "" AND getSessionItem("OB") <> strSortBy Then Call saveSessionItem("OB", strSortBy)









'If this is a top priority post across all forums then read in the forum ID form the querystring and ingnore the real topic forum ID
If Request.QueryString("PR") = "3" Then intForumID = IntC(Request.QueryString("FID"))


strSQL = "" & _
"SELECT" & strDBTop1 & " " & strDbTable & "Category.Cat_ID, " & strDbTable & "Category.Cat_name, " & strDbTable & "Forum.Forum_ID AS ForumID, " & strDbTable & "Forum.Sub_ID, " & strDbTable & "Forum.Forum_name, " & strDbTable & "Forum2.Forum_name AS Main_forum, " & strDbTable & "Forum.Password, " & strDbTable & "Forum.Forum_code, " & strDbTable & "Forum.Locked AS forumLocked, " & strDbTable & "Topic.Poll_ID, " & strDbTable & "Topic.Subject, " & strDbTable & "Topic.Icon, " & strDbTable & "Topic.Locked AS topicLocked, " & strDbTable & "Topic.Priority, " & strDbTable & "Topic.No_of_views, " & strDbTable & "Topic.Hide, " & strDbTable & "Topic.Event_date, " & strDbTable & "Topic.Event_date_end, " & strDbTable & "Permissions.*  " & _
"FROM " & strDbTable & "Category" & strDBNoLock & ", " & strDbTable & "Forum" & strDBNoLock & ", " & strDbTable & "Forum AS " & strDbTable & "Forum2" & strDBNoLock & ", " & strDbTable & "Permissions" & strDBNoLock & ", " & strDbTable & "Topic" & strDBNoLock & " " & _
"WHERE " & strDbTable & "Category.Cat_ID = " & strDbTable & "Forum.Cat_ID " & _
	"AND " & strDbTable & "Forum.Forum_ID = " & strDbTable & "Permissions.Forum_ID "
'Get the forum ID from the topic table
If intForumID = 0 Then
	strSQL = strSQL  & _
	"AND " & strDbTable & "Forum.Forum_ID = " & strDbTable & "Topic.Forum_ID "
'Else this is a priority post so get the forum ID from the querystring (security built in later to make sure the user is not trying to view a post they shouldn't)
Else
	strSQL = strSQL & "" & _
	"AND " & strDbTable & "Forum.Forum_ID = " & intForumID & " "

End If
	strSQL = strSQL & "" & _
	"AND (" & strDbTable & "Forum.Forum_ID = " & intForumID & " OR " & strDbTable & "Forum.Forum_ID = " & strDbTable & "Topic.Forum_ID) " & _
	"AND (" & strDbTable & "Forum.Sub_ID = " & strDbTable & "Forum2.Forum_ID OR (" & strDbTable & "Forum.Sub_ID = 0 AND " & strDbTable & "Forum.Forum_ID = " & strDbTable & "Forum2.Forum_ID)) " & _
	"AND " & strDbTable & "Topic.Topic_ID = " & lngTopicID & " " & _
	"AND (" & strDbTable & "Permissions.Author_ID = " & lngLoggedInUserID & " OR " & strDbTable & "Permissions.Group_ID = " & intGroupID & ") " & _
"ORDER BY " & strDbTable & "Forum.Sub_ID, " & strDbTable & "Forum.Forum_Order, " & strDbTable & "Permissions.Author_ID DESC" & strDBLimit1 & ";"


'Set error trapping
On Error Resume Next

'Query the database
rsCommon.Open strSQL, adoCon

'If an error has occurred write an error to the page
If Err.Number <> 0 Then	Call errorMsg("An error has occurred while executing SQL query on database.", "get_forum_data", "forum_posts.asp")

'Disable error trapping
On Error goto 0


'If there is no record returended then set a message to say that
If rsCommon.EOF Then

	'If there are no thread's to display then display the appropriate error message
	strSubject = strTxtNoThreads



'Else get the details of the forum, permissions, and topic details
Else

	'Read in forum details from the database
	intForumID = Cint(rsCommon("ForumID"))
	intCatID = CInt(rsCommon("Cat_ID"))
	strCatName = rsCommon("Cat_name")
	strForumName = rsCommon("Forum_name")
	strMasterForumName = rsCommon("Main_forum")
	intMasterForumID = CLng(rsCommon("Sub_ID"))
	blnForumLocked = CBool(rsCommon("forumLocked"))
	blnHideTopic = CBool(rsCommon("Hide"))
	If isDate(rsCommon("Event_date")) Then dtmEventDate = CDate(rsCommon("Event_date"))
	If isDate(rsCommon("Event_date_end")) Then dtmEventDateEnd = CDate(rsCommon("Event_date_end"))

	'Read in the forum permissions
	blnRead = CBool(rsCommon("View_Forum"))
	blnPost = CBool(rsCommon("Post"))
	blnReply = CBool(rsCommon("Reply_posts"))
	blnEdit = CBool(rsCommon("Edit_posts"))
	blnDelete = CBool(rsCommon("Delete_posts"))
	blnPriority = CBool(rsCommon("Priority_posts"))
	blnPollCreate = CBool(rsCommon("Poll_create"))
	blnVote = CBool(rsCommon("Vote"))
	blnModerator = CBool(rsCommon("Moderate"))
	blnCheckFirst = CBool(rsCommon("Display_post"))
	strForumPassword = rsCommon("Password")

	'Read in the topic details
	lngPollID = CLng(rsCommon("Poll_ID"))
	strSubject = rsCommon("Subject")
	strTopicIcon = rsCommon("Icon")
	blnTopicLocked = CBool(rsCommon("topicLocked"))
	intPriority = CInt(rsCommon("Priority"))
	
	
	'Get the keywords	
	strDynamicKeywords = dynamicKeywords(strSubject)

	'Clean up input to prevent XXS hack
	strSubject = formatInput(strSubject)

	'If the user has no read writes then kick them out
	If blnRead = False Then

		'Reset Server Objects
		rsCommon.Close
		Call closeDatabase()


		'Redirect to a page asking for the user to enter the forum password
		Response.Redirect("insufficient_permission.asp" & strQsSID1)
	End If


	'If the forum requires a password and a logged in forum code is not found on the users machine then send them to a login page
	If strForumPassword <> "" AND (getCookie("fID", "Forum" & intForumID) <> rsCommon("Forum_code") AND getSessionItem("FP" & intForumID) <> "1") Then

		'Reset Server Objects
		rsCommon.Close
		Call closeDatabase()

		'Redirect to a page asking for the user to enter the forum password
		Response.Redirect("forum_password_form.asp?RP=PT&FID=" & intForumID & "&TID=" & lngTopicID & strQsSID3)
	End If



	'Update no. of views, if not a bot (bots can index a page 100's of times thus making the view count unreliable and lowering performance)
	If NOT strOSType = "Search Robot" AND NOT strOSType = "Unknown" Then

		'Read in the number of views for the page form the database
		lngNumberOfViews = CLng(rsCommon("No_of_views"))

		'Add 1 to the number of views the Topic has had
		lngNumberOfViews = lngNumberOfViews + 1

		'Write the number of times the Topic has been viewed back to the database
		'Initalise the strSQL variable with the SQL string
		strSQL = "UPDATE " & strDbTable & "Topic" & strRowLock & " " & _
		"SET " & strDbTable & "Topic.No_of_views = " & lngNumberOfViews & " " & _
		"WHERE (((" & strDbTable & "Topic.Topic_ID) = " & lngTopicID & "));"

		'Set error trapping
		On Error Resume Next

		'Write to the database
		adoCon.Execute(strSQL)

		'If an error has occurred write an error to the page
	  	If Err.Number <> 0 Then Call errorMsg("An error has occurred while writing to the database.", "update_no._views", "forum_posts.asp")

		'Disable error trapping
		On Error goto 0
	End If
End If

'clean up
rsCommon.Close


'Securtiy check - if this isn't a Priority post and the user is just trying to view a post in a forum they don't have permission to
'then reload the page without the forum ID
If Request.QueryString("PR") = "3" AND NOT intPriority = 3 Then

	'Reset Server Objects
	Call closeDatabase()

	'Redirect back to this page without the forum ID
	Response.Redirect("forum_posts.asp?TID=" & lngTopicID & strQsSID3)
End If



'Use the application session to pass around what forum this user is within
If IntC(getSessionItem("FID")) <> intForumID Then Call saveSessionItem("FID", intForumID)







'********************************
'****   Get Topics SQL Query ****
'********************************


'Start with WHERE Cluases as these are used in both the count query and in the main query

strSQLFromWhere = strSQLFromWhere & "" & _
"WHERE " & strDbTable & "Thread.Topic_ID = " & lngTopicID & " "
'If this isn't a moderator only display hidden posts if the user posted them
If blnModerator = false AND blnAdmin = false Then
	strSQLFromWhere = strSQLFromWhere & "AND (" & strDbTable & "Thread.Hide = " & strDBFalse & " "
	'Don't display hidden posts if guest
	If intGroupID <> 2 Then strSQLFromWhere = strSQLFromWhere & "OR " & strDbTable & "Thread.Author_ID = " & lngLoggedInUserID
	strSQLFromWhere = strSQLFromWhere & ") "
End If





'Count the number of posts in this topic
'***************************************	
strSQL = "" & _
"SELECT Count(" & strDbTable & "Thread.Thread_ID) AS PostCount " & _
"FROM " & strDbTable & "Thread" & strDBNoLock & " "
strSQL = strSQL & strSQLFromWhere & ";"


'Set error trapping
On Error Resume Next
		
'Query the database
rsCommon.Open strSQL, adoCon
	
'If an error has occurred write an error to the page
If Err.Number <> 0 Then	Call errorMsg("An error has occurred while executing SQL query on database.", "post_count", "forum_posts.asp")
				
'Disable error trapping
On Error goto 0
	
'Read in member count from database
lngTotalRecords = CLng(rsCommon("PostCount"))
	
'Close recordset
rsCommon.close



'Calculate what posts to get
'***************************

'Count the number of pages for the topics using '\' so that any fraction is omitted
lngTotalRecordsPages = lngTotalRecords \ intThreadsPerPage
	
'If there is a remainder or the result is 0 then add 1 to the total num of pages
If lngTotalRecords Mod intThreadsPerPage > 0 OR lngTotalRecordsPages = 0 Then lngTotalRecordsPages = lngTotalRecordsPages + 1
	
'Get the record poistion to display from
'If the page number to show from is higher than the last page number then the last page number is the highest page
If (intRecordPositionPageNum > lngTotalRecordsPages) OR (Request.QueryString("get") = "last") Then
	
	'Set the page position number to the highest page number
	intRecordPositionPageNum = lngTotalRecordsPages
End If




'Jump straight to a post (eg. Get Post 35 (&PID=35#35))
'************************************************
	
'If we need to jump straight to a particular post calculate which page to go to
If lngGetPostID <> 0 AND lngTotalRecordsPages > 1 Then
	
	
	'Count the number of posts before the post we want
	strSQL = "" & _
	"SELECT Count(" & strDbTable & "Thread.Thread_ID) AS PrePostCount " &_
	"FROM " & strDbTable & "Thread" & strDBNoLock & " "
	strSQL = strSQL & strSQLFromWhere & " "
	If strSortBy = "DESC" Then
		strSQL = strSQL &"AND " & strDbTable & "Thread.Thread_ID > " & lngGetPostID & ";"
	Else
		strSQL = strSQL &"AND " & strDbTable & "Thread.Thread_ID < " & lngGetPostID & ";"
	End If
	
	
	'Set error trapping
	On Error Resume Next
			
	'Query the database
	rsCommon.Open strSQL, adoCon
		
	'If an error has occurred write an error to the page
	If Err.Number <> 0 Then	Call errorMsg("An error has occurred while executing SQL query on database.", "get_last_post_count", "forum_posts.asp")
					
	'Disable error trapping
	On Error goto 0
		
	'Read in member count from database
	lngPrePostCount = CLng(rsCommon("PrePostCount"))
		
	'Close recordset
	rsCommon.close
	
	'Calculate page number (use FIX to get the whole number)
	intRecordPositionPageNum = FIX(lngPrePostCount / intThreadsPerPage) + 1
	
End If





'Start position
intStartPosition = ((intRecordPositionPageNum - 1) * intThreadsPerPage)





'Query to get Posts
'******************

'Intilise SQL query to get all the posts
'Use a LEFT JOIN for the Guest name as there may not be a Guest name and so we want to include null values
strSQL = "" & _
"SELECT "

'If SQL server advanced paging
If strDatabaseType = "SQLServer" AND blnSqlSvrAdvPaging Then
	strSQL = strSQL & " * " & _
	"FROM (SELECT TOP " & intThreadsPerPage * intRecordPositionPageNum  & " "
End If

'SQL SELECT
strSQL = strSQL & strDbTable & "Thread.Thread_ID, " & strDbTable & "Thread.Message, " & strDbTable & "Thread.Message_date, " & strDbTable & "Thread.Show_signature, " & strDbTable & "Thread.IP_addr, " & strDbTable & "Thread.Hide, " & strDbTable & "Author.Author_ID, " & strDbTable & "Author.Username, " & strDbTable & "Author.Homepage, " & strDbTable & "Author.Location, " & strDbTable & "Author.No_of_posts, " & strDbTable & "Author.Join_date, " & strDbTable & "Author.Signature, " & strDbTable & "Author.Active, " & strDbTable & "Author.Avatar, " & strDbTable & "Author.Avatar_title, " & strDbTable & "Group.Name AS GroupName, " & strDbTable & "Group.Stars, " & strDbTable & "Group.Custom_stars, " & strDbTable & "GuestName.Name AS GuestName "

'If SQL Server advanced paging
If strDatabaseType = "SQLServer"  AND blnSqlSvrAdvPaging Then
	strSQL = strSQL & ", ROW_NUMBER() OVER (ORDER BY " & strDbTable & "Thread.Message_date " & strSortBy & ") AS RowNum "

End If

'FROM Clause
strSQL = strSQL & "FROM (" & strDbTable & "Group INNER JOIN (" & strDbTable & "Author INNER JOIN " & strDbTable & "Thread ON " & strDbTable & "Author.Author_ID = " & strDbTable & "Thread.Author_ID) ON " & strDbTable & "Group.Group_ID = " & strDbTable & "Author.Group_ID) LEFT JOIN " & strDbTable & "GuestName ON " & strDbTable & "Thread.Thread_ID = " & strDbTable & "GuestName.Thread_ID "

'Get the FROM and WHERE cluases from earlier
strSQL = strSQL & strSQLFromWhere

'If SQL Server advanced paging
If strDatabaseType = "SQLServer" AND blnSqlSvrAdvPaging Then
	strSQL = strSQL & ") AS PagingQuery WHERE RowNum BETWEEN " & intStartPosition + 1 & " AND " & intStartPosition + intThreadsPerPage & " "

'Else Order by clause here
Else
	strSQL = strSQL & "ORDER BY " & strDbTable & "Thread.Message_date " & strSortBy & " "
End If

'mySQL limit operator
If strDatabaseType = "mySQL" Then
	strSQL = strSQL & "LIMIT " & intStartPosition & ", " & intThreadsPerPage
End If

strSQL = strSQL & ";"

'Set error trapping
On Error Resume Next

'Query the database
rsCommon.Open strSQL, adoCon

'If an error has occurred write an error to the page
If Err.Number <> 0 Then	Call errorMsg("An error has occurred while executing SQL query on database.", "get_topic_posts_data", "forum_posts.asp")

'Disable error trapping
On Error goto 0

'If there is a topic in the database then get the post data
If NOT rsCommon.EOF Then
	

	'Read in the topic recordset into an array
	sarryPosts = rsCommon.GetRows()
	
	'Clean up
	rsCommon.Close

	'SQL Query Array Look Up table
	'0 = tblThread.Thread_ID,
	'1 = tblThread.Message,
	'2 = tblThread.Message_date,
	'3 = tblThread.Show_signature,
	'4 = tblThread.IP_addr,
	'5 = tblThread.Hide,
	'6 = tblAuthor.Author_ID,
	'7 = tblAuthor.Username,
	'8 = tblAuthor.Homepage,
	'9 = tblAuthor.Location,
	'10 = tblAuthor.No_of_posts,
	'11 = tblAuthor.Join_date,
	'12 = tblAuthor.Signature,
	'13 = tblAuthor.Active,
	'14 = tblAuthor.Avatar,
	'15 = tblAuthor.Avatar_title,
	'16 = tblGroup.Name,
	'17 = tblGroup.Stars,
	'18 = tblGroup.Custom_stars
	'19 = tblGuestName.Name

	'If advanced paging then workout the end and start position differently
	If (strDatabaseType = "SQLServer" AND blnSqlSvrAdvPaging) OR strDatabaseType = "mySQL" Then
		
		'End Position
		intEndPosition = Ubound(sarryPosts,2) + 1
	
		'Get the start position
		intCurrentRecord = 0
	
	'Else for slower paging for Access and SQL Server 2000	
	Else
		'End Position
		intEndPosition = intStartPosition + intThreadsPerPage
	
		'Get the start position
		intCurrentRecord = intStartPosition
	End If
	
	'Get meta description
	strMetaDescription = Trim(removeHTML(sarryPosts(1,0), 100, true))
	
	'Get the author ID of the first post (this is used for checking if the topic is hidden)
	lngUserID = CLng(sarryPosts(6,0))


'Else if no record is retuned we do not want to be displaying a foum title
Else

	strSubject = ""
	rsCommon.Close
End If




'Hidden Topic check (only display hidden tiopics to the admin/mods, or if the poster created the topic)
If blnHideTopic AND blnModerator = false AND blnAdmin = false Then
	If lngUserID <> lngLoggedInUserID OR intGroupID = 2 Then
		strSubject = ""
		lngTotalRecords = 0
		lngTotalRecordsPages = 0
	
	End If
End If



'If we have not yet checked for unread posts since last visit run it now
If Session("dtmUnReadPostCheck") = "" Then 
	Call UnreadPosts()
	
'Read in array if at application level
ElseIf isArray(Application("sarryUnReadPosts" & strSessionID)) Then  
	sarryUnReadPosts = Application("sarryUnReadPosts" & strSessionID)
	
'Read in the unread posts array	
ElseIf isArray(Session("sarryUnReadPosts")) Then 
	sarryUnReadPosts = Session("sarryUnReadPosts")
	
End If

'See if there are any unread posts in this topic
If isArray(sarryUnReadPosts) Then
	For intUnReadForumPostsLoop = 0 to UBound(sarryUnReadPosts,2)
		'If an unread post is found in this topic 
		If CLng(sarryUnReadPosts(1,intUnReadForumPostsLoop)) = lngTopicID AND sarryUnReadPosts(3,intUnReadForumPostsLoop) = "1" Then 
			'Increament unread post count
			intUnReadPostCount = intUnReadPostCount + 1
			'Get first unread post ID
			If lngFirstUnreadPostID = 0 Then lngFirstUnreadPostID = CLng(sarryUnReadPosts(0,intUnReadForumPostsLoop))
		End If
	Next	
End If





'Page to link to for mutiple page (with querystrings if required)
strLinkPage = "forum_posts.asp?TID=" & lngTopicID & "&amp;"
If Request.QueryString("KW") <> "" Then strLinkPage = strLinkPage & "KW=" & Server.URLEncode(Request.QueryString("KW")) & "&amp;"
If Request.QueryString("FID") <> "" Then strLinkPage = strLinkPage & "FID=" & intForumID & "&amp;"
If Request.QueryString("PR") <> "" Then strLinkPage = strLinkPage & "PR=" & CInt(Request.QueryString("PR")) & "&amp;"
strLinkPageTitle = SeoUrlTitle(strSubject, "&amp;title=")



'If active users is enabled update the active users application array
If blnActiveUsers Then
	'If there are keywords this is a search
	If Request.QueryString("KW") <> "" Then
		'Call active users function
		saryActiveUsers = activeUsers(strTxtViewingTopic & " " & strTxtSearchResults, strSubject, strLinkPage & "PN=" & intRecordPositionPageNum & SeoUrlTitle(strSubject, "&amp;title="), intForumID)
	'Else normal topic
	Else
		'Call active users function
		saryActiveUsers = activeUsers(strTxtViewingTopic, strSubject, strLinkPage & "PN=" & intRecordPositionPageNum & SeoUrlTitle(strSubject, "&amp;title="), intForumID)
	End If
End If





'Set bread crumb trail
'Display the category name
strBreadCrumbTrail = strBreadCrumbTrail & strNavSpacer & "<a href=""default.asp?C=" & intCatID & strQsSID2 & SeoUrlTitle(strCatName, "&title=") & """>" & strCatName & "</a>" & strNavSpacer

'Display if there is a main forum to the sub forums name
If intMasterForumID <> 0 Then strBreadCrumbTrail = strBreadCrumbTrail & "<a href=""forum_topics.asp?FID=" & intMasterForumID & strQsSID2 & SeoUrlTitle(strMasterForumName, "&title=") & """>" & strMasterForumName & "</a>" & strNavSpacer

'Display forum name
If strForumName = "" Then strBreadCrumbTrail = strBreadCrumbTrail &  strTxtNoForums Else strBreadCrumbTrail = strBreadCrumbTrail & "<a href=""forum_topics.asp?FID=" & intForumID & strQsSID2 & SeoUrlTitle(strForumName, "&title=") & """>" & strForumName & "</a>"



'Set the status bar tools

'Active Topics Links
strStatusBarTools = strStatusBarTools & "&nbsp;&nbsp;<img src=""" & strImagePath & "active_topics." & strForumImageType & """ alt=""" & strTxtActiveTopics & """ title=""" & strTxtActiveTopics & """ style=""vertical-align: text-bottom"" /> <a href=""active_topics.asp" & strQsSID1 & """>" & strTxtActiveTopics & "</a>"

'If RSS XML enabled then display an RSS button to link to XML file
If blnRSS AND (isNull(strForumPassword) OR strForumPassword = "") Then strStatusBarTools = strStatusBarTools & " <a href=""RSS_post_feed.asp?TID=" & lngTopicID & SeoUrlTitle(strSubject, "&title=") & """ target=""_blank""><img src=""" & strImagePath & "rss." & strForumImageType & """ alt=""" & strTxtRSS & ": " & strSubject & """ title=""" & strTxtRSS & ": " & strSubject & """ /></a>"



'Write the HTML head of the page
%><!-- #include file="includes/browser_page_encoding_inc.asp" -->
<title><% = strSubject & " - " & strMainForumName %><% If lngTotalRecordsPages > 1 Then Response.Write(" - " & strTxtPage & " " & intRecordPositionPageNum) %></title>
<meta name="generator" content="Web Wiz Forums" /><% 

'No index if no post is availble
If lngTotalRecords = 0 Then Response.Write(vbCrLf & "<meta name=""robots"" content=""noindex"" />")

'Dynamic meta tags
If blnDynamicMetaTags AND lngTotalRecords > 0 Then 
%>
<meta name="description" content="<% = strMetaDescription %>" />
<meta name="keywords" content="<% = strDynamicKeywords  %>" />

<%

End If

'***** START WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
Response.Write("<!--//" & _
vbCrLf & "/* *******************************************************" & _
vbCrLf & "Software: Web Wiz Forums(TM) ver. " & strVersion & "" & _
vbCrLf & "Info: http://www.webwizforums.com" & _
vbCrLf & "Copyright: (C)2001-2010 Web Wiz(TM). All rights reserved" & _
vbCrLf & "******************************************************* */" & _
vbCrLf & "//-->" & vbCrLf)
'***** END WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******


'If RSS Feed is enabled then have an alt link to the XML file for supporting browsers
'Only display if the last post was less than xx weeks ago, to reduce the amount of consumed bandwidth
If blnRSS AND (isNull(strForumPassword) OR strForumPassword = "") Then Response.Write(vbCrLf & "<link rel=""alternate"" type=""application/rss+xml"" title=""RSS 2.0"" href=""RSS_post_feed.asp?TID=" & lngTopicID & SeoUrlTitle(strSubject, "&title=") & """ />")


'Display javascript for form checking
If blnActiveMember AND blnForumLocked = false AND blnReply AND (intRecordPositionPageNum = lngTotalRecordsPages) Then

%>
<script language="JavaScript">
function CheckForm() {
	var errorMsg = '';
	var formArea = document.getElementById('frmMessageForm');
<%

	'If Gecko Madis API (RTE) need to strip default input from the API
	If RTEenabled = "Gecko" Then Response.Write(vbCrLf & "	//For Gecko Madis API (RTE)" & vbCrLf & "	if (formArea.message.value.indexOf('<br>') > -1 && formArea.message.value.length==5) formArea.message.value = '';" & vbCrLf)


	'If this is a guest posting check that they have entered their name
	If blnPost And lngLoggedInUserID = 2 Then
%>
	//Check for a name
	if (formArea.Gname.value==''){
		errorMsg += '\n\t<% =  strTxtNoNameError %>';
	}<%
	
	End If

	'If CAPTCHA is displayed check it's been entered
	If blnGuestPostingCAPTCHA AND lngLoggedInUserID = 2 Then 
	
	%>
	
	//Check for a security code
        if (formArea.securityCode.value == ''){
                errorMsg += "\n\t<% = strTxtErrorSecurityCode %>";
        }<%
	End If


%>

	//Check for message
	if (formArea.message.value==''){
		errorMsg += '\n\t<% =  strTxtNoMessageError %>';
	}

	//If there is aproblem with the form then display an error
	if (errorMsg != ''){
		msg = '<% =  strTxtErrorDisplayLine %>\n\n';
		msg += '<% =  strTxtErrorDisplayLine1 %>\n';
		msg += '<% =  strTxtErrorDisplayLine2 %>\n';
		msg += '<% =  strTxtErrorDisplayLine %>\n\n';
		msg += '<% =  strTxtErrorDisplayLine3 %>\n';

		errorMsg += alert(msg + errorMsg + '\n\n');
		return false;
	}

	return true;
}
</script><%

End If

%>
<link href="<% = strCSSfile %>default_style.css" rel="stylesheet" type="text/css" />
<!-- #include file="includes/header.asp" -->
<!-- #include file="includes/status_bar_header_inc.asp" -->
<a name="top"></a>
<table class="basicTable" cellspacing="0" cellpadding="5" align="center">
 <tr>
  <td><h1><%
  	
'If the forum is locked show a locked pad lock icon
If blnForumLocked Then 
	Response.Write ("<img src=""" & strImagePath & "forum_lock." & strForumImageType & """ alt=""" & strTxtForumLocked & """ title=""" & strTxtForumLocked & """ style=""vertical-align: text-bottom"" />")
'If the topic is locked then have a locked icon
ElseIf blnTopicLocked Then 
	Response.Write ("<img src=""" & strImagePath & "topic_lock." & strForumImageType & """ alt=""" & strTxtTopicLocked & """ title=""" & strTxtTopicLocked & """ style=""vertical-align: text-bottom"" />")
End If

'If a calendar event then display so
If isDate(dtmEventDate) Then
	Response.Write(strSubject & " - " & strTxtEventDate & ": " & stdDateFormat(dtmEventDate, False))
	
	'If over multiple dates
	If isDate(dtmEventDateEnd) Then Response.Write(" - " & stdDateFormat(dtmEventDateEnd, False))
Else  	
 	Response.Write(strSubject) 
End If




%></h1></td>
 </tr>
</table>
<table class="basicTable" cellspacing="0" cellpadding="3" align="center">
 <tr>
  <td>
   <a href="new_reply_form.asp?TID=<% = lngTopicID %>&amp;PN=<% = lngTotalRecordsPages %>&amp;TR=<% =  lngTotalRecords & strQsSID2 %>" title="<% = strTxtPostReply %>" class="largeButton" rel="nofollow">&nbsp;<% = strTxtPostReply %> <img src="<% = strImagePath %>reply.<% = strForumImageType %>" border="0" alt="<% = strTxtPostReply %>" /></a> 
  </td>
  <td align="right"><!-- #include file="includes/page_link_inc.asp" --></td>
 </tr>
</table><%

'If there is a poll then display the poll include
If lngPollID > 0 Then
	%><!--#include file="includes/poll_display_inc.asp" --><%
End If


'If there are posts display them
If lngTotalRecords > 0 Then


%>
<table class="tableBorder" align="center" cellspacing="1" cellpadding="3" style="table-layout: fixed;">
 <tr class="tableLedger">
  <td style="width:140px;"><% = strTxtAuthor %></td>
  <td>
   <div style="float:left;"><a href="forum_posts.asp?TID=<% = lngTopicID %>&amp;OB=DESC<% = strQsSID2 %>" title="<% = strTxtReverseSortOrder %>"><% = strTxtMessage %></a><% If strSortBy = "DESC" Then Response.Write(" <a href=""forum_posts.asp?TID=" & lngTopicID & "&amp;OB=ASC" & strQsSID2 & """><img src=""" & strImagePath & strSortBy & "." & strForumImageType & """ title=""" & strTxtReverseSortOrder & """ alt=""" & strTxtReverseSortOrder & """ /></a>") %><%
   	
   	'Display link to first unread post
	If intUnReadPostCount > 0 Then
		Response.Write(" / <a href=""forum_posts.asp?TID=" & lngTopicID)
		If intPriority = 3 Then Response.Write("&amp;FID=" & intForumID & "&amp;PR=3") 
		Response.Write("&amp;PID=" & lngFirstUnreadPostID & "#" & lngFirstUnreadPostID & strQsSID2 & """  title=""" & intUnReadPostCount & " " & strTxtNewPosts & """>" & strTxtViewUnreadPost & "</a>") 
   	End If
   	
   	%></div>
   <div style="float:right;" class="downDropParent"><%
   
   
	'Share Topic Drop Down
	Response.Write("&nbsp;&nbsp;<span id=""shareTopic"" onclick=""showDropDown('shareTopic', 'shareTopicMenu', 145, 0);"" class=""dropDownPointer""><img src=""" & strImagePath & "openshare-icon." & strForumImageType & """ alt=""" & strTxtShareTopic & """ title=""" & strTxtShareTopic & """ style=""vertical-align: text-bottom"" /> " & strTxtShareTopic & "</span>" & _
	"<div id=""shareTopicMenu"" class=""dropDownMenu"">")
	Response.Write("<a href=""printer_friendly_posts.asp?TID=" & lngTopicID & strQsSID2 & """ target=""_blank"" rel=""nofollow""><div title=""" & strTxtPrintVersion & """><img src=""" & strImagePath & "printable_version." & strForumImageType & """ alt=""" & strTxtPrintVersion & """ /> " & strTxtPrintVersion & "</div></a>")
	'Email Topic Option
	If intGroupID <> 2 AND blnEmail AND blnActiveMember Then Response.Write("<a href=""javascript:winOpener('email_topic.asp?TID=" & lngTopicID & strQsSID2 & "','email_friend',0,1,440,480)""><div title=""" & strTxtEmailTopic & """><img src=""" & strImagePath & "email_topic.gif"" alt=""" & strTxtEmailTopic & """ /> " & strTxtEmailTopic & "</div></a>")
	'Social Bookmark links
	Response.Write(_
	"<a href=""http://del.icio.us/post?url=" & Server.URLEncode(strForumPath & "forum_posts.asp?TID=" & lngTopicID) & "&title=" & strSubject & """ target=""_blank""><div title=""" & strTxtPostThisTopicTo & " Delicious""><img src=""" & strImagePath & "bookmark_delicious.gif"" alt=""" & strTxtPostThisTopicTo & " Delicious"" /> Delicious</div></a>" & _
	"<a href=""http://digg.com/submit?url=" & Server.URLEncode(strForumPath & "forum_posts.asp?TID=" & lngTopicID) & "&title=" & strSubject & """ target=""_blank""><div title=""" & strTxtPostThisTopicTo & " Digg""><img src=""" & strImagePath & "bookmark_digg.gif"" alt=""" & strTxtPostThisTopicTo & " Digg"" /> Digg</div></a>" & _
	"<a href=""http://www.facebook.com/share.php?u=" & Server.URLEncode(strForumPath & "forum_posts.asp?TID=" & lngTopicID) & "&title=" & strSubject & """ target=""_blank""><div title=""" & strTxtPostThisTopicTo & " Facebook""><img src=""" & strImagePath & "bookmark_facebook.gif"" alt=""" & strTxtPostThisTopicTo & " Facebook"" /> Facebook</div></a>" & _
	"<a href=""http://furl.net/storeIt.jsp?u=" & Server.URLEncode(strForumPath & "forum_posts.asp?TID=" & lngTopicID) & "&t=" & strSubject & """ target=""_blank""><div title=""" & strTxtPostThisTopicTo & " Furl""><img src=""" & strImagePath & "bookmark_furl.gif"" alt=""" & strTxtPostThisTopicTo & " Furl"" /> Furl</div></a>" & _
	"<a href=""http://www.google.com/bookmarks/mark?op=edit&output=popup&bkmk=" & Server.URLEncode(strForumPath & "forum_posts.asp?TID=" & lngTopicID) & "&title=" & strSubject & """ target=""_blank""><div title=""" & strTxtPostThisTopicTo & " Google""><img src=""" & strImagePath & "bookmark_google.gif"" alt=""" & strTxtPostThisTopicTo & " Google"" /> Google</div></a>" & _
	"<a href=""http://www.myspace.com/Modules/PostTo/Pages/?l=3&u=" & Server.URLEncode(strForumPath & "forum_posts.asp?TID=" & lngTopicID) & "&t=" & strSubject & """ target=""_blank""><div title=""" & strTxtPostThisTopicTo & " MySpace""><img src=""" & strImagePath & "bookmark_myspace.gif"" alt=""" & strTxtPostThisTopicTo & " MySpace"" /> MySpace</div></a>" & _
	"<a href=""http://www.newsvine.com/_wine/save?u=" & Server.URLEncode(strForumPath & "forum_posts.asp?TID=" & lngTopicID) & "&h=" & strSubject & """ target=""_blank""><div title=""" & strTxtPostThisTopicTo & " Newsvine""><img src=""" & strImagePath & "bookmark_newsvine.gif"" alt=""" & strTxtPostThisTopicTo & " Newsvine"" /> Newsvine</div></a>" & _
	"<a href=""http://www.reddit.com/submit?url=" & Server.URLEncode(strForumPath & "forum_posts.asp?TID=" & lngTopicID) & "&title=" & strSubject & """ target=""_blank""><div title=""" & strTxtPostThisTopicTo & " reddit""><img src=""" & strImagePath & "bookmark_reddit.gif"" alt=""" & strTxtPostThisTopicTo & " reddit"" /> reddit</div></a>" & _
	"<a href=""http://www.stumbleupon.com/submit?url=" & Server.URLEncode(strForumPath & "forum_posts.asp?TID=" & lngTopicID) & "&title=" & strSubject & """ target=""_blank""><div title=""" & strTxtPostThisTopicTo & " StumbleUpon""><img src=""" & strImagePath & "bookmark_stumbleupon.gif"" alt=""" & strTxtPostThisTopicTo & " StumbleUpon"" /> StumbleUpon</div></a>" & _
	"<a href=""http://translate.google.com/translate?u=" & Server.URLEncode(strForumPath & "forum_posts.asp?TID=" & lngTopicID) & """ target=""_blank""><div title=""" & strTxtTranslate & """><img src=""" & strImagePath & "bookmark_google.gif"" alt=""" & strTxtTranslate & """ /> " & strTxtTranslate & "</div></a>" & _
	"<a href=""http://twitter.com/home?status=" & strSubject & ": " & Server.URLEncode(strForumPath & "forum_posts.asp?TID=" & lngTopicID) & """ target=""_blank""><div title=""" & strTxtPostThisTopicTo & " Twitter""><img src=""" & strImagePath & "bookmark_twitter.gif"" alt=""" & strTxtPostThisTopicTo & " Twitter"" /> Twitter</div></a>" & _
	"<a href=""http://favorites.live.com/quickadd.aspx?url=" & Server.URLEncode(strForumPath & "forum_posts.asp?TID=" & lngTopicID) & "&title=" & strSubject & """ target=""_blank""><div title=""" & strTxtPostThisTopicTo & " Windows Live""><img src=""" & strImagePath & "bookmark_windows_live.gif"" alt=""" & strTxtPostThisTopicTo & " Windows Live"" /> Windows Live</div></a>" & _
	"<a href=""http://bookmarks.yahoo.com/toolbar/savebm?u=" & Server.URLEncode(strForumPath & "forum_posts.asp?TID=" & lngTopicID) & "&t=" & strSubject & """ target=""_blank""><div title=""" & strTxtPostThisTopicTo & " Yahoo Bookmarks""><img src=""" & strImagePath & "bookmark_yahoo.gif"" alt=""" & strTxtPostThisTopicTo & " Yahoo Bookmarks"" /> Yahoo Bookmarks</div></a>" & _
	"</div>")
	
	
	'Topic Search Link
  	Response.Write ("&nbsp;&nbsp;<span id=""SearchTopicLink"" onclick=""showDropDown('SearchTopicLink', 'dropDownTopicSearch', 230, 135);"" class=""dropDownPointer""><img src=""" & strImagePath & "search." & strForumImageType & """ alt=""" & strTxtTopic & " " & strTxtSearch & """ title=""" & strTxtTopic & " " & strTxtSearch & """ style=""vertical-align: text-bottom;"" />&nbsp;" & strTxtTopic & " " & strTxtSearch & "</span>") 
	
	
	
	'Modertor Tools
	If blnAdmin OR blnModerator Then
		
		'Moderator tools drop down
		Response.Write("&nbsp;&nbsp;<span id=""modTools"" onclick=""showDropDown('modTools', 'modToolsMenu', 120, 0);"" class=""dropDownPointer""><img src=""" & strImagePath & "moderator_tools." & strForumImageType & """ alt=""" & strTxtModeratorTools & """ title=""" & strTxtModeratorTools & """ style=""vertical-align: text-bottom"" /> " & strTxtModeratorTools & "</span>" & _
		"<div id=""modToolsMenu"" class=""dropDownMenu"">" & _
		"<a href=""pre_approved_topics.asp" & strQsSID1 & """><div>" & strTxtHiddenTopics & "</div></a>" & _
		"<a href=""javascript:winOpener('pop_up_topic_admin.asp?TID=" & lngTopicID & strQsSID2 & "','admin',1,1,600,285)""><div>" & strTxtTopicAdmin & "</div></a>")
		
		'Lock or un-lock forum if admin
		If blnTopicLocked Then
			Response.Write("<a href=""lock_topic.asp?mode=UnLock&amp;TID=" & lngTopicID & "&amp;XID=" & getSessionItem("KEY") & strQsSID2 & """><div>" & strTxtUnLockTopic & "</div></a>")
		Else
			Response.Write("<a href=""lock_topic.asp?mode=Lock&amp;TID=" & lngTopicID & "&amp;XID=" & getSessionItem("KEY") & strQsSID2 & """><div>" & strTxtLockTopic & "</div></a>")
		End If
		
		'Hide or show topic
		If blnHideTopic = false Then
			Response.Write("<a href=""lock_topic.asp?mode=Hide&amp;TID=" & lngTopicID & "&amp;XID=" & getSessionItem("KEY") & strQsSID2 & """><div>" & strTxtHideTopic & "</div></a>")
		Else
			Response.Write("<a href=""lock_topic.asp?mode=Show&amp;TID=" & lngTopicID & "&amp;XID=" & getSessionItem("KEY") & strQsSID2 & """><div>" & strTxtShowTopic & "</div></a>")
		End If
		
		Response.Write("<a href=""delete_topic.asp?TID=" & lngTopicID & "&amp;PN=" & intRecordPositionPageNum & "&amp;XID=" & getSessionItem("KEY") & strQsSID2 & """ onclick=""return confirm('" & strTxtDeleteTopicAlert & "')""><div>" & strTxtDeleteTopic & "</div></a>")
		Response.Write("</div>")
	End If
	
	
	'Topic Options drop down
	Response.Write("&nbsp;&nbsp;<span id=""topicOptions"" onclick=""")
	'If we need a subscription link then include a call to the ajax function
	If intGroupID <> 2 AND blnEmail AND blnLoggedInUserEmail AND blnActiveMember Then Response.Write("getAjaxData('ajax_email_notify.asp?TID=" & lngTopicID & "&amp;PN=" & intRecordPositionPageNum & strQsSID2 & "', 'ajaxEmailSub');")
		
	Response.Write("showDropDown('topicOptions', 'optionsMenu', 122, 26);"" class=""dropDownPointer""><img src=""" & strImagePath & "topic_options." & strForumImageType & """ alt=""" & strTxtTopicOptions & """ title=""" & strTxtTopicOptions & """ style=""vertical-align: text-bottom;"" /> " & strTxtTopicOptions & "</span>" & _
	"<div id=""optionsMenu"" class=""dropDownMenu"">" & _
	"<a href=""new_reply_form.asp?TID=" & lngTopicID & "&amp;PN=" &  lngTotalRecordsPages & "&amp;TR=" &  lngTotalRecords & strQsSID2 & """ rel=""nofollow""><div>" & strTxtPostReply & "</div></a>" & _
	"<a href=""new_topic_form.asp?FID=" & intForumID & strQsSID2 & """ rel=""nofollow""><div>" & strTxtCreateNewTopic & "</div></a>")
	If blnPollCreate Then Response.Write("<a href=""new_poll_form.asp?FID=" & intForumID & strQsSID2 & """ rel=""nofollow""><div>" & strTxtCreateNewPoll & "</div></a>")
	
	'Display option to subscribe or un-subscribe to topic
	If intGroupID <> 2 AND blnEmail AND blnLoggedInUserEmail AND blnActiveMember Then Response.Write("<span id=""ajaxEmailSub""></span>")
	  
  
  
  %></div>
  </td>
 </tr><%

 	'Calculate the post number
	intThreadNo = (intRecordPositionPageNum - 1) * intThreadsPerPage


	'Do....While Loop to loop through the recorset to display the topic posts
	Do While intCurrentRecord < intEndPosition

		'If there are no post records left to display then exit loop
		If intCurrentRecord >= lngTotalRecords Then Exit Do

		'Calculate the thread number
		intThreadNo = intThreadNo + 1
		
		'Initliase the unread post variable
		blnUnreadPost = False

		'SQL Query Array Look Up table
		'0 = tblThread.Thread_ID,
		'1 = tblThread.Message,
		'2 = tblThread.Message_date,
		'3 = tblThread.Show_signature,
		'4 = tblThread.IP_addr,
		'5 = tblThread.Hide,
		'6 = tblAuthor.Author_ID,
		'7 = tblAuthor.Username,
		'8 = tblAuthor.Homepage,
		'9 = tblAuthor.Location,
		'10 = tblAuthor.No_of_posts,
		'11 = tblAuthor.Join_date,
		'12 = tblAuthor.Signature,
		'13 = tblAuthor.Active,
		'14 = tblAuthor.Avatar,
		'15 = tblAuthor.Avatar_title,
		'16 = tblGroup.Name,
		'17 = tblGroup.Stars,
		'18 = tblGroup.Custom_stars
		'19 = tblGuestName.Name

		'Read in threads details for the topic from the database
		lngMessageID = CLng(sarryPosts(0,intCurrentRecord))
		strMessage = sarryPosts(1,intCurrentRecord)
		dtmPostDate = CDate(sarryPosts(2,intCurrentRecord))
		strAuthorIP = sarryPosts(4,intCurrentRecord)
		blnHidePost = CBool(sarryPosts(5,intCurrentRecord))
		lngUserID = CLng(sarryPosts(6,intCurrentRecord))
		strUsername = sarryPosts(7,intCurrentRecord)

		strAuthorHomepage = sarryPosts(8,intCurrentRecord)
		strAuthorLocation = sarryPosts(9,intCurrentRecord)
		lngAuthorNumOfPosts = CLng(sarryPosts(10,intCurrentRecord))
		dtmAuthorRegistration = CDate(sarryPosts(11,intCurrentRecord))
		strAuthorSignature = sarryPosts(12,intCurrentRecord)

		strAuthorAvatar = sarryPosts(14,intCurrentRecord)
		strMemberTitle = sarryPosts(15,intCurrentRecord)
		strGroupName = sarryPosts(16,intCurrentRecord)
		intRankStars = CInt(sarryPosts(17,intCurrentRecord))
		strRankCustomStars = sarryPosts(18,intCurrentRecord)

		strGuestUsername = sarryPosts(19,intCurrentRecord)
		
		
		'If there is a newer post than the last time the unread posts array was initilised run it again
		If dtmPostDate > CDate(Session("dtmUnReadPostCheck")) Then Call UnreadPosts()
		
		'Mark if this post has been read, if the unread posts array exists
		If isArray(sarryUnReadPosts) AND  dtmPostDate > dtmLastVisitDate Then
			
			'Loop through the unread posts array
			For intUnReadForumPostsLoop = 0 to UBound(sarryUnReadPosts,2)
				
				'Mark the post as read
				If CLng(sarryUnReadPosts(0,intUnReadForumPostsLoop)) = lngMessageID Then 
					
					If sarryUnReadPosts(3,intUnReadForumPostsLoop) = "1" Then blnUnreadPost = True
					
					'mark post as read
					sarryUnReadPosts(3,intUnReadForumPostsLoop) = "0"
					
					'save back to session
					
					'Save the array at applicion level
					If isArray(Application("sarryUnReadPosts" & strSessionID)) Then  
						Application.Lock
						Application("sarryUnReadPosts" & strSessionID) = sarryUnReadPosts 
						Application.UnLock
					'save the array at session level
					ElseIf isArray(Session("sarryUnReadPosts")) Then 
						Session("sarryUnReadPosts") = sarryUnReadPosts
					End If
					
					'Exit for to save some processing time
					Exit For
				End If
			Next	
		End If



		'Calculate the row colour
		If intCurrentRecord MOD 2 = 0 Then
			strPostTableRowClass = "msgEvenTableRow"
			strPostTableSideClass = "msgEvenTableSide"
			strPostTableTopClass = "msgEvenTableTop"
		Else
			strPostTableRowClass = "msgOddTableRow"
			strPostTableSideClass = "msgOddTableSide"
			strPostTableTopClass = "msgOddTableTop"
		End If

		'If this is a hidden post then change the row colour to highlight it
		If blnHidePost Then strPostTableRowClass = "msgHiddenTableRow"


		'If the poster is a guest see if they have entered their name in the GuestName table and get it
		If lngUserID = 2 AND strGuestUsername <> "" Then strUsername = strGuestUsername


		'If the post contains a quote or code block then format it
		If InStr(1, strMessage, "[QUOTE=", 1) > 0 AND InStr(1, strMessage, "[/QUOTE]", 1) > 0 Then strMessage = formatUserQuote(strMessage)
		If InStr(1, strMessage, "[QUOTE]", 1) > 0 AND InStr(1, strMessage, "[/QUOTE]", 1) > 0 Then strMessage = formatQuote(strMessage)
		If InStr(1, strMessage, "[CODE]", 1) > 0 AND InStr(1, strMessage, "[/CODE]", 1) > 0 Then strMessage = formatCode(strMessage)


		'If the Post or signature contains Flash or YouTube BBcodes then display them
		If blnFlashFiles Then
			'Flash
			If InStr(1, strMessage, "[FLASH", 1) > 0 AND InStr(1, strMessage, "[/FLASH]", 1) > 0 Then strMessage = formatFlash(strMessage)
			If InStr(1, strAuthorSignature, "[FLASH", 1) > 0 AND InStr(1, strAuthorSignature, "[/FLASH]", 1) > 0 Then strAuthorSignature = formatFlash(strAuthorSignature)
		
			'YouTube
			If InStr(1, strMessage, "[TUBE]", 1) > 0 AND InStr(1, strMessage, "[/TUBE]", 1) > 0 Then strMessage = formatYouTube(strMessage)
			If InStr(1, strAuthorSignature, "[TUBE]", 1) > 0 AND InStr(1, strAuthorSignature, "[/TUBE]", 1) > 0 Then strMessage = formatYouTube(strAuthorSignature)
		End If


		'If the message has been edited parse the 'edited by' XML into HTML for the post
		If InStr(1, strMessage, "<edited>", 1) Then strMessage = editedXMLParser(strMessage)


		'Call the function to highlight search words if coming froma search page
		If strSearchKeywords <> "" Then strMessage = searchHighlighter(strMessage, sarySearchWord)
		
		
		'Calulate rowspan amount for table below side bar	
		If CBool(sarryPosts(3,intCurrentRecord)) AND strAuthorSignature <> "" Then 
			intPostRowsSpan = 3
		Else 
			intPostRowsSpan = 2
		End If
		
		
%>
 <tr>
  <td rowspan="<% = intPostRowsSpan %>" valign="top" class="<% = strPostTableSideClass %>">
   <!-- google_ad_section_start(weight=ignore) -->
   <a name="<% = lngMessageID %>"></a>
   <span id="userProfile<% = lngMessageID %>" onclick="showDropDown('userProfile<% = lngMessageID %>', 'profileMenu<% = lngMessageID %>', 160, 0);" class="msgSideProfile" title="<% = strTxtViewDropDown %>"><% = strUsername %> <img src="<% = strImagePath %>drop_down.<% = strForumImageType %>" alt="<% = strTxtViewDropDown %>" /></span>
   <div id="profileMenu<% = lngMessageID %>" class="dropDownMenu">
    <a href="member_profile.asp?PF=<% = lngUserID & strQsSID2 %>" rel="nofollow"><div><% = strTxtMembersProfile %></div></a><%

    		'Memeber drop down options
    		If blnPrivateMessages Then Response.Write(vbCrLf & "    <a href=""pm_new_message_form.asp?name=" & Server.URLEncode(Replace(strUsername, "'", "\'",  1, -1, 1)) & strQsSID2 & """ rel=""nofollow""><div>" & strTxtSendPrivateMessage & "</div></a>")
    		Response.Write(vbCrLf & "    <a href=""search_form.asp?USR=" & Server.URLEncode(Replace(strUsername, "'", "\'",  1, -1, 1)) & strQsSID2 & """ rel=""nofollow""><div>" & strTxtFindMembersPosts & "</div></a>")
    		If strAuthorHomepage <> "" Then Response.Write(vbCrLf & "    <a href=""" & formatInput(strAuthorHomepage) & """ target=""_blank""><div>" & strTxtVisitMembersHomepage & "</div></a>")
    		If blnPrivateMessages Then Response.Write(vbCrLf & "    <a href=""pm_buddy_list.asp?name=" & Server.URLEncode(Replace(strUsername, "'", "\'",  1, -1, 1)) & strQsSID2 & """ rel=""nofollow""><div>" & strTxtAddToBuddyList & "</div></a>")
%> 
   </div>
   <br /><% = strGroupName %>
   <br /><img src="<% If strRankCustomStars <> "" Then Response.Write(strRankCustomStars) Else Response.Write(strImagePath & intRankStars & "_star_rating.png") %>" alt="<% = strGroupName %>" title="<% = strGroupName %>" />
   <br /><%


	        'If the user has an avatar then display it
	        If blnAvatar = True AND strAuthorAvatar <> "" Then Response.Write("<img src=""" & strAuthorAvatar & """ alt=""" & strTxtAvatar & """ class=""avatar"" onerror=""this.src='avatars/blank_avatar.jpg';"" />")

	       	'If there is a title for this member then display it
	       	If strMemberTitle <> "" Then Response.Write(vbCrLf & "   <br />" & strMemberTitle)

	        'If not a guest post then display some details
	        If lngUserID <> 2 Then

	         	'Show the joined date
	         	Response.Write(vbCrLf & "   <br /><br />" & strTxtJoined & ": " & DateFormat(dtmAuthorRegistration))

	         	'If the is a location display it
	         	If strAuthorLocation <> "" Then Response.Write(vbCrLf & "   <br />" & strTxtLocation & ": " & strAuthorLocation)


			'If active users is enabled see if the user is online
			If blnActiveUsers Then

				'Display if the user is online
				blnIsUserOnline = False

				'Loop through the active users array
				For intLoop = 1 To UBound(saryActiveUsers, 2)
					If saryActiveUsers(1, intLoop) = lngUserID Then blnIsUserOnline = True
				Next

				'Display if the user is online
				If blnIsUserOnline Then Response.Write(vbCrLf & "   <br />" & strTxtOnlineStatus & ": " & strTxtOnLine2) Else Response.Write(vbCrLf & "      <br />" & strTxtOnlineStatus & ": " & strTxtOffLine)
			End If


	         	'Display the num of posts
	         	Response.Write(vbCrLf & "   <br />" & strTxtPosts & ": " & lngAuthorNumOfPosts)
		End If
%>
   <!-- google_ad_section_end -->
  </td>
  <td valign="top" class="<% = strPostTableTopClass %>"  style="height:15px;"><%

  		'Disply post options if there are any for this user
 		If (blnTopicLocked = False) OR (blnAdmin OR blnModerator) Then
  		
	  		Response.Write(vbCrLf & "   <span style=""float:right"">")
	  		
	  		'If post is hidden display approved post option
	  		If blnHidePost AND (blnAdmin OR blnModerator) Then Response.Write(vbCrLf & "   <img src=""" & strImagePath & "approve_post." & strForumImageType & """ title=""" & strTxtApprovePost & """ alt=""" & strTxtApprovePost & """ style=""vertical-align: text-bottom;"" /> <a href=""show_post.asp?PID=" & lngMessageID & "&amp;XID=" & getSessionItem("KEY") & strQsSID2 & """>" & strTxtApprovePost & "</a>&nbsp;&nbsp;")
	  		
	  		
	  		'Moderator tools drop down
	  		Response.Write(vbCrLf & "    <span id=""postOptions" & lngMessageID & """ onclick=""showDropDown('postOptions" & lngMessageID & "', 'postMenu" & lngMessageID & "', 130, 0);"" class=""postOptions""><img src=""" & strImagePath & "post_options." & strForumImageType & """ alt=""" & strTxtPostOptions & """ title=""" & strTxtPostOptions & """ style=""vertical-align: text-bottom;"" /> " & strTxtPostOptions & "</span>" & _
	  		vbCrLf & "    <div id=""postMenu" & lngMessageID & """ class=""dropDownMenu"">")
			
			'If the topic is not locked put in a link for someone to quote this message
	      		If blnTopicLocked = False AND blnPollNoReply = False AND blnHidePost = False Then 
				Response.Write(vbCrLf & "     <a href=""new_reply_form.asp?TID=" & lngTopicID & "&amp;PN=" &  lngTotalRecordsPages & "&amp;TR=" &  lngTotalRecords & strQsSID2 & """ rel=""nofollow""><div>" & strTxtPostReply & "</div></a>" & _
				vbCrLf & "     <a href=""new_reply_form.asp?M=Q&amp;PID=" & lngMessageID & "&amp;PN=" & lngTotalRecordsPages & "&amp;TR=" & lngTotalRecords & strQsSID2 & """ rel=""nofollow""><div>" & strTxtQuote & "&nbsp;" & strUsername & "</div></a>")
			End If
			
			'Display the report post feature if email is enabled.
	        	If blnEmail AND lngUserID <> lngLoggedInUserID AND blnActiveMember Then Response.Write(vbCrLf & "     <a href=""report_post.asp?PID=" & lngMessageID & "&amp;FID=" & intForumID & "&amp;TID=" & lngTopicID & "&amp;PN=" & intRecordPositionPageNum & strQsSID2 & """><div>" & strTxtReportPost & "</div></a> ")
			
			'If the logged in user is the person who posted the message or the forum administrator/moderator then allow them to edit or delete the message
		      	If (lngLoggedInUserID = lngUserID AND blnForumLocked = False AND blnActiveMember AND blnTopicLocked = False) OR (blnAdmin OR blnModerator) Then
	
		      	   	'Only let the user edit the post if they have edit rights
		      	   	If blnEdit OR blnAdmin Then
		      	   		Response.Write(vbCrLf & "     <a href=""edit_post_form.asp?PID=" & lngMessageID & "&amp;PN=" & intRecordPositionPageNum)
		      	   		If lngPollID > 0 AND intThreadNo = 1 Then Response.Write("&amp;POLL=" & lngPollID)
		      	   		Response.Write("" & strQsSID2 & """ rel=""nofollow""><div>" & strTxtEditPost & "</div></a>")
				End If
	
				'Only let a normal user delete there post if someone hasn't posted a reply
	      			If (lngTotalRecords = intThreadNo) OR (blnAdmin OR blnModerator) Then
	
		            		'Only let the user delete the post if they have delete rights
		            		If blnDelete OR blnAdmin Then
		            			Response.Write(vbCrLf & "     <a href=""delete_post.asp?PID=" & lngMessageID & "&amp;PN=" & intRecordPositionPageNum & "&amp;XID=" & getSessionItem("KEY") & strQsSID2 & """ OnClick=""return confirm('" & strTxtDeletePostAlert & "')""><div>" & strTxtDeletePost & "</div></a>")
		      			End If
		      		End If
		      	End If
	
	
	   	      	'If the user is the forum admin or a moderator
		      	If blnAdmin OR blnModerator Then
	
		      		'Let them hide the post
		      		If blnHidePost Then
		      			Response.Write(vbCrLf & "     <a href=""show_post.asp?PID=" & lngMessageID & "&amp;XID=" & getSessionItem("KEY") & strQsSID2 & """><div>" & strTxtApprovePost & "</div></a>")
		      		Else
		      			Response.Write(vbCrLf & "     <a href=""hide_post.asp?PID=" & lngMessageID & "&amp;XID=" & getSessionItem("KEY") & strQsSID2 & """ OnClick=""return confirm('" & strTxtAreYouSureYouWantToHidePost & "')""><div>" & strTxtHidePost & "</div></a>")
		      		End If
	
		      		'Let them move the post to another forum
		      		Response.Write(vbCrLf & "     <a href=""javascript:winOpener('move_post_form.asp?PID=" & lngMessageID & strQsSID2 & "','move',1,1,580,265)""><div>" & strTxtMovePost & "</div></a>")
			
				'Display the IP address for IP blocking to admin/moderators
				If strAuthorIP <> "" Then Response.Write(vbCrLf & "     <a href=""javascript:winOpener('pop_up_IP_blocking.asp?IP=" & strAuthorIP & strQsSID2 & "','ip',1,1,425,350)"" title=""" & strAuthorIP & """><div>" & strTxtBlockUsersIP & "</div></a>")
			End If
			
			Response.Write(vbCrLf & "    </div>")

	
	
	
	                'If the topic is not locked put in a link for someone to quote this message
	      		If blnTopicLocked = False AND blnPollNoReply = False AND blnHidePost = False Then 
	      			
	      			Response.Write(vbCrLf & "    &nbsp;&nbsp;<img src=""" & strImagePath & "quote." & strForumImageType & """ title=""" & strTxtQuote & "&nbsp;" & strUsername & """ alt=""" & strTxtQuote & "&nbsp;" & strUsername & """ style=""vertical-align: text-bottom;"" /> <a href=""new_reply_form.asp?M=Q&amp;PID=" & lngMessageID & "&amp;PN=" & lngTotalRecordsPages & "&amp;TR=" & lngTotalRecords & strQsSID2 & """ rel=""nofollow"">" & strTxtQuote & "</a>&nbsp;&nbsp;" & _
	      			"<img src=""" & strImagePath & "reply." & strForumImageType & """ title=""" & strTxtPostReply & """ alt=""" & strTxtPostReply & """ style=""vertical-align: text-bottom;"" /><a href=""new_reply_form.asp?PID=" & lngMessageID & "&amp;PN=" & lngTotalRecordsPages & "&amp;TR=" &  lngTotalRecords & strQsSID2 & """ rel=""nofollow"">" & strTxtReply & "</a>")
	      			
	      		End If
	      		
	      		Response.Write(vbCrLf & "   </span>")

		End If

		
		'If unread post display an un-read post icon next to the post
		If blnUnreadPost Then 
			Response.Write(vbCrLf & "   <a href=""forum_posts.asp?TID=" & lngTopicID & "&amp;PID=" & lngMessageID & strQsSID2 & SeoUrlTitle(strSubject, "&amp;title=") & "#" & lngMessageID & """ title=""" & strTxtNewPost & ": " & strTxtDirectLinkToThisPost & """><img src=""" & strImagePath & "new_post." & strForumImageType & """ alt=""" & strTxtNewPost & ": " & strTxtDirectLinkToThisPost & """ /></a> ")
		
		'Else display a bullet incon with direct link to post
		Else
			'Display direct link to post
			Response.Write(vbCrLf & "   <a href=""forum_posts.asp?TID=" & lngTopicID & "&amp;PID=" & lngMessageID & strQsSID2 & SeoUrlTitle(strSubject, "&amp;title=") & "#" & lngMessageID & """ title=""" & strTxtDirectLinkToThisPost & """><img src=""" & strImagePath & "bullet." & strForumImageType & """ alt=""" & strTxtDirectLinkToThisPost & """ /></a> ")
     		End If
     		
     		'If first record display topic title
     		If intCurrentRecord = 0 Then 
     			Response.Write("<strong>")
			'If a calendar event then display so
			If isDate(dtmEventDate) Then Response.Write(strTxtCalendarEvent & ": ") Else Response.Write(strTxtTopic & ": ") 
			Response.Write(strSubject & "</strong><br />&nbsp;&nbsp;&nbsp;&nbsp;")
		End If

		'Display message post date and time
		Response.Write(strTxtPosted & " " & DateFormat(dtmPostDate) & " " & strTxtAt & " " & TimeFormat(dtmPostDate)) 
		
		'Display IP if admin or moderator
		If blnAdmin OR blnModerator Then Response.Write(" - " & strTxtIP & ": " & strAuthorIP)
%></td>
 </tr>
 <tr class="<% = strPostTableRowClass %>" style="height:200px;min-height:200px;">
  <td valign="top" class="msgLineDevider">
   <!-- Start Member Post -->
   <!-- google_ad_section_start -->
   <div class="msgBody">
   <% = strMessage %>
   </div>
   <!-- google_ad_section_end -->
   <!-- End Member Post --><%

		'If the user wants there signature the display it
		If CBool(sarryPosts(3,intCurrentRecord)) AND strAuthorSignature <> "" Then
			Response.Write(vbCrLf & "  </td>" & _
			vbCrLf & " </tr>" & _
			vbCrLf & " <tr class=""" & strPostTableRowClass & """>" & _
			vbCrLf & "  <td class=""msgLineDevider"">" & _
			formatSignature(strAuthorSignature))
		End If
		
		
		
%>
  </td>
 </tr><%
 
 		'***** START WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
		If intCurrentRecord = 0 AND (strInstallID = "Adware" OR strMyGoogleAdSenseID <> "pub-9026955576675812") Then
			
			strPostTableRowClass = "msgEvenTableRow"
			strPostTableSideClass = "msgEvenTableSide"
			strPostTableTopClass = "msgEvenTableTop"
	
%>
 <tr class="postSeparatorTableRow">
  <td colspan="2" align="right"><a href="#top"><img src="<% = strImagePath %>back_to_top.<% = strForumImageType %>" alt="<% = strTxtBackToTop %>" title="<% = strTxtBackToTop %>" /></a></td>
 </tr>
 <tr>
  <td valign="top" class="<% = strPostTableSideClass %>">
   <span class="msgSideProfile"><% = strTxtSponsor %></span>
  </td>
  <td class="<% = strPostTableRowClass %>" align="center" nowrap="nowrap"><br /><%			
			If strInstallID = "Adware" Then
				Response.Write(strSponsor2)
			ElseIf strMyGoogleAdSenseID <> "pub-9026955576675812" Then
				Response.Write(strAdSenseCodePost)
			End If
%><br /><br />
</td>
 </tr><%
			
		End If
		'***** END WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
		
 %>
 <tr class="postSeparatorTableRow">
  <td colspan="2" align="right"><a href="#top"><img src="<% = strImagePath %>back_to_top.<% = strForumImageType %>" alt="<% = strTxtBackToTop %>" title="<% = strTxtBackToTop %>" /></a></td>
 </tr><%

 		'Move to the next record
		intCurrentRecord = intCurrentRecord + 1
	Loop
%>
</table>
<iframe id="dropDownTopicSearch" src="quick_topic_search.asp?TID=<% = lngTopicID & strQsSID2 %>" class="dropDownTopicSearch" frameborder="0" scrolling="no" rel="nofollow"></iframe><%

'Else display there are no posts to display so display error message
Else

%>
<br />
<table class="errorTable" cellspacing="1" cellpadding="3" align="center">
 <tr>
  <td><img src="<% = strImagePath %>error.png" alt="<% = strTxtError %>" /> <strong><% = strTxtError %></strong></td>
 </tr>
 <tr>
  <td><% = strTxtNoThreads %></td>
 </tr>
<table><%



End If



%>
<table class="basicTable" cellspacing="0" cellpadding="3" align="center">
 <tr>
  <td>
   <a href="new_reply_form.asp?TID=<% = lngTopicID %>&amp;PN=<% = lngTotalRecordsPages %>&amp;TR=<% =  lngTotalRecords & strQsSID2 %>" title="<% = strTxtPostReply %>" class="largeButton" rel="nofollow">&nbsp;<% = strTxtPostReply %> <img src="<% = strImagePath %>reply.<% = strForumImageType %>" border="0" alt="<% = strTxtPostReply %>" /></a> 
  </td>
  <td align="right" nowrap><%

'Display table for email and/or page links
If lngTotalRecordsPages > 1 Then  
  
  	%><!-- #include file="includes/page_link_inc.asp" --><%

End If
%>
  </td>
 </tr>
</table><%







'Quick Reply !!!!
If blnBannedIP = false AND blnActiveMember AND blnBanned = False AND blnForumLocked = false AND blnReply AND blnTopicLocked = false AND blnPollNoReply = false AND intRecordPositionPageNum = lngTotalRecordsPages Then

	
	'Check to see if the user has email notification for this topic
	If blnEmail AND blnLoggedInUserEmail Then
		strSQL = "SELECT " & strDbTable & "EmailNotify.Author_ID  " & _
		"FROM " & strDbTable & "EmailNotify" & strRowLock & " " & _
		"WHERE " & strDbTable & "EmailNotify.Author_ID = " & lngLoggedInUserID & " AND " & strDbTable & "EmailNotify.Topic_ID = " & lngTopicID & ";"
		
		'Query the database
		rsCommon.Open strSQL, adoCon
		
		'If a record is returned then users has email notification enabled
		If NOT rsCommon.EOF Then blnReplyNotify = True
		
		'Close RS	
		rsCommon.Close
	End If
	
	
	
	%><!--#include file="includes/quick_reply_form_inc.asp" --><%
End If




%>
<br />
<table class="basicTable" cellspacing="0" cellpadding="3" align="center">
 <tr>
  <td valign="top">
   <!-- #include file="includes/forum_jump_inc.asp" -->
  </td>
  <td align="right" class="smText" nowrap><!-- #include file="includes/show_forum_permissions_inc.asp" --></td>
 </tr>
</table>
<br />
<div align="center"><%

'Clear server objects
Call closeDatabase()


'***** START WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
If blnLCode = True Then
	If blnTextLinks = True Then
		Response.Write("<span class=""text"" style=""font-size:10px"">Bulletin Board Software by <a href=""http://www.webwizforums.com"" target=""_blank"" style=""font-size:10px"">Web Wiz Forums&reg;</a> version " & strVersion & "</span>")
		If blnACode Then Response.Write("<span class=""text"" style=""font-size:10px""> [Free Express Edition]")
	Else
  		Response.Write("<a href=""http://www.webwizforums.com"" target=""_blank""><img src=""webwizforums_image.asp"" border=""0"" title=""Bulletin Board Software by Web Wiz Forums&reg; version " & strVersion & """ alt=""Bulletin Board Software by Web Wiz Forums&reg; version " & strVersion& """ /></a>")
  		If blnACode Then Response.Write("<br /><span class=""text"" style=""font-size:10px"">Powered by Web Wiz Forums Free Express Edition</span>")
	End If
	
	Response.Write("<br /><span class=""text"" style=""font-size:10px"">Copyright &copy;2001-2010 <a href=""http://www.webwizguide.com"" target=""_blank"" style=""font-size:10px"">Web Wiz</a></span>")
End If
'***** END WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******



'Display the process time
If blnShowProcessTime Then Response.Write("<span class=""smText""><br /><br />" & strTxtThisPageWasGeneratedIn & " " & FormatNumber(Timer() - dblStartTime, 3) & " " & strTxtSeconds & "</span>")


Response.Write("</div>")

'Display an alert message if the user is watching this topic for email notification
If Request.QueryString("EN") = "TS" Then
	Response.Write("<script language=""JavaScript"">")
	Response.Write("alert('" & strTxtYouWillNowBeNotifiedOfAllReplies & "');")
	Response.Write("</script>")
End If

'Display an alert message if the user is not watching this topic for email notification
If Request.QueryString("EN") = "TU" Then
	Response.Write("<script language=""JavaScript"">")
	Response.Write("alert('" & strTxtYouWillNowNOTBeNotifiedOfAllReplies & "');")
	Response.Write("</script>")
End If

'Display an alert message if the user is posting in a moderated forum
If Request.QueryString("MF") = "Y" Then
	Response.Write("<script language=""JavaScript"">")
	Response.Write("alert('" & strTxtYouArePostingModeratedForum & " \n\n " & strTxtBeforePostDisplayedAuthorised & "');")
	Response.Write("</script>")
End If

%>
<!-- #include file="includes/footer.asp" -->