<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uKampusRehberi.ascx.cs" Inherits="UC_KampusRehberi_uKampusRehberi" %>

<%@ Register src="~/UC/KampusRehberi/uUniversityItem.ascx" tagname="uUniversityItem" tagprefix="uc1" %>

<div class="clear"></div>

<asp:Repeater runat="server" ID="rpt">
<ItemTemplate>
    <uc1:uUniversityItem ID="uUniversityItem11" runat="server"
        OrientationUniversityID='<%#Eval("OrientationUniversityID") %>'
        University='<%#Eval("UniversityName") %>'
        Address='<%#Eval("Address") %>'
        Web='<%#Eval("Web") %>'
     />
</ItemTemplate>
</asp:Repeater>