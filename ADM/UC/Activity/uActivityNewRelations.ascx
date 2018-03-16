<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uActivityNewRelations.ascx.cs" Inherits="UC_Activity_uActivityNewRelations" %>
<%@ Register src="~/UC/Common/Error.ascx" tagname="uError" tagprefix="uc1" %>                 
<%@ Register src="~/UC/Common/Success.ascx" tagname="uSuccess" tagprefix="uc2" %>
<%@ Register src="~/UC/Activity/uActivities.ascx" tagname="uActivities" tagprefix="uc3" %>

<h2>İLİŞKİLİ ETKİNLİKLER</h2>

    <div class="Form">

    <p>Etinliklerde Ara</p>
    <asp:TextBox CssClass="TextBox" runat="server" ID="txtActivityTitleDetail" ValidationGroup="vgActivitySearch" MaxLength="512"></asp:TextBox>
        
    </div>

    <div class="FormFooter">
        <asp:Button runat="server" ID="btnFind" CssClass="Button" Text="FİLTRELE"
            ValidationGroup="vgActivitySearch" onclick="btnFind_Click" />
    </div>

    <br />

    <h1>ATANAN İLİŞKİLİ ETKİNLİKLER</h1>

    <uc3:uActivities ID="uActivitiyRelations" runat="server" />
    
    <asp:Button CssClass="Button2" runat="server" ID="btnRelationActivity" 
    Text="İlişkili etkinliklerden çıkar" onclick="btnRelationActivity_Click" 
     />
    
    <br /><br />
    
    <h1>ETKİNLİKLER</h1>

    <uc3:uActivities ID="uActivities1" runat="server" />
    
    <asp:Button CssClass="Button2" runat="server" ID="btnRelationAdd" 
    Text="İlişkili etkinliklere ekle" onclick="btnRelationAdd_Click" 
    />