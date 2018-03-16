<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uActivityJoin.ascx.cs" Inherits="UC_Activities_uActivityJoin" %>
<%@ Register src="~/UC/Common/ActivityNews.ascx" tagname="ActivityNews" tagprefix="uc2" %>
<%@ Register src="~/UC/Common/ActivityFollower.ascx" tagname="ActivityFollower" tagprefix="uc4" %>
<%@ Register src="~/UC/Common/Banner.ascx" tagname="uBanner" tagprefix="Banner" %>
<%@ Register src="~/UC/Common/Search.ascx" tagname="uSearch" tagprefix="Search" %>
<%@ Register src="~/UC/Common/Error.ascx" tagname="uError" tagprefix="Error" %>
<%@ Register src="~/UC/Common/Success.ascx" tagname="uSuccess" tagprefix="Success" %>

<script type="text/javascript">
    function EducationShow() {
        var EducationLevel = '<%=ddlEducationLevelID.ClientID %>';
        if (ddlSelectedValue(EducationLevel) > 2)
            $get('dvUniversity').style.display = 'block';
        else
            $get('dvUniversity').style.display = 'none';
    }

    function JoinFormSend(IsShowPerms) {
        var btnJoinID = '<%=btnJoin.ClientID %>';
        var hlJoinID = '<%=hlJoin.ClientID %>';

        WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions($get(btnJoinID), "", true, "vgActivityJoin", "", false, false));

        if (Page_ClientValidate())
            $get(hlJoinID).disabled = true;
        
        if (IsShowPerms)
            FB.Connect.showPermissionDialog('publish_stream',
                                                            function(x) {
                                                                __doPostBack('btnJoin', '');
                                                                $get('<%=hlJoin.ClientID %>').href = "javascript:JoinFormSend(false)";
                                                            }, false, null);
        else
            __doPostBack('btnJoin', '');
        
        //$get(btnJoinID).style.display = 'none';
    }
</script>

