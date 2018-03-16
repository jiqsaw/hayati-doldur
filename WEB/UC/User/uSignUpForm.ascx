<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uSignUpForm.ascx.cs" Inherits="UC_User_uSignUpForm" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="Ajax" %>
<%@ Register src="~/UC/Common/Error.ascx" tagname="uError" tagprefix="Error" %>
<%@ Register src="~/UC/Common/Date.ascx" tagname="uDate" tagprefix="Date" %>

<asp:UpdatePanel ID="upSignUpForm" runat="server">
    <ContentTemplate>
    
<asp:UpdateProgress ID="upgrsSignUpForm" runat="server" AssociatedUpdatePanelID="upSignUpForm" DynamicLayout="true">
    <ProgressTemplate>
        <img alt="" src="Images/Icons/Indicator.gif" />
    </ProgressTemplate>
</asp:UpdateProgress>

<asp:Panel runat="server" ID="pnlFormSended" CssClass="success" Visible="false">
    <asp:Literal runat="server" ID="ltlSuccess" Visible="false">Üyeliğinizin tamamlanması için lütfen e-posta adresinize gönderilen aktivasyon mesajındaki linke tıklayın, aktivasyon sürecini tamamlayın.</asp:Literal>
    <asp:Literal runat="server" ID="ltlSuccessNoEmail" Visible="false">Üye kaydı yapıldı fakat aktivasyon maili gönderilemedi. Lütfen ilgili linkten tekrar deneyin</asp:Literal>
</asp:Panel>

<asp:Panel runat="server" ID="pnlForm">

<script type="text/javascript">
    function cvPassCtrl(source, args) {
        args.IsValid = false;
        var jPass = theForm['<%=txtPassword.ClientID %>'].value;
        if (jPass.length == 0) { args.IsValid = true; }
        else if (jPass.length >= 5) { args.IsValid = true; }
    }

    function EducationShow() {
        var EducationLevel = '<%=ddlEducationLevelID.ClientID %>';
        if (ddlSelectedValue(EducationLevel) > 2)
            $get('dvUniversity').style.display = 'block';
        else
            $get('dvUniversity').style.display = 'none';
    }
    
</script>

<Error:uError ID="errHasEmail" runat="server" Desc="Seçtiğiniz e-posta adresi kullanılmaktadır. Lütfen başka bir e-posta adresi belirtin." Visible="false" />    	    
<Error:uError ID="errNoSave" runat="server" Desc="ÜYE KAYDI YAPILIRKEN HATA OLUŞTU. BİLGİLERİNİZİ KONTROL EDİNİZ." Visible="false" />

<div class="login-box"> <!-- LOGIN BOX -->
    <div class="login-head">Adınız:</div>
    <div class="login-input">
        
        <asp:TextBox runat="server" ID="txtFirstName" CssClass="TextBox" MaxLength="128" ValidationGroup="vgSignUp" /><br />
        <asp:RequiredFieldValidator ID="rqFirstName" ErrorMessage="Adınızı giriniz!" ControlToValidate="txtFirstName" SetFocusOnError="true" runat="server" CssClass="login-warn" Display="Static" ValidationGroup="vgSignUp" />        
        
    </div>
</div> <!-- // LOGIN BOX // -->

<div class="login-box"> <!-- LOGIN BOX -->
    <div class="login-head">Soyadınız:</div>
    <div class="login-input">
    
        <asp:TextBox runat="server" ID="txtSurname" CssClass="TextBox" MaxLength="128" ValidationGroup="vgSignUp" /><br />
        <asp:RequiredFieldValidator ID="rqSurname" ErrorMessage="Soyadınızı giriniz!" ControlToValidate="txtSurname" SetFocusOnError="true" runat="server" CssClass="login-warn" Display="Static" ValidationGroup="vgSignUp" />
    
    </div>
</div> <!-- // LOGIN BOX // -->

<div class="login-box"> <!-- LOGIN BOX -->
    <div class="login-head">Doğum Tarihiniz:</div>
    <div class="login-input">
    
        <Date:uDate ID="txtBirthDate" runat="server" />
        
    </div>
</div> <!-- // LOGIN BOX // -->

