<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uNewsNew.ascx.cs" Inherits="UC_News_uNewsNew" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register src="~/UC/Common/Error.ascx" tagname="uError" tagprefix="uc1" %>
<%@ Register src="~/UC/Common/Success.ascx" tagname="uSuccess" tagprefix="uc2" %>

<asp:Panel runat="server" ID="pnlForm" CssClass="fW1">

<asp:RequiredFieldValidator ID="rqActivity" runat="server" ErrorMessage="Haberin etkinliğini seçiniz!" ControlToValidate="ddlActivities" InitialValue="0" SetFocusOnError="true" Display="None" ValidationGroup="vgNewsNew" />
<asp:RequiredFieldValidator ID="rqNewsTitle" runat="server" ErrorMessage="Haber başlığını giriniz !" ControlToValidate="txtNewsTitle" SetFocusOnError="true" Display="None"  ValidationGroup="vgNewsNew" />
<asp:RequiredFieldValidator ID="rqNewsDetail" runat="server" ErrorMessage="Haber detayını !" ControlToValidate="txtNewsDetail" SetFocusOnError="true" Display="None"  ValidationGroup="vgNewsNew" />
<asp:RequiredFieldValidator ID="rqNewsDate" runat="server" ErrorMessage="Haber tarihini giriniz !" ControlToValidate="txtNewsDate" SetFocusOnError="true" Display="None"  ValidationGroup="vgNewsNew" />

    <uc2:uSuccess ID="uSuccess1" runat="server" Visible="false" Title="YENİ HABER EKLENDİ" Desc="Yeni haber eklenmiştir" />
    <uc2:uSuccess ID="uSuccess2" runat="server" Visible="false" Title="Haber güncellenmiştir" Desc="Haber güncellenmiştir" />    

    <uc1:uError ID="uError1" runat="server" Visible="false" Title="KAYIT EDİLMEDİ" Desc="Kayıt yapılırken hata oluştu" />

    <asp:ValidationSummary ID="ValSum" runat="server" CssClass="Validate" ShowSummary="true" ValidationGroup="vgNewsNew" />
            
    <h2>HABER KAYDI</h2>
    
    <div class="Form">

    Haberin etkinliğini seçiniz
    <asp:DropDownList runat="server" ID="ddlActivities" ValidationGroup="vgNewsNew"></asp:DropDownList>
            
    <p>Haber başlığını giriniz</p>
    <asp:TextBox CssClass="TextBox" runat="server" ID="txtNewsTitle" ValidationGroup="vgNewsNew" MaxLength="512"></asp:TextBox>
    
    <p>Haber detayını giriniz</p>
    <asp:TextBox CssClass="TextBox" runat="server" ID="txtNewsDetail" 
            ValidationGroup="vgNewsNew" TextMode="MultiLine" Rows="20" Height="250px"></asp:TextBox>

    <p>Haber tarihi</p>
    <cc1:CalendarExtender ID="ajNewsStarDate" runat="server" TargetControlID="txtNewsDate" Format="dd MMMM yyyy"></cc1:CalendarExtender>
    <asp:TextBox CssClass="TextBox" runat="server" ID="txtNewsDate" ValidationGroup="vgNewsNew"></asp:TextBox>
    
    <br />
    
    <asp:RadioButton runat="server" ID="rdActive" GroupName="rdGrActive" Text="Gösterimde" Checked="true" />
    <asp:RadioButton runat="server" ID="rdInactive" GroupName="rdGrActive" Text="Beklemede" />

    <asp:HiddenField runat="server" ID="hdNewsID" Value="0" />

    </div>
    
    <div class="FormFooter">
        <asp:Button runat="server" ID="btnSend" CssClass="Button" Text="KAYDET"  
            ValidationGroup="vgNewsNew" onclick="btnSend_Click" />
    </div>
                        
</asp:Panel>