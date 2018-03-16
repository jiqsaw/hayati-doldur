<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uAdminUserManagement.ascx.cs" Inherits="UC_AdminUserManagement_uAdminUserManagement" %>
<%@ Register src="~/UC/Common/Paging.ascx" tagname="uPaging" tagprefix="Paging" %>
<%@ Register src="~/UC/Common/Error.ascx" tagname="uError" tagprefix="Error" %>
<%@ Register src="~/UC/Common/Success.ascx" tagname="uSuccess" tagprefix="Success" %>

<h1>ADMIN KULLANICI HESAPLARI</h1>

<Success:uSuccess ID="uSuccess1" runat="server" Visible="false" Title="SEÇİLEN ADMIN HESAPLARI SİLİNMİŞTİR" Desc="Seçtiğiniz adminlere ait kayıt bilgileri silinmiştir" />
<Error:uError ID="uError1" runat="server" Visible="false" Title="SEÇTİĞİNİZ KAYITLAR SİLİNİRKEN HATA OLUŞTU" Desc="Lütfen doğru seçimler yaptığınıza emin olunuz." />

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        
<table cellpadding="0" cellspacing="0" class="Grid fW2">

    <tr id="tr0" class="Head">
        <th class="tdCh"><asp:CheckBox runat="server" ID="chAll" AutoPostBack="true" oncheckedchanged="chAll_CheckedChanged" /></th>
        <td>KULLANICI ADI</td>
        <td>ADI</td>
        <td>SOYADI</td>
        <td>GÖREVİ</td>
    </tr>

<asp:Repeater runat="server" ID="rptList">
<ItemTemplate>
    <tr id='tr<%#Eval("AdminID") %>' class="Item" onmouseover="ClsChng(this.id, 'ItemOver');" onmouseout="ClsChng(this.id, 'Item');">
        <th><asp:CheckBox runat="server" ID="CheckBox1" CommandValue='<%# Eval("AdminID") %>' /></th>
        <td onclick="<%#Eval("AdminID", "go('AdminUserNew.aspx?jID={0}');") %>"><%# Eval("UserName") %></td>
        <td onclick="<%#Eval("AdminID", "go('AdminUserNew.aspx?jID={0}');") %>"><%# Eval("FirstName") %></td>
        <td onclick="<%#Eval("AdminID", "go('AdminUserNew.aspx?jID={0}');") %>"><%# Eval("Surname") %></td>
        <td onclick="<%#Eval("AdminID", "go('AdminUserNew.aspx?jID={0}');") %>"><%# Eval("Description") %></td>
    </tr>
</ItemTemplate>
</asp:Repeater>

</table>

    </ContentTemplate>
</asp:UpdatePanel>

    
<Paging:uPaging ID="Paging1" runat="server" />

<br />

<asp:Button CssClass="Button2" runat="server" ID="btnDelete" 
    Text="KULLANICILARI SİL" 
    OnClientClick="return confirm('Seçtiğiniz kayıtları silmek istiyor musunuz ?')" 
    onclick="btnDelete_Click" />