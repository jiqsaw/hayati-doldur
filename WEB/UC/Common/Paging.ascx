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

<div class="search-footer">
	<p class="found">
	
	    <asp:Literal runat="server" ID="ltlRecordCountTitle" Text="Toplam Kayıt" />:	
	    <asp:Label CssClass="RecordCountText" runat="server" ID="lblRecordCount" />
	    
	    <asp:Literal runat="server" ID="ltlPageSize" Text="Gösterim Adedi:" Visible="false" /> 
        <asp:DropDownList runat="server" ID="ddlPageSize" CssClass="DropDownList" Visible="false" />
            
	</p>
    <p class="search-links">
    
        <asp:HyperLink runat="server" ID="hlPrevious" Enabled="False">Önceki</asp:HyperLink> &nbsp;&nbsp;
        <asp:DropDownList runat="server" ID="ddlPageNumber" style="display: none;" /> &nbsp;&nbsp;
        <asp:HyperLink runat="server" ID="hlNext" Enabled="False">Sonraki</asp:HyperLink>
    
    </p>
    <p class="clear"></p>
</div>