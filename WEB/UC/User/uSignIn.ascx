<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uSignIn.ascx.cs" Inherits="UC_User_uSignIn" %>
<%@ Register src="~/UC/Common/Error.ascx" tagname="uError" tagprefix="error" %>
<%@ Register src="~/UC/User/uFacebookLogin.ascx" tagname="uFacebookLogin" tagprefix="uc2" %>

<div class="register-step1" id="dvSignInPanel">
    <h1>Üye Girişi</h1>
    
    <div class="box-top"></div>
    <div class="box-body register">
    
    <div class="WarningHolder">   
        <Error:uError ID="errNoLogin" runat="server" Desc="Geçersiz bir e-posta adresi veya şifre girdiniz." Visible="false" />    
    </div>
    
        <div class="register-mail">
            <div class="login-head">E-posta Adresiniz</div>
            <div class="register-input">
            
                <asp:TextBox runat="server" ID="txtLoginEmail" CssClass="signin-input" ValidationGroup="vgLogin"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rqEmail" runat="server" CssClass="login-warn" ErrorMessage="e-posta adresinizi giriniz!" ControlToValidate="txtLoginEmail" Display="Dynamic" ValidationGroup="vgLogin" />
                <asp:RegularExpressionValidator ID="rexEmail" runat="server"  CssClass="login-warn" ControlToValidate="txtLoginEmail" ErrorMessage="Geçerli bir e-posta adresi giriniz !" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" ValidationGroup="vgLogin" />
                
            </div>
        </div>
        
        <div class="register-pass">
            <div class="login-head">Şifreniz</div>
            <div class="register-input">
            
                <asp:TextBox runat="server" ID="txtLoginPassword" CssClass="signin-input" ValidationGroup="vgLogin" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rqPassword" runat="server" CssClass="login-warn" ErrorMessage="Şifrenizi giriniz!" ControlToValidate="txtLoginPassword" Display="Static" ValidationGroup="vgLogin" />
                
            </div>
        </div>
        
        <div class="register-action">
            <div class="remember-me">
                <asp:CheckBox runat="server" ID="chIsRemember" />                
            <p>Beni Hatırla</p></div>
            <div class="login-btn">
                
                <asp:ImageButton runat="server" ID="btnImgLogin" 
                ImageUrl="~/images/login-btn.gif" ValidationGroup="vgLogin" 
                onclick="btnImgLogin_Click" />
                
            </div>
        </div>
        
        <div class="register-links">
            <a href="javascript:LoginPanelShow('dvForgotPasswordPanel')" title="Şifremi Unuttum">Şifremi Unuttum.</a>
            <a href="javascript:LoginPanelShow('dvActivationPanel')" title="Aktivasyon Kodunu Tekrar Gönder">Aktivasyon Kodunu Tekrar Gönder.</a>
        </div>
        
        <uc2:uFacebookLogin ID="uFacebookLogin1" runat="server" />
        
    </div>
    <div class="box-bottom"></div>
</div>

<asp:HiddenField runat="server" ID="hdUrlReferrer" />