<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uFacebookLogin.ascx.cs" Inherits="UC_User_uFacebookLogin" %>

<div class="fconnect">
    <fb:login-button length="long" onlogin="go('Login.aspx?f=1')"></fb:login-button>
</div>

<asp:HiddenField runat="server" ID="hdUrlReferrer" />
