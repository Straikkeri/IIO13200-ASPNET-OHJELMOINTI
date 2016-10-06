<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAP.master" AutoEventWireup="true" CodeFile="TestMySQLAP.aspx.cs" Inherits="TestMySQLAP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <asp:SqlDataSource ID ="srcMysli" runat="server"
        ConnectionString="<%$ ConnectionStrings:Mysli %>"
        ProviderName="MySql.Data.MySqlClient"
        SelectCommand="SELECT * FROM Pelaaja"
        DeleteCommand="DELETE FROM Pelaaja WHERE PelaajaID=@PelaajaID"
        UpdateCommand="UPDATE Pelaaja 
        SET Nimi=@Nimi, Seura=@Seura, Pelipaikka=@Pelipaikka, 
        Nro=@Nro, Maalit=@Maalit, Syotot=@Syotot
        WHERE (PelaajaID=@PelaajaID)">
    </asp:SqlDataSource>
    <h2>Pelaajat Liigassa</h2>
    <asp:GridView ID="gvPlayers" runat="server" DataSourceID="srcMysli" AllowSorting="True" >
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        </Columns>
    </asp:GridView>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

