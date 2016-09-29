<%@ Page Language="C#" AutoEventWireup="true" CodeFile="IndexAP.aspx.cs" Inherits="Index"
    MasterPageFile="~/MasterPageAP.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>IIO13200 .NET Ohjelmointi</title>
    <link href="CSS/demo.css" rel="stylesheet" type="text/css" />
</asp:Content>

 <asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">  
        <div>
            <h1>IIO13200. NET Ohjelmointi</h1>
            <h2>1.kontaktikerta</h2>
            <p>Lorum ipsum ja niinpoispäin...</p>
            <h3>Perus HTML kontrolleja</h3>
            <a href="TestiAamu.html">Testi html-sivu (aamu)</a>
            <p>
                Esimerkki ASP.NET DataKontrollista
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/ShowPhotos.aspx">Show Photos</asp:HyperLink>
            </p>
            <p>
                Esimerkki kuinka koodissa rakennetaan HTML:ää
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/ShowCustomers.aspx">Show WineCustomers</asp:HyperLink>
            </p>
            <h2>To 22.9.2016</h2>
            <h3>
                Tiedon välitys sivulta toiselle:</h3>
            <p>
              <asp:HyperLink ID="HyperLink3" runat="server" 
                  NavigateUrl="~/Source.aspx">Tiedon välitys 6 tapaa</asp:HyperLink>
            </p>
            <h2>To 29.2016</h2>
            <a href="FordMustangAP.aspx">Demo responsiivinen webbi-sivu</a>
            <a href="MoviesFromXMLAP.aspx">Muuvit XML</a>
        </div>

     </asp:Content>

