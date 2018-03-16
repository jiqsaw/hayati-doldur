<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uKampusRehberiDetay.ascx.cs" Inherits="UC_KampusRehberi_uKampusRehberiDetay" %>

<%@ Register src="~/UC/KampusRehberi/uUniversityItem.ascx" tagname="uUniversityItem" tagprefix="uc1" %>
<%@ Register src="~/UC/KampusRehberi/uKampusDetayContent.ascx" tagname="uKampusDetayContent" tagprefix="uc2" %>

<script type="text/javascript">
    function GoKampusRehberi(j) {
        location.href = "KampusRehberiDetay.aspx?j=" + j;
    }
</script>

<h1>Kampüs Rehberi</h1>

<div style="float: right;">
        <a href="KampusRehberi.aspx">Listeye Dön</a>
        
        <asp:DropDownList runat="server" ID="ddlUniversityID" onchange="GoKampusRehberi(ddlSelectedValue(this.id))"></asp:DropDownList><br />
        
</div>
    

<div class="clear"></div>
<br />
    
<uc1:uUniversityItem ID="uUniversityItem1" runat="server" />

    
<table cellpadding="0" cellspacing="0" class="KampusRehberiDetayTbl">
    <tr>
        <td class="KampusRehberiDetayLeft">
        
            <uc2:uKampusDetayContent ID="uKAMPUSLER" runat="server"
            Title="Kampüsler" />
            
            <uc2:uKampusDetayContent ID="uYURTLAR" runat="server"
            Title="Yurtalar" />
            
            <uc2:uKampusDetayContent ID="uUNIVERSITE_KULUPLERI" runat="server"
            Title="Üniversite Kulüpleri" />
            
            <uc2:uKampusDetayContent ID="uKONFERANS_SALONLARI" runat="server"
            Title="Konferans Salonları" />     
                        
        </td>
        <td>

            <uc2:uKampusDetayContent ID="uUNV_ICI_KUTUPHANE" runat="server"
            Title="Üniversite İçi Kütüphaneler" />
            
            <uc2:uKampusDetayContent ID="uCEVRE_KUTUPHANE_ADRES" runat="server"
            Title="Çevre Kütüphane Adresleri" />

            <uc2:uKampusDetayContent ID="uUNV_ICI_FOTOKOPICI" runat="server"
            Title="Üniversite İçi Fotokopici" />
            
            <uc2:uKampusDetayContent ID="uCEVRE_FOTOKOPICI" runat="server"
            Title="Çevre Fotokopici" />            
            
            <uc2:uKampusDetayContent ID="uKANTIN" runat="server"
            Title="Kantin" />       
                        
            <uc2:uKampusDetayContent ID="uCEVRE_CAFELER" runat="server"
            Title="Çevre Kafeler" />
            
            <uc2:uKampusDetayContent ID="uCEVRE_MARKETLER" runat="server"
            Title="Çevre Marketler" />

            <uc2:uKampusDetayContent ID="uALISVERIS_MERKEZLERI" runat="server"
            Title="Alışveriş Merkezleri" />

            <uc2:uKampusDetayContent ID="uTIYATROLAR" runat="server"
            Title="Tiyatrolar" />
            
            <uc2:uKampusDetayContent ID="uCEVRE_SINEMALAR" runat="server"
            Title="Çevre Sinemalar" />

            <uc2:uKampusDetayContent ID="uCEVRE_BAR_KULUP" runat="server"
            Title="Çevre Bar ve Kulüpler" />
            
            <uc2:uKampusDetayContent ID="uCEVRE_MUZE__TARIHI_MEKANLAR" runat="server"
            Title="Çevre Müze ve Tarihi Mekanlar" />
            
            <uc2:uKampusDetayContent ID="uSPOR_SALONLARI" runat="server"
            Title="Spor Salonları" />

            <uc2:uKampusDetayContent ID="uTAKSI_DURAKLARI" runat="server"
            Title="Taksi Durakları" />               
        </td>
    </tr>
</table>