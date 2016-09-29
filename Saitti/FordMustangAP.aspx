<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAP.master"
     AutoEventWireup="true" CodeFile="FordMustangAP.aspx.cs" Inherits="FordMustangAP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Ford Mustang</title>
    <!-- tällä tyyli asetuksella saan kuvan koon automaattisesti oikean kokoiseksi -->
    <style>
        img {
            width:100%;
            height:auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <div class="w3-container w3-blue">
    <h1>Demo responsiivinen sivu</h1>
        <p>The ford Mustang - the beauty of America</p>
    </div>
    <div class="w3-row-padding">
        <div class="w3-third w3-light-blue">
            <h2>General</h2>
            <p>The Ford Mustang is an American automobile manufactured by Ford. It was originally based on the platform of the second generation North American Ford Falcon, a compact car. The original 1962 Ford Mustang I two-seater concept car had evolved into the 1963 Mustang II four-seater concept car which Ford used to pretest how the public would take interest in the first production Mustang. The 1963 Mustang II concept car was designed with a variation of the production model's front and rear ends with a roof that was 2.7 inches shorter. Introduced early on April 17, 1964, and thus dubbed as a "1964½" by Mustang fans, the 1965 Mustang was the automaker's most successful launch since the Model A. The Mustang has undergone several transformations to its current sixth generation.</p>
        </div>
        <div class="w3-third w3-light-green">
            <h2>Followers</h2>
            <p>The Mustang created the "pony car" class of American automobiles, affordable sporty coupes with long hoods and short rear decks and gave rise to competitors such as the Chevrolet Camaro, Pontiac Firebird, AMC Javelin, Chrysler's revamped Plymouth Barracuda, and the first generation Dodge Challenger. The Mustang is also credited for inspiring the designs of coupés such as the Toyota Celica and Ford Capri, which were imported to the United States.</p>
        </div>
        <div class="w3-third">
            <img src="http://www.allfordmustangs.com/wordpress/wp-content/uploads/2016/08/16mustanggt-blackpackage_01_hr-2-1500x1000.jpg" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" Runat="Server">
    <a href="http://www.ford.com/cars/mustang/">Mustang USA</a>
</asp:Content>

