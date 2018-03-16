<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uLogin.ascx.cs" Inherits="UC_Default_uLogin" %>
<%@ Register src="~/UC/Common/Error.ascx" tagname="uError" tagprefix="uc1" %>

<div class="LoginForm">
          
<asp:RequiredFieldValidator ID="rqUserName" runat="server" ErrorMessage="Kullanıcı Adınızı Giriniz !" ControlToValidate="txtUserName" SetFocusOnError="true" Display="None"  ValidationGroup="vgLogin" />
<asp:RequiredFieldValidator ID="rqPass" runat="server" ErrorMessage="Şifrenizi Giriniz !" ControlToValidate="txtPassword" SetFocusOnError="true" Display="None"  ValidationGroup="vgLogin" />

    <uc1:uError ID="uError1" runat="server" Visible="false" Title="GİRİŞ YAPILAMADI" Desc="Girdiğinize kriterlere uygun kullanıcı bulunamadı" />

    <asp:ValidationSummary ID="ValSum" runat="server" CssClass="Validate" ShowSummary="true" ValidationGroup="vgLogin" />

    <h2>YÖNETİM PANELİ LOGIN EKRANI</h2>
    <div class="Form">
    	Kullanıcı adı
        <asp:TextBox CssClass="TextBox" runat="server" ID="txtUserName" MaxLength="50" ValidationGroup="vgLogin"></asp:TextBox>
        
    	<p>Şifre</p>
        <asp:TextBox CssClass="TextBox" runat="server" ID="txtPassword" TextMode="Password" MaxLength="50" ValidationGroup="vgLogin"></asp:TextBox>
    </div>
    <div class="FormFooter">
        <asp:Button runat="server" ID="btnSend" CssClass="Button" Text="GÖNDER"  ValidationGroup="vgLogin" onclick="btnSend_Click" />
    </div>

</div>