<% @ Language=VBScript %>
<% Option Explicit %>
<!-- #include file="includes/global_variables_inc.asp" -->
<!-- #include file="includes/setup_options_inc.asp" -->
<!-- #include file="includes/version_inc.asp" -->
<!-- #include file="database/database_connection.asp" -->
<!-- #include file="functions/functions_common.asp" -->
<!-- #include file="functions/functions_filters.asp" -->
<!-- #include file="functions/functions_format_post.asp" -->
<!-- #include file="language_files/language_file_inc.asp" -->
<!-- #include file="language_files/RTE_language_file_inc.asp" -->
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
Response.Buffer	= True

'Open database connection
Call openDatabase(strCon)

'Load in configuration data
Call getForumConfigurationData()

'If RSS is not enabled send the user away
If blnRSS = False Then

	'Clear server objects
	Call closeDatabase()

	'Redirect
	Response.Redirect("default.asp")
End If

'Include the date time format hear, incase a database hit is required if the date and time data is not in the web servers memory
%><!-- #include file="functions/functions_date_time_format.asp" --><%


'Declare variables
Dim sarryRssTopics	'Holds the RSS Feed recordset
Dim intCurrentRecord	'Holds the current record in the array
Dim strForumName	'Holds the forum name
Dim lngTopicID		'Holds the topic ID
Dim strSubject		'Holds the subject
Dim lngMessageID	'Holds the message ID
Dim dtmMessageDate	'Holds the message date
Dim lngAuthorID		'Holds the author ID
Dim strUsername		'Holds sthe authros user name
Dim strMessage		'Holds the post
Dim strRssChannelTitle	'Holds the channel name
Dim strTimeZone		'Holds the time zone for the feed
Dim dtmLastEntryDate	'Holds the date of the last message
Dim intRSSLoopCounter	'Loop counter


'This is the number of posts to include in the feed
Const intMaxResults = 10

'This is the Time to Live value so that RSS News Readers know how often to update their feed,
'if this is set to low you may consume to much bandwidth, to high and the RSS News Reader may not be updated fast enough
Const intTimeToLive = 30

'Set this to the time zone you require
strTimeZone = "+0000" 'See http://www.sendmail.org/rfc/0822.html#5 for list of time zones

'Initliase variables
intForumID = 0
strRssChannelTitle = strMainForumName


'Set the content type for feed
Response.ContentType = "application/xml"




'Read in the forum ID
If isNumeric(Request.QueryString("FID")) Then intForumID = CInt(Request.QueryString("FID"))



'Get the last x posts from the database
strSQL = "" & _
"SELECT "
If strDatabaseType = "SQLServer" OR strDatabaseType = "Access" Then
	strSQL = strSQL & " TOP " & intMaxResults & " "
End If
strSQL = strSQL & _
"" & strDbTable & "Forum.Forum_name, " & strDbTable & "Topic.Topic_ID, " & strDbTable & "Topic.Subject, " & strDbTable & "Thread.Thread_ID, " & strDbTable & "Thread.Message_date, " & strDbTable & "Author.Author_ID, " & strDbTable & "Author.Username, " & strDbTable & "Thread.Message  " & _
"FROM " & strDbTable & "Forum, " & strDbTable & "Topic, " & strDbTable & "Author, " & strDbTable & "Thread " & _
"WHERE " & strDbTable & "Forum.Forum_ID = " & strDbTable & "Topic.Forum_ID " & _
	"AND " & strDbTable & "Topic.Topic_ID = " & strDbTable & "Thread.Topic_ID " & _
	"AND " & strDbTable & "Author.Author_ID = " & strDbTable & "Thread.Author_ID "

'If looking at a forum only, only get posts from tha forum
If intForumID <> 0 Then strSQL = strSQL & "AND " & strDbTable & "Topic.Forum_ID = " & intForumID & " "

'Check permissions
strSQL = strSQL & _
	"AND (" & strDbTable & "Topic.Forum_ID " & _
		"IN (" & _
			"SELECT " & strDbTable & "Permissions.Forum_ID " & _
			"FROM " & strDbTable & "Permissions" & strDBNoLock & " " & _
			"WHERE (" & strDbTable & "Permissions.Group_ID = 2) " & _
				"AND " & strDbTable & "Permissions.View_Forum = " & strDBTrue & _
		")" & _
	")"

