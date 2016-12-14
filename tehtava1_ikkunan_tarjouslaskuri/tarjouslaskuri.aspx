<%@ Page Language="C#" AutoEventWireup="true" CodeFile="tarjouslaskuri.aspx.cs" Inherits="tarjouslaskuri" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                    <tr>
                        <td><asp:Label ID="lblIkkunanLeveys" runat="server" Text="Leveys:"></asp:Label></td>
                        <td><asp:TextBox ID="txtIkkunanLeveys" runat="server" Text="1200"></asp:TextBox></td>
                        <td>mm</td>
                    </tr>
                    <tr>
                        <td><asp:Label ID="lblIkkunanKorkeus" runat="server" Text="Korkeus:"></asp:Label></td>
                        <td><asp:TextBox ID="txtIkkunanKorkeus" runat="server" Text="900"></asp:TextBox></td>
                        <td>mm</td>
                    </tr>
                    <tr>
                        <td><asp:Label ID="lblRaaminLeveys" runat="server" Text="Karmipuun leveys:"></asp:Label></td>
                        <td><asp:TextBox ID="txtRaaminKorkeus" runat="server" Text="45"></asp:TextBox></td>
                        <td>mm</td>
                    </tr>
                </table>
            <asp:Button ID="btnLaske" Text="Laske tarjoushinta" runat="server" OnClick="btnLaske_Click"/>
        </div>
    </form>
    <div>
        <asp:Label ID="lblAlue" runat="server" Text="Ikkunan pinta-ala"></asp:Label>
        <asp:Label ID="lblAlueTulos" runat="server"></asp:Label><br />
        <asp:Label ID="lblRaaminPiiri" runat="server" Text="Karmin piiri"></asp:Label>
        <asp:Label ID="lblRaaminPiiriTulos" runat="server"></asp:Label><br />
        <asp:Label ID="lblTarjous" runat="server" Text="Tarjoushinta (ilman ALV)"></asp:Label>
        <asp:Label ID="lblTarjousTulos" runat="server"></asp:Label>
    </div>
</body>
</html>
