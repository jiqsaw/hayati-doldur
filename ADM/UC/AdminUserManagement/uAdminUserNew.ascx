<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uAdminUserNew.ascx.cs" Inherits="UC_AdminUserManagement_uAdminUserNew" %>
<%@ Register src="~/UC/Common/Error.ascx" tagname="uError" tagprefix="uc1" %>
<%@ Register src="~/UC/Common/Success.ascx" tagname="uSuccess" tagprefix="uc2" %>

    <uc2:uSuccess ID="uSuccess1" runat="server" Visible="false" Title="YENİ ADMIN KULLANICI HESABI OLUŞTURULDU" Desc="Kullanıcı hesabı belirlediğiniz yetkiler ile oluşturulmuştur" />
    <uc2:uSuccess ID="uSuccess2" runat="server" Visible="false" Title="ADMIN KULLANICISININ BİLGİLERİ GÜNCELLENDİ" Desc="Kullanıcı hesabı güncellenmiştir" />    
    
<asp:Panel runat="server" ID="pnlForm" CssClass="fW2">

<asp:RequiredFieldValidator ID="rqUserName" runat="server" ErrorMessage="Kullanıcı Adını Giriniz !" ControlToValidate="txtUserName" SetFocusOnError="true" Display="None"  ValidationGroup="vgAdminNew" />
<asp:RequiredFieldValidator ID="rqPass" runat="server" ErrorMessage="Şifreyi Giriniz !" ControlToValidate="txtPassword" SetFocusOnError="true" Display="None"  ValidationGroup="vgAdminNew" />

    <uc1:uError ID="uError1" runat="server" Visible="false" Title="KAYIT EDİLMEDİ" Desc="Kayıt yapılırken hata oluştu" />
    <uc1:uError ID="uError2" runat="server" Visible="false" Title="KAYIT EDİLMEDİ" Desc="Bu kullanıcı adına sahip admin bulunmaktadır. Başka bir kullanıcı adı giriniz." />

    <asp:ValidationSummary ID="ValSum" runat="server" CssClass="Validate" ShowSummary="true" ValidationGroup="vgAdminNew" />
            
    <h2>ADMIN BİLGİLERİ</h2>
    
    <div class="Form">
        
    Kullanıcı Adı
    <asp:TextBox CssClass="TextBox" runat="server" ID="txtUserName" ValidationGroup="vgAdminNew"></asp:TextBox>
    
    <p>Şifre</p>
    <asp:TextBox CssClass="TextBox" runat="server" ID="txtPassword" ValidationGroup="vgAdminNew"></asp:TextBox>

    <p>Adı</p>
    <asp:TextBox CssClass="TextBoxOpt" runat="server" ID="txtFirstname" ValidationGroup="vgAdminNew"></asp:TextBox>
    
    <p>Soyadı</p>
    <asp:TextBox CssClass="TextBoxOpt" runat="server" ID="txtSurName" ValidationGroup="vgAdminNew"></asp:TextBox>

    <p>Görevi</p>
    <asp:TextBox CssClass="TextBoxOpt" runat="server" ID="txtDescription" ValidationGroup="vgAdminNew"></asp:TextBox>

    <br />
    
    <asp:RadioButton runat="server" ID="rdActive" GroupName="rdGrActive" Text="Aktif" Checked="true" />
    <asp:RadioButton runat="server" ID="rdInactive" GroupName="rdGrActive" Text="Pasif" />

    <asp:HiddenField runat="server" ID="hdAdminID" Value="0" />

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

    <asp:Repeater runat="server" ID="rptPermissionList">
        <ItemTemplate>
            <asp:Literal ID="ltlPermissionID" runat="server" Visible="false" Text='<%# Eval("AdminPermissionID") %>' />
            <asp:Literal ID="ltlParentID" runat="server" Visible="false" Text='<%# Eval("ParentID") %>' />
            
            <asp:Literal ID="ltlBr" runat="server" Visible="false" Text="<br /><br /><br />" />
            
            <asp:CheckBox runat="server" ID='ch1' Width="200" Height="23" Text='<%# Eval("PermissionName") %>' />
            
            <asp:Literal ID="ltlHr" runat="server" Visible="false" Text="<hr />" />
        </ItemTemplate>
        <SeparatorTemplate>
            
        </SeparatorTemplate>
    </asp:Repeater>

</ContentTemplate>
</asp:UpdatePanel>

    <asp:HiddenField runat="server" ID="hdPermissionChecked" Value="" />

    </div>

    
    <div class="FormFooter">
        <asp:Button runat="server" ID="btnSend" CssClass="Button" Text="KAYDET"  
            ValidationGroup="vgAdminNew" onclick="btnSend_Click" />
    </div>
                        
</asp:Panel>