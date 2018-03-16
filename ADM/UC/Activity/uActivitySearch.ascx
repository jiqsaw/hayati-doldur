<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uActivitySearch.ascx.cs" Inherits="UC_Activity_uActivitySearch" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register src="uActivities.ascx" tagname="uActivities" tagprefix="uc2" %>


<asp:Panel runat="server" ID="pnlExpand">
<h2 style="cursor: pointer;">TÜM ETKİNLİKLERDE ARA</h2>
</asp:Panel>

<asp:Panel runat="server" ID="pnlSearch">

    <div class="Form">

    Etkinlik Kategorisi
    <asp:DropDownList runat="server" ID="ddlActivityCategories" ValidationGroup="vgActivitySearch"></asp:DropDownList>

    <p>Etkinliğin yapılacağı şehir</p>
    <asp:DropDownList runat="server" ID="ddlLocationID" ValidationGroup="vgActivitySearch"></asp:DropDownList>
            
    <p>Etkinlik Başlığı, Özeti ve Detay içeriği</p>
    <asp:TextBox CssClass="TextBox" runat="server" ID="txtActivityTitleDetail" ValidationGroup="vgActivitySearch" MaxLength="512"></asp:TextBox>

    <p>Başlangıç Tarihi</p>
    <cc1:CalendarExtender ID="ajCalendarStarDate" runat="server" TargetControlID="txtActivityStartDate" Format="dd MMMM yyyy"></cc1:CalendarExtender>
    <asp:TextBox CssClass="TextBox" runat="server" ID="txtActivityStartDate" ValidationGroup="vgActivitySearch"></asp:TextBox>

    <p>Bitiş Tarihi</p>
    <cc1:CalendarExtender ID="ajCalendarEndDate" runat="server" TargetControlID="txtActivityEndDate" Format="dd MMMM yyyy"></cc1:CalendarExtender>
    <asp:TextBox CssClass="TextBox" runat="server" ID="txtActivityEndDate" ValidationGroup="vgActivitySearch"></asp:TextBox>

        <p> </p>
        <asp:RadioButton runat="server" ID="rdAll" GroupName="rdGrActive" Text="Hepsi" Checked="true" ValidationGroup="vgActivitySearch"/>
        <asp:RadioButton runat="server" ID="rdActive" GroupName="rdGrActive" Text="Gösterimde Olanlar" ValidationGroup="vgActivitySearch"/>
        <asp:RadioButton runat="server" ID="rdInactive" GroupName="rdGrActive" Text="Beklemeye Alınanlar"  ValidationGroup="vgActivitySearch"/>    
        
    </div>

    <div class="FormFooter">
        <asp:Button runat="server" ID="btnFind" CssClass="Button" Text="ETKİNLİĞİ BUL"
            ValidationGroup="vgActivitySearch" onclick="btnFind_Click" />
    </div>

</asp:Panel>


<asp:Panel runat="server" ID="pnlResults" Visible="false">

    <br />

    <h1>ETKİNLİK ARAMA SONUÇLARI</h1>

    <uc2:uActivities ID="uActivities1" runat="server" />

</asp:Panel>


<cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender1" runat="server"
    TargetControlID="pnlSearch"
    ExpandControlID="pnlExpand"
    CollapseControlID="pnlExpand"
    SuppressPostBack="True" Enabled="True" />