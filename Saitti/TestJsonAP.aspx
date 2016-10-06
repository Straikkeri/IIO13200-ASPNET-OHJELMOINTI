<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAP.master" AutoEventWireup="true" CodeFile="TestJsonAP.aspx.cs" Inherits="TestJsonAP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <asp:Button ID="btnGet" Text="Hae Json teksti" runat="server" onclick="btnGet_Click"/>
    <asp:Button ID="btnGetPerson" Text="Hae Json ja muuta olioksi" runat="server" onclick="btnGetPerson_Click"  />
    <asp:Button ID="btnGetPolitics" Text="Hae hallitus" runat="server" OnClick="btnGetPolitics_Click" />
    <h2>Tulokset</h2>
    <asp:Literal ID="ltResult" Text="..." runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

