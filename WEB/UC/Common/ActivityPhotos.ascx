<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ActivityPhotos.ascx.cs" Inherits="UC_Common_uActivityPhotos" %>

<div id="dvPhoto" runat="server" class="photos">
    <h1>Fotoğraflar</h1>
    <div class="photos-narrow" style="display: none;">
    
        <div class="narrow-left"><a href="#" title="Önceki">Önceki</a></div>
        <div class="narrow-right"><a href="#" title="Sonraki">Sonraki</a></div>
        
        <div class="clear"></div>
    </div>
    <div class="clear"></div>
    <ul>
    
        <asp:Repeater runat="server" ID="rptPhotos" 
            OnItemDataBound="rptPhotos_ItemDataBound">
        <ItemTemplate>                        
    
        <li>
            <asp:Literal runat="server" ID="ltlCreatedByUserFirstname" Visible="false" Text='<%#Eval("Firstname") %>'></asp:Literal>
            <asp:Literal runat="server" ID="ltlCreatedByUserSurname" Visible="false" Text='<%#Eval("Surname") %>'></asp:Literal>
            <asp:Literal runat="server" ID="ltlKeywords" Visible="false" Text='<%#Eval("Keywords") %>'></asp:Literal>
            <asp:HyperLink runat="server" ID="hlDetail" ImageUrl='<%# Eval("Photo") %>' NavigateUrl='<%# Eval("PhotoID") %>' Text='<%# Eval("ActivityID") %>' />
        </li>
    	
        </ItemTemplate>
        </asp:Repeater>
    	
    </ul>
    <div class="clear"></div>
</div>
<div class="gallery-link"><div class="clear"></div>
    <br /><br />
    <asp:HyperLink runat="server" ID="hlGoToGallery" NavigateUrl="#">Galeriye Git</asp:HyperLink>
</div>