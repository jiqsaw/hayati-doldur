<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Paging.ascx.cs" Inherits="UC_Common_Paging" %>

<script type="text/javascript">
    function ChangePage(PageValue, ValueType) {
        var chr = "&";
        var path = String(location.href);
        if (path.indexOf(ValueType + "=") != "-1") { path = path.substring(0, eval(path.indexOf(ValueType + "=") - 1)); }
        if (path.indexOf("?") == "-1") { chr = "?"; }
        path = path + chr + ValueType + "=" + PageValue;
        location.href = path;
    }
</script>
<br />
<table class="Paging">
    <tr>
        <td class="RecordCountCell">
            <asp:Literal runat="server" ID="ltlRecordCountTitle" Text="Toplam Kayıt" />:
            <asp:Label CssClass="RecordCountText" runat="server" ID="lblRecordCount" />
        </td>
        <td class="PageSizeCell">
            <asp:Literal runat="server" ID="ltlPageSize" Text="Gösterim Adedi:" /> 
            <asp:DropDownList runat="server" ID="ddlPageSize" CssClass="DropDownList" />
        </td>
        <td class="PageNumberCell">
            <asp:HyperLink runat="server" CssClass="NextPrevLink" ID="hlPrevious" Enabled="False">«« &nbsp;Önceki</asp:HyperLink> &nbsp;&nbsp;
            <asp:DropDownList runat="server" CssClass="DropDownList" ID="ddlPageNumber" /> &nbsp;&nbsp;
            <asp:HyperLink runat="server" CssClass="NextPrevLink" ID="hlNext" Enabled="False">Sonraki&nbsp; »»</asp:HyperLink>
        </td>
    </tr>
</table>