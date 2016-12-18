using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Levytarkastelu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            literalLevy.Text = Session["levy"].ToString();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}