<div class="left-block"> <!-- LEFT BLOCK -->
	<div class="profile-container">
        <h1>Profil Bilgileri</h1>
            <div class="bigbox-top"></div>
            <div class="bigbox-body">
                
                <asp:HiddenField runat="server" ID="hdCategory" />
                
                <asp:HiddenField runat="server" ID="hdIsSend" Value="1" />
                
                <asp:HiddenField runat="server" ID="hdJoinCount" />
                <asp:HiddenField runat="server" ID="hdUserCount" />
                <asp:HiddenField runat="server" ID="hdAlternateUserCount" />
                <asp:HiddenField runat="server" ID="hdIsJoinUser" />
                <asp:HiddenField runat="server" ID="hdInvitePeopleInfoID" />
                
                <asp:HiddenField runat="server" ID="hdPhoto" />
                
                <div class="event">
                	<div class="event-header"> <!-- Event Header -->
                        <div class="content-detail-header">
                            <h2>
                            
                                <asp:Literal runat="server" ID="ltlActivityTitle"></asp:Literal>
                                
                            </h2>
                            <h3>
                                
                                <asp:Literal runat="server" ID="ltlActivityDate"></asp:Literal>
                                    
                            </h3>
                            <h4>
                            
                                <asp:Literal runat="server" ID="ltlPlace"></asp:Literal>
                                
                            </h4>
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
                            <div class="detail-date">
                            
                                <%--<asp:Literal runat="server" ID="ltlActivityDate"></asp:Literal>--%>
                                
                            </div>
                        </div>
                        <div class="clear"></div>   
                    </div>
                    
                    <Error:uError ID="err" runat="server" Desc="HATA OLUŞTU ! Daha sonra tekrar deneyiniz..." Visible="false" />


                    <asp:Panel runat="server" ID="Success" Visible="false" CssClass="event-body">                    
                        <p class="event-head">
                            <img alt="" src="Images/SuccessBig.jpg" align="left" />
                            Etkinlik başvurunuz alınmıştır
                            <br /><br /><br />
                            <asp:HyperLink CssClass="aBig" runat="server" ID="hlActivityBack1" NavigateUrl="#">Etkinliğe dön</asp:HyperLink>
                        </p>
                    </asp:Panel>

                    <asp:Panel runat="server" ID="SuccessButAlternate" Visible="false" CssClass="event-body">
                        <p class="event-head">
                            <img alt="" src="Images/SuccessBig.jpg" align="left" />
                            Başvurunuz alınmıştır. Yedek listeye yerleştirildiniz. Sizinle iletişime geçilecektir
                            <br /><br /><br />
                            <asp:HyperLink CssClass="aBig" runat="server" ID="hlActivityBack2" NavigateUrl="#">Etkinliğe dön</asp:HyperLink>
                        </p>                                            
                    </asp:Panel>

                    <asp:Panel runat="server" ID="pnlForm" CssClass="event-body"> <!-- Event Body -->
                    	<p class="event-head">Etkinliğe katılmanız için eksik bilgilerinizi tamamlayın</p>
                    	
                    	<asp:Panel runat="server" ID="pnlProfile">
                    	
                        <div class="event-input-wrapper">
                        	<div class="event-txt">Adınız:</div>
                            <div class="edit-input">
                            
                        <asp:TextBox runat="server" ID="txtFirstName" CssClass="TextBox" MaxLength="128" /><br />

                            </div>
                            <div class="clear"></div>
                        <asp:RequiredFieldValidator ID="rqFirstName" ErrorMessage="Adınızı giriniz!" ControlToValidate="txtFirstName" SetFocusOnError="true" runat="server" CssClass="login-warn" Display="Static" ValidationGroup="vgActivityJoin" />        
                        
                        </div>
                        <div class="event-input-wrapper">
                        	<div class="event-txt">Soyadınız:</div>
                            <div class="edit-input">
                            
                        <asp:TextBox runat="server" ID="txtSurname" CssClass="TextBox" MaxLength="128" /><br />
                            
                            </div>
                            <div class="clear"></div>
                        <asp:RequiredFieldValidator ID="rqSurname" ErrorMessage="Soyadınızı giriniz!" ControlToValidate="txtSurname" SetFocusOnError="true" runat="server" CssClass="login-warn" Display="Static" ValidationGroup="vgActivityJoin" />
                                                    
                        </div>
                        <div class="event-input-wrapper">
                        	<div class="event-txt">Cep Telefonunuz:</div>
                            <div class="edit-input">
                            
                        <asp:TextBox runat="server" ID="txtGsm" CssClass="TextBox" MaxLength="128" /><br />
                                
                            </div>
                            <div class="clear"></div>
                        <asp:RequiredFieldValidator ID="rqGsm" ErrorMessage="Cep telefonunuzu giriniz!" ControlToValidate="txtGsm" SetFocusOnError="true" runat="server" CssClass="login-warn" Display="Static" ValidationGroup="vgActivityJoin" />
                                                    
                        </div>
                        <div class="event-input-wrapper">
                        	<div class="event-txt">E-posta Adresiniz:</div>
                            <div class="edit-input">
                            
                        <asp:TextBox runat="server" ID="txtEmail" CssClass="TextBox" MaxLength="120" /><br />
                                
                            </div>
                            <div class="clear"></div>
                        <asp:RequiredFieldValidator ID="rqEmail" runat="server" CssClass="login-warn" ErrorMessage="E-posta adresinizi giriniz!" ControlToValidate="txtEmail" SetFocusOnError="true" Display="Static" ValidationGroup="vgActivityJoin" />
                        <asp:RegularExpressionValidator ID="rexEmail" runat="server"  CssClass="login-warn" ControlToValidate="txtEmail" ErrorMessage="Geçerli bir e-posta adresi giriniz !" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Static" ValidationGroup="vgActivityJoin" />                            
                        
                        </div>
                        <div class="event-input-wrapper">
                        	<div class="event-txt">Eğitim Durumunuz:</div>
                            <div class="edit-input">
                            
                        <asp:DropDownList runat="server" ID="ddlEducationLevelID" ValidationGroup="vgActivityJoin" onchange="EducationShow()"></asp:DropDownList><br />
                                
                            </div>
                            <div class="clear"></div>
                        <asp:RequiredFieldValidator ID="rqEducationLevel" ErrorMessage="Eğitim durumunuzu giriniz !" ControlToValidate="ddlEducationLevelID" Display="Static" SetFocusOnError="true" runat="server" CssClass="login-warn" ValidationGroup="vgActivityJoin" InitialValue="0" />
                                                    
                        </div>
                        <div class="event-input-wrapper">
                        	<div class="event-txt">Mezuniyet Durumunuz:</div>
                            <div class="edit-input">
                            
                        <asp:DropDownList runat="server" ID="ddlEducationStatusID" ValidationGroup="vgActivityJoin"></asp:DropDownList><br />
                                
                            </div>
                            <div class="clear"></div>
                        <asp:RequiredFieldValidator ID="rqEducationStatus" ErrorMessage="Mezuniyet durumunuzu giriniz !" ControlToValidate="ddlEducationStatusID" Display="Static" SetFocusOnError="true" runat="server" CssClass="login-warn" ValidationGroup="vgActivityJoin" InitialValue="0" />
                                                    
                        </div>
                        <div class="event-input-wrapper">
                        
                            <div id="dvUniversity" style="display: none;">
                        
                    	    <div class="event-txt">Üniversite:</div>
                            <div class="edit-input">
                            
                                <asp:DropDownList runat="server" ID="ddlUniversityID" ValidationGroup="vgActivityJoin"></asp:DropDownList><br />
                                
                            </div>
                            
                            </div>
                            
                            <div class="clear"></div>
                        </div>
                        <div class="event-input-wrapper last-input">
                        	<div class="event-txt">Yaşadığınız Şehir:</div>
                            <div class="edit-input">
                            
                            <asp:DropDownList runat="server" ID="ddlLocationID" ValidationGroup="vgActivityJoin"></asp:DropDownList><br />
                                
                            </div>
                            <div class="clear"></div>
                            <asp:RequiredFieldValidator ID="rqLocation" runat="server" ErrorMessage="Lütfen şehir seçimini yapınız!" ControlToValidate="ddlLocationID" InitialValue="0" CssClass="login-warn" SetFocusOnError="true" Display="Static" ValidationGroup="vgActivityJoin" />                            
                            
                        </div>
                        
                        <script type="text/javascript">
                            EducationShow();
                        </script>
                        
                        </asp:Panel>
                        
                        
                        
