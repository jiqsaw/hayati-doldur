<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uPendingVideos.ascx.cs" Inherits="UC_Video_uPendingVideos" %>
<%@ Register src="~/UC/Common/Paging.ascx" tagname="uPaging" tagprefix="Paging" %>
<%@ Register src="~/UC/Common/Error.ascx" tagname="uError" tagprefix="Error" %>
<%@ Register src="~/UC/Common/Success.ascx" tagname="uSuccess" tagprefix="Success" %>

<h1>ONAY BEKLEYEN VIDEOLAR</h1>

<asp:Panel runat="server" ID="pnlPage">

<Success:uSuccess ID="uSuccessDelete" runat="server" Visible="false" Title="SEÇİLEN VIDEOLAR SİLİNMİŞTİR" Desc="Seçtiğiniz vidoelar sistemden kaldırılmıştır" />
<Error:uError ID="uErrorDelete" runat="server" Visible="false" Title="SEÇTİĞİNİZ VIDEOLAR SİLİNİRKEN HATA OLUŞTU" Desc="Lütfen doğru seçimler yaptığınıza emin olunuz." />

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    
<Success:uSuccess ID="uSuccessApprov" runat="server" Visible="false" Title="VIDEO ONAYLANMIŞTIR" Desc="Video onaylanarak yayına alınmıştır" />
<Error:uError ID="uErrorApprov" runat="server" Visible="false" Title="VIDEO ONAYLANIRKEN HATA OLUŞTU" Desc="Lütfen bilgilerinizi kontrol ediniz." />
        
<table cellpadding="0" cellspacing="0" class="Grid fW2">

    <tr id="tr0" class="Head">
        <td>&nbsp;&nbsp;
            <asp:CheckBox runat="server" ID="chAll" AutoPostBack="true" oncheckedchanged="chAll_CheckedChanged" />
            VIDEOLAR
        </td>
    </tr>
    
    <tr class="Item">
        <td>
            
            <asp:DataList runat="server" ID="dlList" RepeatColumns="3">
                <ItemTemplate>
                    <div class="dListCh">
                        <asp:CheckBox runat="server" ID="CheckBox1" CommandValue='<%# Eval("VideoID") %>' />
                    </div>
                    <div class="dListCell">                        
                        <%# Eval("VideoURL")%>
                    </div>
                </ItemTemplate>
            </asp:DataList>
            
        </td>
    </tr>
    
</table>

    </ContentTemplate>
</asp:UpdatePanel>

<Paging:uPaging ID="Paging1" runat="server"  />

<br />

<asp:Button CssClass="Button2" runat="server" ID="btnApprov" 
    Text="VIDEOLARI ONAYLA"
        
        OnClientClick="return confirm('Seçtiğiniz videoları yayına almak istiyor musunuz ?')" 
        onclick="btnApprov_Click" />

&nbsp;&nbsp;&nbsp;
        
<asp:Button CssClass="Button2" runat="server" ID="btnDelete" 
    Text="VIDEOLARI SİL" OnClick="btnDelete_Click" 
        OnClientClick="return confirm('Seçtiğiniz videoları silmek istiyor musunuz ?')" />

</asp:Panel>    

<asp:Panel runat="server" ID="pnlNoData" Visible="false">
    <div class="Form Big">
        Onay bekleyen video bulunmamaktadır !..
    </div>
</asp:Panel>