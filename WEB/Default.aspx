<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Def" %>
<%@ Register src="~/UC/Common/ActivityPhotos.ascx" tagname="uActivityPhotos" tagprefix="uc1" %>
<%@ Register src="~/UC/Common/ActivityNews.ascx" tagname="ActivityNews" tagprefix="uc2" %>
<%@ Register src="~/UC/Activities/uUpcomingActivitiesHolder.ascx" tagname="uUpcomingActivitiesHolder" tagprefix="uc3" %>
<%@ Register src="~/UC/Common/ActivityFollower.ascx" tagname="ActivityFollower" tagprefix="uc4" %>
<%@ Register src="~/UC/Common/Banner.ascx" tagname="uBanner" tagprefix="Banner" %>
<%@ Register src="~/UC/Common/Search.ascx" tagname="uSearch" tagprefix="Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       
        	<div class="left-block"> <!-- LEFT BLOCK -->
        	
        	    <uc3:uUpcomingActivitiesHolder ID="uUpcomingActivitiesHolder1" runat="server" />
                
                <div class="last-comment"> <!-- LAST COMMENTS -->
                	<h1>Son Yorumlar</h1>
                	
                	<asp:Repeater runat="server" ID="rptComments">
                	<ItemTemplate>
                	
                	<ul>
                    	<li class="comment">
                    	
                    	    <a href='<%#Eval("CommentTypeID", "Detail.aspx?j={0}") %>'>
                    	    <%# LIB.Util.Left(Eval("CommentDetail").ToString(), 150) %>
                    	    </a>
                    	</li>
                        <li class="subject">Konu: <%#Eval("ActivityTitle") %></li>
                        <li class="commentor">
                            <%#Eval("CommentByName")%> 
                            <%# COM.Util.ReturnTimeAgo(Convert.ToDateTime(Eval("CreateDate"))) %>
                        önce yazdı.</li>
                    </ul>
                    
                	</ItemTemplate>
                	</asp:Repeater>
                </div> <!-- // LAST COMMENTS // -->
                
                <uc1:uActivityPhotos ID="uActivityPhotos1" runat="server" />
                
                <div class="clear"></div>
                
            </div>
            
    <div class="right-block">
    	
    	<Search:uSearch ID="uSearch1" runat="server" />
        
        <Banner:uBanner ID="uBanner1" runat="server" />
        
        <uc2:ActivityNews ID="ActivityNews1" runat="server" />
        
        <uc4:ActivityFollower ID="ActivityFollower1" runat="server" />
        
    </div>
            
</asp:Content>