<%--                        <p class="event-head">Etkinlik için kaldırılacak olan otobüsten faydalanmak istiyorsanız, gerekli alanları doldurunuz:</p>--%>
                        <div id="Service" runat="server" class="event-check last-input">
                        	<asp:CheckBox runat="server" ID="chHasService" />
                        	
                        	<p>Servisten faydalanmak istiyorum.</p>                        	                        	    
                        	
                            <div class="clear"></div>
                        </div>
                        
                        <p id="pEkBilgi" runat="server" class="event-head">Ek bilgiler</p>
                        
                        <asp:Panel runat="server" ID="pnlLabelValue1" CssClass="event-input-wrapper">
                            <div class="event-txt">
                                <asp:Literal runat="server" ID="ltlLabel1"></asp:Literal>
                            </div>
                            <div class="edit-input">
                            
                        <asp:TextBox runat="server" ID="txtLabelValue1" CssClass="TextBox" MaxLength="512" ValidationGroup="vgActivityJoin" /><br />                        
                                
                            </div>
                            <div class="clear"></div>
                            <div><asp:RequiredFieldValidator ID="rqtxtLabelValue1" ErrorMessage="Lütfen doldurunuz!" ControlToValidate="txtLabelValue1" SetFocusOnError="true" runat="server" CssClass="login-warn" Display="Static" ValidationGroup="vgActivityJoin" /></div>
                        </asp:Panel>
                        
                        <asp:Panel runat="server" ID="pnlLabelValue2" CssClass="event-input-wrapper">
                            <div class="event-txt">
                                <asp:Literal runat="server" ID="ltlLabel2"></asp:Literal>
                            </div>
                            <div class="edit-input">
                            
                        <asp:TextBox runat="server" ID="txtLabelValue2" CssClass="TextBox" MaxLength="512" ValidationGroup="vgActivityJoin" /><br />                        
                                
                            </div>
                            <div class="clear"></div>
                            <div><asp:RequiredFieldValidator ID="rqtxtLabelValue2" ErrorMessage="Lütfen doldurunuz!" ControlToValidate="txtLabelValue1" SetFocusOnError="true" runat="server" CssClass="login-warn" Display="Static" ValidationGroup="vgActivityJoin" /></div>
                        </asp:Panel>
                        
                        <asp:Panel runat="server" ID="pnlLabelValue3" CssClass="event-input-wrapper">
                            <div class="event-txt">
                                <asp:Literal runat="server" ID="ltlLabel3"></asp:Literal>
                            </div>
                            <div class="edit-input">
                            
                        <asp:TextBox runat="server" ID="txtLabelValue3" CssClass="TextBox" MaxLength="512" ValidationGroup="vgActivityJoin" /><br />                        
                                
                            </div>
                            <div class="clear"></div>
                            <div><asp:RequiredFieldValidator ID="rqtxtLabelValue3" ErrorMessage="Lütfen doldurunuz!" ControlToValidate="txtLabelValue3" SetFocusOnError="true" runat="server" CssClass="login-warn" Display="Static" ValidationGroup="vgActivityJoin" /></div>
                        </asp:Panel>
                        
                        <asp:Panel runat="server" ID="pnlLabelValue4" CssClass="event-input-wrapper">
                            <div class="event-txt">
                                <asp:Literal runat="server" ID="ltlLabel4"></asp:Literal>
                            </div>
                            <div class="edit-input">
                            
                        <asp:TextBox runat="server" ID="txtLabelValue4" CssClass="TextBox" MaxLength="512" ValidationGroup="vgActivityJoin" /><br />                        
                                
                            </div>
                            <div class="clear"></div>
                            <div><asp:RequiredFieldValidator ID="rqtxtLabelValue4" ErrorMessage="Lütfen doldurunuz!" ControlToValidate="txtLabelValue4" SetFocusOnError="true" runat="server" CssClass="login-warn" Display="Static" ValidationGroup="vgActivityJoin" /></div>
                        </asp:Panel>
                        
                        <asp:Panel runat="server" ID="pnlLabelValue5" CssClass="event-input-wrapper">
                            <div class="event-txt">
                                <asp:Literal runat="server" ID="ltlLabel5"></asp:Literal>
                            </div>
                            <div class="edit-input">
                            
                        <asp:TextBox runat="server" ID="txtLabelValue5" CssClass="TextBox" MaxLength="512" ValidationGroup="vgActivityJoin" /><br />                        
                                
                            </div>
                            <div class="clear"></div>
                            <div><asp:RequiredFieldValidator ID="rqtxtLabelValue5" ErrorMessage="Lütfen doldurunuz!" ControlToValidate="txtLabelValue5" SetFocusOnError="true" runat="server" CssClass="login-warn" Display="Static" ValidationGroup="vgActivityJoin" /></div>
                        </asp:Panel>
                        
                        <asp:Panel runat="server" ID="pnlLabelValue6" CssClass="event-input-wrapper">
                            <div class="event-txt">
                                <asp:Literal runat="server" ID="ltlLabel6"></asp:Literal>
                            </div>
                            <div class="edit-input">
                            
                        <asp:TextBox runat="server" ID="txtLabelValue6" CssClass="TextBox" MaxLength="512" ValidationGroup="vgActivityJoin" /><br />                        
                                
                            </div>
                            <div class="clear"></div>
                            <div><asp:RequiredFieldValidator ID="rqtxtLabelValue6" ErrorMessage="Lütfen doldurunuz!" ControlToValidate="txtLabelValue6" SetFocusOnError="true" runat="server" CssClass="login-warn" Display="Static" ValidationGroup="vgActivityJoin" /></div>
                        </asp:Panel>                                                                        
                        <div class="clear"></div> <br /><br />
                        <div class="edit-buttons">

                            <asp:HyperLink runat="server" ID="hlJoin" NavigateUrl="javascript:JoinFormSend(false)" ImageUrl="~/images/save.gif"></asp:HyperLink>
                            
                            <img alt="Etkinliğe katılmaktan vazgeç" style="cursor: pointer;" src="images/cancel.gif" onclick="history.back()" />
                            
                            <asp:ImageButton runat="server" ID="btnJoin" style="display: none;" />
                            
                        </div>
                    </asp:Panel>
                </div>
                    
            </div>
            <div class="bigbox-bottom event-bottom"></div>
    </div>
</div>

<div class="right-block">
	
	<Search:uSearch ID="uSearch1" runat="server" />
    
    <Banner:uBanner ID="uBanner1" runat="server" />
    
    <uc2:ActivityNews ID="ActivityNews1" runat="server" />
    
    <uc4:ActivityFollower ID="ActivityFollower1" runat="server" />
    
</div>