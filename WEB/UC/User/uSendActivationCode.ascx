<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uSendActivationCode.ascx.cs" Inherits="UC_User_uSendActivationCode" %>
<%@ Register src="~/UC/Common/Error.ascx" tagname="uError" tagprefix="Error" %>
<%@ Register src="~/UC/Common/Success.ascx" tagname="uSuccess" tagprefix="Success" %>

<div class="register-step2" id="dvActivationPanel" style="display: none;">
	<h1>Aktivasyon Kodu</h1>
    <div class="box-top"></div>
    <div class="box-body register">
    	<asp:Panel ID="pnlReActivitionCode" DefaultButton="imgTell" runat="server" CssClass="step2">

<asp:UpdatePanel ID="upActivationPanel" runat="server">
    <ContentTemplate>

<div class="WarningHolder">
        	
<Error:uError ID="errNoUser" runat="server" Desc="Bu e-posta adresine ait bir üye kaydı bulunmamaktadır." Visible="false" />
<Success:uSuccess ID="Success" runat="server" Desc="Aktivasyon linki e-posta adresinize gönderilmiştir" Visible="false" />

</div>

<asp:UpdateProgress ID="upgrsActivationPanel" runat="server" AssociatedUpdatePanelID="upActivationPanel" DynamicLayout="true">
    <ProgressTemplate>
        <img alt="" src="Images/Icons/Indicator.gif" />
    </ProgressTemplate>
</asp:UpdateProgress>
                                	
            <p class="step2-p">Aktivasyon e-postanızı tekrar almak için, kayıt olurken girdiğiniz e-posta adresini yazıp, gönderin.</p>
            <div class="register-mail">
                <div class="login-head">E-posta Adresiniz</div>
                <div class="register-input">
                
                <asp:TextBox runat="server" ID="txtEmail" CssClass="signin-input" ValidationGroup="vgActivation"></asp:TextBox>
            
                <asp:RequiredFieldValidator ID="rqEmail" runat="server" CssClass="login-warn" ErrorMessage="E-posta adresinizi giriniz!" ControlToValidate="txtEmail" SetFocusOnError="true" Display="Dynamic" ValidationGroup="vgActivation" />
                <asp:RegularExpressionValidator ID="rexEmail" runat="server"  CssClass="login-warn" ControlToValidate="txtEmail" ErrorMessage="Geçerli bir e-posta adresi giriniz !" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" ValidationGroup="vgActivation" />
                    
                </div>
            </div>
            <div class="step2-footer">
                <a href="javascript:LoginPanelShow('dvSignInPanel')" title="Kapat">Kapat</a>
                
                	<asp:ImageButton runat="server" ID="imgTell" ValidationGroup="vgActivation"
                    ImageUrl="~/images/send-comment.gif" onclick="imgActivationSend_Click" />                
                
                
                <div class="clear"></div>
            </div>
            
    </ContentTemplate>
</asp:UpdatePanel>
            
        </asp:Panel>
    </div>
    <div class="box-bottom"></div>
</div>