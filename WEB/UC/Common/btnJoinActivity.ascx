<%@ Control Language="C#" AutoEventWireup="true" CodeFile="btnJoinActivity.ascx.cs" Inherits="UC_Common_btnJoinActivity" %>
<%@ Register src="~/UC/Common/ModalPopup.ascx" tagname="uModalPopup" tagprefix="ModalPopup" %>

<%@ Register 
    Assembly="AjaxControlToolkit" 
    Namespace="AjaxControlToolkit" 
    TagPrefix="ajaxToolkit" %>
    
<ModalPopup:uModalPopup ID="mpUserActivityAdd" runat="server" 
    Title = "Uyarı" 
    Message = "Etkinliğe başvurabilmeniz için üye girişi yapın"
    OnOkScript = "go('/Login.aspx')"
    TargetControlID="hlUserActivity_Add"
/>




<div class="attend">

<asp:LinkButton runat="server" ID="lnkUserActivity_Del" Visible="false" CssClass="Del" onclick="lnkUserActivity_Del_Click" >Etkinlikten çık</asp:LinkButton>  
<asp:HyperLink CssClass="Add" runat="server" ID="hlUserActivity_Add" Visible="false" NavigateUrl="#">Etkinliğe başvur</asp:HyperLink>
<asp:HyperLink CssClass="End" runat="server" ID="hlUserActivity_End" Visible="false">Kontenjan doldu</asp:HyperLink>

</div>