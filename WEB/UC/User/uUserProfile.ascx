<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uUserProfile.ascx.cs" Inherits="UC_User_uUserProfile" %>
<%@ Register src="~/UC/Common/Date.ascx" tagname="uDate" tagprefix="Date" %>
<%@ Register src="~/UC/Common/Success.ascx" tagname="uSuccess" tagprefix="Success" %>
<%@ Register src="~/UC/Common/Error.ascx" tagname="uError" tagprefix="Error" %>
<%@ Register src="~/UC/Common/UserImage.ascx" tagname="UserImage" tagprefix="uc1" %>

<script type="text/javascript">
    function TabChange(TabNo) {
        for (var i = 1; i <= 5; i++) {
            if (i == TabNo) {
                $get('Nav' + i).className = 'profile-active';
                $get('dvProfile' + i).style.display = '';
            }
            else {
                $get('Nav' + i).className = '';
                $get('dvProfile' + i).style.display = 'none';
            }
        }
    }

    function cvPassCtrl(source, args) {
        args.IsValid = false;
        var jPass = theForm['<%=txtPassword.ClientID %>'].value;
        if (jPass.length == 0) { args.IsValid = true; }
        else if (jPass.length >= 5) { args.IsValid = true; }
    }

    function EducationShow() {
        var EducationLevel = '<%=ddlEducationLevelID.ClientID %>';
        if (ddlSelectedValue(EducationLevel) > 2)
            $get('dvUniversity').style.display = 'block';
        else
            $get('dvUniversity').style.display = 'none';
    }
    
</script>

