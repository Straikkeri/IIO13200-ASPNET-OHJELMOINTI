using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Serialization;

public partial class LevykauppaX : System.Web.UI.Page
{

    XmlDocument xmlDoc;
    List<Levy> kaikkiLevyt = new List<Levy>();

    protected void Page_Load(object sender, EventArgs e)
    {
        xmlDoc = xdsAlbums.GetXmlDocument();
        XmlNodeList recordNodeList = xmlDoc.GetElementsByTagName("record");
        XmlNodeList trackNodeList;
        Levy tempRecord;
        Kappale tempTrack;

        foreach (XmlNode recordNode in recordNodeList)
        {
            tempRecord = new Levy();
            tempRecord.artisti = recordNode.Attributes["Artist"].InnerText;
            tempRecord.nimi = recordNode.Attributes["Title"].InnerText;
            tempRecord.ISBN = recordNode.Attributes["ISBN"].InnerText;
            tempRecord.hinta = Double.Parse(recordNode.Attributes["Price"].InnerText);
            trackNodeList = recordNode.SelectNodes("song");

            foreach (XmlNode trackNode in trackNodeList)
            {
                tempTrack = new Kappale();
                tempTrack.nimi = trackNode.Attributes["name"].InnerText;
                tempTrack.numero = trackNode.Attributes["num"].InnerText;
                tempTrack.lyriikat = trackNode.InnerText;
                tempRecord.levynKappaleet.Add(tempTrack);
            }
            kaikkiLevyt.Add(tempRecord);
        }

            lviewLevyt.DataSource = kaikkiLevyt;
            lviewLevyt.DataBind();

    }

    protected void levynTiedot(object sender, CommandEventArgs e)
    {
        try
        {
            Session["levy"] = e.CommandArgument;
            Response.Redirect("LevynTiedot.aspx");
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}