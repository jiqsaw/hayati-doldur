<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uActivityList.ascx.cs" Inherits="UC_Activities_uActivityList" %>
<%@ Register src="~/UC/Common/Paging.ascx" tagname="uPaging" tagprefix="Paging" %>

<div class="left-block"> <!-- LEFT BLOCK -->
            	
    <div class="member-attend">
    	<h1>    	    
    	    <asp:Literal runat="server" ID="ltlSearchResult" Visible="false">Arama Sonuçları</asp:Literal>
    	    <asp:Literal runat="server" ID="ltlUpComing" Visible="false">Yaklaşan Etkinlikleriniz</asp:Literal>
    	</h1>
        
        <asp:Repeater runat="server" ID="rptList" 
            onitemdatabound="rptList_ItemDataBound">
        <ItemTemplate>
                       
        <div class="member-attend-wrapper search-results">
        	<div class="row1">
        	    <asp:Literal runat="server" ID="ltlCategoryID" Text='<%# Eval("CategoryID") %>' Visible="false"></asp:Literal>
        	    <asp:Image runat="server" ID="imgCategory" ImageUrl='~/Images/Categories/||CategoryID||.png' />
        	        
        	</div>
            <div class="row2"><h5>
            
                <asp:HyperLink runat="server" ID="hlTitle" NavigateUrl='<%#Eval("ActivityID") %>'><%# Eval("ActivityTitle") %></asp:HyperLink>
                <asp:Literal runat="server" ID="ltlCategory" Visible="false" Text='<%#Eval("CategoryName") %>'></asp:Literal>
                
            </h5></div>
            <div class="row3"><h4>
            
                <%# Eval("Place") %>
            
            </h4></div>
            <div class="row4"><h3>
            
                <%# Eval("ActivityDate") %>
            </h3></div>
            <div class="clear"></div>
            <div class="search-desc">
            
                <%# LIB.Util.Nl2Br(Eval("ActivityHeader").ToString()) %>
            
            </div>
        </div>
        
        </ItemTemplate>
        </asp:Repeater>


        <asp:Literal runat="server" ID="ltlNoResult" Text="Aradığınız kriterle ait bir etkinlik bulunmamaktadır" Visible="false"></asp:Literal>
        
        <Paging:uPaging ID="Paging1" runat="server" />
        
    </div>
    
</div>