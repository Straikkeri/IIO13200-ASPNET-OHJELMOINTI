<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAP.master" AutoEventWireup="true" CodeFile="StuffAP.aspx.cs" Inherits="StuffAP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Oppilaat %>" 
        DeleteCommand="DELETE FROM [testi] WHERE [id] = @id" 
        InsertCommand="INSERT INTO [testi] ([name], [description]) VALUES (@name, @description)" 
        SelectCommand="SELECT [id], [name], [description] FROM [testi]" 
        UpdateCommand="UPDATE [testi] SET [name] = @name, [description] = @description WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="description" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <h1 class="w3-container w3-indigo">Stuffia maailmalta muokattavaksi</h1>
    <div class="w3-row">
        <!-- vasemman puoleissa esitetään kaikki stuffit -->
        <div class="w3-container w3-half">
            <asp:GridView ID="gvStuff" runat="server" 
                DataSourceID="SqlDataSource1" AutoGenerateColumns="False" 
                OnSelectedIndexChanged="gvStuff_SelectedIndexChanged">
                <Columns>
                    <asp:ButtonField DataTextField="id" HeaderText="ID" Text="Button" CommandName="Select"/>
                    <asp:BoundField DataField="name" HeaderText="Nimi" />
                    <asp:BoundField DataField="description" HeaderText="kuvaus" />
                </Columns>
            </asp:GridView>
        </div>
        <!-- oikean puoleissa valitu stuffin muokkaus DetailsView-kontrollissa-->
        <div class="w3-container w3-half">
            <h2 class="w3-container w3-blue">Voit muokata: <asp:Label ID="myStuff" runat="server" /> </h2>
            <asp:DetailsView ID="dvStuff" runat="server" DataSourceID="SqlDataSource1">
                <Fields>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

