<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uUser.ascx.cs" Inherits="UC_User_uUser" %>
<%@ Register src="~/UC/Common/UserImage.ascx" tagname="UserImage" tagprefix="uc1" %>

<div class="left-block"> <!-- LEFT BLOCK -->

	<div class="member-container">
    	<div class="member-info-wrapper">
        	<div class="member-img">
        	
        	    <uc1:UserImage ID="UserImage1" runat="server" />
        	
        	</div>
            <div class="member-txt">
            	<p class="member-name">
            	
            	    <asp:Literal runat="server" ID="ltlFullName"></asp:Literal>
            	    
            	</p>
                <p class="member-spec">
                
                    <asp:Literal runat="server" ID="ltlSex" Visible="false">Bay</asp:Literal><asp:Literal runat="server" ID="ltlFemale" Visible="false">an</asp:Literal>
                    
                    <asp:Literal runat="server" ID="ltlAge"></asp:Literal>
                    
                    <asp:Literal runat="server" ID="ltlLocationName"></asp:Literal>
                    
                </p>
                <p class="member-school">
                
                    <asp:Literal runat="server" ID="ltlUniversityName"></asp:Literal>
                    
                </p>
                <div class="member-share">
                
                    <asp:HyperLink runat="server" ID="hlFacebook" Target="_blank" NavigateUrl="">Facebook</asp:HyperLink> &nbsp; &nbsp;
                    <asp:HyperLink runat="server" ID="hlFriendfeed" Target="_blank" NavigateUrl="">FriendFeed</asp:HyperLink> &nbsp; &nbsp;
                    <asp:HyperLink runat="server" ID="hlTwitter" Target="_blank" NavigateUrl="">Twitter</asp:HyperLink>
                    
                </div>
            </div>
            <div class="edit-profile"><asp:HyperLink runat="server" ID="hlProfileEdit">Profilini Düzenle</asp:HyperLink></a></div>
            <div class="clear"></div>
        </div>

    <div class="member-attend" id="dvUserActivities">
    <br /><br />
    	<h1>İlgilendiği Etkinlikler</h1>                
        
        <asp:Repeater runat="server" ID="rptUserActivities" OnItemDataBound="rpt_ItemDataBound">
        <ItemTemplate>
        
        <asp:Panel runat="server" CssClass="member-attend-wrapper" ID="pnlDetail">
        	<div class="row1">
                <asp:HyperLink runat="server" ID="hlCategory" NavigateUrl='<%# Eval("CategoryID", "~/?c={0}") %>'>
                <img alt="" src='Images/Categories/<%# Eval("CategoryID") %>.png' /></asp:HyperLink>
        	</div>
            <div class="row2"><h5>
            
                <asp:HyperLink runat="server" ID="hlActivity" NavigateUrl='<%#Eval("ActivityID") %>' Text='<%# Eval("ActivityTitle") %>'></asp:HyperLink>
                
                <asp:Literal runat="server" ID="ltlCategory" Visible="false" Text='<%#Eval("CategoryName") %>'></asp:Literal>
                
            </h5></div>
            <div class="row3"><h4><%# Eval("Place") %></h4></div>
            <div class="row4"><h3><%# Eval("ActivityDate") %></h3></div>
            <div class="clear"></div>
        </asp:Panel>
        
        </ItemTemplate>
        </asp:Repeater>

        <div id="dvUserActivitiesMore" class="member-attend-wrapper">
        	<asp:HyperLink runat="server" ID="hlAllUserActivites" CssClass="list-all" NavigateUrl="javascript:ShowTagElements('dvUserActivities', 'div', 'dvUserActivitiesMore')">
            [Tümünü Listele]
            </asp:HyperLink>  
        </div>
        
        <asp:Label CssClass="NoData" runat="server" ID="lblNoUserActivities" Text="<br>İlgilendiği etkinlik bulunmamaktadır"></asp:Label>
        
    </div>        
    
    <div class="member-photos">
    <br /><br />
        <div class="photos">
        
            <h1>Fotoğraflar</h1>

    	
<asp:UpdatePanel ID="upPhotos" runat="server">
    <ContentTemplate>                

            <div class="photos-narrow">
                <div class="narrow-left">
                
                    <asp:LinkButton runat="server" ID="lnkPrev" ToolTip="Önceki" 
                        onclick="lnkPrev_Click">Önceki</asp:LinkButton>
                    
                </div>
                <div class="narrow-right">
                
                    <asp:LinkButton runat="server" ID="lnkNext" ToolTip="Sonraki" 
                        onclick="lnkNext_Click">Sonraki</asp:LinkButton>
                    
                </div>
                <div class="clear"></div>
            </div>
            
            <div class="clear"></div>                        

<asp:UpdateProgress ID="uprgrsPhotos" runat="server" AssociatedUpdatePanelID="upPhotos" DynamicLayout="true">
    <ProgressTemplate>
        <img alt="" src="Images/Icons/Indicator.gif" />
    </ProgressTemplate>
</asp:UpdateProgress>
            
            <asp:Repeater runat="server" ID="rptPhotos" 
                OnItemDataBound="rptPhotos_ItemDataBound">
                <HeaderTemplate>
			        <ul class="event-list-pic">
                </HeaderTemplate>
			    <ItemTemplate>
				        <li>
				                    
                            <asp:Literal runat="server" ID="ltlCreatedByUserFirstname" Visible="false" Text='<%#Eval("Firstname") %>'></asp:Literal>
                            <asp:Literal runat="server" ID="ltlCreatedByUserSurname" Visible="false" Text='<%#Eval("Surname") %>'></asp:Literal>
                            <asp:Literal runat="server" ID="ltlKeywords" Visible="false" Text='<%#Eval("Keywords") %>'></asp:Literal>        
            				        
                            <asp:HyperLink runat="server" ID="hlDetail" ImageUrl='<%# Eval("Photo") %>' NavigateUrl='<%# Eval("PhotoID") %>' Text='<%# Eval("ActivityID") %>' ToolTip='<%#Eval("Keywords") %>' />
				        </li>			        
			    </ItemTemplate>
			    <FooterTemplate>
			        </ul>
			    </FooterTemplate>
			</asp:Repeater>

    </ContentTemplate>
</asp:UpdatePanel>

            <asp:Label CssClass="NoData" runat="server" ID="lblNoPhotos" Text="<br>Eklediği fotoğraf bulunmamaktadır" Visible="false"></asp:Label>

            <div class="clear"></div>
            
        </div>
    </div>
    
    </div>

</div>