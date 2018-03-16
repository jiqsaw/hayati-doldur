<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Date.ascx.cs" Inherits="UC_Common_Date" %>

<script type="text/javascript">
    function cvDateReq(source, args) {
        args.IsValid = false;

        var Day = '<%=ddlDay.ClientID %>';
        var Month = '<%=ddlMonth.ClientID %>';
        var Year = '<%=ddlYear.ClientID %>';

        if ((ddlSelectedValue(Day) != "0") && (ddlSelectedValue(Month) != "0") && (ddlSelectedValue(Year) != "0"))
        { args.IsValid = true; }
    }
    
    function cvDateCtrl(source, args) {
        args.IsValid = false;

        var Day = '<%=ddlDay.ClientID %>';
        var Month = '<%=ddlMonth.ClientID %>';
        var Year = '<%=ddlYear.ClientID %>';

        if ((ddlSelectedValue(Day) == "0") || (ddlSelectedValue(Month) == "0") || (ddlSelectedValue(Year) == "0"))
        { args.IsValid = true; }

        if (DateControl(Day, Month, Year)) 
        { args.IsValid = true; }
    }
</script>

<asp:DropDownList runat="server" ID="ddlDay"></asp:DropDownList>
<asp:DropDownList runat="server" ID="ddlMonth"></asp:DropDownList>
<asp:DropDownList runat="server" ID="ddlYear"></asp:DropDownList>

<div style="clear: both;"></div>
    
<asp:CustomValidator ID="cvDateReq" runat="server" ClientValidationFunction="cvDateReq" 
Display="Dynamic" />

<asp:CustomValidator ID="cvDateCtrl" runat="server" ClientValidationFunction="cvDateCtrl" 
Display="Dynamic" />