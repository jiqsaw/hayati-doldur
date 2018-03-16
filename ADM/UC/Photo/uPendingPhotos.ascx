<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uPendingPhotos.ascx.cs" Inherits="UC_Photo_uPendingPhotos" %>
<%@ Register src="~/UC/Common/Error.ascx" tagname="uError" tagprefix="Error" %>
<%@ Register src="~/UC/Common/Success.ascx" tagname="uSuccess" tagprefix="Success" %>
<%@ Register src="~/UC/Common/Paging.ascx" tagname="uPaging" tagprefix="Paging" %>

<script type="text/javascript">
    $(function() {
        $('a.lightbox').lightBox();
    });
</script>
    
<h1>ONAY BEKLEYEN FOTOĞRAFLAR</h1>

<Success:uSuccess ID="uSuccessDelete" runat="server" Visible="false" Title="SEÇİLEN FOTOĞRAFLAR SİLİNMİŞTİR" Desc="Seçtiğiniz fotoğraflar sistemden kaldırılmıştır" />
<Error:uError ID="uErrorDelete" runat="server" Visible="false" Title="SEÇTİĞİNİZ FOTOĞRAFLAR SİLİNİRKEN HATA OLUŞTU" Desc="Lütfen doğru seçimler yaptığınıza emin olunuz." />

<asp:Panel runat="server" ID="pnlPage">

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    
<Success:uSuccess ID="uSuccessApprov" runat="server" Visible="false" Title="FOTOĞRAF ONAYLANMIŞTIR" Desc="Fotoğraf onaylanarak yayına alınmıştır" />
<Error:uError ID="uErrorApprov" runat="server" Visible="false" Title="FOTOĞRAF ONAYLANIRKEN HATA OLUŞTU" Desc="Lütfen bilgilerinizi kontrol ediniz." />
    
<table cellpadding="0" cellspacing="0" class="Grid fW2">

    <tr id="tr0" class="Head">
        <td>&nbsp;&nbsp;
            <asp:CheckBox runat="server" ID="chAll" AutoPostBack="true" oncheckedchanged="chAll_CheckedChanged" />
            FOTOĞRAFLAR
        </td>
    </tr>
    
    <tr class="Item">
        <td>
            
            <asp:DataList runat="server" ID="dlList" RepeatColumns="5" OnItemDataBound="dlList_ItemDataBound">
                <ItemTemplate>
                    <div class="dListCh">
                        <asp:CheckBox runat="server" ID="CheckBox1" CommandValue='<%# Eval("PhotoID") %>' />
                    </div>
                    <div class="dvHigh dListCell">
                    
                        <asp:Literal runat="server" ID="ltlPhoto" Text='<%# Eval("Photo")%>'></asp:Literal>
                        <asp:Literal runat="server" ID="ltlKeywords" Text='<%# Eval("Keywords")%>' Visible="false"></asp:Literal>
   
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
    Text="ONAYLA"
        
        OnClientClick="return confirm('Seçtiğiniz fotoğrafları yayına almak istiyor musunuz ?')" 
        onclick="btnApprov_Click" />

&nbsp;&nbsp;&nbsp;
        
<asp:Button CssClass="Button2" runat="server" ID="btnDelete" 
    Text="FOTOĞRAFLARI SİL" OnClick="btnDelete_Click" 
        OnClientClick="return confirm('Seçtiğiniz fotoğrafları silmek istiyor musunuz ?')" />

</asp:Panel>    

<asp:Panel runat="server" ID="pnlNoData" Visible="false">
    <div class="Form Big">
        Onay bekleyen fotoğraf bulunmamaktadır !..
    </div>
</asp:Panel>