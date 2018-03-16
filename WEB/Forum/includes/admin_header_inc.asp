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



%>
<script language="javascript" src="includes/admin_javascript_v9.js" type="text/javascript"></script>
<link href="<% = strCSSfile %>default_style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<table width="100%" border="0" cellspacing="4" cellpadding="0">
 <tr>
  <td colspan="2" valign="top">
   <table align="center" cellpadding="2" cellspacing="1" class="tableBorder" style="height:50px;width:100%">
    <tr class="tableRow">
     <td><span style="float:right;"><a href="admin_logout.asp?XID=<% = getSessionItem("KEY") & strQsSID2 %>"><strong>Control Panel Logout</strong></a></span><img src="<% = strTitleImage %>" border="0" /> <h1>Control Panel</h1></td>
    </tr>
   </table>
  </td>
 </tr>
 <tr valign="top">
  <td width="13%"><!--#include file="admin_index_inc.asp" --></td>
  <td width="87%" align="center">