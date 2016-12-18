using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Levy
{
    public string nimi { get; set; }
    public string artisti { get; set; }
    public string ISBN { get; set; }
    public double hinta { get; set; }
    public List<Kappale> levynKappaleet { get; set; }

    public Levy()
    {
        levynKappaleet = new List<Kappale>();
    }

    public override string ToString()
    {
        string levynTiedot = "";

        levynTiedot += "<h1>" + artisti + " : " + nimi + "</h1><p>" + hinta + "€</p>";

        foreach (Kappale kappale in levynKappaleet)
        {
            levynTiedot += kappale.ToString();
        }

        return levynTiedot;
    }
}