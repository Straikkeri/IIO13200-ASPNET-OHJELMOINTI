<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAP.master" AutoEventWireup="true" CodeFile="BookShopAP.aspx.cs" Inherits="BookShopAP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <h1 style="w3-container">Esan KirjakaupanX kirjat</h1>
    <div class="h3-row">
        <!-- vasen lohko: asiakkaat -->
        <div class="w3-container w3-third">
            <asp:Button ID="btnGetCustomers" runat="server"
                Text="Hae Asiakkaat" OnClick="btnGetCustomers_Click" />
            <h2 style="w3-container w3-blue">KirjakaupanX asiakkaat</h2>
            <asp:GridView ID="gvCustomers" runat="server" />

        </div>
        <!-- keskimmäinen lohko: asiakas CRUD -->
        <div class="w3-container w3-third w3-light-gray">
            <h3>Asiakkaan luonti ja muokkaus</h3>
            <asp:DropDownList ID="ddlCustomers" runat="server"
                AutoPostBack="True" OnSelectedIndexChanged="ddlCustomers_SelectedIndexChanged">
            </asp:DropDownList>
            <p>
                etunimi:
                <asp:TextBox ID="txtFirstname" runat="server" Text="..."></asp:TextBox>
            </p>
            <p>
                sukunimi:
                <asp:TextBox ID="txtLastname" runat="server" Text="..."></asp:TextBox>
            </p>
            <asp:Button ID="btnCreateCustomer" runat="server" Text="Luo uusi" CssClass="w3-btn" OnClick="btnCreateCustomer_Click" />
            <asp:Button ID="btnSaveCustomer" runat="server" Text="Tallenna" CssClass="w3-btn" OnClick="btnSaveCustomer_Click" />
            <asp:Button ID="btnDeleteCustomer" runat="server" Text="Poista" CssClass="w3-btn" OnClick="btnDeleteCustomer_Click" />

        </div>
        <!-- oikealla: kirjat-->
        <div class="w3-container w3-third">
            <asp:Button ID="btnGetBooks" runat="server"
                Text="Hae Kirjat" OnClick="btnGetBooks_Click" />
            <asp:GridView ID="gvBooks" runat="server" />
        </div>
    </div>
    <div class="w3-row">
        <h3>asiakkaan tilaukset</h3>
        <asp:DropDownList ID="ddlOrders" runat="server" AutoPostBack="true" />
        <!-- ilmoitukset käyttäjälle -->
        <h2>
            <asp:Label ID="lblMessages" runat="server" /></h2>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
</asp:Content>

