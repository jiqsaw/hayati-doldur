<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uPhotoAddContent.ascx.cs" Inherits="UC_Photo_uPhotoAddContent" %>
<%@ Register src="~/UC/Common/Error.ascx" tagname="uError" tagprefix="Error" %>
<%@ Register src="~/UC/Common/Success.ascx" tagname="uSuccess" tagprefix="Success" %>

<asp:Panel runat="server" ID="pnlWrap" CssClass="wrapper">

	<div style="text-align: left;">
	    <div class="number">
	        <asp:Literal runat="server" ID="ltlPhotoNo"></asp:Literal>
	    </div>
	</div>
	
	<asp:Panel runat="server" ID="pnlHead">
        <div class="clear"></div>
        
            <asp:HyperLink CssClass="closed" runat="server" ID="hlPhotoAdd" NavigateUrl="javascript:;">Başka Fotoğraf Ekle</asp:HyperLink>
            
    </asp:Panel>
    
    <asp:Panel runat="server" ID="pnlPhoto">
        <div class="input">
    	    <span>Fotoğraf:</span>
            
            <asp:FileUpload ID="fuPhoto" runat="server" ValidationGroup="vgPhoto" CssClass="browse" />
            <asp:RegularExpressionValidator ID="rexPhoto1" runat="server"
                 ValidationExpression="(.*\.([gG][iI][fF]|[jJ][pP][gG]|[jJ][pP][eE][gG])$)"
                 ControlToValidate="fuPhoto"
                 Display="Dynamic"
                 SetFocusOnError="true"
                 ErrorMessage="Lütfen doğru bir fotoğraf seçiniz !"
                 ValidationGroup="vgPhoto" />

        </div>
        <div class="input">
    	    <span>Açıklama:</span>
            
            <asp:TextBox runat="server" ID="txtDesc" CssClass="desc" TextMode="MultiLine"></asp:TextBox>
            
        </div>
    </asp:Panel>

    <Error:uError ID="ErrorUpload" runat="server" Desc="FOTOĞRAF YÜKLENEMEDİ." Visible="false" />
    <Success:uSuccess ID="SuccUpload" runat="server" Desc="FOTOĞRAF YÜKLENDİ. Fotoğrafınız, onaylandıktan sonra yayınlanacaktır." Visible="false" />
 
</asp:Panel>