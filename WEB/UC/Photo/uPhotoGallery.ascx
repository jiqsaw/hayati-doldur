<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uPhotoGallery.ascx.cs" Inherits="UC_Photo_uPhotoGallery" %>
<%@ Register src="~/UC/Common/Paging2.ascx" tagname="uPaging" tagprefix="Paging" %>

<asp:HiddenField runat="server" ID="hdCategory" />
<asp:HiddenField runat="server" ID="hdActivityID" Value="0" />

<div class="left-block"> <!-- LEFT BLOCK -->
                
    <div class="content-detail"> <!-- CONTENT DETAIL -->
    	<div class="content-detail-header">
            <h2>
            
                <asp:Literal runat="server" ID="ltlActivityTitle"></asp:Literal>
            
            </h2>
            <h3>
            
                <asp:Literal runat="server" ID="ltlPlace"></asp:Literal>
            
            </h3>
            <h4>
            </h4>
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
            <div class="detail-date">
            
                <asp:Literal runat="server" ID="ltlActivityDate"></asp:Literal>
            
            </div>
        </div>
        <div class="clear"></div>
    </div> <!-- // CONTENT DETAIL // -->
    
    <div class="gallery">
    	<h1>Fotoğraf Galerisi</h1>
        
        <Paging:uPaging ID="Paging1" runat="server" Visible="false" />
                
        <div class="clear"></div>
        
        <div class="gallery-contanier">
        
        	<asp:Repeater runat="server" ID="rptList" 
                OnItemDataBound="rptList_ItemDataBound">
        	    <ItemTemplate>
        	
        	<div class="img">
            	<table border="0" cellpadding="0" cellspacing="0" height="145" width="145">
                	<tr>
                    	<td align="center" valign="middle" style="vertical-align:middle">
                    	
                            <asp:Literal runat="server" ID="ltlCreatedByUserFirstname" Visible="false" Text='<%#Eval("Firstname") %>'></asp:Literal>
                            <asp:Literal runat="server" ID="ltlCreatedByUserSurname" Visible="false" Text='<%#Eval("Surname") %>'></asp:Literal>
                            <asp:Literal runat="server" ID="ltlKeywords" Visible="false" Text='<%#Eval("Keywords") %>'></asp:Literal>
            
                    	    <asp:HyperLink runat="server" ID="hlImg" NavigateUrl='<%#Eval("PhotoID") %>' ImageUrl='<%#Eval("Photo") %>'></asp:HyperLink>
                    	</td>
                    </tr>
                </table>
            </div> 
           
                </ItemTemplate>
        	</asp:Repeater>
            
        </div>
        
        <div class="clear"></div>
        <div class="gallery-link">
        
            <asp:HyperLink runat="server" ID="hlBackActivity" ToolTip="Etkinlik Sayfasına Dön">Etkinlik Sayfasına Dön</asp:HyperLink>    
            
        </div>
        
    </div>
    
</div>