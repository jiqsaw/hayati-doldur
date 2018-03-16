<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EncDec.aspx.cs" Inherits="_private_EncDec" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Encyription - Decyription</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="TextBox1" runat="server" Width="248px"></asp:TextBox>
        <br /><br />
        <asp:Button ID="btnEnc" runat="server" Text="Encryipt" OnClick="btnEnc_Click" />
        <asp:Button ID="btnDec" runat="server" Text="Decryipt" OnClick="btnDec_Click" />
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label></div>
    </form>
</body>
</html>
