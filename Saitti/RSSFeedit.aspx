<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAP.master" AutoEventWireup="true" CodeFile="RSSFeedit.aspx.cs" Inherits="RSSFeedit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <asp:Button ID="btnGetFeeds" runat="server" 
        Text="Hae Iltasanomat" OnClick="btnGetFeeds_Click" />
<asp:Button ID="btnGetFeedsYle" runat="server" 
        Text="Hae YLE uutiset" OnClick="btnGetFeedsYle_Click" />
    <asp:XmlDataSource ID="xdsFeedit" 
        XPath="rss/channel/item"
        runat="server"></asp:XmlDataSource>
    <asp:Literal id="ltMessages" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

