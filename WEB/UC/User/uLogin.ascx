<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uLogin.ascx.cs" Inherits="UC_User_uLogin" %>
<%@ Register src="~/UC/User/uSignUpForm.ascx" tagname="uSignUpForm" tagprefix="uc1" %>
<%@ Register src="~/UC/User/uSignIn.ascx" tagname="uSignIn" tagprefix="uc2" %>
<%@ Register src="~/UC/User/uSendActivationCode.ascx" tagname="uSendActivationCode" tagprefix="uc3" %>
<%@ Register src="~/UC/User/uForgotPassword.ascx" tagname="uForgotPassword" tagprefix="uc4" %>

<div class="left-block"> <!-- LEFT BLOCK -->
                
    <div class="login"> <!-- LOGIN -->
    
    <asp:Panel runat="server" CssClass="login-wrapper" ID="pnlStep2">
            <h1>Ücretsiz Üye Olun</h1>
            <div class="login-container"> <!-- LOGIN CONTAINER -->
            
                <uc1:uSignUpForm ID="uSignUpForm1" runat="server" />
                                        
            </div> <!-- // LOGIN CONTAINER // -->
    </asp:Panel>
        
    <asp:Panel runat="server" CssClass="register-now-wrapper" ID="pnlStep1">
        <div class="register-now-wrapper" style="display:block"> <!-- REGISTER NOW -->
        	<h1>Hayatı Doldur'a Şimdi Katılın</h1>
        	<br /><br />
            <div class="register-now">
            	<div class="register-header">
                	<p class="register-block"></p>
                    <p class="register-txt">Hayatı Doldur’a siz de katılın!</p>
                    <div class="clear"></div>
                </div>
                <div class="register-why">
                    <p>Hayatı Doldur’a katılmak çok kolay. İster Facebook hesabınızla, ister üyelik formuyla katılın; etkinlik takvimi sizin ilgi alanınıza göre filtrelensin, nerede ne oluyor anında haberiniz olsun. Beğendiğiniz etkinlikler hakkında istediğiniz kadar yorum yapın, sosyal medyada paylaşın! </p>
                </div>
                <div class="register-now-btn">
                    <asp:Image runat="server" ID="imgSignup" ImageUrl="~/images/register.gif" />
                </div>
            </div>
        </div>
        </asp:Panel>
        
    </div> <!-- // LOGIN // -->
    
</div>

<script type="text/javascript">
    function LoginPanelShow(ShowID) {
        Hides('dvSignInPanel,dvActivationPanel,dvForgotPasswordPanel');
        Show(ShowID);
    }
</script>

<div class="right-block"> <!-- RIGHT BLOCK -->
            
    <uc2:uSignIn ID="uSignIn1" runat="server" />

    <uc3:uSendActivationCode ID="uSendActivationCode1" runat="server" />

    <uc4:uForgotPassword ID="uForgotPassword1" runat="server" />

</div>