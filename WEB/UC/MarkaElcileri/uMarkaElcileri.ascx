<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uMarkaElcileri.ascx.cs" Inherits="UC_MarkaElcileri_uMarkaElcileri" %>

<div class="left-block"> <!-- LEFT BLOCK -->
    <h1 class="big">Marka Elçileri</h1>
    <p class="bllt">Hayatı Doldur Gençlik Kulübü'nü gençlere yaklaştıran, duygusal &amp; fiziksel bağı kurmalarını sağlayan,</p>
    <p class="bllt">Gençler için yaptıklarımızı yine gençlerin dilinden anlatan,</p>
    <p class="bllt">Kurum kimliğine katkı sağlayan,</p>
    <p class="bllt">Marka elçiliğini bir kariyer avantajına çevirme fırsatı yakalayan,</p>
    <p class="bllt">Hayatı Doldur Gençlik Kulübü etkinliklerinde yönetici olabilen,</p>
    <p class="bllt">Hayatı Doldur Gençlik Kulübü etkinliklerine fikirleriyle yön veren,</p>
    <p class="bllt">Kampüsünde bireysel olarak ya da kulübüyle gerçekleştirmek istediği etkinliklere destek bulan,</p>
    <p class="bllt">Etkinliklere  zaman zaman ücretsiz, zaman zaman avantajlı fiyatlarla katılabilen,</p>
    <p class="bllt">Kampüs içerisinde bulunduğu kişiler karşısında 'marka desteğini' yanında hissedebilen,</p>
    <p class="nrml">Yani, Hayatı Doldur gençlik platformunun atar damarı olan üniversite öğrencileridir.</p>
    
    <div style="padding-right: 20px;">
    
        <asp:Repeater runat="server" ID="rptList" 
        onitemdatabound="rptList_ItemDataBound">
    <ItemTemplate>
        <asp:Panel runat="server" ID="sepLocation" CssClass="content-detail" Visible="false"></asp:Panel>
        <asp:Panel runat="server" ID="sepUniversities" Visible="false"><hr /></asp:Panel>
        <table cellpadding="0" cellspacing="0" width="100%">
            <tr style="height: 20px;">
                <td>
                    <div class="brand-city"<p> 
                        <asp:Literal runat="server" ID="ltlLocationName" Text='<%#Eval("LocationName") %>'></asp:Literal>                        
                    </p></div>
                </td>
                <td>
                    <div class="brand-uni"><p> 
                        <asp:Literal runat="server" ID="ltlUniversityName" Text='<%#Eval("UniversityName") %> '></asp:Literal>
                    </p></div>
                </td>
                <td>
                    <div class="brand-id"><p> <%#Eval("FullName") %> </p></div>
                </td>
                <td>
                    <div class="brand-mail"><p> <a href='mailto:<%#Eval("Email") %>'><%#Eval("Email") %></a> </p></div>
                </td>
            </tr>
        </table>
    </ItemTemplate>
    <SeparatorTemplate> <div class="clear"></div> </SeparatorTemplate>
    </asp:Repeater>    

    </div>

</div>