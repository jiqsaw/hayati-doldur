<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uActivityUsers.ascx.cs" Inherits="UC_Activities_uActivityUsers" %>
<%@ Register src="~/UC/Common/UserImage.ascx" tagname="uUserImage" tagprefix="UserImage" %>
<%@ Register src="~/UC/Common/Paging.ascx" tagname="uPaging" tagprefix="Paging" %>

<asp:HiddenField runat="server" ID="hdCategory" />

<div class="left-block"> <!-- LEFT BLOCK -->
                
    <div class="content-detailJoined"> <!-- CONTENT DETAIL -->
    	<div class="content-detail-header">
            <asp:Label runat="server" ID="lblActivityTitle"></asp:Label>
            <h3><asp:Literal runat="server" ID="ltlPlace"></asp:Literal></h3>
        </div>
        <div class="content-detail-icons">
        	<div class="icon">
                <div class="bus">
                    <asp:Image runat="server" ID="imgBus" ImageUrl="~/Images/bus.png" />
                </div>
                <div class="category">
                    <asp:Image runat="server" ID="imgCategory" ImageUrl="~/Images/Categories/||CATEGORYID||.png" />
                </div>
                <div class="clear"></div>
            </div>
            <div class="detail-date"><asp:Literal runat="server" ID="ltlActivityDate"></asp:Literal></div>
        </div>
        <div class="clear"></div>
    </div>        
    
    <asp:Panel runat="server" ID="pnlFriends">
    
        <div class="attender-friend">
        	<h1>Etkinliğe Katılan Facebook Arkadaşlarınız</h1>
            
            <div class="attender-container">
                            
                <asp:Repeater runat="server" ID="rptFriends">
                <ItemTemplate>
                          
                    <div class="attender-wrapper">
                        <div class="attender-img">
                        
                            <UserImage:uUserImage ID="uUserImage2" runat="server" 
                            UserID='<%#Convert.ToInt32(Eval("UserID")) %>'
                            size="square"
                            uid='<%#long.Parse(Eval("FacebookID").ToString()) %>'
                            Photo='<%# Eval("Photo").ToString() %>' />
                        
                        </div>
                        <div class="attender-name">
                        
                            <asp:HyperLink runat="server" ID="hlName" NavigateUrl='<%#Eval("UserID", "~/User.aspx?j={0}") %>'>
                                <%#Eval("FirstName") %>&nbsp;<%#Eval("Surname") %>
                            </asp:HyperLink>
                            
                        </div>
                        <div class="clear"></div>
                    </div>
                
                </ItemTemplate>
                </asp:Repeater>
                
             </div>
            <div class="clear"></div>
        </div>            
    
        <div id="dvOtherAllFriends" runat="server" class="attender-footer">
    	    <div class="attender-counter">
    	        Etkinliğe katılacak toplam 
    	            <asp:Label runat="server" ID="lblAllFriendsCount"></asp:Label>
    	        arkadaşınız var.
    	    </div>
            <div class="attender-list">
                
                <asp:HyperLink runat="server" ID="hlAllFriends" NavigateUrl="#">Tümünü Listele</asp:HyperLink>
                
            </div>
            <div class="clear"></div>
        </div>
        
        <div class="clear"></div>
        <br /><br /><br /><br />
        
    </asp:Panel>
        
        
    <asp:Panel runat="server" ID="pnlAllUsers">
    
    <div class="content-detail"> <!-- CONTENT DETAIL -->
    
        <div class="attender-friend"> <!-- ATTENDER ELSE -->
        	<h1>Etkinliğe Katılan Üyeler</h1>
            
            <div class="attender-container">
            
                <asp:Repeater runat="server" ID="rptUsers">
                <ItemTemplate>
                          
                    <div class="attender-wrapper">
                        <div class="attender-img">
                        
                            <UserImage:uUserImage ID="uUserImage1" runat="server" 
                            UserID='<%#Convert.ToInt32(Eval("UserID")) %>'
                            size="square"
                            uid='<%#long.Parse(Eval("FacebookID").ToString()) %>'
                            Photo='<%# Eval("Photo").ToString() %>' />
                        
                        </div>
                        <div class="attender-name">
                        
                            <asp:HyperLink runat="server" ID="hlName" NavigateUrl='<%#Eval("UserID", "~/User.aspx?j={0}") %>'>
                                <%#Eval("FirstName") %>&nbsp;<%#Eval("Surname") %>
                            </asp:HyperLink>
                            
                        </div>
                        <div class="clear"></div>
                    </div>
                
                </ItemTemplate>
                </asp:Repeater>

            </div>
            <div class="clear"></div>
        </div> <!-- // ATTENDER ELSE // -->
        
    </div> <!-- // CONTENT DETAIL // -->
    
    <div id="dvOtherAllUsers" runat="server" class="attender-footer">
	    <div class="attender-counter">
	        Etkinliğe katılacak toplam 
	            <asp:Label runat="server" ID="lblAllUserCount"></asp:Label>
	        üye var.
	    </div>
        <div class="attender-list">
            
            <asp:HyperLink runat="server" ID="hlAllUsers" NavigateUrl="#">Tümünü Listele</asp:HyperLink>
            
        </div>
        <div class="clear"></div>
    </div>
    
    </asp:Panel>
    
    
    <Paging:uPaging ID="uPagingAll" runat="server" Visible="false" />
    
    <div class="attender-button">
        <br /><br />
    	<asp:HyperLink runat="server" ID="hlBackActivity" ImageUrl="~/Images/attend-back.gif" NavigateUrl="#"></asp:HyperLink>
        &nbsp;&nbsp;&nbsp;
        <asp:HyperLink runat="server" ID="hlBackActivityUsers" ImageUrl="~/Images/attender-back.gif" NavigateUrl="#"></asp:HyperLink>
        <br /><br /><br />
    </div>
                
</div>