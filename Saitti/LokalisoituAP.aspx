<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAP.master" AutoEventWireup="true" CodeFile="LokalisoituAP.aspx.cs" Inherits="LokalisoituAP" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <h1>Lokalisointi testi (staattinen h1 teksti)</h1>
    <h2><asp:Literal runat="server" Text="<%$ Resources:Tervehdys %>" /> </h2>
    <asp:Image runat="server" ImageUrl="<%$ Resources:Lippu %>" Width="100" />
    <br />
    <asp:Button id="btnHello" runat="server" Text="Button"
         meta:resourcekey="btnHello" OnClick="btnHello_Click" />
    <br />
    <asp:Label ID="lblMessage" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

