using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using JAMK.IT.IIO1320;

public partial class Lotto : System.Web.UI.Page
{
    List<int> rivi = new List<int>();
    JAMK.IT.IIO1320.BL_Lotto lotto = new JAMK.IT.IIO1320.BL_Lotto();

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    public void btnViking_Click(object sender, EventArgs e)
    {
        lotto.lottoTyyppi = 1;
        rivi = lotto.arvoJaTulostaRivi();
        gvRivi.DataSource = rivi;
        gvRivi.DataBind();
    }

    public void btnSuomi_Click(object sender, EventArgs e)
    {
        lotto.lottoTyyppi = 2;
        rivi = lotto.arvoJaTulostaRivi();
        gvRivi.DataSource = rivi;
        gvRivi.DataBind();
    }
}