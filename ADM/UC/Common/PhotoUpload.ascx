<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PhotoUpload.ascx.cs" Inherits="UC_Common_PhotoUpload" %>
<%@ Register assembly="CS.WebControls.WebCropImage" namespace="CS.WebControls" tagprefix="cc1" %>
<%@ Register src="~/UC/Common/Error.ascx" tagname="uError" tagprefix="uErr1" %>

<asp:RequiredFieldValidator ID="rqPhoto" runat="server" ErrorMessage="Fotoğraf seçiniz!" ControlToValidate="fuPhoto" SetFocusOnError="true" Display="None" ValidationGroup="vgPhoto" />
<asp:RegularExpressionValidator ID="rexPhoto" runat="server"
                 ValidationExpression="(.*\.([gG][iI][fF]|[jJ][pP][gG]|[jJ][pP][eE][gG])$)"
                 ControlToValidate="fuPhoto"
                 Display="None"
                 SetFocusOnError="true"
                 ErrorMessage="Lütfen doğru bir fotoğraf seçiniz !"
                 ValidationGroup="vgPhoto" />
                                 
<asp:Panel runat="server" ID="pnlPhoto" CssClass="fW2">

<asp:Panel runat="server" ID="pnlPhotoForm">

    <uErr1:uError ID="pnlError" runat="server" Visible="false" Title="FOTOĞRAF YÜKLENEMEDİ" Desc="Doğru fotoğraf seçtiğinize emin olun" />

    <asp:ValidationSummary ID="vs1" runat="server" CssClass="Validate" ShowSummary="true" ValidationGroup="vgPhoto" />

    <h2>YENİ FOTOĞRAF EKLEME</h2>

    <div class="Form">
        <b>Fotoğrafı seçiniz</b> &nbsp;&nbsp; [ Özgün Genişlik: <%=this._SizeW.ToString()%>px ] [ Format: JPG, JPEG, GIF ]
        <asp:FileUpload ID="fuPhoto" runat="server" CssClass="TextBox" ValidationGroup="vgPhoto" />
                
    </div>
    
    <div class="FormFooter">
        <asp:Button runat="server" ID="btnPhotoSave" CssClass="Button" Text="FOTOĞRAFI YÜKLE" ValidationGroup="vgPhoto" onclick="btnPhotoSave_Click" />
    </div>
    
</asp:Panel>
<asp:Panel runat="server" ID="pnlSizing" Visible="false">

    <h2>FOTOĞRAF BOYUTLANDIRMA</h2>
    
    <div class="Form">
        <div class="ImgUploaded ScrollColor"><asp:Image runat="server" ID="imgPhoto" /></div>        
    </div>
    
    <div class="FormFooter" align="center">
        <asp:Button runat="server" ID="btnContinue" CssClass="Button" Text="DEVAM ET" 
            ValidationGroup="vgSizing" onclick="btnContinue_Click" />
    </div>
    
    <cc1:WebCropImage ID="wci1" runat="server" 
            CropImage="imgPhoto"
            IncludeJQuery="true" 
            ScriptPath="~/Scripts/Jquery/"   
            CropButtonID="btnContinue"
             />

</asp:Panel>
    
</asp:Panel>