using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Linq;

public partial class JataPalautetta : System.Web.UI.Page
{
    string nimi;
    string pvm;
    string muuta;
    string opittua;
    string haluanOppia;
    string kurssinNimi;
    string kurssinKoodi;
    string positiiviset;
    string negatiiviset;

    protected void Page_Load(object sender, EventArgs e) { }

    protected void btnTallennaXML_Click(object sender, EventArgs e)
    {
        Initialisoi();

        String polku = HttpContext.Current.Server.MapPath("~/App_Data/kurssipalaute.xml");

        if (!File.Exists(polku))
        {
            luoXMLFilu(polku);
            kirjoitaXML(polku);
        }
        else
        {
            kirjoitaXML(polku);
        }
    }

    protected void Initialisoi()
    {
        kurssinKoodi = txtKurssinKoodi.Text;
        kurssinNimi = txtKurssinNimi.Text;
        nimi = txtNimi.Text;
        muuta = txtMuuta.Text;
        negatiiviset = txtNegatiiviset.Text;
        positiiviset = txtPositiiviset.Text;
        haluanOppia = txtHaluanOppia.Text;
        opittua = txtOpittua.Text;
        pvm = txtPvm.Text;
    }

    protected void kirjoitaXML(string FilePath)
    {
        XDocument doc = XDocument.Load(FilePath);
        XElement xeKurssiPalaute = doc.Element("kurssipalaute");    //ylin elementti
        XElement xePalaute = new XElement("Palaute");               //yksittäinen palaute
        XElement xeKurssinKoodi = new XElement("KurssinKoodi");     //palautteen elementit...
        XElement xeKurssinNimi = new XElement("KurssinNimi");
        XElement xeNimi = new XElement("PalautteenAntaja");
        XElement xePvm = new XElement("Pvm");
        XElement xeHaluanOppia = new XElement("HaluanOppia");
        XElement xeOpittua = new XElement("Opittua");
        XElement xeMuuta = new XElement("Muuta");

        xeKurssinKoodi.Value = kurssinKoodi;
        xeKurssinNimi.Value = kurssinNimi;
        xeNimi.Value = nimi;
        xePvm.Value = pvm;
        xeHaluanOppia.Value = haluanOppia;
        xeOpittua.Value = opittua;
        xeMuuta.Value = muuta;

        xePalaute.Add(xeKurssinKoodi, xeKurssinNimi, xeNimi, xePvm, xeHaluanOppia, xeOpittua, xeMuuta);
        xeKurssiPalaute.Add(xePalaute);

        doc.Save(FilePath);
    }

    protected void luoXMLFilu(string FilePath)
    {
        XmlWriterSettings xmlWriterSettings = new XmlWriterSettings();
        xmlWriterSettings.Indent = true;
        xmlWriterSettings.NewLineOnAttributes = true;
        using (XmlWriter xmlWriter = XmlWriter.Create(FilePath, xmlWriterSettings))
        {
            xmlWriter.WriteStartDocument();
            xmlWriter.WriteStartElement("kurssipalaute");
            xmlWriter.WriteEndElement();
            xmlWriter.WriteEndDocument();
            xmlWriter.Flush();
            xmlWriter.Close();
        }
    }
}