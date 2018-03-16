<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uCommentList.ascx.cs" Inherits="UC_Comment_uCommentList" %>
<%@ Register src="~/UC/Common/Paging.ascx" tagname="uPaging" tagprefix="Paging" %>
<%@ Register src="~/UC/Common/Error.ascx" tagname="uError" tagprefix="Error" %>
<%@ Register src="~/UC/Common/Success.ascx" tagname="uSuccess" tagprefix="Success" %>

<asp:Panel runat="server" ID="pnlPage">

<Success:uSuccess ID="uSuccessApprov" runat="server" Visible="false" Title="ONAY İPTALİ" Desc="Seçtiğiniz yorumların onayı kaldırılmıştır" />
<Error:uError ID="uErrorApprov" runat="server" Visible="false" Title="HATA OLUŞTU" Desc="Yorum onayı kaldırılamadı." />

<table cellpadding="0" cellspacing="0" class="Grid fW2">

    <tr id="tr0" class="Head">
        <th class="tdCh"><asp:CheckBox runat="server" ID="chAll" AutoPostBack="true" oncheckedchanged="chAll_CheckedChanged" /></th>
        <td> 
            &nbsp;&nbsp;&nbsp;&nbsp; YORUM
        </td>
        <td>
            &nbsp;&nbsp;&nbsp; EKLEYEN
        </td>
    </tr>

<asp:Repeater runat="server" ID="rptList" OnItemDataBound="rptList_ItemDataBound">
<ItemTemplate>
    <tr class="Item">
        <th><asp:CheckBox runat="server" ID="CheckBox1" CommandValue='<%# Eval("CommentID") %>' /></th>
        <td class="Padding">
                » 
                <b>
                    
                    <asp:HyperLink runat="server" ID="hlActivityDetail" Target="_blank" NavigateUrl='<%#Eval("ActivityID", "http://www.hayatidoldur.com/Detail.aspx?j={0}") %>'>                    
                    <%# Eval("ActivityTitle") %></asp:HyperLink>
                    
                </b>
                
                    <br />

                    <span class="Mute"><%# Eval("CommentDetailOriginal").ToString()%> </span>
                    
                    <br />
                    
                    <%# Eval("CommentDetail").ToString()%>
                    
                    <br />

        </td>
        <td class="Padding">
                <asp:Literal runat="server" ID="ltlCommentByName" Text='<%# Eval("CommentByName") %>' />                                
                
                <asp:HyperLink runat="server" ID="hlCommentByDetail" NavigateUrl='<%# Eval("UserID", "http://www.hayatidoldur.com/User.aspx?j={0}") %>' Target="_blank"><%# Eval("CommentByName") %></asp:HyperLink>               
                
                <br />
                
                <asp:HyperLink runat="server" ID="hlCommentByMail" NavigateUrl='<%# Eval("CommentByMail", "mailto:{0}") %>'><%# Eval("CommentByMail") %></asp:HyperLink>
                
                <br />
                
                <span class="Mute">(<%# COM.Util.ToDateTimeString(Eval("CreateDate")) %>)</span>
                
                                
                <br />
                
                <asp:Literal runat="server" ID="ltlUserID" Text='<%# Eval("UserID") %>' Visible="false" />                
        </td>

    </tr>
</ItemTemplate>
</asp:Repeater>

</table>

<Paging:uPaging ID="Paging1" runat="server"  />

<br />

<asp:Button CssClass="Button2" runat="server" ID="btnBackApprove" 
    Text="ONAY BEKLEYENLERE GERİ AL" OnClick="btnBackApprove_Click" />

</asp:Panel>


<asp:Panel runat="server" ID="pnlNoData" Visible="false">
    <div class="Form Big">
        Yorum bulunmamaktadır !..
    </div>
</asp:Panel>