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





'Let the user know the database is being created
Response.Write(vbCrLf & "<script language=""JavaScript"">" & _
vbCrLf & "	document.getElementById('displayState').innerHTML = 'Your Database is being created. Please be patient as this may take a few minutes to complete.';" & _
vbCrLf & "</script>")







'Resume on all errors
On Error Resume Next


'intialise variables
blnErrorOccured = False

'If a username and password is entred then start the ball rolling
If strDatabaseType = "mySQL" AND strSQLDBUserName <> "" Then
	
	

	'Open the database
	Call openDatabase(strCon)

	'If an error has occurred write an error to the page
	If Err.Number <> 0 Then
		
		
		
		Response.Write(vbCrLf & "<script language=""JavaScript"">" & _
		vbCrLf & "	document.getElementById('displayState').innerHTML = '<img src=""forum_images/error.png"" alt=""Error"" /> <strong>Error</strong><br /><strong>Error Connecting to database on mySQL Server</strong><br /><br />Replace the database/database_settings.asp file with the one from the orginal Web Wiz Forums download and start the setup process again.<br /><br /><strong>Error Details:</strong><br />" & Err.description & "';" & _
		vbCrLf & "</script>")

		
	Else
		
		
		'Check to see if the database is already created

		'Intialise the main ADO recordset object
		Set rsCommon = CreateObject("ADODB.Recordset")
		
		'Get the admin account
		strSQL = "SELECT " & strDbTable & "Author.Username " & _
		"FROM " & strDbTable & "Author " & _
		"WHERE " & strDbTable & "Author.Author_ID = 1;"
		
		'Query the database
		rsCommon.Open strSQL, adoCon
		
		'If no error occured the database has been created
		If CLng(Err.Number) = 0 Then
			
			Response.Write(vbCrLf & "<script language=""JavaScript"">" & _
			vbCrLf & "	document.getElementById('displayState').innerHTML = '<img src=""forum_images/error.png"" alt=""Error"" /> <strong>Error</strong><br /><strong>The Database Setup Wizard has detected that your database has already been created.</strong><br /><br />Click here to go to your <a href=""default.asp"">Web Wiz Forum Homepage</a>.';" & _
			vbCrLf & "</script>")
			
			
			Set rsCommon = Nothing
		
		'Create the database
		Else

			'Reset error object
			Err.Number = 0
			Set rsCommon = Nothing


