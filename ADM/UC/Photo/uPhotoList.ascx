<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uPhotoList.ascx.cs" Inherits="UC_Photo_uPhotoList" %>
<%@ Register src="~/UC/Common/Paging.ascx" tagname="uPaging" tagprefix="Paging" %>
<%@ Register src="~/UC/Common/Error.ascx" tagname="uError" tagprefix="Error" %>
<%@ Register src="~/UC/Common/Success.ascx" tagname="uSuccess" tagprefix="Success" %>

<script type="text/javascript">
    $(function() {
        $('a.lightbox').lightBox();
    });
</script>

<asp:Panel runat="server" ID="pnlPage">

<table cellpadding="0" cellspacing="0" class="Grid fW2">

    <tr id="tr0" class="Head">
        <td> 
            &nbsp;&nbsp;&nbsp;&nbsp; FOTOĞRAFLAR
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

<Paging:uPaging ID="Paging1" runat="server"  />

<br />

<asp:Button CssClass="Button2" runat="server" ID="btnBackApprove" 
    Text="ONAY BEKLEYENLERE GERİ AL" OnClick="btnBackApprove_Click" />

</asp:Panel>

<asp:Panel runat="server" ID="pnlNoData" Visible="false">
    <div class="Form Big">
        Fotoğraf bulunmamaktadır !..
    </div>
</asp:Panel>