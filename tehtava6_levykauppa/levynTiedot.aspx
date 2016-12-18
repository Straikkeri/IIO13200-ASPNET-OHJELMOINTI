<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LevynTiedot.aspx.cs" Inherits="Levytarkastelu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Literal ID="literalLevy" runat="server" />
        <asp:ListView ID="lviewKappaleLista" runat="server">
            <ItemTemplate>
                <p><%# Eval("numero") %>. <%# Eval("nimi") %></p>
                <p>Lyriikat: <br /><%# Eval("lyriikat") %></p>
            </ItemTemplate>
        </asp:ListView>
        <asp:Literal ID="ltFooter" runat="server" />
    </div>
    </form>
</body>
</html>