<div class="left-block">
<div class="profile-container">
    <h1>Profil Bilgileri</h1>
        <div class="bigbox-top"></div>
        <div class="bigbox-body">
        
        <Success:uSuccess ID="SuccessActivate" runat="server" Desc="Aktivasyon başarıyla tamamlandı. Hayatı Doldur' a hoş geldiniz! " Visible="false" />
        
            <ul class="profile-nav">

                <li class="kb"><a id="Nav1" class="profile-active" href="javascript:TabChange('1');" title="Kişisel Bilgiler">Kişisel Bilgiler</a></li>
                <li class="ub"><a id="Nav2" href="javascript:TabChange('2');" title="Üye Bilgileri">Üye Bilgileri</a></li>
                <li class="eb"><a id="Nav3" href="javascript:TabChange('3');" title="Eğitim Bilgileri">Eğitim Bilgileri</a></li>
                <li class="sa"><a id="Nav4" href="javascript:TabChange('4');" title="Sosyal Ağ">Sosyal Ağ</a></li>
                <li class="ia"><a id="Nav5" href="javascript:TabChange('5');" title="İlgi Alanları">İlgi Alanları</a></li>
                
            </ul>
            <div class="clear"></div>
            <div class="profile-body">
            
    			<div id="dvProfile1" class="profile-step1" style="display:block"> <!-- PROFILE STEP 1 -->
    			
			        <Success:uSuccess ID="SuccessPersonalInfo" runat="server" Desc="Kişisel bilgileriniz güncellenmiştir" Visible="false" />
                    <Success:uSuccess ID="SuccessDeleteImage" runat="server" Desc="Sistemimizdeki Profil fotoğrafınız silnmiştir" Visible="false" />
                        
                    <p>Profilinize fotoğraf ekleyin, kişisel bilgilerinizi eksiksiz doldurun.</p>                    
                    
                    <div class="load-image">
                        <div class="image-side">
                        
                            <uc1:UserImage ID="UserImage1" runat="server" /><br />
                            
                        </div>
                        <div class="image-input">
                            <asp:FileUpload ID="fuPhoto" runat="server" ValidationGroup="vgPersonalInfo" />
                            <asp:RegularExpressionValidator ID="rexPhoto" runat="server"
                                 ValidationExpression="(.*\.([gG][iI][fF]|[jJ][pP][gG]|[jJ][pP][eE][gG])$)"
                                 ControlToValidate="fuPhoto"
                                 Display="Dynamic"
                                 SetFocusOnError="true"
                                 ErrorMessage="Lütfen doğru bir fotoğraf seçiniz !"
                                 ValidationGroup="vgPersonalInfo" />
                                 
                                    <asp:LinkButton runat="server" ID="lnkDeleteImage" Text="[ Fotoğrafı Kaldır ]" 
                                        OnClick="lnkDeleteImage_Click"></asp:LinkButton>
                        </div>
                        <div class="image-desc"><br /><br />JPG ya da GIF dosyası yükleyebilirsiniz. <br />Dosya boyutu 6 MB ile sınırlıdır. </div>
                        <div class="clear"></div>
                    </div>
                    
                    <div class="edit-box"> <!-- EDIT BOX -->
                        <div class="edit-head">Adınız</div>
                        <div class="edit-input">
                        
                            <asp:TextBox runat="server" ID="txtFirstName" CssClass="text" ValidationGroup="vgPersonalInfo"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rqFirstName" ErrorMessage="Adınızı giriniz!" ControlToValidate="txtFirstName" runat="server" CssClass="error" Display="Dynamic" ValidationGroup="vgPersonalInfo" />
                            
                        </div>
                        
                    </div> <!-- // EDIT BOX // -->
                    
                    <div class="edit-box"> <!-- EDIT BOX -->
                        <div class="edit-head">Soyadınız</div>
                        <div class="edit-input">
                        
                            <asp:TextBox runat="server" ID="txtSurname" CssClass="text" ValidationGroup="vgPersonalInfo"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rqSurname" ErrorMessage="Soyadınızı giriniz!" ControlToValidate="txtSurname" runat="server" CssClass="error" Display="Dynamic" ValidationGroup="vgPersonalInfo" />
                            
                        </div>
                        
                    </div> <!-- // EDIT BOX // -->
                    
                    <div class="edit-box"> <!-- EDIT BOX -->
                        <div class="edit-head">Doğum Tarihiniz</div>
                        <div class="edit-input">
                        
                            <Date:uDate ID="txtBirthDate" runat="server" />
                            
                        </div>
                        
                    </div> <!-- // EDIT BOX // -->
                    
                    <div class="edit-box"> <!-- EDIT BOX -->
                        <div class="edit-head">Cinsiyetiniz</div>
                        <div class="edit-choose">
                            <div class="choose-container">
                                    
                                    <asp:RadioButton runat="server" ID="rdFemale" GroupName="Sex" Text="Bayan" ValidationGroup="vgPersonalInfo" /><br />
                                    <asp:RadioButton runat="server" ID="rdMale" GroupName="Sex" Text="Bay" ValidationGroup="vgPersonalInfo" />
                                    
                            </div>
                            <div class="clear"></div>
                        </div>
                        
                    </div> <!-- // EDIT BOX // -->
                    
                    <div class="edit-box"> <!-- EDIT BOX -->
                        <div class="edit-head">Cep Telefonunuz</div>
                        <div class="edit-input">
                        
                            <asp:TextBox runat="server" ID="txtGsm" MaxLength="13" CssClass="text" ValidationGroup="vgPersonalInfo"></asp:TextBox>
                            
                        </div>
                        
                    </div> <!-- // EDIT BOX // -->
                    
                    <div class="edit-box"> <!-- EDIT BOX -->
                        <div class="edit-head">Yaşadığınız Şehir</div>
                        <div class="edit-input">
                        
                            <asp:DropDownList runat="server" ID="ddlLocationID" ValidationGroup="vgPersonalInfo"></asp:DropDownList><br />
                            <asp:RequiredFieldValidator ID="rqLocation" runat="server" ErrorMessage="Lütfen şehir seçimini yapınız!" ControlToValidate="ddlLocationID" InitialValue="0" CssClass="error" Display="Static" ValidationGroup="vgPersonalInfo" />
                            
                        </div>
                        
                    </div> <!-- // EDIT BOX // -->
                    
                    <div class="clear"></div> 
                    
                    <div class="edit-buttons">
                        <img alt="" src="images/cancel.gif" style="cursor: pointer;" onclick="FormReset();" />
                                                
                        <asp:ImageButton runat="server" ID="btnImgSave" 
                            ImageUrl="~/images/save.gif" ValidationGroup="vgPersonalInfo" 
                            OnClick="btnImgSave_Click" />
                    </div>                               
                </div> <!-- // PROFILE STEP 1 // -->
                
                <div id="dvProfile2" class="profile-step2" style="display:none"> <!-- PROFILE STEP 2 -->
                
                <asp:UpdatePanel ID="upMemberInfo" runat="server">
                    <ContentTemplate>
                
                <asp:UpdateProgress ID="upgrsMemberInfo" runat="server" AssociatedUpdatePanelID="upMemberInfo" DynamicLayout="true">
                    <ProgressTemplate>
                        <img alt="" src="Images/Icons/Indicator.gif" />
                    </ProgressTemplate>
                </asp:UpdateProgress>
                
                    <Success:uSuccess ID="SuccessMemberInfo" runat="server" Desc="Üyelik bilgileriniz güncellenmiştir" Visible="false" />
                    <Error:uError ID="errHasEmail" runat="server" Desc="Seçtiğiniz e-posta adresi kullanılmaktadır. Lütfen başka bir e-posta adresi belirtin." Visible="false" />
                
                    <p>Hayatı Doldur’a giriş yapmanızı sağlayacak e-posta adresinizi ve şifrenizi belirleyin</p>
                    
                    <div class="edit-box"> <!-- EDIT BOX -->
                        <div class="edit-head">E-posta Adresi</div>
                        <div class="edit-input">
                        
        <asp:TextBox runat="server" ID="txtEmail" CssClass="text" MaxLength="120" ValidationGroup="vgMemberInfo" />        
        <asp:RequiredFieldValidator ID="rqEmail" runat="server" CssClass="error" ErrorMessage="E-posta adresinizi giriniz!" ControlToValidate="txtEmail" Display="Dynamic" ValidationGroup="vgMemberInfo" />
        <asp:RegularExpressionValidator ID="rexEmail" runat="server"  CssClass="error" ControlToValidate="txtEmail" ErrorMessage="Geçerli bir e-posta adresi giriniz !" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" ValidationGroup="vgMemberInfo" />                                
                            
                        </div>
                        
                    </div> <!-- // EDIT BOX // -->
                    
                    <div class="edit-box"> <!-- EDIT BOX -->
                        <div class="edit-head">Şifre</div>
                        <div class="edit-input">
                        
        <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="text" MaxLength="20" ValidationGroup="vgMemberInfo" />        
        <asp:RequiredFieldValidator ID="rqPassword" ErrorMessage="Şifrenizi giriniz!" ControlToValidate="txtPassword" Display="Dynamic" runat="server" CssClass="error" ValidationGroup="vgMemberInfo" />
        <asp:CompareValidator ID="cpvPassword" CssClass="error" runat="server" ErrorMessage="Girdiğiniz şifreler birbirine uymuyor !" ControlToValidate="txtPassword" ControlToCompare="txtPassword2" Display="Dynamic" ValidationGroup="vgMemberInfo" />
        <asp:CustomValidator ID="cvPass" runat="server" Display="Dynamic" CssClass="login-warn" ClientValidationFunction="cvPassCtrl" ErrorMessage="Şifreniz en az 5 karakter olmalıdır !" ValidationGroup="vgMemberInfo" />
                                    
                        </div>
                        
                    </div> <!-- // EDIT BOX // -->
                    
                    <div class="edit-box"> <!-- EDIT BOX -->
                        <div class="edit-head">Şifre (Tekrar)</div>
                        <div class="edit-input">
                        
        <asp:TextBox runat="server" ID="txtPassword2" CssClass="text" MaxLength="20" TextMode="Password" ValidationGroup="vgMemberInfo" />
        <asp:RequiredFieldValidator ID="rqPassword2" ErrorMessage="Şifre tekrarını giriniz!" ControlToValidate="txtPassword2" Display="Dynamic" runat="server" CssClass="error" ValidationGroup="vgMemberInfo" />
                            
                        </div>
                        
                    </div> <!-- // EDIT BOX // -->
                    
                    <div class="edit-box step2-buttons">
                    
                        <img alt="" src="images/cancel.gif" style="cursor: pointer;" onclick="FormReset();" />
                                                
                        <asp:ImageButton runat="server" ID="btnImgMemberInfo" 
                            ImageUrl="~/images/save.gif" ValidationGroup="vgMemberInfo" 
                            OnClick="btnImgMemberInfo_Click" />
                            
                    </div>                              
                    
                    <div class="clear"></div>
                    
                    </ContentTemplate>
                </asp:UpdatePanel>
                    
                </div> <!-- // PROFILE STEP 2 // -->
                
                <div id="dvProfile3" class="profile-step3" style="display:none"> <!-- PROFILE STEP 3 -->
                
                <asp:UpdatePanel ID="upEducation" runat="server">
                    <ContentTemplate>
                
                <asp:UpdateProgress ID="upgrsEducation" runat="server" AssociatedUpdatePanelID="upEducation" DynamicLayout="true">
                    <ProgressTemplate>
                        <img alt="" src="Images/Icons/Indicator.gif" />
                    </ProgressTemplate>
                </asp:UpdateProgress>
                
                    <Success:uSuccess ID="SuccessEducation" runat="server" Desc="Eğitim bilgileriniz güncellenmiştir" Visible="false" />
                
                    <p>Eğitim durumunuzu belirtin. Okuduğunuz okuldaki etkinliklerden anında haberdar olun.</p>
                    
                    <div class="edit-box"> <!-- EDIT BOX -->
                        <div class="edit-head">Eğitim Durumu</div>
                        <div class="edit-input">
                        
                            <asp:DropDownList runat="server" ID="ddlEducationLevelID" ValidationGroup="vgEducation" onchange="EducationShow()"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rqEducationLevel" ErrorMessage="Eğitim durumunuzu giriniz !" ControlToValidate="ddlEducationLevelID" Display="Dynamic" runat="server" CssClass="login-warn" ValidationGroup="vgEducation" InitialValue="0" />
                            
                        </div>
                        
                    </div> <!-- // EDIT BOX // -->
                    
                    <div class="edit-box"> <!-- EDIT BOX -->
                        <div class="edit-head">Mezuniyet Durumu</div>
                        <div class="edit-input">
                        
        <asp:DropDownList runat="server" ID="ddlEducationStatusID" ValidationGroup="vgEducation"></asp:DropDownList><br />
        <asp:RequiredFieldValidator ID="rqEducationStatus" ErrorMessage="Mezuniyet durumunuzu giriniz !" ControlToValidate="ddlEducationStatusID" Display="Dynamic" runat="server" CssClass="login-warn" ValidationGroup="vgSignUp" InitialValue="0" />
                            
                        </div>
                        
                    </div> <!-- // EDIT BOX // -->
                    
                    <div class="edit-box"> <!-- EDIT BOX -->
                        <div id="dvUniversity">
                            <div class="edit-head">Üniversite</div>
                            <div class="edit-input">
                        
                            <asp:DropDownList runat="server" ID="ddlUniversityID" ValidationGroup="vgEducation"></asp:DropDownList><br />
                            
                            </div>
                        </div>
                    </div> <!-- // EDIT BOX // -->
                    
                    <div class="edit-box step2-buttons">
                         <img alt="" src="images/cancel.gif" style="cursor: pointer;" onclick="FormReset();" />
                                                
                        <asp:ImageButton runat="server" ID="btnImgEducation" 
                            ImageUrl="~/images/save.gif" ValidationGroup="vgEducation" 
                            OnClick="btnImgEducation_Click" />
                    </div>                              
                    
                    <script type="text/javascript">
                        EducationShow();
                    </script>
                
                    </ContentTemplate>
                </asp:UpdatePanel>
                    
                    <div class="clear"></div> 
                </div> <!-- // PROFILE STEP 3 // -->
                
                <div id="dvProfile4" class="profile-step4 social-network" style="display: none;"> <!-- PROFILE STEP 4 -->
                
                <asp:UpdatePanel ID="upSocial" runat="server">
                    <ContentTemplate>
                
                <asp:UpdateProgress ID="upgrsSocial" runat="server" AssociatedUpdatePanelID="upSocial" DynamicLayout="true">
                    <ProgressTemplate>
                        <img alt="" src="Images/Icons/Indicator.gif" />
                    </ProgressTemplate>
                </asp:UpdateProgress>
                
                    <Success:uSuccess ID="SuccessSocial" runat="server" Desc="Sosyal Ağ bilgileriniz güncellenmiştir" Visible="false" />
                
                    <p>Hayatı Doldur içinde sosyal medyada paylaşmak istediğiniz her şeyi buradan düzenleyebilirsiniz. </p>
                    
                    <asp:HyperLink CssClass="aBig" runat="server" ID="hlFacebookPermission"                                 
                    NavigateUrl="javascript:FB.Connect.showPermissionDialog('publish_stream', function(x){location.reload();}, false, null);">
                    
                    <br /><br />                    
                    » Hayatı Doldur sitesinin bana sormadan gönderiler yayınlamasına izin ver</asp:HyperLink>
                                                        
                    <div class="edit-box"> <!-- EDIT BOX -->
                        <div class="edit-head">www.facebook.com/</div>
                        <div class="edit-input">
                        
        <asp:TextBox runat="server" ID="txtFacebook" CssClass="text" MaxLength="50" ValidationGroup="vgSocial" />
                            
                        </div>                        
                    </div> <!-- // EDIT BOX // -->
                    
                    <div class="edit-box"> <!-- EDIT BOX -->
                        <div class="edit-head">www.twitter.com/</div>
                        <div class="edit-input">
                        
        <asp:TextBox runat="server" ID="txtTwitter" CssClass="text" MaxLength="50" ValidationGroup="vgSocial" />
                            
                        </div>                        
                    </div> <!-- // EDIT BOX // -->

                    <div class="edit-box"> <!-- EDIT BOX -->
                        <div class="edit-head">www.friendfeed.com/</div>
                        <div class="edit-input">
                        
        <asp:TextBox runat="server" ID="txtFriendfeed" CssClass="text" MaxLength="50" ValidationGroup="vgSocial" />
                            
                        </div>                        
                    </div> <!-- // EDIT BOX // -->
                                        
                    
                                        
                    
                    <div class="edit-box step2-buttons">
                         <img alt="" src="images/cancel.gif" style="cursor: pointer;" onclick="FormReset();" />
                                                
                        <asp:ImageButton runat="server" ID="btnImgSocial" 
                            ImageUrl="~/images/save.gif" ValidationGroup="vgSocial" 
                            OnClick="btnImgSocial_Click" />
                    </div>    

                    </ContentTemplate>
                </asp:UpdatePanel>
                                    
                    <div class="clear"></div> 
                </div> <!-- // PROFILE STEP 4 // -->
                
                <div id="dvProfile5" class="profile-step5" style="display: none"> <!-- PROFILE STEP 5 -->
                
                <asp:UpdatePanel ID="upInterest" runat="server">
                    <ContentTemplate>
                
                <asp:UpdateProgress ID="upgrsInterest" runat="server" AssociatedUpdatePanelID="upInterest" DynamicLayout="true">
                    <ProgressTemplate>
                        <img alt="" src="Images/Icons/Indicator.gif" />
                    </ProgressTemplate>
                </asp:UpdateProgress>
                
                    <Success:uSuccess ID="SuccessInterest" runat="server" Desc="İlgi alanlarınız güncellenmiştir" Visible="false" />                    
                
                    <p>İlgi alanlarınızı ve ilgilendiğiniz şehirleri ne kadar ayrıntılı bir biçimde belirtirseniz, etkinlik takviminizi o doğrultuda filtreleyebilirsiniz. Böylece istemediğiniz bir şehirdeki ilgilenmediğiniz bir konserin haberini görmek zorunda kalmazsınız. </p>
                    <div class="step5-container">
                    	<p class="step5-head">İlgi alanlarınızı aşağıdaki listeden işaretleyiniz:</p>
                        <ul class="step5">
                                <li onclick="CheckChange('<%=chSpor.ClientID %>')">
                            	    <asp:CheckBox runat="server" ID="chSpor" Text="Spor" onclick="this.checked = !this.checked;" />
                                </li>
                                <li onclick="CheckChange('<%=chKariyer.ClientID %>')">
                            	    <asp:CheckBox runat="server" ID="chKariyer" Text="Kariyer" onclick="this.checked = !this.checked;" />
                                </li>
                                <li onclick="CheckChange('<%=chEglence.ClientID %>')">
                            	    <asp:CheckBox runat="server" ID="chEglence" Text="Eğlence" onclick="this.checked = !this.checked;" />
                                </li>
                                <li onclick="CheckChange('<%=chMuzik.ClientID %>')">
                            	    <asp:CheckBox runat="server" ID="chMuzik" Text="Müzik" onclick="this.checked = !this.checked;" />
                                </li>
                                <li onclick="CheckChange('<%=chKulturSanat.ClientID %>')">
                            	    <asp:CheckBox runat="server" ID="chKulturSanat" Text="Kültür Sanat" onclick="this.checked = !this.checked;" />
                                </li>
                                <li onclick="CheckChange('<%=chFestival.ClientID %>')">
                            	    <asp:CheckBox runat="server" ID="chFestival" Text="Festival" onclick="this.checked = !this.checked;" />
                                </li>
                            </ul>
                        <div class="clear"></div>
                        <p class="step5-head">İlgilendiğiniz illeri aşağıdaki listeden işaretleyiniz:</p>
                        <ul class="step5 city">
                            
                            <asp:Repeater runat="server" ID="rptUserLocations" 
                                onitemdatabound="rptUserLocations_ItemDataBound">
                                <ItemTemplate>                                
                        
                        	<li>
                        	    
                        	    <asp:Literal runat="server" ID="ltlHasSelected" Visible="false" Text='<%#Eval("HasSelected") %>'></asp:Literal>
                        	    <asp:CheckBox runat="server" ID="chUserLocation" LocationID='<%#Eval("LocationID") %>' />
                        	    <p><%# Eval("LocationName") %></p>
                        	    
                        	</li>
                        	
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                        <div class="clear"></div>                       
                        <div class="edit-box step5-buttons">
                        <img alt="" src="images/cancel.gif" style="cursor: pointer;" onclick="FormReset();" />
                                                
                        <asp:ImageButton runat="server" ID="btnImgInterest" 
                            ImageUrl="~/images/save.gif" ValidationGroup="vgInteresting" 
                            OnClick="btnImgInterest_Click" />
                        </div>    
                    </div>
                    
                    </ContentTemplate>
                </asp:UpdatePanel>
                
                    <div class="clear"></div> 
                </div> <!-- // PROFILE STEP 5 // -->
                
            </div>
        </div>
        <div class="bigbox-bottom"></div>
</div>
</div>