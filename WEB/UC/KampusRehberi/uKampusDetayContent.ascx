<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uKampusDetayContent.ascx.cs" Inherits="UC_KampusRehberi_uKampusDetayContent" %>

<br />

<table cellpadding="0" cellspacing="0" class="KampusRehberiDetayContentTable">
    <tr>        
        <td style="width: 10px"></td>
        <td class="KampusRehberiDetayTitle">            
            
            <asp:Literal runat="server" ID="ltlTitle"></asp:Literal>
            
        </td>
        <td class="KampusRehberiDetayContent">
        
            <asp:Repeater runat="server" ID="rptValues">         
                <ItemTemplate>
                
                    <span><%#Eval("OrientationParameterValue")%></span>
                    <p><%#LIB.Util.Nl2Br(LIB.Util.Url2Link(Eval("OrientationParameterDesc").ToString())) %></p>
                    
                </ItemTemplate>
                <SeparatorTemplate>
                    <div class="clear"></div><br />                
                </SeparatorTemplate>
            </asp:Repeater>                        
            
        </td>
    </tr>
</table>