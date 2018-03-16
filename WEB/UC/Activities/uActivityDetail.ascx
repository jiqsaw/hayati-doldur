<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uActivityDetail.ascx.cs" Inherits="UC_Activities_uActivityDetail" %>
<%@ Register src="~/UC/Comment/uComment.ascx" tagname="uComment" tagprefix="uc1" %>
<%@ Register src="~/UC/Common/ActivityPhotos.ascx" tagname="uActivityPhotos" tagprefix="uc2" %>
<%@ Register src="~/UC/Activities/uActivityRelations.ascx" tagname="uActivityRelations" tagprefix="uc3" %>
<%@ Register src="~/UC/Common/Search.ascx" tagname="uSearch" tagprefix="uc4" %>
<%@ Register src="~/UC/Common/ActivityNews.ascx" tagname="ActivityNews" tagprefix="uc5" %>
<%@ Register src="~/UC/Common/btnJoinActivity.ascx" tagname="btnJoinActivity" tagprefix="uc6" %>
<%@ Register src="~/UC/Common/btnPhotoAdd.ascx" tagname="btnPhotoAdd" tagprefix="uc7" %>
<%@ Register src="~/UC/Common/ModalPopup.ascx" tagname="uModalPopup" tagprefix="ModalPopup" %>
<%@ Register src="~/UC/Common/Success.ascx" tagname="uSuccess" tagprefix="Success" %>

<asp:HiddenField runat="server" ID="hdCategory" />
     
<div class="left-block"> <!-- LEFT BLOCK -->

<div class="content-detail"> <!-- CONTENT DETAIL -->
<div class="content-detail-header">
    <asp:Label runat="server" ID="lblActivityTitle"></asp:Label>
    <h3><asp:Literal runat="server" ID="ltlPlace"></asp:Literal></h3>
    <h4></h4>
</div>
<div class="content-detail-icons">
	<div class="icon">
        <div class="bus">
            <asp:Image runat="server" ID="imgBus" ImageUrl="~/Images/bus.png" />
        </div>
        <div class="category">
            <asp:Image runat="server" ID="imgCategory" ImageUrl="~/Images/Categories/||CATEGORYID||.png" />
        </div>
        <div class="clear"></div>
    </div>
    <div class="detail-date"><asp:Literal runat="server" ID="ltlActivityDate"></asp:Literal></div>
</div>
<div class="clear"></div>
<div class="big-img">
    <asp:Image runat="server" ID="imgPhoto" Width="186" />
</div>
<div class="content-detail-desc">

    <div id="dvDetail" runat="server"></div>
   	
	<div class="comment-count">    	
	    <b><asp:Label runat="server" ID="lblCommentCount"></asp:Label></b> yorum var    	    
	</div>
	
	<asp:HyperLink runat="server" ID="hlActivityUsers" CssClass="joined-count" NavigateUrl="#">
	    <b><asp:Label runat="server" ID="lblJoinCount"></asp:Label></b> kişi katılıyor
	</asp:HyperLink>

    <uc6:btnJoinActivity ID="btnJoinActivity1" runat="server" />
	
	
	<asp:HyperLink runat="server" ID="hlShareThis" NavigateUrl="http://www.addthis.com/bookmark.php" CssClass="addthis_button share-event">Paylaş</asp:HyperLink>
        
    <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pub=xa-4ad4893244376022"></script>            
    
    <div class="clear"></div>
    
</div>
<div class="clear"></div>
</div> <!-- // CONTENT DETAIL // -->

<div class="comments"> <!-- COMMENTS -->
<h1>Yorumlar</h1>
<div class="comments-wrapper">

<Success:uSuccess ID="ltlCommentSended" runat="server" Desc="Yorumunuz onay verildikten sonra yayınlanacaktır" Visible="false" />

<asp:Panel runat="server" ID="pnlNoLogin">

	<div class="comments-body">
        <div class="comments-text">Adınız, Soyadınız:</div>
        <div class="comments-input">
        
            <asp:TextBox runat="server" ID="txtCommentByName" MaxLength="50" ValidationGroup="vgAddComment" />
            <asp:RequiredFieldValidator ID="rqCommentByName" runat="server" CssClass="error" ErrorMessage="Lütfen isminizi giriniz!" ControlToValidate="txtCommentByName" SetFocusOnError="true" Display="Dynamic" ValidationGroup="vgAddComment" />        
        
        </div>
        <div class="clear"></div>
    </div>
    
    <div class="comments-body">
        <div class="comments-text">E-posta Adresiniz:</div>
        <div class="comments-input">
        
            <asp:TextBox runat="server" ID="txtCommentByEmail" MaxLength="60"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rqEmail" runat="server" CssClass="error" ErrorMessage="E-posta adresinizi giriniz!" ControlToValidate="txtCommentByEmail" SetFocusOnError="true" Display="Dynamic" ValidationGroup="vgAddComment" />
            <asp:RegularExpressionValidator ID="rexEmail" runat="server"  CssClass="error" ControlToValidate="txtCommentByEmail" ErrorMessage="Geçerli bir e-posta adresi giriniz !" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" ValidationGroup="vgAddComment" />
                                        
        </div>
        <div class="clear"></div>
    </div>

</asp:Panel>


    <div class="comments-body">
        <div class="comments-text">Yorumunuz:</div>
        <div class="comments-input">
        
            <asp:TextBox runat="server" ID="txtComment" CssClass="comment-container" TextMode="MultiLine" ValidationGroup="vgAddComment"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rqComment" runat="server" CssClass="error" ErrorMessage="Yorumunuzu giriniz!" ControlToValidate="txtComment" SetFocusOnError="true" Display="Dynamic" ValidationGroup="vgAddComment" />            
            
        </div>
        <div class="clear"></div>
    </div>
    

    <div class="comments-body">
        <div class="comments-text"></div>
        <div>
        
            <asp:CheckBox CssClass="Check" runat="server" ID="chIsNotifyMe" Text="Diğer yorumlardan haberdar olmak istiyorum" />            
                
            <br /><br />
            
            <asp:ImageButton CssClass="send-button" runat="server" ID="btnImgCommentSend"
            ToolTip="Gönder" ImageUrl="~/Images/send-comment.gif" OnClick="btnImgCommentSend_Click" ValidationGroup="vgAddComment" />
            
        </div>
        <div class="clear"></div>
    </div>


<asp:Literal runat="server" ID="ltlhd"></asp:Literal>

<uc1:uComment ID="uComment1" runat="server" />
    
</div>
</div> <!-- // COMMENTS // -->

</div>

<div class="right-block"> <!-- RIGHT BLOCK -->

    <uc4:uSearch ID="uSearch1" runat="server" />

    <uc3:uActivityRelations ID="uActivityRelations1" runat="server" />

    <uc7:btnPhotoAdd ID="btnPhotoAdd1" runat="server" />
    
    <br /><br />
    
    <uc2:uActivityPhotos ID="uActivityPhotos1" runat="server" />    

    <div class="clear"></div>

    <uc5:ActivityNews ID="uActivityNews1" runat="server" />

</div>