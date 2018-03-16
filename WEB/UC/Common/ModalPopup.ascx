<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ModalPopup.ascx.cs" Inherits="UserControls_Common_ModalPopup" %>
<%@ Register 
    Assembly="AjaxControlToolkit" 
    Namespace="AjaxControlToolkit" 
    TagPrefix="ajaxToolkit" %>

<asp:Panel runat="server" ID="pnlModal" CssClass="lightbox-wrapper">
	<div class="lightbox-top"></div>
    <div class="lightbox-body">
    	<div class="lightbox-header"><p class="warning">
    	
            <asp:Literal runat="server" ID="ltlTitle"></asp:Literal>
    	    
    	</p></div>
        <span class="lightbox-span">
            <asp:Literal runat="server" ID="ltlText"></asp:Literal>
        </span>
        
        <div class="lightbox-send">
        
        	<asp:HyperLink runat="server" ID="hlCancel" CssClass="lightbox-cancel-btn" NavigateUrl="#">Vazgeç</asp:HyperLink>

            <asp:HyperLink runat="server" ID="hlLogin" CssClass="lightbox-send-btn" NavigateUrl="~/Login.aspx">Üyelik</asp:HyperLink>

            
        	<div class="clear"></div>
        	
        </div>
    </div>
    <div class="lightbox-bottom"></div>
                
</asp:Panel>

<ajaxToolkit:ModalPopupExtender ID="MPE" runat="server"
    PopupControlID="pnlModal"
    BackgroundCssClass="modalBackground" 
    OkControlID="hlLogin" 
    OnOkScript="onOk()"
    CancelControlID="hlCancel" 
    PopupDragHandleControlID="pnlModalNeedLogin" />
    
    
