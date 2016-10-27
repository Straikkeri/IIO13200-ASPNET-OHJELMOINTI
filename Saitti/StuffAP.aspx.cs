using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StuffAP : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void gvStuff_SelectedIndexChanged(object sender, EventArgs e)
    {
        //valitun rivin tiedot näkyviin h2:een
        int i = gvStuff.SelectedIndex;
        string nimi = gvStuff.Rows[i].Cells[1].Text;
        string kuvaus = gvStuff.Rows[i].Cells[2].Text;
        myStuff.Text = string.Format("{0} {1}", nimi, kuvaus);
        //vaihdetaan dv:n tietue
        dvStuff.PageIndex = i;
    }
}