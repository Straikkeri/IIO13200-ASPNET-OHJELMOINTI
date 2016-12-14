<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Lotto.aspx.cs" Inherits="Lotto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Valitse lotto</h1>
            <asp:Button ID="btnViking" runat="server" Text="Viking Lotto" OnClick="btnViking_Click" /><br />
            <asp:Button ID="btnSuomi" runat="server" Text="Suomi Lotto" OnClick="btnSuomi_Click" />
            <p>Arvottu rivi:</p>
            <asp:GridView ShowHeader="false" runat="server" ID="gvRivi"></asp:GridView>
            <asp:Label runat="server" ID="lblFooter"></asp:Label>
        </div>
    </form>
</body>
</html>
