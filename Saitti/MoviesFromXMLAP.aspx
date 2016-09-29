<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAP.master" AutoEventWireup="true" CodeFile="MoviesFromXMLAP.aspx.cs" Inherits="MoviesFromXMLAP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>XML Movies</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <!-- XMLDatasource määrittely -->
    <asp:XmlDataSource ID="srcMovies" runat="server" 
        DataFile="~/App_Data/Movies.xml" 
        XPath="//Movie"></asp:XmlDataSource>
    <!-- näytetään Movie-data GV-kontrollissa -->
    <div>
        <h2 class="w3-container w3-indigo">Elokuvat XML-tiedostosta</h2>
        <asp:GridView ID="gvMovies" DataSourceID="srcMovies" runat="server"></asp:GridView>
    </div>
    <!-- näytetään Movie-data HTML:ssä Repeater-kontrollilla -->
    <h2 class="w3-container w3-indigo">Elokuvat XML-tiedostosta HTML-taulussa</h2>
    <asp:Repeater ID="Repeater1" DataSourceID="srcMovies" runat="server">
        <HeaderTemplate>
            <table border="1" style="width:50%">
            <tr>
                <td>Nimi</td>
                <td>Ohjaaja</td>
            </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td><%# Eval("Name") %></td>
                <td><%# Eval("Director") %></td>
            </tr>
<!--             <p><%# Eval("Name") %> by <%# Eval("Director") %> </p> -->
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

