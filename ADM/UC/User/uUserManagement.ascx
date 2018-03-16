<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uUserManagement.ascx.cs" Inherits="UC_User_uUserManagement" %>
<%@ Register src="~/UC/Common/Paging.ascx" tagname="uPaging" tagprefix="Paging" %>
<%@ Register src="~/UC/Common/Error.ascx" tagname="uError" tagprefix="Error" %>
<%@ Register src="~/UC/Common/Success.ascx" tagname="uSuccess" tagprefix="Success" %>

<asp:Panel runat="server" ID="pnlPage">

<Success:uSuccess ID="uSuccess1" runat="server" Visible="false" Title="SEÇİLEN ÜYELERİN HESAPLARI SİLİNMİŞTİR" Desc="Seçtiğiniz üyelere ait kayıt bilgileri silinmiştir" />
<Error:uError ID="uError1" runat="server" Visible="false" Title="SEÇTİĞİNİZ KAYITLAR SİLİNİRKEN HATA OLUŞTU" Desc="Lütfen doğru seçimler yaptığınıza emin olunuz." />

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        
<table cellpadding="0" cellspacing="0" class="Grid fW2">

    <tr id="tr0" class="Head">
        <th class="tdCh"><asp:CheckBox runat="server" ID="chAll" AutoPostBack="true" oncheckedchanged="chAll_CheckedChanged" /></th>
        <td>FOTOĞRAF</td>
        <td>BİLGİLER</td>
        <td></td>
        <td></td>
    </tr>

<asp:Repeater runat="server" ID="rptList" onitemdatabound="rptList_ItemDataBound">
<ItemTemplate>
    <tr id='tr<%#Eval("UserID") %>' class="Item" onmouseover="ClsChng(this.id, 'ItemOver');" onmouseout="ClsChng(this.id, 'Item');">
        <th><asp:CheckBox runat="server" ID="CheckBox1" CommandValue='<%# Eval("UserID") %>' /></th>
        <td height="90" onclick="<%#Eval("UserID", "window.open('http://www.hayatidoldur.com/User.aspx?j={0}');") %>">
           
           <asp:Literal runat="server" ID="ltlIsFacebookUser" Text='<%# Eval("IsFacebookUser") %>' Visible="false"></asp:Literal> 
           <asp:Image runat="server" ID="imgUser" ImageUrl='<%# Eval("Photo") %>' Width="50" />
            
            
        </td>
        <td onclick="<%#Eval("UserID", "window.open('http://www.hayatidoldur.com/User.aspx?j={0}');") %>">
        
            <b><%# Eval("FirstName") %> <%# Eval("SurName")%> </b> <br />
            Cinsiyet: <b>
                <%# (Eval("IsFemale") == DBNull.Value) ? "" : (Convert.ToInt32(Eval("IsFemale"))).ToString().Replace("0", "BAY").Replace("1", "BAYAN") %>
            </b> <br />
            Facebook Login: <b><%# (Convert.ToInt32(Eval("IsFacebookUser"))).ToString().Replace("0", "HAYIR").Replace("1", "EVET") %></b> <br />
            <asp:HyperLink runat="server" ID="hlMail" NavigateUrl='<%# Eval("Email", "mailto:{0}") %>' Text='<%# Eval("Email").ToString() %>'/> <br />            
            
        </td>
        <td onclick="<%#Eval("UserID", "window.open('http://www.hayatidoldur.com/User.aspx?j={0}');") %>">

            Doğum Tarihi: <b><%# Eval("BirthDate") %></b> <br />
            Yaşadığı Yer:  <b><%# Eval("LocationName")%></b> <br />
            Eğitim:  <b><%# Eval("EducationLevel")%></b> / <b><%# Eval("EducationStatus")%></b><br />
            Üniversite:  <b><%# Eval("UniversityName")%></b> <br />

        </td>
        <td onclick="<%#Eval("UserID", "window.open('http://www.hayatidoldur.com/User.aspx?j={0}');") %>">
            GSM: <b><%# Eval("GSM") %></b> <br />
            Kayıt Tarihi: <b><%# Convert.ToDateTime(Eval("CreateDate")).ToShortDateString()%></b> <br />
            Sitede Aktif: <b><%# (Convert.ToInt32(Eval("IsActive"))).ToString().Replace("0", "PASİF").Replace("1", "AKTİF") %></b> <br />
            Son Güncelleme: <b><%# Convert.ToDateTime(Eval("ModifyDate")).ToShortDateString()%></b> <br />
        </td>
    </tr>
</ItemTemplate>
</asp:Repeater>

</table>

    </ContentTemplate>
</asp:UpdatePanel>

    
<Paging:uPaging ID="Paging1" runat="server" />

<br />

<asp:Button CssClass="Button2" runat="server" ID="btnDelete" 
    Text="ÜYELERİ SİL" 
    OnClientClick="return confirm('Seçtiğiniz kayıtları silmek istiyor musunuz ?')" 
    onclick="btnDelete_Click" />

&nbsp;&nbsp;&nbsp;

<asp:Button CssClass="Button2" runat="server" ID="btnExport" 
    Text="Excel'e Aktar"    
    onclick="btnExport_Click" />    
    
</asp:Panel>

<asp:Panel runat="server" ID="pnlNoData" Visible="false">
    <div class="Form Big">
        Üye bulunmamaktadır !..
    </div>
</asp:Panel>