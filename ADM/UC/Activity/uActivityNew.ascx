<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uActivityNew.ascx.cs" Inherits="UC_Activity_uActivityNew" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UC/Common/FreeTextBox.ascx" TagName="FreeTextBox" TagPrefix="uc2" %>
<%@ Register src="~/UC/Common/Error.ascx" tagname="uError" tagprefix="uErr1" %>
<%@ Register src="~/UC/Common/Success.ascx" tagname="uSuccess" tagprefix="Success" %>

<asp:Panel runat="server" ID="pnlForm" CssClass="fW2">    

    <Success:uSuccess ID="uSuccess1" runat="server" Visible="false" Title="ETKİNLİK GÜNCELLENMİŞTİR" Desc="Bu etkinlik için yaptığınız değişiklikler kayıt edilmiştir" />
    <uErr1:uError ID="uError1" runat="server" Visible="false" Title="ETKİNLİK KAYIT EDİLEMEDİ" Desc="Kayıt yapılırken hata oluştu. Lütfen girdiğiniz bilgileri kontrol ediniz." />
    
    <asp:RequiredFieldValidator ID="rqCategory" runat="server" ErrorMessage="Etkinlik kategorisini seçiniz!" ControlToValidate="ddlActivityCategories" InitialValue="0" SetFocusOnError="true" Display="None" ValidationGroup="vgActivityNew" />
    <asp:RequiredFieldValidator ID="rqLocation" runat="server" ErrorMessage="Etkinliğin yapılacağı şehri seçiniz!" ControlToValidate="ddlLocationID" InitialValue="0" SetFocusOnError="true" Display="None" ValidationGroup="vgActivityNew" />
    <asp:RequiredFieldValidator ID="rqActivityTitle" runat="server" ErrorMessage="Etkinliğin başlığını giriniz!" ControlToValidate="txtActivityTitle" SetFocusOnError="true" Display="None" ValidationGroup="vgActivityNew" />
    <asp:RequiredFieldValidator ID="rqActivityHeader" runat="server" ErrorMessage="Etkinliğe ait özet metni giriniz!" ControlToValidate="txtActivityHeader" SetFocusOnError="true" Display="None" ValidationGroup="vgActivityNew" />
    <asp:RequiredFieldValidator ID="rqPlace" runat="server" ErrorMessage="Etkinlik mekanını giriniz!" ControlToValidate="txtPlace" SetFocusOnError="true" Display="None" ValidationGroup="vgActivityNew" />
    <asp:RequiredFieldValidator ID="rqActivityDate" runat="server" ErrorMessage="Etkinliğin görünen tarihini giriniz!" ControlToValidate="txtActivityDate" SetFocusOnError="false" Display="None" ValidationGroup="vgActivityNew" />
    <asp:RequiredFieldValidator ID="rqActivityStartDate" runat="server" ErrorMessage="Etkinliğin başlangıç tarihini giriniz!" ControlToValidate="txtActivityStartDate" SetFocusOnError="false" Display="None" ValidationGroup="vgActivityNew" />
    <asp:RequiredFieldValidator ID="rqActivityEndDate" runat="server" ErrorMessage="Etkinlik bitiş tarihini giriniz!" ControlToValidate="txtActivityEndDate" SetFocusOnError="false" Display="None" ValidationGroup="vgActivityNew" />    

    <asp:RequiredFieldValidator ID="rqUserCount" runat="server"  InitialValue="" ErrorMessage="Katılımcı limitini rakam olarak giriniz!" ControlToValidate="txtUserCount" SetFocusOnError="true" Display="None" ValidationGroup="vgActivityNew" />
    <asp:RequiredFieldValidator ID="rqAlternateUserCount" runat="server" InitialValue="" ErrorMessage="Yedek katılımcı sayısını rakam olarak belirtiniz!" ControlToValidate="txtAlternateUserCount" SetFocusOnError="true" Display="None" ValidationGroup="vgActivityNew" />
    
    <asp:RangeValidator ID="rngUserCount" runat="server" ValidationGroup="vgActivityNew" ControlToValidate="txtUserCount" CssClass="Error" Display="None" 
        ErrorMessage="Katılımcı limitini belirtiniz" MinimumValue="1" MaximumValue="50000" SetFocusOnError="True" Type="Integer"></asp:RangeValidator>
    <asp:RangeValidator ID="rngAlternateUserCount" runat="server" ControlToValidate="txtAlternateUserCount" CssClass="Error" Display="None" 
        ErrorMessage="Yedek katılımcı sayısını giriniz" MinimumValue="1" MaximumValue="1000" SetFocusOnError="True" Type="Integer"></asp:RangeValidator>
    
    <asp:ValidationSummary ID="ValSum" runat="server" CssClass="Validate" ShowSummary="true" ValidationGroup="vgActivityNew" />
        
    <h2>ETKİNLİK KAYDI</h2>
    
    <div class="Form">
    
    <asp:Panel runat="server" ID="pnlEdit" Visible="false">
        <div class="dvImg">
            <asp:Image Width="202" runat="server" ID="imgActivity" />
        </div>
        » <asp:LinkButton runat="server" ID="lnkActivityEditPhoto" Text=" Etkinlik fotoğrafını güncelle" onclick="lnkActivityEditPhoto_Click"></asp:LinkButton> <br /><br />
        » <asp:HyperLink runat="server" ID="hlActivityRelations" Text=" İlişkili etkinliklerini güncelle"></asp:HyperLink> <br /><br />
        » <asp:HyperLink runat="server" ID="hlActivityDetailLink" NavigateUrl="http://www.hayatidoldur.com/Detail.aspx?j=" Text=" Detay sayfasına git" Target="_blank"></asp:HyperLink> <br /><br />
        
        <br /><br />
        
        » <b><asp:HyperLink runat="server" ID="hlJoinsUsers" Text=" Etkinliğe katılanlar"></asp:HyperLink></b> <br /><br />
        <%--» <b><asp:HyperLink runat="server" ID="hlAddNews" Text=" Etkiniğe Haber ekle"></asp:HyperLink></b> <br /><br />--%>
    </asp:Panel>
    
    <div style="clear: both;"></div>
    
    Etkinlik Kategorisi
    <asp:DropDownList runat="server" ID="ddlActivityCategories" ValidationGroup="vgActivityNew"></asp:DropDownList>
    
    <p>Etkinliğin yapılacağı şehir</p>
    <asp:DropDownList runat="server" ID="ddlLocationID" ValidationGroup="vgActivityNew"></asp:DropDownList>
            
    <p>Başlık</p>
    <asp:TextBox CssClass="TextBox" runat="server" ID="txtActivityTitle" ValidationGroup="vgActivityNew" MaxLength="512"></asp:TextBox>
   
    <p>ETKİNLİK DETAYI</p>
    <uc2:FreeTextBox ID="txtActivityDetail" runat="server" />
        
    <p>Header</p>
    <asp:TextBox CssClass="TextBox" runat="server" TextMode="MultiLine" ID="txtActivityHeader" ValidationGroup="vgActivityNew" Height="50"></asp:TextBox>
        
    <p>Mekan</p>
    <asp:TextBox CssClass="TextBox" runat="server" ID="txtPlace" ValidationGroup="vgActivityNew"></asp:TextBox>    
    
    <p>Görünen Tarih</p>
    <asp:TextBox CssClass="TextBox" runat="server" ID="txtActivityDate" ValidationGroup="vgActivityNew"></asp:TextBox>

    <p>Başlangıç Tarihi</p>
    <cc1:CalendarExtender ID="ajCalendarStarDate" runat="server" TargetControlID="txtActivityStartDate" Format="dd MMMM yyyy"></cc1:CalendarExtender>
    <asp:TextBox CssClass="TextBox" runat="server" ID="txtActivityStartDate" ValidationGroup="vgActivityNew"></asp:TextBox>

    <p>Bitiş Tarihi</p>
    <cc1:CalendarExtender ID="ajCalendarEndDate" runat="server" TargetControlID="txtActivityEndDate" Format="dd MMMM yyyy"></cc1:CalendarExtender>
    <asp:TextBox CssClass="TextBox" runat="server" ID="txtActivityEndDate" ValidationGroup="vgActivityNew"></asp:TextBox>

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
         
    <p>
        <asp:CheckBox runat="server" ID="chIsShowMainPage" AutoPostBack="true" 
            oncheckedchanged="chIsShowMainPage_CheckedChanged" />  Ana Sayfa En Üstte Mutlak Gösterime Başlama Tarihi</p>
    <cc1:CalendarExtender ID="ajShowMainStartDate" runat="server" TargetControlID="txtShowMainStartDate" Format="dd MMMM yyyy"></cc1:CalendarExtender>
    <asp:TextBox CssClass="TextBox" runat="server" ID="txtShowMainStartDate" ValidationGroup="vgActivityNew" Enabled="false"></asp:TextBox>

    </ContentTemplate>
