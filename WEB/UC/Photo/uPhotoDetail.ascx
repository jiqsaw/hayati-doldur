<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uPhotoDetail.ascx.cs" Inherits="UC_Photo_uPhotoDetail" %>
<%@ Register src="~/UC/Common/Success.ascx" tagname="uSuccess" tagprefix="Success" %>

<asp:HiddenField runat="server" ID="hdCategory" />

<asp:HiddenField runat="server" ID="hdActivityID" Value="0" />
<asp:HiddenField runat="server" ID="hdPhotoID" Value="0" />

<div class="left-block">
                
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
        
        <div id="ArrowPanel" runat="server" class="photos-narrow gallery-narrow">
            <div class="narrow-left"><asp:HyperLink runat="server" ID="hlPrevious" ToolTip="Önceki">Önceki</asp:HyperLink></div>
            <div class="narrow-mid">
                <asp:Label runat="server" ID="lblPhotoIndex"></asp:Label>/
                <asp:Label runat="server" ID="lblPhotoCount"></asp:Label>
            </div>
            <div class="narrow-right"><asp:HyperLink runat="server" ID="hlNext" ToolTip="Sonraki">Sonraki</asp:HyperLink></div>
            <div class="clear"></div>
        </div>
        
        <div class="clear"></div>
        
        <div class="gallery-detail"> <!-- GALLERY DETAIL -->
        	<div class="img-detail">        	

        	    <asp:HyperLink runat="server" ID="hlImg" NavigateUrl='#'></asp:HyperLink>
        	    <Success:uSuccess ID="Success" runat="server" Desc="Fotoğraf Silinmiştir" Visible="false" />
        	            	    
        	</div>
            <div class="img-comment">
            
                <asp:Literal runat="server" ID="ltlKeywords"></asp:Literal>
                
                <br /><br />
                <asp:Literal runat="server" ID="ltlAddUserLbl">Ekleyen: </asp:Literal>
                <asp:HyperLink runat="server" ID="hlUser" CssClass="GreenLink" NavigateUrl="#"></asp:HyperLink>
                
            </div>
        </div>
        
        <div class="clear"></div>
        <div style="float: left;">
            <asp:LinkButton runat="server" ID="lnkRemove" CssClass="Remove"
                OnClick="lnkRemove_Click">Fotoğrafı Sil</asp:LinkButton>
        </div>
            
        <div class="gallery-link">
        	
        	<asp:HyperLink runat="server" ID="hlBackActivity" ToolTip="Etkinlik Sayfasına Dön">Etkinlik Sayfasına Dön</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:HyperLink runat="server" ID="hlBackPhotoGallery" ToolTip="Tüm Fotoğrafları Göster">Tüm Fotoğrafları Göster</asp:HyperLink>
            
        </div>
        
    </div>
    
</div>