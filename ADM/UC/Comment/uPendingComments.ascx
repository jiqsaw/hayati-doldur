<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uPendingComments.ascx.cs" Inherits="UC_Comment_uPendingComments" %>
<%@ Register src="~/UC/Common/Paging.ascx" tagname="uPaging" tagprefix="Paging" %>
<%@ Register src="~/UC/Common/Error.ascx" tagname="uError" tagprefix="Error" %>
<%@ Register src="~/UC/Common/Success.ascx" tagname="uSuccess" tagprefix="Success" %>

<h1>ONAY BEKLEYEN YORUMLAR</h1>

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    
<asp:Panel runat="server" ID="pnlPage">

<Success:uSuccess ID="uSuccessDelete" runat="server" Visible="false" Title="SEÇİLEN YORUMLAR SİLİNMİŞTİR" Desc="Seçtiğiniz yorumlar sistemden kaldırılmıştır" />
<Error:uError ID="uErrorDelete" runat="server" Visible="false" Title="SEÇTİĞİNİZ KAYITLAR SİLİNİRKEN HATA OLUŞTU" Desc="Lütfen doğru seçimler yaptığınıza emin olunuz." />

    
<Success:uSuccess ID="uSuccessApprov" runat="server" Visible="false" Title="YORUM ONAYLANMIŞTIR" Desc="Yorum onaylanarak yayına alınmıştır" />
<Error:uError ID="uErrorApprov" runat="server" Visible="false" Title="YORUM ONAYLANIRKEN HATA OLUŞTU" Desc="Lütfen editlediğiniz yorumu kontrol ediniz." />
        
<table cellpadding="0" cellspacing="0" class="Grid fW2">

    <tr id="tr0" class="Head">
        <th class="tdCh"><asp:CheckBox runat="server" ID="chAll" AutoPostBack="true" oncheckedchanged="chAll_CheckedChanged" /></th>
        <td>YORUM</td>
    </tr>

<asp:Repeater runat="server" ID="rptList" OnItemDataBound="rptList_ItemDataBound" OnItemCommand="rptList_ItemCommand">
<ItemTemplate>
    <tr class="Item">
        <th><asp:CheckBox runat="server" ID="CheckBox1" CommandValue='<%# Eval("CommentID") %>' /></th>
        <td>
            <asp:Panel runat="server" ID="pnlCommentShort" Visible="true">
                <table cellpadding="0" cellspacing="0" width="100%">
                
                    » 
                    <b>
                        <asp:HyperLink runat="server" ID="hlActivityDetail" Target="_blank" NavigateUrl='<%#Eval("ActivityID", "http://www.hayatidoldur.com/Detail.aspx?j={0}") %>'>
                        <%# Eval("ActivityTitle") %></asp:HyperLink>
                    </b>
                    
                    <br />
                    
                    <tr id='tr<%#Eval("CommentID") %>' class="Item" onclick="ShowHide('tbl<%#Eval("CommentID") %>')" onmouseover="ClsChng(this.id, 'ItemOver');" onmouseout="ClsChng(this.id, 'Item');">
                        <td>&nbsp; <span class="Mute">(<%# COM.Util.ToDateTimeString(Eval("CreateDate")) %>)</span> &nbsp; <%# LIB.Util.Nl2Br(LIB.Util.Left(Eval("CommentDetailOriginal").ToString(), 110)) %>... </td>
                    </tr>
                </table>
            </asp:Panel>
            <table cellpadding="0" cellspacing="0" width="100%" style="display: none;" id='tbl<%#Eval("CommentID") %>'>
                <tr>
                    <td colspan="2">                    
                        <asp:TextBox runat="server" Height="90" ID="txtCommentDetail" TextMode="MultiLine" Text='<%# Eval("CommentDetailOriginal").ToString() %>'></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Literal runat="server" ID="ltlUserID" Text='<%# Eval("UserID") %>' Visible="false" />
                        <b>
                        <asp:Literal runat="server" ID="ltlCommentByName" Text='<%# Eval("CommentByName") %>' />
                        <asp:HyperLink runat="server" ID="hlCommentByDetail" NavigateUrl='<%# Eval("UserID", "http://www.hayatidoldur.com/User.aspx?j={0}") %>' Target="_blank"><%# Eval("CommentByName") %></asp:HyperLink>
                        </b> &nbsp;
                        <asp:HyperLink runat="server" ID="hlCommentByMail" NavigateUrl='<%# Eval("CommentByMail", "mailto:{0}") %>'><%# Eval("CommentByMail") %></asp:HyperLink>                                
                        <span class="Mute">(<%# COM.Util.ToDateTimeString(Eval("CreateDate")) %>)</span>
                    </td>
                    <td align="right" height="60">
                        <asp:Button runat="server" ID="btnApprov" CssClass="Button" CommandName="btnApprov" CommandArgument='<%# Eval("CommentID") %>' Text="Onayla" /></div>                        
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</ItemTemplate>
</asp:Repeater>

</table>



<Paging:uPaging ID="Paging1" runat="server"  />

<br />

<asp:Button CssClass="Button2" runat="server" ID="btnDelete" 
    Text="YORUMLARI SİL" OnClick="btnDelete_Click" 
        OnClientClick="return confirm('Seçtiğiniz yorumları silmek istiyor musunuz ?')" />

</asp:Panel>

<asp:Panel runat="server" ID="pnlNoData" Visible="false">
    <div class="Form Big">
        Onay bekleyen yorum bulunmamaktadır !..
    </div>
</asp:Panel>

    </ContentTemplate>
</asp:UpdatePanel>