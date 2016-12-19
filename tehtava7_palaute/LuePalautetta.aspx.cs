using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LuePalaute : System.Web.UI.Page
{
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e){}

    protected void btnNaytaXML_Click(object sender, EventArgs e)
    {
        ds = new DataSet();
        lblFooter.Text = "";
        String filePath = @"~/App_Data/kurssipalaute.xml";
        if (File.Exists(MapPath(filePath)))
        {
            ds.ReadXml(MapPath(filePath));
            gvFeedback.DataSource = ds;
            gvFeedback.DataBind();
        }
        else
        {
            lblFooter.Text = "Palautetta ei ole.";
        }
    }
}