<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LuePalautetta.aspx.cs" Inherits="LuePalaute" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>
        Lue palautteet
    </title>
</head>
    <body>
        <form id="form1" runat="server">
            <div>
                <asp:GridView runat="server" ID="gvFeedback" />
                <a href="JataPalautetta.aspx">Jätä palautetta</a>
                <asp:Button runat="server" Text="Näytä palautteet XML:stä" ID="btnNaytaXML" OnClick="btnNaytaXML_Click" />
                <asp:Label ID="lblFooter" runat="server" />
            </div>
        </form>
    </body>
</html>