<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uUpcomingActivitiesHolder.ascx.cs" Inherits="UC_Activities_uUpcomingActivitiesHolder" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register src="~/UC/Activities/uActivities.ascx" tagname="uActivities" tagprefix="uc3" %>

<h1>Yaklaşan Etkinlikler</h1>
<div>&nbsp;</div>

<uc3:uActivities ID="uActivities1" runat="server" />

<asp:Panel runat="server" ID="pnlCollapse">

<uc3:uActivities ID="uActivitiesOther" runat="server" />

</asp:Panel>


<asp:Panel ID="pnlExpand" runat="server" CssClass="content-footer">
    <asp:HyperLink runat="server" ID="hlOtherUpComingActivities" ToolTip="Diğer Etkinlikler" NavigateUrl="javascript:;">
    Diğer etkinlikleri görüntüle (3)</asp:HyperLink>
</asp:Panel>

<cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender1" runat="server"
    TargetControlID="pnlCollapse"
    ExpandControlID="hlOtherUpComingActivities"
    CollapseControlID="hlOtherUpComingActivities"
    Collapsed="true"
    SuppressPostBack="True" Enabled="True" />