'******************************************
'***  		Create the tables     *****
'******************************************

			'Create the Category Table
			strSQL = "CREATE TABLE " & strDbTable & "Category ("
			strSQL = strSQL & "Cat_ID INT NOT NULL auto_increment, "
			strSQL = strSQL & "Cat_name varchar(60) NOT NULL , "
			strSQL = strSQL & "Cat_order smallint(4) NOT NULL DEFAULT '1' , "
			strSQL = strSQL & "PRIMARY KEY (Cat_ID));"
	
			'Write to the database
			adoCon.Execute(strSQL)
	
			'If an error has occurred write an error to the page
			If Err.Number <> 0 Then
	
				'Write an error message
				Response.Write(vbCrLf & "<script language=""JavaScript"">" & _
				vbCrLf & "document.getElementById('displayState').innerHTML = document.getElementById('displayState').innerHTML + '<br /><br />Error Creating the Table " & strDbTable & "Category <br />" & Err.description & ".';" & _
				vbCrLf & "</script>")
	
				'Reset error object
				Err.Number = 0
	
				'Set the error boolean to True
				blnErrorOccured = True
			End If
	
	
			'Create the Forum Table
			strSQL = "CREATE TABLE " & strDbTable & "Forum ("
			strSQL = strSQL & "Forum_ID INT NOT NULL auto_increment, "
			strSQL = strSQL & "Cat_ID INT NULL ,"
			strSQL = strSQL & "Sub_ID INT NOT NULL DEFAULT '0',"
			strSQL = strSQL & "Forum_Order smallint(4) NOT NULL DEFAULT '0',"
			strSQL = strSQL & "Forum_name varchar(70) NULL ,"
			strSQL = strSQL & "Forum_description varchar(200) NULL ,"
			strSQL = strSQL & "No_of_topics INT NOT NULL DEFAULT '0',"
			strSQL = strSQL & "No_of_posts INT NOT NULL DEFAULT '0',"
			strSQL = strSQL & "Last_post_author_ID INT NOT NULL DEFAULT '1',"
			strSQL = strSQL & "Last_post_date datetime NULL, "
			strSQL = strSQL & "Last_topic_ID  INT NOT NULL DEFAULT '0', "
			strSQL = strSQL & "Password varchar(50) NULL ,"
			strSQL = strSQL & "Forum_code varchar(40) NULL ,"
			strSQL = strSQL & "Show_topics smallint(4) NULL, "
			strSQL = strSQL & "Locked tinyint(1) NOT NULL DEFAULT '0',"
			strSQL = strSQL & "Hide tinyint(1) NOT NULL DEFAULT '0',"
			strSQL = strSQL & "PRIMARY KEY (Forum_ID));"
			
			'Write to the database
			adoCon.Execute(strSQL)
	
			'If an error has occurred write an error to the page
			If Err.Number <> 0 Then
				
				
				'Write an error message
				Response.Write(vbCrLf & "<script language=""JavaScript"">" & _
				vbCrLf & "document.getElementById('displayState').innerHTML = document.getElementById('displayState').innerHTML + '<br /><br />Error Creating the Table " & strDbTable & "Forum<br />" & Err.description & ".';" & _
				vbCrLf & "</script>")
	
				'Reset error object
				Err.Number = 0
	
				'Set the error boolean to True
				blnErrorOccured = True
			End If
	
	
			'Create the Topic Table
			strSQL = "CREATE TABLE " & strDbTable & "Topic ("
			strSQL = strSQL & "Topic_ID INT NOT NULL auto_increment, "
			strSQL = strSQL & "Forum_ID INT NULL ,"
			strSQL = strSQL & "Poll_ID INT NOT NULL DEFAULT '0',"
			strSQL = strSQL & "Moved_ID INT NOT NULL DEFAULT '0',"
			strSQL = strSQL & "Subject varchar(70) NOT NULL,"
			strSQL = strSQL & "Icon varchar(20) NULL,"
			strSQL = strSQL & "Start_Thread_ID INT NULL,"
			strSQL = strSQL & "Last_Thread_ID INT NULL,"
			strSQL = strSQL & "No_of_replies INT NOT NULL DEFAULT '0',"
			strSQL = strSQL & "No_of_views INT NOT NULL DEFAULT '0',"
			strSQL = strSQL & "Priority smallint(4) NOT NULL, "
			strSQL = strSQL & "Locked tinyint(1) NOT NULL DEFAULT '0',"
			strSQL = strSQL & "Hide tinyint(1) NOT NULL DEFAULT '0',"
			strSQL = strSQL & "Event_date datetime NULL,"
			strSQL = strSQL & "Event_date_end datetime NULL,"
			strSQL = strSQL & "PRIMARY KEY (Topic_ID));"
	
			'Write to the database
			adoCon.Execute(strSQL)
	
			'If an error has occurred write an error to the page
			If Err.Number <> 0 Then
				Response.Write(vbCrLf & "<script language=""JavaScript"">" & _
				vbCrLf & "document.getElementById('displayState').innerHTML = document.getElementById('displayState').innerHTML + '<br /><br />Error Creating the Table " & strDbTable & "Topic <br />" & Err.description & ".';" & _
				vbCrLf & "</script>")
	
				'Reset error object
				Err.Number = 0
	
				'Set the error boolean to True
				blnErrorOccured = True
			End If
	
	
			'Create the Thread Table
			strSQL = "CREATE TABLE " & strDbTable & "Thread ("
			strSQL = strSQL & "Thread_ID INT NOT NULL auto_increment, "
			strSQL = strSQL & "Topic_ID INT NOT NULL ,"
			strSQL = strSQL & "Author_ID INT NULL ,"
			strSQL = strSQL & "Message_date datetime NOT NULL ,"
			strSQL = strSQL & "IP_addr varchar(30) NULL, "
			strSQL = strSQL & "Show_signature tinyint(1) NOT NULL DEFAULT '0', "
			strSQL = strSQL & "Hide tinyint(1) NOT NULL DEFAULT '0', "
			strSQL = strSQL & "Message text NULL ,"
			strSQL = strSQL & "PRIMARY KEY (Thread_ID));"
			
			'Write to the database
			adoCon.Execute(strSQL)
	
			'If an error has occurred write an error to the page
			If Err.Number <> 0 Then
				Response.Write(vbCrLf & "<script language=""JavaScript"">" & _
				vbCrLf & "document.getElementById('displayState').innerHTML = document.getElementById('displayState').innerHTML + '<br /><br />Error Creating the Table " & strDbTable & "Thread <br />" & Err.description & ".';" & _
				vbCrLf & "</script>")
	
				'Reset error object
				Err.Number = 0
	
				'Set the error boolean to True
				blnErrorOccured = True
			End If
	
	
	
			'Create the Author Table
			strSQL = "CREATE TABLE " & strDbTable & "Author ("
			strSQL = strSQL & "Author_ID INT NOT NULL auto_increment, "
			strSQL = strSQL & "Group_ID INT NOT NULL ,"
			strSQL = strSQL & "Username varchar(35) NOT NULL ,"
			strSQL = strSQL & "Real_name varchar(40) NULL ,"
			strSQL = strSQL & "User_code varchar(50) NOT NULL ,"
			strSQL = strSQL & "Password varchar(50) NOT NULL ,"
			strSQL = strSQL & "Salt varchar(30) NULL ,"
			strSQL = strSQL & "Author_email varchar(75) NULL ,"
			strSQL = strSQL & "Gender varchar(10) NULL ,"
			strSQL = strSQL & "Photo varchar(100) NULL ,"
			strSQL = strSQL & "Homepage varchar(50) NULL ,"
			strSQL = strSQL & "Location varchar(60) NULL ,"
			strSQL = strSQL & "MSN varchar(75) NULL ,"
			strSQL = strSQL & "Yahoo varchar(75) NULL ,"
			strSQL = strSQL & "ICQ varchar(20) NULL ,"
			strSQL = strSQL & "AIM varchar(75) NULL ,"
			strSQL = strSQL & "Occupation varchar(60) NULL ,"
			strSQL = strSQL & "Interests varchar(160) NULL ,"
			strSQL = strSQL & "DOB datetime NULL ,"
			strSQL = strSQL & "Signature varchar(255) NOT NULL DEFAULT '',"
			strSQL = strSQL & "No_of_posts INT NOT NULL DEFAULT '0',"
			strSQL = strSQL & "Join_date datetime NOT NULL , "
			strSQL = strSQL & "Avatar varchar(100) NULL ,"
			strSQL = strSQL & "Avatar_title varchar(70) NULL ,"
			strSQL = strSQL & "Last_visit datetime NOT NULL , "
			strSQL = strSQL & "Time_offset varchar(1) NOT NULL ,"
			strSQL = strSQL & "Time_offset_hours smallint(4) NOT NULL ,"
			strSQL = strSQL & "Date_format varchar(10) NULL ,"
			strSQL = strSQL & "No_of_PM INT NOT NULL DEFAULT '0',"
			strSQL = strSQL & "Show_email tinyint(1) NOT NULL ,"
			strSQL = strSQL & "Attach_signature tinyint(1) NOT NULL ,"
			strSQL = strSQL & "Active tinyint(1) NOT NULL ,"
			strSQL = strSQL & "Rich_editor tinyint(1) NOT NULL ,"
			strSQL = strSQL & "Reply_notify tinyint(1) NOT NULL ,"
			strSQL = strSQL & "PM_notify tinyint(1) NOT NULL, "
			strSQL = strSQL & "Skype varchar(30) NULL ,"
			strSQL = strSQL & "Login_attempt INT NOT NULL DEFAULT '0',"
			strSQL = strSQL & "Banned tinyint(1) NOT NULL DEFAULT '0',"
			strSQL = strSQL & "Newsletter tinyint(1) NOT NULL DEFAULT '0',"
			strSQL = strSQL & "Info varchar(255) NOT NULL ,"
			strSQL = strSQL & "PRIMARY KEY (Author_ID));"
	
			'Write to the database
			adoCon.Execute(strSQL)
			
	
	
	
	
			'If an error has occurred write an error to the page
			If Err.Number <> 0 Then
				Response.Write(vbCrLf & "<script language=""JavaScript"">" & _
				vbCrLf & "document.getElementById('displayState').innerHTML = document.getElementById('displayState').innerHTML + '<br /><br />Error Creating the Table " & strDbTable & "Author <br />" & Err.description & ".';" & _
				vbCrLf & "</script>")
	
				'Reset error object
				Err.Number = 0
	
				'Set the error boolean to True
				blnErrorOccured = True
			End If
	
	
	
			'Create the Private messages table
			strSQL = "CREATE TABLE " & strDbTable & "PMMessage ("
			strSQL = strSQL & "PM_ID MEDIUMINT NOT NULL auto_increment, "
			strSQL = strSQL & "Author_ID INT NOT NULL ,"
			strSQL = strSQL & "From_ID INT NOT NULL ,"
			strSQL = strSQL & "PM_Tittle varchar(70) NOT NULL ,"
			strSQL = strSQL & "PM_Message text NOT NULL ," 'This is set to a text datatype inorder to hold large posts as varchar has 4,000 limit and varchar an 8,000 limit
			strSQL = strSQL & "PM_Message_date datetime NOT NULL , "
			strSQL = strSQL & "Read_Post tinyint(1) NOT NULL DEFAULT '0',"
			strSQL = strSQL & "Email_notify tinyint(1) NOT NULL DEFAULT '0',"
			strSQL = strSQL & "PRIMARY KEY (PM_ID));"
	
			'Write to the database
			adoCon.Execute(strSQL)
	
			'If an error has occurred write an error to the page
			If Err.Number <> 0 Then
				Response.Write(vbCrLf & "<script language=""JavaScript"">" & _
				vbCrLf & "document.getElementById('displayState').innerHTML = document.getElementById('displayState').innerHTML + '<br /><br />Error Creating the Table " & strDbTable & "PMMessage <br />" & Err.description & ".';" & _
				vbCrLf & "</script>")
	
				'Reset error object
				Err.Number = 0
	
				'Set the error boolean to True
				blnErrorOccured = True
			End If
	
	
	
			'Create the Buddy List table
			strSQL = "CREATE TABLE " & strDbTable & "BuddyList ("
			strSQL = strSQL & "Address_ID INT NOT NULL auto_increment, "
			strSQL = strSQL & "Author_ID INT NOT NULL ,"
			strSQL = strSQL & "Buddy_ID INT NOT NULL ,"
			strSQL = strSQL & "Description varchar(60) NOT NULL ,"
			strSQL = strSQL & "Block tinyint(1) NOT NULL DEFAULT '0', "
			strSQL = strSQL & "PRIMARY KEY (Address_ID));"
	
			'Write to the database
			adoCon.Execute(strSQL)
	
			'If an error has occurred write an error to the page
			If Err.Number <> 0 Then
				Response.Write(vbCrLf & "<script language=""JavaScript"">" & _
				vbCrLf & "document.getElementById('displayState').innerHTML = document.getElementById('displayState').innerHTML + '<br /><br />Error Creating the Table " & strDbTable & "BuddyList <br />" & Err.description & ".';" & _
				vbCrLf & "</script>")
	
				'Reset error object
				Err.Number = 0
	
				'Set the error boolean to True
				blnErrorOccured = True
			End If
	
	
	
	
	
			'Create the Configuration Table
			strSQL = "CREATE TABLE " & strDbTable & "Configuration ("
			strSQL = strSQL & "ID smallint(4) NOT NULL auto_increment, "
			strSQL = strSQL & "website_name varchar(50)  NOT NULL  ,"
			strSQL = strSQL & "forum_name varchar(50)  NULL, "
			strSQL = strSQL & "forum_path varchar(70)  NULL ,"
			strSQL = strSQL & "website_path varchar(70)  NULL ,"
			strSQL = strSQL & "forum_email_address varchar(50)  NULL ,"
			strSQL = strSQL & "email_notify tinyint(1) NOT NULL ,"
			strSQL = strSQL & "mail_component varchar(10)  NULL ,"
			strSQL = strSQL & "mail_server varchar(60)  NULL ,"
			strSQL = strSQL & "IE_editor tinyint(1) NOT NULL ,"
			strSQL = strSQL & "L_code varchar(15) NULL ,"
			strSQL = strSQL & "Topics_per_page smallint(4) NULL ,"
			strSQL = strSQL & "Title_image varchar(70)  NULL ,"
			strSQL = strSQL & "Text_link tinyint(1) NOT NULL ,"
			strSQL = strSQL & "Emoticons tinyint(1) NOT NULL ,"
			strSQL = strSQL & "Avatar tinyint(1) NOT NULL, "
			strSQL = strSQL & "Email_activate tinyint(1) NOT NULL, "
			strSQL = strSQL & "Email_post tinyint(1) NOT NULL, "
			strSQL = strSQL & "Hot_views smallint(4) NULL, "
			strSQL = strSQL & "Hot_replies smallint(4) NOT NULL, "
			strSQL = strSQL & "Private_msg tinyint(1) NOT NULL, "
			strSQL = strSQL & "No_of_priavte_msg smallint(4) NULL, "
			strSQL = strSQL & "Threads_per_page smallint(4) NULL, "
			strSQL = strSQL & "Spam_seconds smallint(4) NULL, "
			strSQL = strSQL & "Spam_minutes smallint(4) NULL, "
			strSQL = strSQL & "Vote_choices smallint(4) NULL, "
			strSQL = strSQL & "Email_sys tinyint(1) NOT NULL, "
			strSQL = strSQL & "Upload_img_types varchar(50) NULL, "
			strSQL = strSQL & "Upload_img_size smallint(4) NULL, "
			strSQL = strSQL & "Upload_files_path varchar(50) NULL, "
			strSQL = strSQL & "Upload_files_type varchar(50) NULL, "
			strSQL = strSQL & "Upload_files_size smallint(4) NULL, "
			strSQL = strSQL & "Upload_avatar tinyint(1) NOT NULL, "
			strSQL = strSQL & "Upload_avatar_types varchar(50) NULL, "
			strSQL = strSQL & "Upload_avatar_size smallint(4) NULL, "
			strSQL = strSQL & "Upload_component varchar(10) NULL, "
			strSQL = strSQL & "Upload_allocation smallint(4) NULL, "
			strSQL = strSQL & "Active_users tinyint(1) NOT NULL, "
			strSQL = strSQL & "Forums_closed tinyint(1) NOT NULL, "
			strSQL = strSQL & "Show_edit tinyint(1) NOT NULL, "
			strSQL = strSQL & "Process_time tinyint(1) NOT NULL, "
			strSQL = strSQL & "Flash tinyint(1) NOT NULL, "
			strSQL = strSQL & "Show_mod tinyint(1) NOT NULL, "
			strSQL = strSQL & "Reg_closed tinyint(1) NOT NULL, "
			strSQL = strSQL & "Mail_username varchar(50) NULL, "
			strSQL = strSQL & "Mail_password varchar(50) NULL, "
			strSQL = strSQL & "Topic_icon tinyint(1) NOT NULL, "
			strSQL = strSQL & "Long_reg tinyint(1) NOT NULL, "
			strSQL = strSQL & "CAPTCHA tinyint(1) NOT NULL, "
			strSQL = strSQL & "Skin_file varchar(50) NULL, "
			strSQL = strSQL & "Skin_image_path varchar(50) NULL, "
			strSQL = strSQL & "Skin_nav_spacer varchar(15) NULL, "
			strSQL = strSQL & "Guest_SID tinyint(1) NOT NULL, "
			strSQL = strSQL & "Calendar tinyint(1) NOT NULL, "
			strSQL = strSQL & "Member_approve tinyint(1) NOT NULL, "
			strSQL = strSQL & "RSS tinyint(1) NOT NULL, "
			strSQL = strSQL & "Install_ID varchar(15) NULL, "
			strSQL = strSQL & "PM_Flood smallint(4) NULL, "
			strSQL = strSQL & "A_code tinyint(1) NOT NULL, "
			strSQL = strSQL & "NewsPad tinyint(1) NOT NULL, "
			strSQL = strSQL & "NewsPad_URL varchar(100) NULL, "
			strSQL = strSQL & "PRIMARY KEY (ID));"
	
			'Write to the database
			adoCon.Execute(strSQL)
	
			'If an error has occurred write an error to the page
			If Err.Number <> 0 Then
				Response.Write(vbCrLf & "<script language=""JavaScript"">" & _
				vbCrLf & "document.getElementById('displayState').innerHTML = document.getElementById('displayState').innerHTML + '<br /><br />Error Creating the Table " & strDbTable & "Configuration <br />" & Err.description & ".';" & _
				vbCrLf & "</script>")
	
				'Reset error object
				Err.Number = 0
	
				'Set the error boolean to True
				blnErrorOccured = True
			End If
	
	
	
			'Create the Date Time Table
			strSQL = "CREATE TABLE " & strDbTable & "DateTimeFormat ("
			strSQL = strSQL & "ID smallint(4) NOT NULL auto_increment, "
			strSQL = strSQL & "Date_format varchar(10)  NOT NULL  ,"
			strSQL = strSQL & "Year_format varchar(6)  NULL ,"
			strSQL = strSQL & "Seporator varchar(15)  NULL ,"
			strSQL = strSQL & "Month1 varchar(15)  NULL ,"
			strSQL = strSQL & "Month2 varchar(15)  NULL ,"
			strSQL = strSQL & "Month3 varchar(15)  NULL ,"
			strSQL = strSQL & "Month4 varchar(15)  NULL ,"
			strSQL = strSQL & "Month5 varchar(15)  NULL ,"
			strSQL = strSQL & "Month6 varchar(15)  NULL ,"
			strSQL = strSQL & "Month7 varchar(15)  NULL ,"
			strSQL = strSQL & "Month8 varchar(15)  NULL ,"
			strSQL = strSQL & "Month9 varchar(15)  NULL ,"
			strSQL = strSQL & "Month10 varchar(15)  NULL ,"
			strSQL = strSQL & "Month11 varchar(15)  NULL ,"
			strSQL = strSQL & "Month12 varchar(15)  NULL ,"
			strSQL = strSQL & "Time_format smallint(4) NULL ,"
			strSQL = strSQL & "am varchar(6)  NULL ,"
			strSQL = strSQL & "pm varchar(6)  NULL, "
			strSQL = strSQL & "Time_offset varchar(1) NOT NULL ,"
			strSQL = strSQL & "Time_offset_hours smallint(4) NOT NULL ,"
			strSQL = strSQL & "PRIMARY KEY (ID));"
	
			'Write to the database
			adoCon.Execute(strSQL)
	
			'If an error has occurred write an error to the page
			If Err.Number <> 0 Then
				Response.Write(vbCrLf & "<script language=""JavaScript"">" & _
				vbCrLf & "document.getElementById('displayState').innerHTML = document.getElementById('displayState').innerHTML + '<br /><br />Error Creating the Table " & strDbTable & "DateTimeFormat <br />" & Err.description & ".';" & _
				vbCrLf & "</script>")
	
				'Reset error object
				Err.Number = 0
	
				'Set the error boolean to True
				blnErrorOccured = True
			End If
			
			
			
			
			'Create the Group Table
			strSQL = "CREATE TABLE " & strDbTable & "Group ("
			strSQL = strSQL & "Group_ID INT NOT NULL auto_increment, "
			strSQL = strSQL & "Name varchar(40) NULL ,"
			strSQL = strSQL & "Minimum_posts int(4) NOT NULL DEFAULT '0',"
			strSQL = strSQL & "Special_rank tinyint(1) NOT NULL ,"
			strSQL = strSQL & "Stars int(4) NOT NULL DEFAULT '0',"
			strSQL = strSQL & "Custom_stars varchar(80) NULL ,"
			strSQL = strSQL & "Starting_group tinyint(1) NOT NULL DEFAULT '0',"
			strSQL = strSQL & "Image_uploads tinyint(1) NOT NULL DEFAULT '0',"
			strSQL = strSQL & "File_uploads tinyint(1) NOT NULL DEFAULT '0',"
			strSQL = strSQL & "PRIMARY KEY (Group_ID));"
	
			'Write to the database
			adoCon.Execute(strSQL)
	
			'If an error has occurred write an error to the page
			If Err.Number <> 0 Then
				Response.Write(vbCrLf & "<script language=""JavaScript"">" & _
				vbCrLf & "document.getElementById('displayState').innerHTML = document.getElementById('displayState').innerHTML + '<br /><br />Error Creating the Table " & strDbTable & "Group <br />" & Err.description & ".';" & _
				vbCrLf & "</script>")
	
				'Reset error object
				Err.Number = 0
	
				'Set the error boolean to True
				blnErrorOccured = True
			End If
			
			
			
			'Create the Poll Table
			strSQL = "CREATE TABLE " & strDbTable & "Poll ("
			strSQL = strSQL & "Poll_ID INT NOT NULL auto_increment, "
			strSQL = strSQL & "Poll_question varchar(90) NOT NULL ,"
			strSQL = strSQL & "Multiple_votes tinyint(1) NOT NULL ,"
			strSQL = strSQL & "Reply tinyint(1) NOT NULL ,"
			strSQL = strSQL & "PRIMARY KEY (Poll_ID));"
	
			'Write to the database
			adoCon.Execute(strSQL)
	
			'If an error has occurred write an error to the page
			If Err.Number <> 0 Then
				Response.Write(vbCrLf & "<script language=""JavaScript"">" & _
				vbCrLf & "document.getElementById('displayState').innerHTML = document.getElementById('displayState').innerHTML + '<br /><br />Error Creating the Table " & strDbTable & "Poll <br />" & Err.description & ".';" & _
				vbCrLf & "</script>")
	
				'Reset error object
				Err.Number = 0
	
				'Set the error boolean to True
				blnErrorOccured = True
			End If
			
			
			
			'Create the Poll Choices Table
			strSQL = "CREATE TABLE " & strDbTable & "PollChoice ("
			strSQL = strSQL & "Choice_ID INT NOT NULL auto_increment, "
			strSQL = strSQL & "Poll_ID INT NOT NULL DEFAULT '0',"
			strSQL = strSQL & "Choice varchar(80) NOT NULL ,"
			strSQL = strSQL & "Votes INT NOT NULL DEFAULT '0',"
			strSQL = strSQL & "PRIMARY KEY (Choice_ID));"
	
			'Write to the database
			adoCon.Execute(strSQL)
	
			'If an error has occurred write an error to the page
			If Err.Number <> 0 Then
				Response.Write(vbCrLf & "<script language=""JavaScript"">" & _
				vbCrLf & "document.getElementById('displayState').innerHTML = document.getElementById('displayState').innerHTML + '<br /><br />Error Creating the Table " & strDbTable & "PollChoice <br />" & Err.description & ".';" & _
				vbCrLf & "</script>")
	
				'Reset error object
				Err.Number = 0
	
				'Set the error boolean to True
				blnErrorOccured = True
			End If
			
			
			
			'Create the Poll Votes Table
			strSQL = "CREATE TABLE " & strDbTable & "PollVote ("
			strSQL = strSQL & "Poll_ID INT NOT NULL DEFAULT '0',"
			strSQL = strSQL & "Author_ID INT NOT NULL DEFAULT '0');"
	
			'Write to the database
			adoCon.Execute(strSQL)
	
			'If an error has occurred write an error to the page
			If Err.Number <> 0 Then
				Response.Write(vbCrLf & "<script language=""JavaScript"">" & _
				vbCrLf & "document.getElementById('displayState').innerHTML = document.getElementById('displayState').innerHTML + '<br /><br />Error Creating the Table " & strDbTable & "PollVote <br />" & Err.description & ".';" & _
				vbCrLf & "</script>")
	
				'Reset error object
				Err.Number = 0
	
				'Set the error boolean to True
				blnErrorOccured = True
			End If
			
			
			
			'Create the Email Notify Table
			strSQL = "CREATE TABLE " & strDbTable & "EmailNotify ("
			strSQL = strSQL & "Watch_ID INT NOT NULL auto_increment, "
			strSQL = strSQL & "Author_ID INT NOT NULL DEFAULT '0',"
			strSQL = strSQL & "Forum_ID INT NOT NULL DEFAULT '0',"
			strSQL = strSQL & "Topic_ID INT NOT NULL DEFAULT '0',"
			strSQL = strSQL & "PRIMARY KEY (Watch_ID));"
	
			'Write to the database
			adoCon.Execute(strSQL)
	
			'If an error has occurred write an error to the page
			If Err.Number <> 0 Then
				Response.Write(vbCrLf & "<script language=""JavaScript"">" & _
				vbCrLf & "document.getElementById('displayState').innerHTML = document.getElementById('displayState').innerHTML + '<br /><br />Error Creating the Table " & strDbTable & "EmailNotify <br />" & Err.description & ".';" & _
				vbCrLf & "</script>")
	
				'Reset error object
				Err.Number = 0
	
				'Set the error boolean to True
				blnErrorOccured = True
			End If
			
			
			
			'Create the Permissions Table
			strSQL = "CREATE TABLE " & strDbTable & "Permissions ("
			strSQL = strSQL & "Group_ID INT NOT NULL DEFAULT '0',"
			strSQL = strSQL & "Author_ID INT NOT NULL DEFAULT '0',"
			strSQL = strSQL & "Forum_ID INT NOT NULL DEFAULT '0',"
			strSQL = strSQL & "View_Forum tinyint(1) NOT NULL ,"
			strSQL = strSQL & "Post tinyint(1) NOT NULL ,"
			strSQL = strSQL & "Reply_posts tinyint(1) NOT NULL ,"
			strSQL = strSQL & "Edit_posts tinyint(1) NOT NULL ,"
			strSQL = strSQL & "Delete_posts tinyint(1) NOT NULL ,"
			strSQL = strSQL & "Priority_posts tinyint(1) NOT NULL ,"
			strSQL = strSQL & "Poll_create tinyint(1) NOT NULL ,"
			strSQL = strSQL & "Vote tinyint(1) NOT NULL ,"
			strSQL = strSQL & "Attachments tinyint(1) NOT NULL ,"
			strSQL = strSQL & "Image_upload tinyint(1) NOT NULL ,"
			strSQL = strSQL & "Moderate tinyint(1) NOT NULL,"
			strSQL = strSQL & "Display_post tinyint(1) NOT NULL,"
			strSQL = strSQL & "Calendar_event tinyint(1) NOT NULL"
			strSQL = strSQL & ");"
			
			'Write to the database
			adoCon.Execute(strSQL)
	
			'If an error has occurred write an error to the page
			If Err.Number <> 0 Then
				Response.Write(vbCrLf & "<script language=""JavaScript"">" & _
				vbCrLf & "document.getElementById('displayState').innerHTML = document.getElementById('displayState').innerHTML + '<br /><br />Error Creating the Table " & strDbTable & "Permissions <br />" & Err.description & ".';" & _
				vbCrLf & "</script>")
	
				'Reset error object
				Err.Number = 0
	
				'Set the error boolean to True
				blnErrorOccured = True
			End If
			
			
			
			
			
			'Create the Thread Table
			strSQL = "CREATE TABLE " & strDbTable & "Session ("
			strSQL = strSQL & "Session_ID varchar(50) NOT NULL, "
			strSQL = strSQL & "IP_address varchar(50) NOT NULL, "
			strSQL = strSQL & "Last_active datetime NOT NULL ,"
			strSQL = strSQL & "Session_data varchar (255) NULL ,"
			strSQL = strSQL & "PRIMARY KEY (Session_ID));"
			
			'Write to the database
			adoCon.Execute(strSQL)
	
			'If an error has occurred write an error to the page
			If Err.Number <> 0 Then
				Response.Write(vbCrLf & "<script language=""JavaScript"">" & _
				vbCrLf & "document.getElementById('displayState').innerHTML = document.getElementById('displayState').innerHTML + '<br /><br />Error Creating the Table " & strDbTable & "Session <br />" & Err.description & ".';" & _
				vbCrLf & "</script>")
	
				'Reset error object
				Err.Number = 0
	
				'Set the error boolean to True
				blnErrorOccured = True
			End If
			
			
			
	
	
			'Create the GuestName Table
			strSQL = "CREATE TABLE " & strDbTable & "GuestName ("
			strSQL = strSQL & "Guest_ID INT NOT NULL auto_increment, "
			strSQL = strSQL & "Thread_ID INT NULL ,"
			strSQL = strSQL & "Name varchar(30)  NULL,"
			strSQL = strSQL & "PRIMARY KEY (Guest_ID));"
	
			'Write to the database
			adoCon.Execute(strSQL)
	
			'If an error has occurred write an error to the page
			If Err.Number <> 0 Then
				Response.Write(vbCrLf & "<script language=""JavaScript"">" & _
				vbCrLf & "document.getElementById('displayState').innerHTML = document.getElementById('displayState').innerHTML + '<br /><br />Error Creating the Table " & strDbTable & "GuestName <br />" & Err.description & ".';" & _
				vbCrLf & "</script>")
	
				'Reset error object
				Err.Number = 0
	
				'Set the error boolean to True
				blnErrorOccured = True
			End If
	
	
	
	
	
			'Create the Smut Table
			strSQL = "CREATE TABLE " & strDbTable & "Smut ("
			strSQL = strSQL & "ID_no smallint(4) NOT NULL auto_increment, "
			strSQL = strSQL & "Smut varchar(50)  NULL ,"
			strSQL = strSQL & "Word_replace varchar(50)  NULL,"
			strSQL = strSQL & "PRIMARY KEY (ID_no));"
	
			'Write to the database
			adoCon.Execute(strSQL)
	
			'If an error has occurred write an error to the page
			If Err.Number <> 0 Then
				Response.Write(vbCrLf & "<script language=""JavaScript"">" & _
				vbCrLf & "document.getElementById('displayState').innerHTML = document.getElementById('displayState').innerHTML + '<br /><br />Error Creating the Table " & strDbTable & "Smut <br />" & Err.description & ".';" & _
				vbCrLf & "</script>")
	
				'Reset error object
				Err.Number = 0
	
				'Set the error boolean to True
				blnErrorOccured = True
			End If
			
			
			
			
			'Create the Ban Table
			strSQL = "CREATE TABLE " & strDbTable & "BanList ("
			strSQL = strSQL & "Ban_ID INT NOT NULL auto_increment, "
			strSQL = strSQL & "IP varchar(30) NULL ,"
			strSQL = strSQL & "Email varchar(60) NULL,"
			strSQL = strSQL & "PRIMARY KEY (Ban_ID));"
	
			'Write to the database
			adoCon.Execute(strSQL)
	
			'If an error has occurred write an error to the page
			If Err.Number <> 0 Then
				Response.Write(vbCrLf & "<script language=""JavaScript"">" & _
				vbCrLf & "document.getElementById('displayState').innerHTML = document.getElementById('displayState').innerHTML + '<br /><br />Error Creating the Table " & strDbTable & "BanList <br />" & Err.description & ".';" & _
				vbCrLf & "</script>")
	
				'Reset error object
				Err.Number = 0
	
				'Set the error boolean to True
				blnErrorOccured = True
			End If
	
	
	
	
	
	'******************************************
	'***  		 Create indexes	      *****
	'******************************************
	
	
			strSQL = "CREATE  INDEX Ban_ID ON " & strDbTable & "BanList(Ban_ID);"
	
			'Write to the database
			adoCon.Execute(strSQL)
			
			strSQL = "CREATE  UNIQUE  INDEX Cat_ID ON " & strDbTable & "Category(Cat_ID);"
	
			'Write to the database
			adoCon.Execute(strSQL)
			
			strSQL = "CREATE  INDEX " & strDbTable & "Group_ID ON " & strDbTable & "Group(Group_ID);"
	
			'Write to the database
			adoCon.Execute(strSQL)
			
			strSQL = "CREATE  INDEX Poll_ID ON " & strDbTable & "Poll(Poll_ID);"
	
			'Write to the database
			adoCon.Execute(strSQL)
			
			strSQL = "CREATE INDEX Author_ID ON " & strDbTable & "Author(Author_ID);"
	
			'Write to the database
			adoCon.Execute(strSQL)
			
			strSQL = "CREATE INDEX Group_ID ON " & strDbTable & "Author(Group_ID);"
			
			'Write to the database
			adoCon.Execute(strSQL)
			
			
			strSQL = "CREATE INDEX " & strDbTable & "Group" & strDbTable & "Author ON " & strDbTable & "Author(Group_ID);"
	
			'Write to the database
			adoCon.Execute(strSQL)
			
			strSQL = "CREATE UNIQUE INDEX User_code ON " & strDbTable & "Author(User_code);"
	
			'Write to the database
			adoCon.Execute(strSQL)
			
			strSQL = "CREATE UNIQUE INDEX Username ON " & strDbTable & "Author(Username);"
	
			'Write to the database
			adoCon.Execute(strSQL)
			
			strSQL = "CREATE INDEX Cat_ID ON " & strDbTable & "Forum(Cat_ID);"
	
			'Write to the database
			adoCon.Execute(strSQL)
			
			strSQL = "CREATE INDEX Sub_ID ON " & strDbTable & "Forum(Sub_ID);"
	
			'Write to the database
			adoCon.Execute(strSQL)
			
			strSQL = "CREATE INDEX Last_post_author_ID ON " & strDbTable & "Forum(Last_post_author_ID);"
	
			'Write to the database
			adoCon.Execute(strSQL)
			
					
			strSQL = "CREATE INDEX " & strDbTable & "Categories" & strDbTable & "Forum ON " & strDbTable & "Forum(Cat_ID);"
	
			'Write to the database
			adoCon.Execute(strSQL)
			
			strSQL = "CREATE INDEX Choice_ID ON " & strDbTable & "PollChoice(Choice_ID);"
	
			'Write to the database
			adoCon.Execute(strSQL)
			
			strSQL = "CREATE INDEX Poll_ID ON " & strDbTable & "PollChoice(Poll_ID);"
	
			'Write to the database
			adoCon.Execute(strSQL)
			
			strSQL = "CREATE INDEX " & strDbTable & "Polls" & strDbTable & "PollChoice ON " & strDbTable & "PollChoice(Poll_ID);"
	
			'Write to the database
			adoCon.Execute(strSQL)
			
			strSQL = "CREATE INDEX Address_ID ON " & strDbTable & "BuddyList(Address_ID);"
	
			'Write to the database
			adoCon.Execute(strSQL)
			
			strSQL = "CREATE INDEX Author_ID ON " & strDbTable & "BuddyList(Buddy_ID);"
	
			'Write to the database
			adoCon.Execute(strSQL)
			
			strSQL = "CREATE INDEX Buddy_ID ON " & strDbTable & "BuddyList(Author_ID);"
	
			'Write to the database
			adoCon.Execute(strSQL)
			
			strSQL = "CREATE INDEX " & strDbTable & "Author" & strDbTable & "BuddyList ON " & strDbTable & "BuddyList(Buddy_ID);"
	
			'Write to the database
			adoCon.Execute(strSQL)
			
			strSQL = "CREATE INDEX Author_ID ON " & strDbTable & "EmailNotify(Author_ID);"
	
			'Write to the database
			adoCon.Execute(strSQL)
			
			strSQL = "CREATE INDEX Forum_ID ON " & strDbTable & "EmailNotify(Forum_ID);"
	
			'Write to the database
			adoCon.Execute(strSQL)
			
			strSQL = "CREATE INDEX " & strDbTable & "Author" & strDbTable & "TopicWatch ON " & strDbTable & "EmailNotify(Author_ID);"
	
			'Write to the database
			adoCon.Execute(strSQL)
			
			strSQL = "CREATE INDEX Toipc_ID ON " & strDbTable & "EmailNotify(Topic_ID);"
	
			'Write to the database
			adoCon.Execute(strSQL)
			
			strSQL = "CREATE INDEX Watch_ID ON " & strDbTable & "EmailNotify(Watch_ID);"
	
			'Write to the database
			adoCon.Execute(strSQL)
			
			strSQL = "CREATE INDEX Auhor_ID ON " & strDbTable & "PMMessage(Author_ID);"
	
			'Write to the database
			adoCon.Execute(strSQL)
			
			strSQL = "CREATE INDEX From_ID ON " & strDbTable & "PMMessage(From_ID);"
	
			'Write to the database
			adoCon.Execute(strSQL)
			
			strSQL = "CREATE INDEX Message_ID ON " & strDbTable & "PMMessage(PM_ID);"
	
			'Write to the database
			adoCon.Execute(strSQL)
			
			strSQL = "CREATE INDEX " & strDbTable & "Author" & strDbTable & "PMMessage ON " & strDbTable & "PMMessage(From_ID);"
	
			'Write to the database
			adoCon.Execute(strSQL)
			
			strSQL = "CREATE INDEX " & strDbTable & "Forum_ID ON " & strDbTable & "Permissions(Forum_ID);"
	
			'Write to the database
			adoCon.Execute(strSQL)
			
			strSQL = "CREATE INDEX " & strDbTable & "Forum" & strDbTable & "Permissions ON " & strDbTable & "Permissions(Forum_ID);"
	
			'Write to the database
			adoCon.Execute(strSQL)
			
			strSQL = "CREATE INDEX " & strDbTable & "Group_ID ON " & strDbTable & "Permissions(Group_ID);"
	
			'Write to the database
			adoCon.Execute(strSQL)
			
			strSQL = "CREATE INDEX Forum_ID ON " & strDbTable & "Topic(Forum_ID);"
	
			'Write to the database
			adoCon.Execute(strSQL)
			
			strSQL = "CREATE INDEX Poll_ID ON " & strDbTable & "Topic(Poll_ID);"
	
			'Write to the database
			adoCon.Execute(strSQL)
			
			strSQL = "CREATE INDEX Start_Thread_ID ON " & strDbTable & "Topic(Start_Thread_ID DESC);"
	
			'Write to the database
			adoCon.Execute(strSQL)
			
			strSQL = "CREATE INDEX Last_Thread_ID ON " & strDbTable & "Topic(Last_Thread_ID DESC);"
	
			'Write to the database
			adoCon.Execute(strSQL)
			
			strSQL = "CREATE INDEX Moved_ID ON " & strDbTable & "Topic(Moved_ID);"
	
			'Write to the database
			adoCon.Execute(strSQL)
			
			strSQL = "CREATE INDEX " & strDbTable & "Forum" & strDbTable & "Topic ON " & strDbTable & "Topic(Forum_ID);"
	
			'Write to the database
			adoCon.Execute(strSQL)
			
			strSQL = "CREATE INDEX Topic_ID ON " & strDbTable & "Topic(Topic_ID);"
	
			'Write to the database
			adoCon.Execute(strSQL)
			
			strSQL = "CREATE INDEX Message_date ON " & strDbTable & "Thread(Message_date DESC);"
	
			'Write to the database
			adoCon.Execute(strSQL)
			
			strSQL = "CREATE INDEX Message_ID ON " & strDbTable & "Thread(Thread_ID DESC);"
	
			'Write to the database
			adoCon.Execute(strSQL)
			
			strSQL = "CREATE INDEX " & strDbTable & "Author" & strDbTable & "Thread ON " & strDbTable & "Thread(Author_ID);"
	
			'Write to the database
			adoCon.Execute(strSQL)
			
			strSQL = "CREATE INDEX " & strDbTable & "Topic" & strDbTable & "Thread ON " & strDbTable & "Thread(Topic_ID);"
	
			'Write to the database
			adoCon.Execute(strSQL)
			
			strSQL = "CREATE INDEX Topic_ID ON " & strDbTable & "Thread(Topic_ID);"
	
			'Write to the database
			adoCon.Execute(strSQL)
					
			strSQL = "CREATE INDEX Guest_ID ON " & strDbTable & "GuestName(Guest_ID); "
			
			'Write to the database
			adoCon.Execute(strSQL)
			
	 		strSQL = "CREATE INDEX " & strDbTable & "Thread" & strDbTable & "GuestName ON " & strDbTable & "GuestName(Thread_ID);"
	
			'Write to the database
			adoCon.Execute(strSQL)
	
	 		strSQL = "CREATE INDEX Thread_ID ON " & strDbTable & "GuestName(Thread_ID);"
			
			'Write to the database
			adoCon.Execute(strSQL)
			
			strSQL = "CREATE UNIQUE INDEX Session_ID ON " & strDbTable & "Session(Session_ID);"
			
			'Write to the database
			adoCon.Execute(strSQL)
	
			'If an error has occurred write an error to the page
			If Err.Number <> 0 Then
				Response.Write(vbCrLf & "<script language=""JavaScript"">" & _
				vbCrLf & "document.getElementById('displayState').innerHTML = document.getElementById('displayState').innerHTML + '<br /><br />Error Creating one or more Indexs <br />" & Err.description & ".';" & _
				vbCrLf & "</script>")
	
				'Reset error object
				Err.Number = 0
	
				'Set the error boolean to True
				blnErrorOccured = True
			End If
	
	
	
	
	
	
	'******************************************
	'***  	Insert default values	      *****
	'******************************************
			
			
			'Enter the default values in the UserGroup Table
			'Admin Group
			strSQL = "INSERT INTO " & strDbTable & "Group ("
			strSQL = strSQL & "Name, "
			strSQL = strSQL & "Minimum_posts, "
			strSQL = strSQL & "Special_rank, "
			strSQL = strSQL & "Stars, "
			strSQL = strSQL & "Starting_group "
			strSQL = strSQL & ") "
			strSQL = strSQL & "VALUES "
			strSQL = strSQL & "('Admin Group', "
			strSQL = strSQL & "'-1', "
			strSQL = strSQL & "'1', "
			strSQL = strSQL & "'5', "
			strSQL = strSQL & "'0')"
			
			'Write to the database
			adoCon.Execute(strSQL)
			
			
			'Guest Group
			strSQL = "INSERT INTO " & strDbTable & "Group ("
			strSQL = strSQL & "Name, "
			strSQL = strSQL & "Minimum_posts, "
			strSQL = strSQL & "Special_rank, "
			strSQL = strSQL & "Stars, "
			strSQL = strSQL & "Starting_group "
			strSQL = strSQL & ") "
			strSQL = strSQL & "VALUES "
			strSQL = strSQL & "('Guest Group', "
			strSQL = strSQL & "'-1', "
			strSQL = strSQL & "'1', "
			strSQL = strSQL & "'0', "
			strSQL = strSQL & "'0')"
			
			'Write to the database
			adoCon.Execute(strSQL)
			
			
			'Moderator Group
			strSQL = "INSERT INTO " & strDbTable & "Group ("
			strSQL = strSQL & "Name, "
			strSQL = strSQL & "Minimum_posts, "
			strSQL = strSQL & "Special_rank, "
			strSQL = strSQL & "Stars, "
			strSQL = strSQL & "Starting_group "
			strSQL = strSQL & ") "
			strSQL = strSQL & "VALUES "
			strSQL = strSQL & "('Moderator Group', "
			strSQL = strSQL & "'-1', "
			strSQL = strSQL & "'1', "
			strSQL = strSQL & "'4', "
			strSQL = strSQL & "'0')"
			
			'Write to the database
			adoCon.Execute(strSQL)
			
			
			'Newbie Group
			strSQL = "INSERT INTO " & strDbTable & "Group ("
			strSQL = strSQL & "Name, "
			strSQL = strSQL & "Minimum_posts, "
			strSQL = strSQL & "Special_rank, "
			strSQL = strSQL & "Stars, "
			strSQL = strSQL & "Starting_group "
			strSQL = strSQL & ") "
			strSQL = strSQL & "VALUES "
			strSQL = strSQL & "('Newbie', "
			strSQL = strSQL & "'0', "
			strSQL = strSQL & "'0', "
			strSQL = strSQL & "'1', "
			strSQL = strSQL & "'-1')"
			
			'Write to the database
			adoCon.Execute(strSQL)
			
			
			'Groupie Group
			strSQL = "INSERT INTO " & strDbTable & "Group ("
			strSQL = strSQL & "Name, "
			strSQL = strSQL & "Minimum_posts, "
			strSQL = strSQL & "Special_rank, "
			strSQL = strSQL & "Stars, "
			strSQL = strSQL & "Starting_group "
			strSQL = strSQL & ") "
			strSQL = strSQL & "VALUES "
			strSQL = strSQL & "('Groupie', "
			strSQL = strSQL & "'40', "
			strSQL = strSQL & "'0', "
			strSQL = strSQL & "'2', "
			strSQL = strSQL & "'0')"
			
			'Write to the database
			adoCon.Execute(strSQL)
			
			
			'Full Member Group
			strSQL = "INSERT INTO " & strDbTable & "Group ("
			strSQL = strSQL & "Name, "
			strSQL = strSQL & "Minimum_posts, "
			strSQL = strSQL & "Special_rank, "
			strSQL = strSQL & "Stars, "
			strSQL = strSQL & "Starting_group "
			strSQL = strSQL & ") "
			strSQL = strSQL & "VALUES "
			strSQL = strSQL & "('Senior Member', "
			strSQL = strSQL & "'100', "
			strSQL = strSQL & "'0', "
			strSQL = strSQL & "'3', "
			strSQL = strSQL & "'0')"
			
			'Write to the database
			adoCon.Execute(strSQL)
			
				
			'If an error has occurred write an error to the page
			If Err.Number <> 0 Then
				Response.Write(vbCrLf & "<script language=""JavaScript"">" & _
				vbCrLf & "document.getElementById('displayState').innerHTML = document.getElementById('displayState').innerHTML + '<br /><br />Error entering default values in the Table " & strDbTable & "Group<br />" & Err.description & ".';" & _
				vbCrLf & "</script>")
	
				'Reset error object
				Err.Number = 0
	
				'Set the error boolean to True
				blnErrorOccured = True
			End If
			
			
			
			
			'Enter the default values in the Author Table
			'Enter the admin account into db
			strSQL = "INSERT INTO " & strDbTable & "Author ("
			strSQL = strSQL & "Group_ID, "
			strSQL = strSQL & "Username, "
			strSQL = strSQL & "User_code, "
			strSQL = strSQL & "Password, "
			strSQL = strSQL & "Salt, "
			strSQL = strSQL & "Show_email, "
			strSQL = strSQL & "Attach_signature, "
			strSQL = strSQL & "Time_offset, "
			strSQL = strSQL & "Time_offset_hours, "
			strSQL = strSQL & "Rich_editor, "
			strSQL = strSQL & "Date_format, "
			strSQL = strSQL & "Active, "
			strSQL = strSQL & "Reply_notify, "
			strSQL = strSQL & "PM_notify, "
			strSQL = strSQL & "No_of_posts, "
			strSQL = strSQL & "Signature, "
			strSQL = strSQL & "Join_date, "
			strSQL = strSQL & "Last_visit, "
			strSQL = strSQL & "Login_attempt, "
			strSQL = strSQL & "Banned, "
			strSQL = strSQL & "Info "
			strSQL = strSQL & ") "
			strSQL = strSQL & "VALUES "
			strSQL = strSQL & "('1', "
			strSQL = strSQL & "'administrator', "
			strSQL = strSQL & "'administrator2FC73499BAC5A41', "
			strSQL = strSQL & "'A85B3E67CFA695D711570FB9822C0CF82871903B', "
			strSQL = strSQL & "'72964E7', "
			strSQL = strSQL & "'0', "
			strSQL = strSQL & "'0', "
			strSQL = strSQL & "'+', "
			strSQL = strSQL & "'0', "
			strSQL = strSQL & "'-1', "
			strSQL = strSQL & "'dd/mm/yy', "
			strSQL = strSQL & "'-1', "
			strSQL = strSQL & "'0', "
			strSQL = strSQL & "'0', "
			strSQL = strSQL & "'0', "
			strSQL = strSQL & "'', "
			strSQL = strSQL & "'" & internationalDateTime(now()) & "', "
			strSQL = strSQL & "'" & internationalDateTime(now()) & "', "
			strSQL = strSQL & "'0',"
			strSQL = strSQL & "'0',"
			strSQL = strSQL & "'')"
	
			'Write to the database
			adoCon.Execute(strSQL)
	
			'Enter the Guest account into db
			strSQL = "INSERT INTO " & strDbTable & "Author ("
			strSQL = strSQL & "Group_ID, "
			strSQL = strSQL & "Username, "
			strSQL = strSQL & "User_code, "
			strSQL = strSQL & "Password, "
			strSQL = strSQL & "Salt, "
			strSQL = strSQL & "Show_email, "
			strSQL = strSQL & "Attach_signature, "
			strSQL = strSQL & "Time_offset, "
			strSQL = strSQL & "Time_offset_hours, "
			strSQL = strSQL & "Rich_editor, "
			strSQL = strSQL & "Date_format, "
			strSQL = strSQL & "Active, "
			strSQL = strSQL & "Reply_notify, "
			strSQL = strSQL & "PM_notify, "
			strSQL = strSQL & "No_of_posts, "
			strSQL = strSQL & "Signature, "
			strSQL = strSQL & "Join_date, "
			strSQL = strSQL & "Last_visit, "
			strSQL = strSQL & "Login_attempt, "
			strSQL = strSQL & "Banned, "
			strSQL = strSQL & "Info "
			strSQL = strSQL & ") "
			strSQL = strSQL & "VALUES "
			strSQL = strSQL & "('2', "
			strSQL = strSQL & "'Guests', "
			strSQL = strSQL & "'Guest48CEE9Z2849AE95A6', "
			strSQL = strSQL & "'6734DDD7A6A6C9F4D34945B0C9CF9677F3221EC9', "
			strSQL = strSQL & "'E4AC', "
			strSQL = strSQL & "'0', "
			strSQL = strSQL & "'0', "
			strSQL = strSQL & "'+', "
			strSQL = strSQL & "'0', "
			strSQL = strSQL & "'-1', "
			strSQL = strSQL & "'dd/mm/yy', "
			strSQL = strSQL & "'-1', "
			strSQL = strSQL & "'0', "
			strSQL = strSQL & "'0', "
			strSQL = strSQL & "'0', "
			strSQL = strSQL & "'', "
			strSQL = strSQL & "'" & internationalDateTime(now()) & "', "
			strSQL = strSQL & "'" & internationalDateTime(now()) & "', "
			strSQL = strSQL & "'0',"
			strSQL = strSQL & "'0',"
			strSQL = strSQL & "'')"
	
			'Write to the database
			adoCon.Execute(strSQL)
	
			'If an error has occurred write an error to the page
			If Err.Number <> 0 Then
				Response.Write(vbCrLf & "<script language=""JavaScript"">" & _
				vbCrLf & "document.getElementById('displayState').innerHTML = document.getElementById('displayState').innerHTML + '<br /><br />Error entering default values in the Table " & strDbTable & "Author<br />" & Err.description & ".';" & _
				vbCrLf & "</script>")
	
				'Reset error object
				Err.Number = 0
	
				'Set the error boolean to True
				blnErrorOccured = True
			End If
			
			
			
			
	
			'Enter the default values in the Configuration Table
			strSQL = "INSERT INTO " & strDbTable & "Configuration ("
			strSQL = strSQL & "website_name, "
			strSQL = strSQL & "forum_name, "
			strSQL = strSQL & "forum_path, "
			strSQL = strSQL & "website_path, "
			strSQL = strSQL & "forum_email_address, "
			strSQL = strSQL & "email_notify, "
			strSQL = strSQL & "mail_component, "
			strSQL = strSQL & "mail_server, "
			strSQL = strSQL & "IE_editor, "
			strSQL = strSQL & "L_code, "
			strSQL = strSQL & "Topics_per_page, "
			strSQL = strSQL & "Title_image, "
			strSQL = strSQL & "Text_link, "
			strSQL = strSQL & "Emoticons, "
			strSQL = strSQL & "Avatar, "
			strSQL = strSQL & "Email_activate, "
			strSQL = strSQL & "Email_post, "
			strSQL = strSQL & "Hot_views, "
			strSQL = strSQL & "Hot_replies, "
			strSQL = strSQL & "Private_msg, "
			strSQL = strSQL & "No_of_priavte_msg, "
			strSQL = strSQL & "Threads_per_page, "
			strSQL = strSQL & "Spam_seconds, "
			strSQL = strSQL & "Spam_minutes, "
			strSQL = strSQL & "Vote_choices, "
			strSQL = strSQL & "Email_sys, "
			strSQL = strSQL & "Upload_img_types, "
			strSQL = strSQL & "Upload_img_size, "
			strSQL = strSQL & "Upload_files_path, "
			strSQL = strSQL & "Upload_files_type, "
			strSQL = strSQL & "Upload_files_size, "
			strSQL = strSQL & "Upload_avatar, "
			strSQL = strSQL & "Upload_avatar_types, "
			strSQL = strSQL & "Upload_avatar_size, "
			strSQL = strSQL & "Upload_component, "
			strSQL = strSQL & "Upload_allocation, "
			strSQL = strSQL & "Active_users, "
			strSQL = strSQL & "Forums_closed, "
			strSQL = strSQL & "Show_edit, "
			strSQL = strSQL & "Process_time, "
			strSQL = strSQL & "Flash, "
			strSQL = strSQL & "Show_mod, "
			strSQL = strSQL & "Reg_closed, "
			strSQL = strSQL & "Topic_icon, "
			strSQL = strSQL & "Long_reg, "
			strSQL = strSQL & "CAPTCHA, "
			strSQL = strSQL & "Skin_file, "
			strSQL = strSQL & "Skin_image_path, "
			strSQL = strSQL & "Skin_nav_spacer, "
			strSQL = strSQL & "Guest_SID, "
			strSQL = strSQL & "Calendar, "
			strSQL = strSQL & "Member_approve, "
			strSQL = strSQL & "RSS, "
			strSQL = strSQL & "PM_Flood, "
			strSQL = strSQL & "A_code, "
			strSQL = strSQL & "NewsPad "
			strSQL = strSQL & ") "
			strSQL = strSQL & "VALUES "
			strSQL = strSQL & "('My Website', "
			strSQL = strSQL & "'Web Wiz Forums', "
			strSQL = strSQL & "'http://www.myweb.com/forum', "
			strSQL = strSQL & "'http://www.webwizforums.com', "
			strSQL = strSQL & "'forum@company.lan', "
			strSQL = strSQL & "'0', "
			strSQL = strSQL & "'CDOSYS', "
			strSQL = strSQL & "'localhost', "
			strSQL = strSQL & "'-1', "
			strSQL = strSQL & "'-1', "
			strSQL = strSQL & "'16', "
			strSQL = strSQL & "'forum_images/web_wiz_forums.png', "
			strSQL = strSQL & "'0', "
			strSQL = strSQL & "'-1', "
			strSQL = strSQL & "'-1', "
			strSQL = strSQL & "'0', "
			strSQL = strSQL & "'-1', "
			strSQL = strSQL & "'50', "
			strSQL = strSQL & "'10', "
			strSQL = strSQL & "'-1', "
			strSQL = strSQL & "'40', "
			strSQL = strSQL & "'10', "
			strSQL = strSQL & "'20', "
			strSQL = strSQL & "'7', "
			strSQL = strSQL & "'5', "
			strSQL = strSQL & "'-1', "
			strSQL = strSQL & "'jpg;jpeg;gif;png', "
			strSQL = strSQL & "'50', "
			strSQL = strSQL & "'uploads', "
			strSQL = strSQL & "'zip;rar;doc;pdf;txt;rtf;gif;jpg;png', "
			strSQL = strSQL & "'500', "
			strSQL = strSQL & "'0', "
			strSQL = strSQL & "'jpg;jpeg;gif;png', "
			strSQL = strSQL & "'25', "
			strSQL = strSQL & "'AspUpload', "
			strSQL = strSQL & "'10', "
			strSQL = strSQL & "'-1', "
			strSQL = strSQL & "'0',"
			strSQL = strSQL & "'-1',"
			strSQL = strSQL & "'-1',"
			strSQL = strSQL & "'-1',"
			strSQL = strSQL & "'0',"
			strSQL = strSQL & "'-1',"
			strSQL = strSQL & "'-1',"
			strSQL = strSQL & "'-1',"
			strSQL = strSQL & "'-1',"
			strSQL = strSQL & "'css_styles/default/',"
			strSQL = strSQL & "'forum_images/',"
			strSQL = strSQL & "' &gt; ',"
			strSQL = strSQL & "'-1',"
			strSQL = strSQL & "'-1',"
			strSQL = strSQL & "'0',"
			strSQL = strSQL & "'-1',"
			strSQL = strSQL & "'10',"
			strSQL = strSQL & "'-1',"
			strSQL = strSQL & "'-1')"
	
			'Write to the database
			adoCon.Execute(strSQL)
	
			'If an error has occurred write an error to the page
			If Err.Number <> 0 Then
				Response.Write(vbCrLf & "<script language=""JavaScript"">" & _
				vbCrLf & "document.getElementById('displayState').innerHTML = document.getElementById('displayState').innerHTML + '<br /><br />Error entering default values in the Table " & strDbTable & "Configuration<br />" & Err.description & ".';" & _
				vbCrLf & "</script>")
	
				'Reset error object
				Err.Number = 0
	
				'Set the error boolean to True
				blnErrorOccured = True
			End If
	
	
	
			'Enter the default values in the date time table
			strSQL = "INSERT INTO " & strDbTable & "DateTimeFormat ("
			strSQL = strSQL & "Date_format, "
			strSQL = strSQL & "Year_format, "
			strSQL = strSQL & "Seporator, "
			strSQL = strSQL & "Month1, "
			strSQL = strSQL & "Month2, "
			strSQL = strSQL & "Month3, "
			strSQL = strSQL & "Month4, "
			strSQL = strSQL & "Month5, "
			strSQL = strSQL & "Month6, "
			strSQL = strSQL & "Month7, "
			strSQL = strSQL & "Month8, "
			strSQL = strSQL & "Month9, "
			strSQL = strSQL & "Month10, "
			strSQL = strSQL & "Month11, "
			strSQL = strSQL & "Month12, "
			strSQL = strSQL & "Time_format, "
			strSQL = strSQL & "am, "
			strSQL = strSQL & "pm, "
			strSQL = strSQL & "Time_offset, "
			strSQL = strSQL & "Time_offset_hours "
			strSQL = strSQL & ") "
			strSQL = strSQL & "VALUES "
			strSQL = strSQL & "('dd/mm/yy', "
			strSQL = strSQL & "'long', "
			strSQL = strSQL & "'" & chr(32) & "', "
			strSQL = strSQL & "'Jan', "
			strSQL = strSQL & "'Feb', "
			strSQL = strSQL & "'Mar', "
			strSQL = strSQL & "'Apr', "
			strSQL = strSQL & "'May', "
			strSQL = strSQL & "'Jun', "
			strSQL = strSQL & "'Jul', "
			strSQL = strSQL & "'Aug', "
			strSQL = strSQL & "'Sep', "
			strSQL = strSQL & "'Oct', "
			strSQL = strSQL & "'Nov', "
			strSQL = strSQL & "'Dec', "
			strSQL = strSQL & "'12', "
			strSQL = strSQL & "'am', "
			strSQL = strSQL & "'pm', "
			strSQL = strSQL & "'+', "
			strSQL = strSQL & "'0')"
	
			'Write to the database
			adoCon.Execute(strSQL)
	
			'If an error has occurred write an error to the page
			If Err.Number <> 0 Then
				Response.Write(vbCrLf & "<script language=""JavaScript"">" & _
				vbCrLf & "document.getElementById('displayState').innerHTML = document.getElementById('displayState').innerHTML + '<br /><br />Error entering default values in the Table " & strDbTable & "DateTimeFormat<br />" & Err.description & ".';" & _
				vbCrLf & "</script>")
	
				'Reset error object
				Err.Number = 0
	
				'Set the error boolean to True
				blnErrorOccured = True
			End If
	
	
	
			'Enter the default values in the smut table
			For intBadWordLoopCounter = 1 to 14
	
				'Write the SQL
				strSQL = "INSERT INTO " & strDbTable & "Smut (Smut, Word_replace) "
				strSQL = strSQL & "VALUES ("
	
				Select Case intBadWordLoopCounter
					Case 1
						strSQL = strSQL & "'\bcunt\b', '<img src=""smileys/smiley35.gif"" border=""0"">'"
					Case 2
						strSQL = strSQL & "'cunting', '<img src=""smileys/smiley35.gif"" border=""0"">'"
					Case 3
						strSQL = strSQL & "'\bfuck\b', '<img src=""smileys/smiley35.gif"" border=""0"">'"
					Case 4
						strSQL = strSQL & "'fucker', '<img src=""smileys/smiley35.gif"" border=""0"">'"
					Case 5
						strSQL = strSQL & "'fucking', '<img src=""smileys/smiley35.gif"" border=""0"">'"
					Case 6
						strSQL = strSQL & "'fuck-off', 'please leave'"
					Case 7
						strSQL = strSQL & "'fuckoff', 'please leave'"
					Case 8
						strSQL = strSQL & "'motherfucker', 'motherf**k'"
					Case 9
						strSQL = strSQL & "'shit', 'sh*t'"
					Case 10
						strSQL = strSQL & "'shiting', 'sh*ting'"
					Case 11
						strSQL = strSQL & "'\bslag\b', 'sl*g'"
					Case 12
						strSQL = strSQL & "'tosser', 't**ser'"
					Case 13
						strSQL = strSQL & "'wanker', 'w**ker'"
					Case 14
						strSQL = strSQL & "'wanking', 'I like to plat with myself'"
				End Select
	
				strSQL = strSQL & ")"
	
				'Write to database
				adoCon.Execute(strSQL)
			Next
	
			'If an error has occurred write an error to the page
			If Err.Number <> 0 Then
				Response.Write(vbCrLf & "<script language=""JavaScript"">" & _
				vbCrLf & "document.getElementById('displayState').innerHTML = document.getElementById('displayState').innerHTML + '<br /><br />Error entering default values in the Table " & strDbTable & "Smut<br />" & Err.description & ".';" & _
				vbCrLf & "</script>")
	
				'Reset error object
				Err.Number = 0
	
				'Set the error boolean to True
				blnErrorOccured = True
			End If
	
	
			'Clean out the application variables
			Application.Lock
			Application(strAppPrefix & "blnConfigurationSet") = false
			Application.UnLock
	
	
			'Display a message to say the database is created
			If blnErrorOccured = True Then
				Response.Write(vbCrLf & "<script language=""JavaScript"">" & _
				vbCrLf & "document.getElementById('displayState').innerHTML = document.getElementById('displayState').innerHTML + '<br /><br />" & Err.description & "<br /><br /><h2>mySQL database is set up, but with Error!</h2>'" & _
				vbCrLf & "</script>")
			Else
				Response.Write(vbCrLf & "<script language=""JavaScript"">" & _
				vbCrLf & "document.getElementById('displayState').innerHTML = document.getElementById('displayState').innerHTML + '<br /><br /><h2>Congratulations, Web Wiz Forums Database setup is now complete</h2>'" & _
				vbCrLf & "</script>")
			End If
			
			
			
			'Display completed message
			Response.Write(vbCrLf & "<script language=""JavaScript"">" & _
			vbCrLf & "document.getElementById('displayState').innerHTML = document.getElementById('displayState').innerHTML + '<br />The default administrator login for your forum is:-<br /><blockquote>User: Administrator<br />Pass: letmein<br /></blockquote>Click here to go to your <a href=""default.asp"">Forum Homepage</a><br />Click here to login to your <a href=""admin.asp"">Forum Admin Area</a>'" & _
     			vbCrLf & "</script>")
		
		End If
	End If

	'Reset Server Variables
	Set adoCon = Nothing
End If
%>