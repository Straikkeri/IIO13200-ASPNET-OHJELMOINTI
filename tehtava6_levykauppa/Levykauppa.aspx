<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Levykauppa.aspx.cs" Inherits="LevykauppaX" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Tehtava 6. Levykauppa XML</title>
    <link href="http://www.w3schools.com/lib/w3.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:XmlDataSource ID="xdsAlbums" DataFile="~/App_Data/LevykauppaX.xml" XPath="//record" runat="server"/>

    <div>
        <asp:ListView ID="lviewLevyt" runat="server">
            <ItemTemplate>
                <div>
                    <div>
                        <img src='levykuvat/<%# Eval("ISBN") %>.jpg' alt="<%# Eval("ISBN") %>" />
                    </div>
                    <div style="position:center;">
                        <h3><%# Eval("Artisti") %> : <%# Eval("Nimi") %></h3>
                        <p>
                            <b>ISBN:</b>
                            <asp:LinkButton runat="server" Text='<%# Eval("ISBN") %>'  OnCommand="levynTiedot" CommandArgument="<%# (Levy)Container.DataItem %>" /> <br />
                            <b>Hinta:</b><%# Eval("Hinta") %>
                        </p>
                    </div>
                </div>
            </ItemTemplate>
        </asp:ListView>
    </div>
    <div>
        <asp:Literal ID="ltFooter" runat="server" />
    </div>
    </form>
</body>
</html>