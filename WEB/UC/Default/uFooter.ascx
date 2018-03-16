<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uFooter.ascx.cs" Inherits="UC_Default_uFooter" %>
<div class="footer">
    <div class="footer-container">
        <div class="footer-left">
                <ul class="footer-events">
                    <li class="footer-header">Etkinlikler</li>
                    <li><asp:HyperLink runat="server" ID="hlFootNavSpor" NavigateUrl="~/Activities.aspx?c=2">Spor</asp:HyperLink></li>
                    
                    <li class="bullet">-</li>
                    
                    <li><asp:HyperLink runat="server" ID="hlFootNavKariyer" NavigateUrl="~/Activities.aspx?c=3">Kariyer</asp:HyperLink></li>
                    
                    <li class="bullet">-</li>
                    
                    <li><asp:HyperLink runat="server" ID="hlFootNavEglence" NavigateUrl="~/Activities.aspx?c=4">Eğlence</asp:HyperLink></li>
                    
                    <li class="bullet">-</li>
                    
                    <li><asp:HyperLink runat="server" ID="hlFootNavMuzik" NavigateUrl="~/Activities.aspx?c=5">Müzik</asp:HyperLink></li>
                    
                    <li class="bullet">-</li>
                    
                    <li><asp:HyperLink runat="server" ID="hlFootNavKulturSanat" NavigateUrl="~/Activities.aspx?c=6">Kültür-Sanat</asp:HyperLink></li>
                    
                    <li class="bullet">-</li>
                    
                    <li><asp:HyperLink runat="server" ID="hlFootNavFestival" NavigateUrl="~/Activities.aspx?c=7">Festival</asp:HyperLink></li>
                </ul>
                
                <div class="clear"></div>
                
                <ul class="footer-share">
                    <li class="footer-header">Paylaşın</li>
                    <li><a href="javascript:Share('twitter')" title="Twitter">Twitter</a></li>
                    
                    <li class="bullet">-</li>
                    
                    <li><a href="javascript:Share('facebook')" title="Facebook">Facebook</a></li>
                    
                    <li class="bullet">-</li>
                    
                    <li><a href="javascript:Share('friendfeed')" title="Friendfeed">Friendfeed</a></li>
                    
                    <li class="bullet">-</li>
                    
                    <li><a href="javascript:Share('delicious')" title="Delicious">Delicious</a></li>
                    
                    <li class="bullet">-</li>
                    
                    <li><a href="javascript:Share('stumbleupon')" title="StumbleUpon">StumbleUpon</a></li>
                    
                    <li class="bullet">-</li>
                    
                    <li><a href="#" title="E-posta">E-posta</a></li>
                </ul>
                
                <div class="clear"></div>
            </div>
        <div class="footer-right">
            	<div class="copyright">Copyright &copy; 2009 Hayatı Doldur - Tüm hakları saklıdır</div>
                <ul class="statement">
                    <li><asp:HyperLink runat="server" ID="hlFootHayatiDoldur" NavigateUrl="~/" Text="Hayatı Doldur">Ana Sayfa</asp:HyperLink></li>
                    
                    <li class="bullet">-</li>
                    
                    <li><asp:HyperLink runat="server" ID="hlYasalUyari" NavigateUrl="~/Disclaimer.aspx" Text="Hayatı Doldur">Yasal Uyarı</asp:HyperLink></li>

                    <li class="bullet">-</li>                   
                    
                    <li><asp:HyperLink runat="server" ID="hlTribununSesi" NavigateUrl="~/TribununSesi.aspx" Text="Tribün sesini arıyor">Tribünün Sesi</asp:HyperLink></li>
                    
                    <li class="bullet">-</li>                   
                    
                    <li><asp:HyperLink runat="server" ID="hlKampusRehberi" NavigateUrl="~/KampusRehberi.aspx" Text="Kampüs Rehberi">Kampüs Rehberi</asp:HyperLink></li>
                                                            
                    <li class="bullet">-</li>                   
                    
                    <li><asp:HyperLink runat="server" ID="hlMarkaElcileri" NavigateUrl="~/MarkaElcileri.aspx" Text="Marka Elçileri">Marka Elçileri</asp:HyperLink></li>
                    
                    <li class="bullet">-</li>                   
                    
                    <li><asp:HyperLink runat="server" ID="hlContact" NavigateUrl="~/Contact.aspx" Text="Hayatı Doldur'la iletişime geçin">İletişim</asp:HyperLink></li>
                </ul>
            </div>
        <div class="clear"></div>
    </div>
</div>