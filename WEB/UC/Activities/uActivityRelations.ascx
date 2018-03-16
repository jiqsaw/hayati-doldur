<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uActivityRelations.ascx.cs" Inherits="UC_Activities_uActivityRelations" %>
<div id="dvRelationsActivities" runat="server" class="related-events"> <!-- RELATED EVENTS -->
<h1>İlgili Etkinlikler</h1>
<div class="box-top"></div>
<div class="box-body">
	<ul>
    
        <asp:Repeater runat="server" ID="rptActivities" 
            onitemdatabound="rptActivities_ItemDataBound">
        <ItemTemplate>        
    
    	<li>
        	<h5>
        	    <asp:HyperLink runat="server" ID="hlActivity" NavigateUrl='<%# Eval("ActivityID") %>'>
            	        <%# Eval("ActivityTitle") %></asp:HyperLink>
            	        
            	        <asp:Literal runat="server" ID="ltlCategory" Visible="false" Text='<%# Eval("CategoryName") %>'></asp:Literal>
            	        
        	</h5>
            <p class="related-img">
                <img alt="" src='images/Categories/<%#Eval("CategoryID") %>.png' />
            </p>
            <p class="related-date">
                <%# Eval("ActivityDate") %>
            </p>
            <p class="related-place">
                <%# Eval("Place") %>
            </p>
            <p class="clear"></p>
        </li>
        
        </ItemTemplate>
        </asp:Repeater>
        
    </ul>
</div>
<div class="box-bottom"></div>
</div> <!-- // RELATED EVENTS // -->