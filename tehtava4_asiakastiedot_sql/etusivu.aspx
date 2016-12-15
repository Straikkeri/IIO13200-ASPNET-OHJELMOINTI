<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="etusivu.aspx.cs" Inherits="etusivu" %>


<asp:Content ID="ContentHeaderi" ContentPlaceHolderID="headeri" Runat="Server">
</asp:Content>

<asp:Content ID="ContentBody" ContentPlaceHolderID="body" Runat="Server">
    <h1>MySQL MasterPagea käyttäen.</h1>
    <p>Tämä on etusivu.</p>
    <a href="SQLHaettuData.aspx">Tutki SQL:stä haettua dataa.</a>
</asp:Content>
