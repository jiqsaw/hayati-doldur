<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uUserSearch.ascx.cs" Inherits="UC_User_uUserSearch" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register src="~/UC/User/uUserManagement.ascx" tagname="uUserManagement" tagprefix="uc1" %>


<asp:Panel runat="server" ID="pnlExpand">
<h2 style="cursor: pointer;">TÜM ÜYELERDE ARA</h2>
</asp:Panel>

<asp:Panel runat="server" ID="pnlSearch">

    <div class="Form">

    İsim / mail
    <asp:TextBox CssClass="TextBox" runat="server" ID="txtName" ValidationGroup="vgUserSearch" MaxLength="512"></asp:TextBox>

    <p>Şehir</p>
    <asp:DropDownList runat="server" ID="ddlLocationID" ValidationGroup="vgUserSearch"></asp:DropDownList>
            
    <p>Üniversite</p>
    <asp:DropDownList runat="server" ID="ddlUniversityID" ValidationGroup="vgUserSearch"></asp:DropDownList>

    <p>Eğitim Durumu</p>
    <asp:DropDownList runat="server" ID="ddlEducationLevelID" ValidationGroup="vgUserSearch"></asp:DropDownList>
    
    <p>Kayıt Tarihi (Minimum)</p>
    <cc1:CalendarExtender ID="ajCalendarCreateDate" runat="server" TargetControlID="txtCreateDate" Format="dd MMMM yyyy"></cc1:CalendarExtender>
    <asp:TextBox CssClass="TextBox" runat="server" ID="txtCreateDate" ValidationGroup="vgUserSearch"></asp:TextBox>

    <p>Yaş (Minimum)</p>
    <cc1:CalendarExtender ID="ajCalendarBirthDate" runat="server" TargetControlID="txtBirthDate" Format="dd MMMM yyyy"></cc1:CalendarExtender>
    <asp:TextBox CssClass="TextBox" runat="server" ID="txtBirthDate" ValidationGroup="vgUserSearch"></asp:TextBox>

        <p> </p>
        <asp:RadioButton runat="server" ID="rdIsFemaleAll" GroupName="rdGrIsFemale" Text="Hepsi" Checked="true" ValidationGroup="vgUserSearch"/>
        <asp:RadioButton runat="server" ID="rdIsFemaleM" GroupName="rdGrIsFemale" Text="Bay" ValidationGroup="vgUserSearch"/>
        <asp:RadioButton runat="server" ID="rdIsFemaleF" GroupName="rdGrIsFemale" Text="Bayan"  ValidationGroup="vgUserSearch"/>         

        <p> </p>
        <asp:RadioButton runat="server" ID="rdIsFacebookUserAll" GroupName="rdGrIsFacebookUser" Text="Hepsi" Checked="true" ValidationGroup="vgUserSearch"/>
        <asp:RadioButton runat="server" ID="rdIsFacebookUserY" GroupName="rdGrIsFacebookUser" Text="Facebook login kullanan üyeler" ValidationGroup="vgUserSearch"/>
        <asp:RadioButton runat="server" ID="rdIsFacebookUserN" GroupName="rdGrIsFacebookUser" Text="Facebook login olmayan üyeler"  ValidationGroup="vgUserSearch"/>     
        
        <p> </p>
        <asp:RadioButton runat="server" ID="rdIsActiveAll" GroupName="rdGrIsActive" Text="Hepsi" Checked="true" ValidationGroup="vgUserSearch"/>
        <asp:RadioButton runat="server" ID="rdIsActive" GroupName="rdGrIsActive" Text="Aktif Olanlar" ValidationGroup="vgUserSearch"/>
        <asp:RadioButton runat="server" ID="rdIsInactive" GroupName="rdGrIsActive" Text="Aktivasyon Yapmayanlar"  ValidationGroup="vgUserSearch"/>    
    
    <br /><br />
    
    <b><asp:Literal runat="server" ID="ltlUserCount"></asp:Literal></b> aktif üye mevcut
    
    </div>

    <div class="FormFooter">
        <asp:Button runat="server" ID="btnFind" CssClass="Button" Text="ÜYELERDE ARA"
            ValidationGroup="vgUserSearch" onclick="btnFind_Click" />
    </div>

</asp:Panel>


<asp:Panel runat="server" ID="pnlResults" Visible="false">

    <br />

    <h1>ÜYE ARAMA SONUÇLARI</h1>

    <uc1:uUserManagement ID="uUserManagement1" runat="server" />

</asp:Panel>

<cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender1" runat="server"
    TargetControlID="pnlSearch"
    ExpandControlID="pnlExpand"
    CollapseControlID="pnlExpand"
    SuppressPostBack="True" Enabled="True" />