<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uActivities.ascx.cs" Inherits="UC_Activity_uActivities" %>
<%@ Register src="~/UC/Common/Paging.ascx" tagname="uPaging" tagprefix="Paging" %>
<%@ Register src="~/UC/Common/Error.ascx" tagname="uError" tagprefix="Error" %>
<%@ Register src="~/UC/Common/Success.ascx" tagname="uSuccess" tagprefix="Success" %>

<asp:Panel runat="server" ID="pnlPage">

    <Success:uSuccess ID="uSuccess1" runat="server" Visible="false" Title="SEÇİLEN ETKİNLİKLER SİLİNMİŞTİR" Desc="Seçtiğiniz etkinlik bilgileri silinmiştir" />
    <Error:uError ID="uError1" runat="server" Visible="false" Title="SEÇTİĞİNİZ KAYITLAR SİLİNİRKEN HATA OLUŞTU" Desc="Lütfen doğru seçimler yaptığınıza emin olunuz." />

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            
    <table cellpadding="0" cellspacing="0" class="Grid fW2">

        <tr id="tr0" class="Head">
            <th class="tdCh"><asp:CheckBox runat="server" ID="chAll" AutoPostBack="true" oncheckedchanged="chAll_CheckedChanged" /></th>
            <td>ETKİNLİK ADI</td>
            <td>MEKAN</td>
            <td>TARİH</td>
            <td>HİT</td>
        </tr>

    <asp:Repeater runat="server" ID="rptList">
    <ItemTemplate>
        <tr id='tr<%#Eval("ActivityID") %>' class="Item" onmouseover="ClsChng(this.id, 'ItemOver');" onmouseout="ClsChng(this.id, 'Item');">
            <th><asp:CheckBox runat="server" ID="CheckBox1" CommandValue='<%# Eval("ActivityID") %>' /></th>
            <td onclick="<%#Eval("ActivityID", "go('ActivityNew.aspx?j={0}');") %>"><%# Eval("ActivityTitle")%></td>
            <td onclick="<%#Eval("ActivityID", "go('ActivityNew.aspx?j={0}');") %>"><%# Eval("Place")%></td>
            <td onclick="<%#Eval("ActivityID", "go('ActivityNew.aspx?j={0}');") %>"><%# Eval("ActivityDate")%></td>
            <td onclick="<%#Eval("ActivityID", "go('ActivityNew.aspx?j={0}');") %>"><%# Eval("Hit")%></td>
        </tr>
    </ItemTemplate>
    </asp:Repeater>

    </table>

        </ContentTemplate>
    </asp:UpdatePanel>

        
    <Paging:uPaging ID="Paging1" runat="server" />

    <br />

    <asp:Button CssClass="Button2" runat="server" ID="btnDelete" 
        Text="ETKİNLİKLERİ SİL" 
        OnClientClick="return confirm('Seçtiğiniz kayıtları silmek istiyor musunuz ?')" 
        onclick="btnDelete_Click" />
            
    &nbsp;&nbsp;&nbsp;

    <asp:Button CssClass="Button2" runat="server" ID="btnExport" 
        Text="Excel'e Aktar"    
        onclick="btnExport_Click" /> 
        
</asp:Panel>
    
<asp:Panel runat="server" ID="pnlNoData" Visible="false">
    <div class="Form Big">
        Etkinlik bulunmamaktadır !..
    </div>
</asp:Panel>