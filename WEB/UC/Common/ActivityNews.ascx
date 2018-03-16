<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ActivityNews.ascx.cs" Inherits="UC_Common_ActivityNews" %>

<div id="dvNews" runat="server" class="etkinlik-haberleri"> <!-- ETKİNLİK HABERLERİ -->
	<h1>Etkinlik Haberleri</h1>
	<div class="box-top"></div>
	<div class="box-body">
    <ul>
    
        <asp:Repeater runat="server" ID="rptNews">
        <ItemTemplate>
            <li>
        	    <a class="event-name" href='<%#Eval("NewsID", "javascript:NewsOpen({0})") %>'><%#Eval("NewsTitle") %></a>
                <%# Convert.ToDateTime(Eval("NewsDate")).ToShortDateString() %> - <%#Eval("CategoryName") %>
            </li>
        </ItemTemplate>
        </asp:Repeater>
    </ul>
    </div>
    <div class="box-bottom"></div>
</div> <!-- // ETKİNLİK HABERLERİ // -->