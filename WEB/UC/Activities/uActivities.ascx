<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uActivities.ascx.cs" Inherits="UC_Activities_uActivities" %>
<%@ Register src="~/UC/Common/Paging.ascx" tagname="uPaging" tagprefix="Paging" %>
<%@ Register src="~/UC/Common/ModalPopup.ascx" tagname="uModalPopup" tagprefix="ModalPopup" %>
<%@ Register src="~/UC/Common/btnJoinActivity.ascx" tagname="btnJoinActivity" tagprefix="uc6" %>

<%@ Register 
    Assembly="AjaxControlToolkit" 
    Namespace="AjaxControlToolkit" 
    TagPrefix="ajaxToolkit" %>

<h1>    	    
    <asp:Literal runat="server" ID="ltlTitle"></asp:Literal>
</h1>
    	
<asp:Repeater runat="server" ID="rptActivities" 
    onitemdatabound="rptActivities_ItemDataBound">
    <ItemTemplate>
        <asp:Panel ID="pnlContent" runat="server" CssClass="small-content"> <!-- BIG CONTENT -->
	        
	        <div class="big-left">
    	        <div class="category"><img alt="" src='Images/Categories/<%#Eval("CategoryID") %>.png' /></div>
                <div class="month"><%# LIB.Util.MonthName(Convert.ToDateTime(Eval("ActivityStartDate")).Month) %> </div>
                <div class="date"><%# Convert.ToDateTime(Eval("ActivityStartDate")).Day %> </div>
            </div>
            
            <div class="big-img">
                <asp:HyperLink runat="server" ID="hlImg">
                <asp:Image runat="server" ID="imgPhoto" ImageUrl='<%#Eval("ActivityPhoto") %>' /></asp:HyperLink>
            </div>
            
            <div class="big-desc">
    	        <h2>
    	            <asp:HyperLink runat="server" ID="hlTitle" NavigateUrl='<%#Eval("ActivityID") %>' Text='<%# Eval("ActivityTitle") %>'></asp:HyperLink>
    	            
    	            <asp:Literal runat="server" ID="ltlCategory" Visible="false" Text='<%#Eval("CategoryName") %>'></asp:Literal>
    	        </h2>
                <h3><%# Eval("ActivityDate") %></h3>
                <h4><%# Eval("Place") %></h4>
                
                    <asp:Label runat="server" ID="lblActivityHeader" 
                    Text='<%# LIB.Util.Nl2Br(Eval("ActivityHeader").ToString()) %>'></asp:Label>

                    <asp:Literal runat="server" ID="ltlActivityEndDate" Text='<%#Eval("ActivityEndDate") %>' Visible="false"></asp:Literal>                        
                    
                <div class="desc-footer">
                
                	<div class="comment-count">    	
	                    <b><%#Eval("CommentCount") %></b> yorum var    	    
	                </div>

                    <asp:Literal runat="server" ID="ltlJoinCount" Visible="false" Text='<%#Eval("JoinCount") %>'></asp:Literal>
                    <asp:Literal runat="server" ID="ltlActivityID" Visible="false" Text='<%#Eval("ActivityID") %>'></asp:Literal>

                    <asp:HyperLink runat="server" ID="hlActivityUsers" CssClass="joined-count" NavigateUrl='javascript:;'>
	                    <b><%#Eval("JoinCount") %></b> kişi katılıyor
	                </asp:HyperLink>                 
                    
                    <uc6:btnJoinActivity ID="btnJoinActivity1" runat="server"
                        ActivityID = '<%# Eval("ActivityID") %>'
                        UserCount = '<%# Convert.ToInt32(Eval("UserCount")) %>'
                        JoinCount = '<%# Convert.ToInt32(Eval("JoinCount")) %>'
                        AlternateUserCount = '<%# Convert.ToInt32(Eval("AlternateUserCount")) %>'
                        IsJoinUser = '<%# ((Convert.ToInt32(Eval("IsJoinUser"))) > 0) %>'
                     />
                        
                    <div class="clear"></div>
                </div>
                
            </div>
            <div class="clear"></div>
        </asp:Panel>
    </ItemTemplate>
</asp:Repeater>

<Paging:uPaging ID="Paging1" runat="server" Visible="false" />