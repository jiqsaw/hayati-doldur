<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uMarkaElcileriNew.ascx.cs" Inherits="UC_MarkaElcileri_uMarkaElcileriNew" %>
<%@ Register src="~/UC/Common/Error.ascx" tagname="uError" tagprefix="uc1" %>
<%@ Register src="~/UC/Common/Success.ascx" tagname="uSuccess" tagprefix="uc2" %>

<asp:Panel runat="server" ID="pnlForm" CssClass="fW1">

<asp:RequiredFieldValidator ID="rqLocationID" runat="server" ErrorMessage="Şehir seçiniz!" ControlToValidate="ddlLocationID" InitialValue="0" SetFocusOnError="true" Display="None" ValidationGroup="vgMarkaElcileri" />
<asp:RequiredFieldValidator ID="rqUniversityID" runat="server" ErrorMessage="Üniversite seçiniz!" ControlToValidate="ddlUniversityID" InitialValue="0" SetFocusOnError="true" Display="None"  ValidationGroup="vgMarkaElcileri" />
<asp:RequiredFieldValidator ID="rqFullName" runat="server" ErrorMessage="İsim giriniz" ControlToValidate="txtFullName" SetFocusOnError="true" Display="None"  ValidationGroup="vgMarkaElcileri" />
<asp:RequiredFieldValidator ID="rqEmail" runat="server" ErrorMessage="Email adresini giriniz!" ControlToValidate="txtEmail" SetFocusOnError="true" Display="None" ValidationGroup="vgMarkaElcileri" />
<asp:RegularExpressionValidator ID="rexEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Geçerli bir email adresi giriniz !" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="None" ValidationGroup="vgMarkaElcileri" />
    
    <uc2:uSuccess ID="uSuccess1" runat="server" Visible="false" Title="YENİ MARKA ELÇİSİ EKLENDİ" Desc="Yeni marka elçisi eklenmiştir" />
    <uc2:uSuccess ID="uSuccess2" runat="server" Visible="false" Title="Marka Elçisi güncellenmiştir" Desc="Marka Elçisi güncellenmiştir" />    

    <uc1:uError ID="uError1" runat="server" Visible="false" Title="KAYIT EDİLMEDİ" Desc="Kayıt yapılırken hata oluştu" />

    <asp:ValidationSummary ID="ValSum" runat="server" CssClass="Validate" ShowSummary="true" ValidationGroup="vgMarkaElcileri" />
            
    <h2>MARKA ELÇİSİ KAYDI</h2>
    
    <asp:Panel runat="server" ID="pnlFormInputs" CssClass="Form">

    Şehir
    <asp:DropDownList runat="server" ID="ddlLocationID" ValidationGroup="vgMarkaElcileri"></asp:DropDownList>

    <p>Üniversite</p>
    <asp:DropDownList runat="server" ID="ddlUniversityID" ValidationGroup="vgMarkaElcileri"></asp:DropDownList><br />
            
    <p>Marka Elçisinin İsmi</p>
    <asp:TextBox CssClass="TextBox" runat="server" ID="txtFullName" ValidationGroup="vgMarkaElcileri" MaxLength="128"></asp:TextBox>
    
    <p>Email</p>
    <asp:TextBox runat="server" ID="txtEmail" CssClass="TextBox" MaxLength="120" ValidationGroup="vgMarkaElcileri" /><br /<br />

    <asp:HiddenField runat="server" ID="hdMarkaElcileriID" Value="0" />

    </asp:Panel>
    
    <div class="FormFooter">
        <asp:Button runat="server" ID="btnSend" CssClass="Button" Text="KAYDET" ValidationGroup="vgMarkaElcileri" onclick="btnSend_Click" />
    </div>
                        
</asp:Panel>