<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uUserActivities.ascx.cs" Inherits="UC_User_uUserActivities" %>
<%@ Register src="~/UC/Common/Paging.ascx" tagname="uPaging" tagprefix="Paging" %>

<h1>
    <asp:Literal runat="server" ID="ltlActivityTitle"></asp:Literal> Etkinliğine katılanlar
</h1>

<div class="Form">
<div style="clear: both;"></div>

    Etkinlikler Listesi
    <asp:DropDownList runat="server" ID="ddlActivities" AutoPostBack="true" onselectedindexchanged="ddlActivities_SelectedIndexChanged"></asp:DropDownList>
    
</div>



<asp:Panel runat="server" ID="pnlPage">

<table cellpadding="0" cellspacing="0" class="Grid fW2">

    <tr id="tr0" class="Head">
        <th class="tdCh"></th>
        <td>FOTOĞRAF</td>
        <td>BİLGİLER</td>
        <td></td>
        <td></td>
    </tr>
<asp:Repeater runat="server" ID="rptList" onitemdatabound="rptList_ItemDataBound">
<ItemTemplate>
    <tr id='tr<%#Eval("UserID") %>' class="Item" onmouseover="ClsChng(this.id, 'ItemOver');" onmouseout="ClsChng(this.id, 'Item');">
        <th></th>
        <td valign="top" onclick="<%#Eval("UserID", "window.open('http://www.hayatidoldur.com/User.aspx?j={0}');") %>">
           
           <asp:Literal runat="server" ID="ltlIsFacebookUser" Text='<%# Eval("IsFacebookUser") %>' Visible="false"></asp:Literal> 
           <asp:Image runat="server" ID="imgUser" ImageUrl='<%# Eval("Photo") %>' />            
            
        </td>
        <td onclick="<%#Eval("UserID", "window.open('http://www.hayatidoldur.com/User.aspx?j={0}');") %>">
        
            <b><%# Eval("FirstName") %> <%# Eval("SurName")%> </b> <br />
            Cinsiyet: <b>
                <%# (Eval("IsFemale") == DBNull.Value) ? "" : (Convert.ToInt32(Eval("IsFemale"))).ToString().Replace("0", "BAY").Replace("1", "BAYAN") %>
            </b> <br />
            <asp:HyperLink runat="server" ID="hlMail" NavigateUrl='<%# Eval("Email", "mailto:{0}") %>' Text='<%# Eval("Email").ToString() %>'/> <br />            
            
            Katılım Tarihi: <b><%# Convert.ToDateTime(Eval("JoinDate")).ToShortDateString()%></b> <br />
            Servis: <b><%# (Convert.ToInt32(Eval("HasService"))).ToString().Replace("0", "YOK").Replace("1", "VAR") %></b> <br />
            
        </td>
        <td onclick="<%#Eval("UserID", "window.open('http://www.hayatidoldur.com/User.aspx?j={0}');") %>" style="min-width: 150px">

            GSM: <b><%# Eval("Gsm")%></b> <br />
            Yaşadığı Yer:  <b><%# Eval("LocationName")%></b> <br />
            Eğitim:  <b><%# Eval("EducationLevel")%></b> / <b><%# Eval("EducationStatus")%></b><br />
            Üniversite:  <b><%# Eval("UniversityName")%></b> <br />

        </td>
        <td onclick="<%#Eval("UserID", "window.open('http://www.hayatidoldur.com/User.aspx?j={0}');") %>">
        
            <%#Eval("Label1") %>
            <b><%#Eval("Value1") %></b><br />
            
            <%#Eval("Label2") %>
            <b><%#Eval("Value2") %></b><br />
            
            <%#Eval("Label3") %>
            <b><%#Eval("Value3") %></b><br />
            
            <%#Eval("Label4") %>
            <b><%#Eval("Value4") %></b><br />
            
            <%#Eval("Label5") %>
            <b><%#Eval("Value5") %></b><br />
            
            <%#Eval("Label6") %>
            <b><%#Eval("Value6") %></b>
            
        </td>
    </tr>
</ItemTemplate>
</asp:Repeater>

</table>

<Paging:uPaging ID="Paging1" runat="server" />

<br />

<asp:Button CssClass="Button2" runat="server" ID="btnExport" 
    Text="Excel'e Aktar"    
    onclick="btnExport_Click" /> 
    
</asp:Panel>

<asp:Panel runat="server" ID="pnlNoData" Visible="false">
    <div class="Form Big">
        Etkinliğe katılan üye bulunmamaktadır !..
    </div>
</asp:Panel>