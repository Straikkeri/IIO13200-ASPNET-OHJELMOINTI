<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SQLHaettuData.aspx.cs" Inherits="SQLHaettuData" %>

<asp:Content ID="ContentHeaderi" ContentPlaceHolderID="headeri" Runat="Server">
</asp:Content>

<asp:Content ID="ContentBody" ContentPlaceHolderID="body" Runat="Server">
    <!-- connection string web.configista -->
    <asp:SqlDataSource ID="srcAsiakkaat" runat="server" ConnectionString="<%$ ConnectionStrings:Asiakkaat %>" SelectCommand="SELECT [astunnus], [asnimi], [yhteyshlo], [postitmp] FROM [asiakas]"></asp:SqlDataSource>
    
    <h1>Tällä sivulla SQL:stä haettu data!</h1>
    <div class="w3-half">
        <div class="w3-blue">
            <p>SQL-taulun sisältö grid viewissä:</p>
        </div>
        <div class="w3-blue-grey">
            <asp:GridView ID="gvAsiakkaat1" DataSourceID="srcAsiakkaat" runat="server"></asp:GridView>
        </div>
    </div>
    <div class="w3-half">
        <div class="w3-red">
            <p>SQL-taulun sisältö esiluotua luokkaa käyttäen:</p>
        </div>
        <div class="w3-amber">
            <asp:GridView ID="gvAsiakkaat2" runat="server"></asp:GridView>
        </div>
    </div>
</asp:Content>
