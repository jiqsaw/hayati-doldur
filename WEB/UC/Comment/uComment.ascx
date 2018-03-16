<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uComment.ascx.cs" Inherits="UC_Comment_uComment" %>
<%@ Register src="~/UC/Common/Error.ascx" tagname="uError" tagprefix="Error" %>
<%@ Register src="~/UC/Common/UserImage.ascx" tagname="UserImage" tagprefix="uc1" %>

<asp:Panel runat="server" ID="pnlNoComment" Visible="false">
    <asp:Label runat="server" CssClass="NoData" Visible="false"><br /><br />Bu etkinliğe ait yorum bulunmamaktadır.</asp:Label>
</asp:Panel>

<Error:uError ID="errDelete" runat="server" Desc="Yorum Silinmiştir..." Visible="false" />

<asp:Panel runat="server" ID="pnlComments">

<asp:Repeater runat="server" ID="rptComments" 
        OnItemDataBound="rptComments_ItemDataBound" 
        OnItemCommand="rptComments_ItemCommand">
<ItemTemplate>

<asp:Literal runat="server" ID="ltlUserID" Text='<%# Eval("UserID") %>' Visible="false"></asp:Literal>
<asp:Literal runat="server" ID="ltlIsActive" Text='<%# Eval("IsActive") %>' Visible="false"></asp:Literal>

    <asp:Panel ID="pnlComment" runat="server" CssClass="user-comments"> <!-- USER COMMENTS -->
    	<div class="user-img">
    	
    	<uc1:UserImage ID="UserImage1" runat="server" 
	        UserID='<%# Eval("UserID") %>' 
	        size="square"
	        uid='<%# Eval("FacebookID") %>'
	        Photo='<%#Eval("Photo") %>' />
    	    
    	</div>
        <div class="byuser">
        	<div class="comment-header">
            	<div class="user-info"><span>
            	            	
            	    <asp:HyperLink runat="server" ID="hlUserPage">
    	                <%# Eval("CommentByName") %>
    	            </asp:HyperLink>
            	
            	</span> dedi ki;</div>
                <div class="comment-time">
                
                <%# COM.Util.ReturnTimeAgo(Convert.ToDateTime(Eval("CreateDate"))) %>
                
                 önce</div>
                <div class="clear"></div>
            </div>
            <div class="comments-txt">
            
        <%# LIB.Util.Nl2Br(Eval("CommentDetail").ToString()) %>
        <asp:Literal runat="server" ID="ltlOriginalDetail" Visible="false" Text='<%# LIB.Util.Nl2Br(Eval("CommentDetailOriginal").ToString()) %>'></asp:Literal>

        <asp:LinkButton runat="server" ID="lnkDelete" Visible="false" CommandArgument='<%# Eval("CommentID") %>' CommandName="Delete">· Sil</asp:LinkButton>

        <asp:Panel runat="server" ID="pnlPending" CssClass="Pending" Visible="false">
            <i>Onay bekleniyor...</i>
        </asp:Panel>

            </div>
        </div>
        <div class="clear"></div>
    </asp:Panel> <!-- // USER COMMENTS // -->

</ItemTemplate>        
</asp:Repeater>

</asp:Panel>