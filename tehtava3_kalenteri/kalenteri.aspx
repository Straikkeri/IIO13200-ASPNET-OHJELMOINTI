<%@ Page Language="C#" AutoEventWireup="true" CodeFile="kalenteri.aspx.cs" Inherits="kalenteri" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label runat="server" ID="lblValitsePvm" Text="Valitse haluamasi päivä: " />
            <asp:Label runat="server" ID="lblValittuPvm" Text="" /><br />
            <asp:Label runat="server" Text="Valitun päivän ja tämän päivän erotus: " />
            <asp:Label runat="server" ID="lblErotus" /><br />
            <asp:Button runat="server" ID="btnTaakse" Text="<vuosi" OnClick="btnTaakse_Click" />
            <asp:Button runat="server" ID="btnEteen" Text="vuosi>" OnClick="btnEteen_Click" />
            <asp:Calendar runat="server" ID="kalenteri1" OnSelectionChanged="kalenteri1_SelectionChanged"/>
        </div>
    </form>
</body>
</html>