<div class="login-box"> <!-- LOGIN BOX -->
    <div class="login-head">E-posta Adresiniz:</div>
    <div class="login-input">
    
        <asp:TextBox runat="server" ID="txtEmail" CssClass="TextBox" MaxLength="120" ValidationGroup="vgSignUp" /><br />  
        <asp:RequiredFieldValidator ID="rqEmail" runat="server" CssClass="login-warn" ErrorMessage="E-posta adresinizi giriniz!" ControlToValidate="txtEmail" SetFocusOnError="true" Display="Dynamic" ValidationGroup="vgSignUp" />
        <asp:RegularExpressionValidator ID="rexEmail" runat="server"  CssClass="login-warn" ControlToValidate="txtEmail" ErrorMessage="Geçerli bir e-posta adresi giriniz !" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" ValidationGroup="vgSignUp" />
    
    </div>
</div> <!-- // LOGIN BOX // -->

<div class="login-box"> <!-- LOGIN BOX -->
    <div class="login-head">Şifreniz:</div>
    <div class="login-input">
    
        <asp:TextBox runat="server" ID="txtPassword" CssClass="TextBox" MaxLength="20" TextMode="Password" ValidationGroup="vgSignUp" /><br />
        <asp:RequiredFieldValidator ID="rqPassword" ErrorMessage="Şifrenizi giriniz!" ControlToValidate="txtPassword" Display="Dynamic"  runat="server" CssClass="login-warn" ValidationGroup="vgSignUp" />
        <asp:CustomValidator ID="cvPass" runat="server" Display="Dynamic" CssClass="login-warn" ClientValidationFunction="cvPassCtrl" ErrorMessage="Şifreniz en az 5 karakter olmalıdır !" ValidationGroup="vgSignUp" />
        
    </div>
</div> <!-- // LOGIN BOX // -->

<div class="login-box"> <!-- LOGIN BOX -->
    <div class="login-head">Şifreniz(Tekrar):</div>
    <div class="login-input">
    
        <asp:TextBox runat="server" ID="txtPassword2" CssClass="TextBox" MaxLength="20" TextMode="Password" ValidationGroup="vgSignUp" /><br />
        <asp:RequiredFieldValidator ID="rqPassword2" ErrorMessage="Şifre tekrarını giriniz!" ControlToValidate="txtPassword2" Display="Dynamic" runat="server" CssClass="login-warn" ValidationGroup="vgSignUp" />
        <asp:CompareValidator ID="cpvPassword" CssClass="login-warn" runat="server" ErrorMessage="Girdiğiniz şifreler birbirine uymuyor !" ControlToValidate="txtPassword2" ControlToCompare="txtPassword" Display="Dynamic" ValidationGroup="vgSignUp" />
        
    </div>
</div> <!-- // LOGIN BOX // -->
                    
<div class="login-box"> <!-- LOGIN BOX -->
    <div class="login-head">Eğitim Durumunuz:</div>
    <div class="login-input">
        <asp:DropDownList runat="server" ID="ddlEducationLevelID" onchange="EducationShow()"
            ValidationGroup="vgSignUp"></asp:DropDownList><br />
        <asp:RequiredFieldValidator ID="rqEducationLevel" ErrorMessage="Eğitim durumunuzu giriniz !" ControlToValidate="ddlEducationLevelID" Display="Dynamic" runat="server" CssClass="login-warn" ValidationGroup="vgSignUp" InitialValue="0" />
        
    </div>
</div> <!-- // LOGIN BOX // -->

<div class="login-box"> <!-- LOGIN BOX -->
    <div class="login-head">Mezuniyet Durumunuz:</div>
    <div class="login-input">
    
        <asp:DropDownList runat="server" ID="ddlEducationStatusID" ValidationGroup="vgSignUp"></asp:DropDownList><br />
        <asp:RequiredFieldValidator ID="rqEducationStatus" ErrorMessage="Mezuniyet durumunuzu giriniz !" ControlToValidate="ddlEducationStatusID" Display="Dynamic" SetFocusOnError="true" runat="server" CssClass="login-warn" ValidationGroup="vgSignUp" InitialValue="0" />
        
    </div>
</div> <!-- // LOGIN BOX // -->

<div class="login-box">
    <div id="dvUniversity" style="display: none;"> <!-- LOGIN BOX -->
        <div class="login-head">Üniversite Adı:</div>
        <div class="login-input">
        
            <asp:DropDownList runat="server" ID="ddlUniversityID" ValidationGroup="vgSignUp"></asp:DropDownList><br />
            
        </div>
    </div> <!-- // LOGIN BOX // -->
</div>


<div class="login-box"> <!-- LOGIN BOX -->
    <asp:ImageButton runat="server" ID="btnImgSignUp" 
        ImageUrl="~/images/register.gif" ValidationGroup="vgSignUp" 
        OnClick="btnImgSignUp_Click" />
</div>

</asp:Panel>

    </ContentTemplate>
</asp:UpdatePanel>