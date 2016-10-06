using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using JAMK.IT;
using Newtonsoft.Json;

public partial class TestJsonAP : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnGet_Click(object sender, EventArgs e)
    {
        //haetaan JSon ja näytetään se sellaisenaan 
        var dataa = GetJsonFromWeb("JsonTest");
        ltResult.Text = dataa;
    }
    protected string GetJsonFromWeb(string filename)
    {
        string url = "http://student.labranet.jamk.fi/~salesa/mat/" + filename;
        using (WebClient wc = new WebClient())
        {
            var json = wc.DownloadString(url);
            return json;
        }
    }
    protected Person ConvertJsonToPerson(string json)
    {
        Person p = JsonConvert.DeserializeObject<Person>(json);
        return p;
    }
    protected List<Politic> ConvertJsonToPolitics(string json)
    {
        List<Politic> poliitikot = JsonConvert.DeserializeObject<List<Politic>>(json);
        return poliitikot;
    }
    protected void btnGetPerson_Click(object sender, EventArgs e)
    {
        //Person p = new Person();
        //p.Name = "Esa";
        string dataa = GetJsonFromWeb("JsonTestP");
        Person p = ConvertJsonToPerson(dataa);
        ltResult.Text = string.Format
            ("Löytyi persoona {0} synt.aika {1}", p.Name, p.Birthday);
    }

    protected void btnGetPolitics_Click(object sender, EventArgs e)
    {
        //haetaan json-teksti ja muutetaan se kokoelmaksi Politic-olioita
        string dataa = GetJsonFromWeb("JsonTest");
        List<Politic> hallitus = ConvertJsonToPolitics(dataa);
        string msg = "<h2>Suomen hallitus vankka 2016 </h2><ul>";
        foreach (var ministeri in hallitus)
        {
            msg += "<li>" + ministeri.Name + " " + ministeri.Party + "</li>";
        }
        msg += "</ul>";
        ltResult.Text = msg;
    }
}