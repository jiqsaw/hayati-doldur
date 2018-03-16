<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Search.ascx.cs" Inherits="UC_Common_Search" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<div class="search-box">

    <asp:TextBox CssClass="search-text" runat="server" ID="txtSearchText" MaxLength="100" Text="Aranacak Kelimeyi Giriniz..." onfocus="txtInitial(this.id, this.className, '')"></asp:TextBox>
    
    <asp:ImageButton runat="server" ID="btnImgSearch" ToolTip="Ara" CssClass="search-button" 
    ImageUrl="~/images/search-button.jpg" onclick="btnImgSearchGo_Click" />
    
<div class="clear"></div>

<asp:Panel runat="server" ID="pnlCollapse">
    <div class="search-body">
        <div class="search-container">
            <div class="search-wrapper">
                <p>Başlangıç Tarihi</p>
                    <asp:TextBox runat="server" ID="txtStartDate" ValidationGroup="vgActivitySearch"></asp:TextBox>
                    <cc1:CalendarExtender ID="ajStartDate" runat="server" TargetControlID="txtStartDate" Format="dd MMMM yyyy"></cc1:CalendarExtender>
            </div>
            
            <div class="search-wrapper">
                <p>Bitiş Tarihi</p>
                    <asp:TextBox runat="server" ID="txtEndDate" ValidationGroup="vgActivitySearch"></asp:TextBox>
                    <cc1:CalendarExtender ID="ajEndDate" runat="server" TargetControlID="txtEndDate" Format="dd MMMM yyyy"></cc1:CalendarExtender>
            </div>
            <div class="search-wrapper">
                <p>Kategori</p>
                    <asp:DropDownList runat="server" ID="ddlCategories" ValidationGroup="vgActivitySearch"></asp:DropDownList>
            </div>
            
            <div class="search-wrapper">
                <p>Şehir</p>
                <asp:DropDownList runat="server" ID="ddlCities" ValidationGroup="vgActivitySearch"></asp:DropDownList>
            </div>
            
            <div class="clear"></div>
            
            <div class="search-btn">
                <asp:ImageButton runat="server" ID="btnImgSearchGo"
                    ImageUrl="~/images/search.gif" onclick="btnImgSearchGo_Click" />
                <asp:ImageButton runat="server" ID="btnImgCancel" ImageUrl="~/images/cancel.gif" />
            </div>
            
        </div>
    </div>
    <div class="search-bottom"></div>
</asp:Panel>

</div>

<cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender1" runat="server"
    TargetControlID="pnlCollapse"
    ExpandControlID="txtSearchText"
    CollapseControlID="btnImgCancel"
    Collapsed="true"
    SuppressPostBack="True" Enabled="True" />