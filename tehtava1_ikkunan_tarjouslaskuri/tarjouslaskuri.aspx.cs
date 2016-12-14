using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class tarjouslaskuri : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLaske_Click(object sender, EventArgs e)
    {

        try
        {
            double tarjousHinta;
            double lasinHinta = Convert.ToDouble(ConfigurationManager.AppSettings["lasinHinta"]);
            double tyonHinta = Convert.ToDouble(ConfigurationManager.AppSettings["tyonHinta"]);
            double alumiininHinta = Convert.ToDouble(ConfigurationManager.AppSettings["alumiininHinta"]);
            double korkeus = Convert.ToDouble(txtIkkunanKorkeus.Text) / 1000;
            double leveys = Convert.ToDouble(txtIkkunanLeveys.Text) / 1000;
            double piiri = korkeus * 2 + leveys * 2;

            //Hinta(ilman alvia) = (1 + kate %) x((IkkunanPintaAla x LasinNeliohinta) + (KarminPiiri x AlumiiniKarminJuoksumetriHinta) +(Työmenekki))

            //Käytetään tehtävässä seuraavia parametrejä:
            //kate % = 30 % LasinNelioHinta = 45€/ m2  AlumiiniKarminJuoksumetriHinta = 100€/ jm  Työmenekki = 150€/ ikkuna

            tarjousHinta = 1.3 * (((korkeus * leveys) * lasinHinta) + (piiri * alumiininHinta)) + tyonHinta;

            lblAlueTulos.Text = (korkeus * leveys).ToString() + " m^2";
            lblRaaminPiiriTulos.Text = piiri.ToString() + " m";
            lblTarjousTulos.Text = tarjousHinta.ToString() + " €";
        }
        catch (Exception ex)
        {

            throw ex;
        }

    }
}