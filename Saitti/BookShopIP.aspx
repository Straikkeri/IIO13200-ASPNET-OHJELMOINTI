<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageIP.master" AutoEventWireup="true" CodeFile="BookShopIP.aspx.cs" Inherits="BookShopIP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <h1>Esan KirjakauppaX</h1>
    <div class="w3-row">
        <!-- vasen lohko: asiakkaat -->
        <div class="w3-container w3-third">
            <asp:Button ID="btnGetCustomers" runat="server"
                Text="Hae asiakkaat"
                CssClass="w3-btn" OnClick="btnGetCustomers_Click" />

            <asp:GridView ID="gvCustomers" runat="server" />
        </div>
        <!-- keski lohko: asiakas CRUD -->
        <div class="w3-container w3-third">
            <h2>Asiakkaan lisäys, muokkaus, poisto</h2>
            <asp:DropDownList ID="ddlCustomers" runat="server"
                OnSelectedIndexChanged="ddlCustomers_SelectedIndexChanged"
                AutoPostBack="True" />
            <p>etunimi:
                <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox></p>
            <p>sukunimi:
                <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox></p>
            <asp:Button ID="btnCreateCustomer" runat="server" Text="Luo uusi" CssClass="w3-btn" OnClick="btnCreateCustomer_Click" />
            <asp:Button ID="btnSaveCustomer" runat="server" Text="Tallenna" CssClass="w3-btn" OnClick="btnSaveCustomer_Click"/>
            <asp:Button ID="btnDeleteCustomer" runat="server" Text="Poista" CssClass="w3-btn" />
        </div>
        <!-- oikea lohko: kirjat -->
        <div class="w3-container w3-third">
            <asp:Button ID="btnGetBooks" runat="server"
                Text="Hae kirjat"
                CssClass="w3-btn w3-blue" OnClick="btnGetBooks_Click" />
            <asp:GridView ID="gvBooks" runat="server" />
        </div>
    </div>
    <div class="w3-row">
        <asp:Literal ID="ltResult" runat="server" />
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
    <asp:Label ID="lblMessages" runat="server" />
</asp:Content>

