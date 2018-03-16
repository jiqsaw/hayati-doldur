<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uOrientationNew.ascx.cs" Inherits="UC_Orientation_uOrientationNew" %>

<%@ Register src="~/UC/Common/Error.ascx" tagname="uError" tagprefix="uc1" %>
<%@ Register src="~/UC/Common/Success.ascx" tagname="uSuccess" tagprefix="uc2" %>

<uc2:uSuccess ID="succSave" runat="server" Visible="false" Title="Oryantasyon Kaydı" Desc="Oryantasyon bilgileri kaydedilmiştir" />
<uc2:uSuccess ID="succUpdate" runat="server" Visible="false" Title="Oryantasyon Kaydı" Desc="Oryantosyan bilgileri güncellenmiştir" />

<uc1:uError ID="err" runat="server" Visible="false" Title="KAYIT EDİLMEDİ" Desc="Kayıt yapılırken hata oluştu" />

<h2>ÜNİVERSİTE BİLGİLERİ</h2>

<asp:Panel runat="server" ID="pnlForm">

    <asp:RequiredFieldValidator ID="reqUniversityID" runat="server" ErrorMessage="Üniversite seçiniz !" ControlToValidate="ddlUniversityID" SetFocusOnError="true" Display="None" ValidationGroup="vgOrientation" />
    <asp:RequiredFieldValidator ID="reqAddress" runat="server" ErrorMessage="Üniversite seçiniz !" ControlToValidate="txtAddress" SetFocusOnError="true" Display="None" ValidationGroup="vgOrientation" />
    <asp:RequiredFieldValidator ID="reqUlasim" runat="server" ErrorMessage="Üniversite seçiniz !" ControlToValidate="txtUlasim" SetFocusOnError="true" Display="None" ValidationGroup="vgOrientation" />

    <asp:ValidationSummary ID="ValSum" runat="server" CssClass="Validate" ShowSummary="true" ValidationGroup="vgOrientation" />

    <div class="Form">

        <p>Üniversite</p>
        <asp:DropDownList runat="server" ID="ddlUniversityID" ValidationGroup="vgOrientation"></asp:DropDownList><br />
                
        <p>Adres</p>
        <asp:TextBox CssClass="TextBox" runat="server" ID="txtAddress" ValidationGroup="vgOrientation" TextMode="MultiLine" Height="30px"></asp:TextBox>
        
        <p>Web</p>
        <asp:TextBox CssClass="TextBox" runat="server" ID="txtWeb" ValidationGroup="vgOrientation" MaxLength="512"></asp:TextBox>

        <p>Ulaşım</p>
        <asp:TextBox CssClass="TextBox" runat="server" ID="txtUlasim" ValidationGroup="vgOrientation" TextMode="MultiLine" Height="25px"></asp:TextBox>    
        
        <br />
        
        <asp:Repeater runat="server" ID="rptOrientationParameters" OnItemCommand="rptOrientationParameters_ItemCommand" OnItemDataBound="rptOrientationParameters_ItemDataBound">
            <ItemTemplate>
        
            <hr />

            <asp:UpdatePanel runat="server" ID="upPanel">
            <ContentTemplate>

            <asp:UpdateProgress ID="upgrsFonMembers" runat="server" AssociatedUpdatePanelID="upPanel" DynamicLayout="true">
                <ProgressTemplate>
                    <img alt="" src="Images/Global/Indicator.gif" />
                </ProgressTemplate>
            </asp:UpdateProgress>

  	        <asp:Repeater runat="server" ID="rptOrientationParameterValues" OnItemCommand="rptOrientationParameterValues_ItemCommand">
  	        <ItemTemplate>
      	    
  	            <asp:HiddenField runat="server" ID="hdOrientationParameterID" Value='<%#Eval("OrientationParameterID")%>' />  	        
  	            
  	            <b> <asp:Literal runat="server" ID="ltlOrientationParameterValue" Text='<%# Eval("OrientationParameterValue") %>'></asp:Literal></b> &nbsp;&nbsp;
  	            
  	            [ <asp:LinkButton runat="server" ID="lnkEdit" CommandName="Edit" CommandArgument='<%#Eval("Index") %>' CausesValidation="false">Düzenle</asp:LinkButton> ]
  	            [ <asp:LinkButton runat="server" ID="lnkDelete" CommandName="Delete" CommandArgument='<%#Eval("Index") %>' CausesValidation="false">SİL</asp:LinkButton> ]<br />
                
                <asp:Literal runat="server" ID="ltlOrientationParameterDesc" Text='<%# LIB.Util.Nl2Br(Eval("OrientationParameterDesc").ToString()) %>'></asp:Literal>
                <br /><br />
                
            </ItemTemplate>
  	        </asp:Repeater>
            
            <asp:RequiredFieldValidator ID="reqOrientationParameterValue" runat="server" ErrorMessage="Lütfen içerik giriniz !" ControlToValidate="txtOrientationParameterValue" SetFocusOnError="true" Display="None"  ValidationGroup='<%#Eval("OrientationParameterID", "vgOrientationParameters{0}")%>' />

            <asp:ValidationSummary ID="ValSumParameters" runat="server" CssClass="Validate" ShowSummary="true" ValidationGroup='<%#Eval("OrientationParameterID", "vgOrientationParameters{0}")%>' />
            
            <asp:HiddenField runat="server" ID="hdOrientationParameterID" Value='<%#Eval("OrientationParameterID")%>' />
            
            <p><%#Eval("OrientationParameterName") %></p>
            <asp:TextBox CssClass="TextBox" runat="server" ID="txtOrientationParameterValue" ValidationGroup='<%#Eval("OrientationParameterID", "vgOrientationParameters{0}")%>'></asp:TextBox>

            <p><%#Eval("OrientationParameterDescTitle") %></p>
            <asp:TextBox CssClass="TextBox" runat="server" ID="txtOrientationParameterDesc" ValidationGroup='<%#Eval("OrientationParameterID", "vgOrientationParameters{0}")%>' TextMode="MultiLine" Height="30px"></asp:TextBox>   

            <br />
            <asp:Button runat="server" ID="btnAdd" CssClass="Button" Text="EKLE" ValidationGroup='<%#Eval("OrientationParameterID", "vgOrientationParameters{0}")%>' CommandName="Add" />                
        
                </ContentTemplate>
            </asp:UpdatePanel>
        
            <br /><br />
        
            </ItemTemplate>
        </asp:Repeater>
        
    </div>

    <asp:HiddenField runat="server" ID="hdOrientationUniversityID" Value="0" />

    <div class="FormFooter"> <asp:Button runat="server" ID="btnSend" CssClass="Button" Text="KAYDET" ValidationGroup="vgOrientation" onclick="btnSend_Click" /> </div>

</asp:Panel>