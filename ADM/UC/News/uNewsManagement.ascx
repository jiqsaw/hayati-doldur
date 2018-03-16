﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uNewsManagement.ascx.cs" Inherits="UC_News_uNewsManagement" %>
<%@ Register src="~/UC/Common/Paging.ascx" tagname="uPaging" tagprefix="Paging" %>
<%@ Register src="~/UC/Common/Error.ascx" tagname="uError" tagprefix="Error" %>
<%@ Register src="~/UC/Common/Success.ascx" tagname="uSuccess" tagprefix="Success" %>

<h1>HABERLER</h1>

<Success:uSuccess ID="uSuccess1" runat="server" Visible="false" Title="SEÇİLEN KAYITLAR SİLİNMİŞTİR" Desc="Seçtiğiniz haberler silinmiştir" />
<Error:uError ID="uError1" runat="server" Visible="false" Title="SEÇTİĞİNİZ KAYITLAR SİLİNİRKEN HATA OLUŞTU" Desc="Lütfen doğru seçimler yaptığınıza emin olunuz." />

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        
<table cellpadding="0" cellspacing="0" class="Grid fW2">

    <tr id="tr0" class="Head">
        <th class="tdCh"><asp:CheckBox runat="server" ID="chAll" AutoPostBack="true" oncheckedchanged="chAll_CheckedChanged" /></th>
        <td>HABER</td>
        <td>ETKİNLİK</td>
        <td>TARİH</td>
    </tr>

<asp:Repeater runat="server" ID="rptList">
<ItemTemplate>
    <tr id='tr<%#Eval("NewsID") %>' class="Item" onmouseover="ClsChng(this.id, 'ItemOver');" onmouseout="ClsChng(this.id, 'Item');">
        <th><asp:CheckBox runat="server" ID="CheckBox1" CommandValue='<%# Eval("NewsID") %>' /></th>
        <td onclick="<%#Eval("NewsID", "go('NewsNew.aspx?j={0}');") %>"><%# Eval("NewsTitle")%></td>
        <td onclick="<%#Eval("NewsID", "go('NewsNew.aspx?j={0}');") %>"><%# Eval("ActivityTitle") %></td>
        <td onclick="<%#Eval("NewsID", "go('NewsNew.aspx?j={0}');") %>"><%# Convert.ToDateTime(Eval("NewsDate")).ToShortDateString() %></td>
    </tr>
</ItemTemplate>
</asp:Repeater>

</table>

    </ContentTemplate>
</asp:UpdatePanel>

    
<Paging:uPaging ID="Paging1" runat="server" />

<br />

<asp:Button CssClass="Button2" runat="server" ID="btnDelete" 
    Text="HABERLERİ SİL" 
    OnClientClick="return confirm('Seçtiğiniz kayıtları silmek istiyor musunuz ?')" 
    onclick="btnDelete_Click" />