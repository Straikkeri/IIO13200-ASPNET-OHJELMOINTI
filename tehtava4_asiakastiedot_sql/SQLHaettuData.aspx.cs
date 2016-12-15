using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using JAMK.IT;


public partial class SQLHaettuData : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        try
        {
            DataTable dt = DBDemoxOy.HaeKannasta();
            gvAsiakkaat2.DataSource = dt;
            gvAsiakkaat2.DataBind();

        }
        catch (Exception ex)
        {
            throw ex;
        }

    }
}