'Don't include password protected forums
strSQL = strSQL & "AND (" & strDbTable & "Forum.Password = '' OR " & strDbTable & "Forum.Password Is Null) "


strSQL = strSQL & "AND (" & strDbTable & "Topic.Hide = " & strDBFalse & " AND " & strDbTable & "Thread.Hide = " & strDBFalse & ") " & _
"ORDER BY " & strDbTable & "Thread.Thread_ID DESC"

'mySQL limit operator
If strDatabaseType = "mySQL" Then
	strSQL = strSQL & " LIMIT " & intMaxResults
End If
strSQL = strSQL & ";"


'Set error trapping
On Error Resume Next

'Query the database
rsCommon.Open strSQL, adoCon


'If an error has occurred write an error to the page
If Err.Number <> 0 AND  strDatabaseType = "mySQL" Then
	Call errorMsg("An error has occurred while executing SQL query on database.<br />Please check that the MySQL Server version is 4.1 or above.", "get_RSS_topic_data", "RSS_topic_feed.asp")
ElseIf Err.Number <> 0 Then
	Call errorMsg("An error has occurred while executing SQL query on database.", "get_RSS_topic_data", "RSS_topic_feed.asp")
End If

'Disable error trapping
On Error goto 0



'Read in db results
If NOT rsCommon.EOF Then


	'Get the channel name
	If intForumID <> 0 Then strRssChannelTitle = strRssChannelTitle & " : " & rsCommon("Forum_name")

	'Get the date of the last entry for the build date
	dtmLastEntryDate = CDate(rsCommon("Message_date"))

	'Place the db results into an array
	sarryRssTopics = rsCommon.GetRows()
End If

'Close the recordset
rsCommon.Close

'RS array lookup table
'0 = tblForum.Forum_name
'1 = tblTopic.Topic_ID
'2 = tblTopic.Subject
'3 = tblThread.Thread_ID
'4 = tblThread.Message_date
'5 = tblAuthor.Author_ID
'6 = tblAuthor.Username
'7 = tblThread.Message



'Clear server objects
Call closeDatabase()


'Clean up channel name to prevent errors
strRssChannelTitle = Server.HTMLEncode(strRssChannelTitle)
strMainForumName = Server.HTMLEncode(strMainForumName)



%><?xml version="1.0" encoding="<% = strPageEncoding %>" ?>
<?xml-stylesheet type="text/xsl" href="RSS_xslt_style.asp" version="1.0" ?>
<rss version="2.0" xmlns:WebWizForums="http://syndication.webwizguide.com/rss_namespace/">
 <channel>
  <title><% = strRssChannelTitle %></title>
  <link><% = strForumPath %></link>
  <description><% = strTxtThisIsAnXMLFeedOf %>; <% = strRssChannelTitle & " : " & strTxtLast & " " & intMaxResults & " " & strTxtPosts %></description><%

If blnLCode Then
	%>
  <copyright>Copyright (c) 2006-2009 Web Wiz Forums - All Rights Reserved.</copyright><%
End If

%>
  <pubDate><% = RssDateFormat(Now(), strTimeZone) %></pubDate>
  <lastBuildDate><% = RssDateFormat(dtmLastEntryDate, strTimeZone) %></lastBuildDate>
  <docs>http://blogs.law.harvard.edu/tech/rss</docs>
  <generator>Web Wiz Forums <% = strVersion %></generator>
  <ttl><% = intTimeToLive %></ttl>
  <WebWizForums:feedURL><% = Replace(strForumPath, "http://", "") %>RSS_topic_feed.asp<% If intForumID <> 0 Then Response.Write("?FID=" & intForumID) %></WebWizForums:feedURL><%

'If there is a title image for the forum display it
If strTitleImage <> "" Then
%>
  <image>
   <title><% = strMainForumName %></title>
   <url><% = strForumPath & strTitleImage %></url>
   <link><% = strForumPath %></link>
  </image><%

End If