</asp:UpdatePanel>
    
    <p>Katılımcı Limiti</p>
    <asp:TextBox CssClass="TextBox" runat="server" ID="txtUserCount" ValidationGroup="vgActivityNew" MaxLength="5"></asp:TextBox>

    <p>Yedek Katılımcı Limiti</p>
    <asp:TextBox CssClass="TextBox" runat="server" ID="txtAlternateUserCount" ValidationGroup="vgActivityNew" MaxLength="5"></asp:TextBox>           

<asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
    
    <p>Yanında getirebileceği arkadaş sayısı</p>
    <asp:DropDownList runat="server" ID="ddlInvitePeopleCount" 
            ValidationGroup="vgActivityNew"></asp:DropDownList>
    
    <p>Etkinliğe özel istenecek kriterler</p>    
    <asp:TextBox CssClass="TextBox" runat="server" ID="txtInviteLabel1" ValidationGroup="vgActivityNew"></asp:TextBox>
    <asp:TextBox CssClass="TextBox" runat="server" ID="txtInviteLabel2" ValidationGroup="vgActivityNew"></asp:TextBox>
    <asp:TextBox CssClass="TextBox" runat="server" ID="txtInviteLabel3" ValidationGroup="vgActivityNew"></asp:TextBox>
    <asp:TextBox CssClass="TextBox" runat="server" ID="txtInviteLabel4" ValidationGroup="vgActivityNew"></asp:TextBox>
    <asp:TextBox CssClass="TextBox" runat="server" ID="txtInviteLabel5" ValidationGroup="vgActivityNew"></asp:TextBox>
    <asp:TextBox CssClass="TextBox" runat="server" ID="txtInviteLabel6" ValidationGroup="vgActivityNew"></asp:TextBox>
    
    </ContentTemplate>
</asp:UpdatePanel>
           
    <p>
        <asp:CheckBox runat="server" ID="chHasService" /> Servis kaldırılacak</p>            
    <p>&nbsp;</p>
    <asp:RadioButton runat="server" ID="rdActive" GroupName="rdGrActive" Text="Sitede görünsün" Checked="true" ValidationGroup="vgActivityNew" />
    <asp:RadioButton runat="server" ID="rdInactive" GroupName="rdGrActive" Text="Beklemede"  ValidationGroup="vgActivityNew" />

    <asp:HiddenField runat="server" ID="hdActivityID" Value="0" />

    </div>

    <div class="FormFooter">        
        <asp:Button runat="server" ID="btnSend" CssClass="Button" Text="ETKİNLİĞİ KAYDET"
            ValidationGroup="vgActivityNew" onclick="btnSend_Click" />
    </div>
    
    <p>&nbsp;</p>
        
</asp:Panel>