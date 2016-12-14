using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class kalenteri : System.Web.UI.Page
{
    DateTime valittuPvm;
    DateTime nykyinenPvm;

    protected void Page_Load(object sender, EventArgs e)
    {
        nykyinenPvm = kalenteri1.TodaysDate;
        lblValittuPvm.Text = "valittu: " + valittuPvm.Day + "." + valittuPvm.Month + "." + valittuPvm.Year + " vuosi: " + valittuPvm.Year;
    }

    protected void btnTaakse_Click(object sender, EventArgs e)
    {
        if (kalenteri1.VisibleDate == DateTime.MinValue)
        {
            kalenteri1.VisibleDate = DateTime.Now;
        }
        kalenteri1.VisibleDate = kalenteri1.VisibleDate.AddYears(-1);
    }

    protected void btnEteen_Click(object sender, EventArgs e)
    {
        if (kalenteri1.VisibleDate == DateTime.MinValue)
        {
            kalenteri1.VisibleDate = DateTime.Now;
        }

        kalenteri1.VisibleDate = kalenteri1.VisibleDate.AddYears(1);
    }

    protected void kalenteri1_SelectionChanged(object sender, EventArgs e)
    {
        valittuPvm = kalenteri1.SelectedDate;
        lblValittuPvm.Text = "valittu: " + valittuPvm.Day + "." + valittuPvm.Month + "." + valittuPvm.Year + " vuosi: " + valittuPvm.Year;
        lblErotus.Text = (nykyinenPvm - valittuPvm).TotalDays.ToString();
    }


}