'If there are records we need to display them
If isArray(sarryRssTopics) Then

	'Loop throug recordset to display the topics
	Do While intCurrentRecord <= Ubound(sarryRssTopics, 2)

		'RS array lookup table
		'0 = tblForum.Forum_name
		'1 = tblTopic.Topic_ID
		'2 = tblTopic.Subject
		'3 = tblThread.Thread_ID
		'4 = tblThread.Message_date
		'5 = tblAuthor.Author_ID
		'6 = tblAuthor.Username
		'7 = tblThread.Message


		'Read in db details for RSS feed
		strForumName = sarryRssTopics(0, intCurrentRecord)
		lngTopicID = CLng(sarryRssTopics(1, intCurrentRecord))
		strSubject = sarryRssTopics(2, intCurrentRecord)
		lngMessageID = CLng(sarryRssTopics(3, intCurrentRecord))
		dtmMessageDate = CDate(sarryRssTopics(4, intCurrentRecord))
		lngAuthorID = CLng(sarryRssTopics(5, intCurrentRecord))
		strUsername = sarryRssTopics(6, intCurrentRecord)
		strMessage = sarryRssTopics(7, intCurrentRecord)



		'If the post contains a quote or code block then format it
		If InStr(1, strMessage, "[QUOTE=", 1) > 0 AND InStr(1, strMessage, "[/QUOTE]", 1) > 0 Then strMessage = formatUserQuote(strMessage)
		If InStr(1, strMessage, "[QUOTE]", 1) > 0 AND InStr(1, strMessage, "[/QUOTE]", 1) > 0 Then strMessage = formatQuote(strMessage)
		If InStr(1, strMessage, "[CODE]", 1) > 0 AND InStr(1, strMessage, "[/CODE]", 1) > 0 Then strMessage = formatCode(strMessage)


		'If the post contains a flash link then format it
		If blnFlashFiles Then
			If InStr(1, strMessage, "[FLASH", 1) > 0 AND InStr(1, strMessage, "[/FLASH]", 1) > 0 Then strMessage = formatFlash(strMessage)
		End If


		'If the message has been edited parse the 'edited by' XML into HTML for the post
		If InStr(1, strMessage, "<edited>", 1) Then strMessage = editedXMLParser(strMessage)




		'Format	the post to be sent with the e-mail
		strMessage = "<strong>" & strTxtAuthor & ":</strong> <a href=""" & strForumPath & "member_profile.asp?PF=" & lngAuthorID & """ rel=""nofollow"">" & strUsername & "</a>" & _
		"<br /><strong>" & strTxtSubject & ":</strong> " & sarryRssTopics(2, intCurrentRecord) & _
		"<br /><strong>" & strTxtPosted & "</strong> " & stdDateFormat(dtmMessageDate, True) & " " & strTxtAt & " " & TimeFormat(dtmMessageDate) & "<br /><br />" & _
		strMessage

		'Change	the path to the	emotion	symbols	to include the path to the images
		strMessage = Replace(strMessage, "src=""smileys/", "src=""" & strForumPath & "smileys/", 1, -1, 1)

		'Replace [] with HTML econded
		strMessage = Replace(strMessage, "[", "&#091;", 1, -1, 1)
		strMessage = Replace(strMessage, "]", "&#093;", 1, -1, 1)

		'Remove line breaks
		strMessage = Replace(strMessage, vbCrLf, "", 1, -1, 1)

%>
  <item>
   <title><% = Server.HTMLEncode(strForumName) %> : <% = strSubject %></title>
   <link><% = strForumPath & "forum_posts.asp?TID=" & lngTopicID & "&amp;PID=" & lngMessageID & "#" & lngMessageID %></link>
   <description>
    <![CDATA[<% = strMessage %>]]>
   </description>
   <pubDate><% = RssDateFormat(dtmMessageDate, strTimeZone) %></pubDate>
   <guid isPermaLink="true"><% = strForumPath & "forum_posts.asp?TID=" & lngTopicID & "&amp;PID=" & lngMessageID & "#" & lngMessageID %></guid>
  </item> <%

  		'Increment the record position
  		intCurrentRecord = intCurrentRecord + 1

  	Loop

End If

%>
 </channel>
</rss>