using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BookShopAP : System.Web.UI.Page
{
    protected static BookShopEntities ctx;
    protected static bool KustiValittu;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //luodaan konteksti
            ctx = new BookShopEntities();
            FillControls();
        }
    }
    #region METHODS
    protected void GetBooks()
    {
        gvBooks.DataSource = ctx.Books.ToList();
        gvBooks.DataBind();
    }
    protected void GetCustomers()
    {
        gvCustomers.DataSource = ctx.Customers.ToList();
        gvCustomers.DataBind();
    }
    protected void FillControls()
    {
        //ui-kontrollien alustaminen
        var result = from c in ctx.Customers
                     orderby c.lastname
                     select new { c.id, c.lastname };
        //määritellään dropdownlistille mitä se esittää
        ddlCustomers.SelectedIndex = -1;
        ddlCustomers.DataSource = result.ToList();
        ddlCustomers.DataTextField = "lastname";
        ddlCustomers.DataValueField = "id";
        ddlCustomers.DataBind();
        ddlCustomers.Items.Insert(0, string.Empty);//lisätään tyhjä rivi
        //11.10
        txtFirstname.Text = string.Empty;
        txtLastname.Text = string.Empty;
        SetButtons();
    }
    protected void SetButtons()
    {
        //TODO buttosten käytettävyys sen mukaan onko valittu kustia
        btnCreateCustomer.Enabled = !KustiValittu;
        btnSaveCustomer.Enabled = KustiValittu;
        btnDeleteCustomer.Enabled = KustiValittu;
    }
    #endregion
    protected void btnGetBooks_Click(object sender, EventArgs e)
    {
        GetBooks();
    }

    protected void btnGetCustomers_Click(object sender, EventArgs e)
    {
        GetCustomers();
    }

    protected void ddlCustomers_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlCustomers.SelectedIndex > 0)
        {
            //tyhjätään ddlorderist entiset röpöt pois
            ddlOrders.Items.Clear();
            int cid = -1;
            cid = Int32.Parse(ddlCustomers.SelectedValue);
            //haetaan valittu asiakas
            var ret = from c in ctx.Customers
                      where c.id == cid
                      select c;
            var asiakas = ret.FirstOrDefault();//otetaan 1. entiteetti
            if (asiakas != null)
            {
                lblMessages.Text 
                    = string.Format("Valitsit asiakkaan {0}", asiakas.lastname);
                //jatko 11.10
                txtFirstname.Text = asiakas.firstname;
                txtLastname.Text = asiakas.lastname;
                KustiValittu = true;
                SetButtons();
                //tutkitaan onko valitulla asiakkaalla tilauksia ja jos on näytetään
                if (asiakas.Orders.Count > 0)
                {
                    lblMessages.Text += 
                        string.Format(", tilauksia {0}", asiakas.Orders.Count);
                    //täytetään ddl tilauksilla
                    var ret2 = (from o in asiakas.Orders
                               select new { Pvm = o.odate }).ToList();
                    ddlOrders.DataSource = ret2;
                    ddlOrders.DataTextField = "Pvm";
                    ddlOrders.DataBind();
                    //haetaan ja näytetään tilaukset ja tilausten tilausrivit
                    foreach (var item in asiakas.Orders)
                    {
                        lblMessages.Text +=
                        string.Format("<br> tilaus: {0} ", item.odate.ToShortDateString());
                        //loopitetaan tilauksen tilausrivit
                        foreach (var or in item.Orderitems)
                        {
                            lblMessages.Text +=
                                string.Format("<br> -tilattu kirja {0} ", or.Book.name);
                        }
                    }
                }
                else
                {
                    lblMessages.Text += ", ei ole tilauksia.";
                }
            }
        }
        else
        {
            lblMessages.Text = string.Empty;
            KustiValittu = false;
            txtFirstname.Text = string.Empty;
            txtLastname.Text = string.Empty;
            SetButtons();
        }
    }

    protected void btnCreateCustomer_Click(object sender, EventArgs e)
    {
        //tarkistetaan ensin onko ko. asiakasta jo olemassa LINQ lambda-funktiolla
        bool isThere = ctx.Customers.Any(c => (c.firstname.Contains(txtFirstname.Text) &
        c.lastname.Contains(txtLastname.Text)));
        if (isThere)
        {
            lblMessages.Text = string.Format("Asiakas {0} on jo olemassa", txtLastname.Text);
        }
        else
        {
            //luodaan kontekstiin uusi asiakas entiteetti
            Customer kusti = new Customer();
            kusti.firstname = txtFirstname.Text;
            kusti.lastname = txtLastname.Text;
            ctx.Customers.Add(kusti);
            //save changes to db
            ctx.SaveChanges();
            lblMessages.Text = string.Format("uusi asiakas {0} {1} {2} luotu onnistuneesti",
                kusti.id, kusti.firstname, kusti.lastname);
            //päivitetään kontrollit
            FillControls();
        }

    }

    protected void btnSaveCustomer_Click(object sender, EventArgs e)
    {
        //haetaan valitun asiakkaan id
        int i = int.Parse(ddlCustomers.SelectedValue);
        if (i > 0)
        {
            var ret = ctx.Customers.Where(c => c.id == i);
            Customer kusti = ret.FirstOrDefault();
            if (kusti != null)
            {
                if (kusti.firstname != txtFirstname.Text)
                    kusti.firstname = txtFirstname.Text;
                if (kusti.lastname != txtLastname.Text)
                    kusti.lastname = txtLastname.Text;
                ctx.SaveChanges();
                FillControls();
            }
        }
    }

    protected void btnDeleteCustomer_Click(object sender, EventArgs e)
    {
        //TODO poistetaan valittu
        if (KustiValittu)
        {
            //poistetaan kontekstista ja db:stä
            //huomioi myös businesslogiikka eli onko oikeast järkevää poistaa asiakas
            //tässä casessa saa poistaa vain sellaisia asiakkaita joilla EI ole tilauksia
            //haetaan valitun asiakkaan id
            int i = int.Parse(ddlCustomers.SelectedValue);
            if (i > 0)
            {
                var ret = ctx.Customers.Where(c => c.id == i);
                Customer kusti = ret.FirstOrDefault();
                if (kusti != null)
                {
                    //tutkitaan onko kustilla tilauksia, jos on ei poisteta
                    if (kusti.Orders.Count == 0)
                    {
                        ctx.Customers.Remove(kusti);
                        ctx.SaveChanges();
                        //UIn päivitys
                        KustiValittu = false;
                        FillControls();
                    }
                    else
                    {
                        lblMessages.Text = string.Format
                            ("asiakasta {0} ei voi poistaa, koska hänellä on {1} tilausta.",
                            kusti.lastname, kusti.Orders.Count);
                    }
                }
            }
        }
    }
}