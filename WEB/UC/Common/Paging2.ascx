<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Paging2.ascx.cs" Inherits="UC_Common_Paging2" %>
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

	    <asp:Literal runat="server" ID="ltlRecordCountTitle" Text="Toplam Kayıt" Visible="false" />	
	    <asp:Label CssClass="RecordCountText" runat="server" ID="lblRecordCount" Visible="false" />
	    
	    <asp:Literal runat="server" ID="ltlPageSize" Text="Gösterim Adedi:" Visible="false" /> 
        <asp:DropDownList runat="server" ID="ddlPageSize" CssClass="DropDownList" Visible="false" />
        <asp:DropDownList runat="server" ID="ddlPageNumber" style="display: none;" Visible="false" />
        
<div class="photos-narrow">
    <div class="narrow-left">
        <asp:HyperLink runat="server" ID="hlPrevious" Enabled="False">Önceki</asp:HyperLink>
    </div>
    <div class="narrow-right">
        <asp:HyperLink runat="server" ID="hlNext" Enabled="False">Sonraki</asp:HyperLink>
    </div>
    <div class="clear"></div>
</div>