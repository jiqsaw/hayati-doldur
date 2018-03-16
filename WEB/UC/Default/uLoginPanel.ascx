<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uLoginPanel.ascx.cs" Inherits="UC_Default_uLoginPanel" %>
<%@ Register src="~/UC/Common/UserImage.ascx" tagname="uUserImage" tagprefix="UserImage" %>

<asp:Panel runat="server" ID="pnlOnline" CssClass="login-area" Visible="false">
    <div class="login-img">

        <UserImage:uUserImage ID="uUserImage1" runat="server" /><br />
        
    </div>
    <div class="login-name">        
        <asp:HyperLink runat="server" ID="hlFullName" CssClass="login-namee"></asp:HyperLink>
        
        <asp:Panel runat="server" ID="pnlUpcomingActivities"><p>Yaklaşan

            "<asp:Label runat="server" ID="lblUpcomingAcitivitiesCount"></asp:Label>"

            etkinliğiniz var</p>
        
        </asp:Panel>
        
        <asp:Panel runat="server" ID="pnlUpcomingActivitiesNone">
            <p>Yakında etkinliğiniz yok</p>
        </asp:Panel>
        
        
    </div>
    <div class="login-logout">
    
        <asp:LinkButton runat="server" ID="lnkLogOut" ToolTip="Güvenli Çıkış" 
            OnClick="lnkLogOut_Click">Çıkış</asp:LinkButton>
    
    </div>
    <div class="clear"></div>
</asp:Panel>

<asp:Panel runat="server" ID="pnlOffline" CssClass="login-area">
    <div class="member-login"><a href="Login.aspx" title="Üye Girişi">Üye Girişi</a></div>
    <div class="member-reg"><a href="Login.aspx?IsNew=1" title="Üye Ol">Üye Ol</a></div>
</asp:Panel>