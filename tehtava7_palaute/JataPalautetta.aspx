<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JataPalautetta.aspx.cs" Inherits="JataPalautetta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
        <form id="form1" runat="server">
            <h1>Opintojakson palaute</h1>
            <table>                  
                    <tr>
                        <td><asp:Label runat="server" Text="Pvm:" /></td>           
                        <td><asp:TextBox runat="server" ID="txtPvm"  Width="240px" /></td>
                        <td><asp:RequiredFieldValidator ID="txtDateValidator" runat="server" ControlToValidate="txtPvm" ErrorMessage="Vaadittu kenttä!" /></td>
                    </tr>
                    <tr>
                        <td><asp:Label runat="server" Text="Nimi:" /></td> 
                        <td><asp:TextBox runat="server"  ID="txtNimi" Width="240px" Height="23px" /></td> 
                        <td><asp:RequiredFieldValidator ID="txtNameValidator" runat="server" ControlToValidate="txtNimi" ErrorMessage="Vaadittu kenttä!" /></td> 
                    </tr>
                    <tr>
                        <td><asp:Label runat="server" Text="Opintojakson nimi:" /></td> 
                        <td><asp:TextBox runat="server" ID="txtKurssinNimi" Width="240px" Height="16px" /></td> 
                        <td><asp:RequiredFieldValidator ID="txtCourseNameValidator" runat="server" ControlToValidate="txtKurssinNimi" ErrorMessage="Vaadittu kenttä!" /></td> 
                    </tr>
                    <tr>
                        <td><asp:Label runat="server" Text="Kurssin koodi:" /></td> 
                        <td><asp:TextBox runat="server" ID="txtKurssinKoodi" Width="240px" Height="16px" /></td> 
                        <td><asp:RequiredFieldValidator ID="txtCourseCodeValidator" runat="server" ControlToValidate="txtKurssinKoodi" ErrorMessage="Vaadittu kenttä!" /></td> 
                    </tr>
                    <tr>

                        <td><asp:Label runat="server" Text="Olen oppinut:" /></td> 
                        <td><asp:TextBox runat="server" ID="txtOpittua" Width="240px" Height="48px" /></td> 
                        <td><asp:RequiredFieldValidator ID="txtLearnedValidator" runat="server" ControlToValidate="txtOpittua" ErrorMessage="Vaadittu kenttä!" /></td> 
                    </tr>
                    <tr>
                        <td><asp:Label runat="server" Text="Haluan oppia:" /></td> 
                        <td><asp:TextBox runat="server" ID="txtHaluanOppia" Width="240px" Height="50px" /></td> 
                        <td><asp:RequiredFieldValidator ID="txtToLearnValidator" runat="server" ControlToValidate="txtHaluanOppia" ErrorMessage="Vaadittu kenttä!" /></td> 
                    </tr>
                    <tr>
                        <td><asp:Label runat="server" Text="Positiivista:" /></td> 
                        <td><asp:TextBox runat="server" ID="txtPositiiviset" Width="240px" Height="57px" /></td> 
                        <td><asp:RequiredFieldValidator ID="txtGoodsValidator" runat="server" ControlToValidate="txtPositiiviset" ErrorMessage="Vaadittu kenttä!" /></td> 
                    </tr>
                     <tr>
                        <td><asp:Label runat="server" Text="Huonoa:" /></td> 
                        <td><asp:TextBox runat="server" ID="txtNegatiiviset" Width="240px" Height="58px" /></td> 
                        <td><asp:RequiredFieldValidator ID="txtFaultsValidator" runat="server" ControlToValidate="txtNegatiiviset" ErrorMessage="Vaadittu kenttä!" /></td> 
                    </tr>
                    <tr>
                        <td><asp:Label runat="server" Text="Muuta:" /></td> 
                        <td><asp:TextBox runat="server" ID="txtMuuta" Width="240px" Height="64px" /></td> 
                    </tr>

                    <asp:Button runat="server" ID="btnTallennaXML" Text="Tallenna XML-tiedostoon" OnClick="btnTallennaXML_Click" />                             

            </table>                
        </form>
        <div>
            <a href="LuePalautetta.aspx">Lue palautteita</a> 
            <asp:Label runat="server" ID="lblFooter" />
        </div> 
    </body>
</html>
