using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Kappale
/// </summary>
public class Kappale
{
    public string numero { get; set; }
    public string nimi { get; set; }
    public string lyriikat { get; set; }

    public Kappale() {
    }

    public override string ToString()
    {
        return "<h3>" + numero + ". " + nimi + "</h3><p>" + lyriikat + "</p>";
    }
}