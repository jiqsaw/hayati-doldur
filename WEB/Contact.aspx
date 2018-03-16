<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>
<%@ Register src="~/UC/Common/Error.ascx" tagname="uError" tagprefix="Error" %>
<%@ Register src="~/UC/Common/Success.ascx" tagname="uSuccess" tagprefix="Success" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

            <h1>İletişim</h1>
            <br />
            <Error:uError ID="Err" runat="server" Desc="HATA OLUŞTU ! Daha sonra tekrar deneyiniz..." Visible="false" />
            <Success:uSuccess ID="Success" runat="server" Desc="Formunuz elimize ulaşmıştır. İlginiz için teşekkür ederiz." Visible="false" />
            
            <asp:Panel runat="server" ID="pnlForm" CssClass="contact-wrapper">
            	<p>
            	
            	    Hayatı Doldur ile ilgili her türlü görüş ve önerilerinizi aşağıdaki form ile kolayca aktarabilirsiniz. <br /><br />
            	    Marka elçilerimiz için <a href="MarkaElcileri.aspx">tıklayınız</a>
            	    
            	</p>
            	

                <div class="input-wrapper">
                	<p>Konu:</p>
        
        <asp:DropDownList runat="server" ID="ddlSubject" ValidationGroup="vgContact" Width="230">
        <asp:ListItem Selected="True" Text="Konu Seçiniz" Value="0"></asp:ListItem>
        <asp:ListItem Selected="False" Text="Etkinlik Hakkında" Value="Etkinlik Hakkında"></asp:ListItem>
        <asp:ListItem Selected="False" Text="Üyelik Hakkında" Value="Üyelik Hakkında"></asp:ListItem>
        <asp:ListItem Selected="False" Text="Diğer" Value="Diğer"></asp:ListItem>
        </asp:DropDownList><br />
        <asp:RequiredFieldValidator ID="rqddlSubject" ErrorMessage="Konu Seçiniz !" ControlToValidate="ddlSubject" Display="Dynamic" runat="server" CssClass="login-warn" ValidationGroup="vgContact" InitialValue="0" />
        <div class="login-warn"></div>
                    <div class="clear"></div>

                </div>
                                
                <div class="input-wrapper">
                	<p>İsminiz:</p>

                <asp:TextBox runat="server" ID="txtName" CssClass="TextBox" MaxLength="128" ValidationGroup="vgContact" />
                <asp:RequiredFieldValidator ID="rqName" ErrorMessage="İsminizi giriniz!" ControlToValidate="txtName" SetFocusOnError="true" runat="server" CssClass="login-warn" Display="Dynamic" ValidationGroup="vgContact" />

        <div class="login-warn"></div>
                    <div class="clear"></div>

                </div>
                
                <div class="input-wrapper">
                	<p>E-posta Adresiniz:</p>

        <asp:TextBox runat="server" ID="txtEmail" CssClass="TextBox" MaxLength="120" ValidationGroup="vgContact" /><br />  
        <asp:RequiredFieldValidator ID="rqEmail" runat="server" CssClass="login-warn" ErrorMessage="E-posta adresinizi giriniz!" ControlToValidate="txtEmail" SetFocusOnError="true" Display="Dynamic" ValidationGroup="vgContact" />
        <asp:RegularExpressionValidator ID="rexEmail" runat="server" CssClass="login-warn" ControlToValidate="txtEmail" ErrorMessage="Geçerli bir email adresi giriniz !" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" ValidationGroup="vgContact" />
<div class="login-warn"></div>        
                    <div class="clear"></div>
                    
                    
                </div>
                    
                <div class="input-wrapper">
                	<p>Üniversiteniz:</p>

        <asp:TextBox runat="server" ID="txtUniversity" CssClass="TextBox" MaxLength="128" ValidationGroup="vgContact" /><br />

                    <div class="clear"></div>
                    <div class="login-warn"></div>                    
                    
                </div>                
                
                <div class="input-wrapper">
                	<p>Mesaj:</p>
        
        <asp:TextBox runat="server" ID="txtMessage" CssClass="TextBox" ValidationGroup="vgContact" TextMode="MultiLine" /><br />
        <asp:RequiredFieldValidator ID="rqMessage" ErrorMessage="Mesajınızı giriniz!" ControlToValidate="txtMessage" SetFocusOnError="true" runat="server" CssClass="login-warn" Display="Dynamic" ValidationGroup="vgContact" />        
        
                    <div class="clear"></div>

                </div>
                
                    <asp:ImageButton runat="server" ID="BtnImgSend" CssClass="contact-send" ValidationGroup="vgContact"
                    ImageUrl="images/send-comment.gif" onclick="BtnImgSend_Click" />
                    
            </asp:Panel>
            <div class="clear"></div>

</asp:Content>