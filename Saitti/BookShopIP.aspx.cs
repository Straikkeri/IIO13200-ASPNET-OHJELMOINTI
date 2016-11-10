using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BookShopIP : System.Web.UI.Page
{
    protected static BookShopEntities ctx;
    protected static bool KustiValittu;
    protected void Page_Load(object sender, EventArgs e)
    {
        //ctx:ään tiedot vain kerran ja kontrollien populointi
        if (!IsPostBack)
        {
            ctx = new BookShopEntities();
            FillControls();
        }
    }
    #region METHODS
    protected void FillControls()
    {
        //dropdownlist
        //var retval = ctx.Customers;
        //var retval = from c in ctx.Customers
        //             orderby c.lastname
        //             select c;
        //sama lambda tyylillä
        var retval = ctx.Customers.OrderBy(x => x.lastname);
        ddlCustomers.DataSource = retval.ToList();
        ddlCustomers.DataTextField = "lastname";
        ddlCustomers.DataValueField = "id";
        ddlCustomers.DataBind();
        //lisätään tyhjä alkio ddl:ään
        ddlCustomers.Items.Insert(0, string.Empty);
        //CRUDia varten
        txtFirstName.Text = string.Empty;
        txtLastName.Text = string.Empty;
        SetButtons();
    }
    protected void SetButtons()
    {
        //buttosten käytettävyyden hallinta
        btnCreateCustomer.Enabled = !KustiValittu;
        btnSaveCustomer.Enabled = KustiValittu;
        btnDeleteCustomer.Enabled = KustiValittu;
    }
    protected void ShowCustomers()
    {
        gvCustomers.DataSource = ctx.Customers.ToList();
        gvCustomers.DataBind();
        int i = ctx.Customers.Count();
        lblMessages.Text = string.Format("Haettu {0} asiakkaan tiedot", i);
    }
    protected void ShowBooks()
    {
        gvBooks.DataSource = ctx.Books.ToList();
        gvBooks.DataBind();
        int i = ctx.Books.Count();
        lblMessages.Text = string.Format("Haettu {0} kirjan tiedot", i);
    }
    protected void ShowCustomersOrders(Customer kusti)
    {
        //näytetään asiakkaan tilaukset ja tilaukseen kuuluvat rivit=kirjat
        ltResult.Text = string.Format("Asiakkaalla {0} {1} on {2} tilausta",
            kusti.firstname, kusti.lastname, kusti.Orders.Count);
        //loopitetaan asiakkaan tilaukset läpi
        foreach (var o in kusti.Orders)
        {
            ltResult.Text  += 
                string.Format("<br>- tilaus {0} sisältää {1} kirjaa:", 
                o.odate, o.Orderitems.Count());
            //loopitetaann tilauksen tilausrivit
            foreach (var oi in o.Orderitems)
            {
                ltResult.Text +=
                    string.Format("<br>-- kirjaa {0} {1} kpl {2}",
                    oi.Book.name, oi.Book.author, oi.count);
            }
        }
    }
    #endregion
    protected void btnGetCustomers_Click(object sender, EventArgs e)
    {
        ShowCustomers();
    }
    protected void btnGetBooks_Click(object sender, EventArgs e)
    {
        ShowBooks();
    }
    protected void ddlCustomers_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlCustomers.SelectedIndex > 0)
        { 
        //valitun asiakkaan indeksin perusteella
        int id = int.Parse(ddlCustomers.SelectedValue);
        var ret = from c in ctx.Customers
                  where c.id == id
                  select c;
        Customer kusti = ret.FirstOrDefault();
        ShowCustomersOrders(kusti);
            //CRUDia varten
            KustiValittu = true;
            txtFirstName.Text = kusti.firstname;
            txtLastName.Text = kusti.lastname;
            SetButtons();
        }
        else
        {
            ltResult.Text = string.Empty;
            KustiValittu = false;
            txtFirstName.Text = string.Empty;
            txtLastName.Text = string.Empty;
            SetButtons();
        }
    }

    protected void btnCreateCustomer_Click(object sender, EventArgs e)
    {
        //luodaan uusi asiakas kontekstiin jollei samannimistä ole
        //tsekkaus LINQ:lla
        bool isThere = 
            ctx.Customers.Any(c => (c.firstname.Contains(txtFirstName.Text) &
            c.lastname.Contains(txtLastName.Text)));
        if (isThere)
        {
            lblMessages.Text = string.Format("Asiakas {0} on jo olemassa.", txtLastName.Text);
        }
        else
        {
            //luodaan uusi customer entiteetti
            Customer kusti = new Customer();
            kusti.firstname = txtFirstName.Text;
            kusti.lastname = txtLastName.Text;
            ctx.Customers.Add(kusti);
            //kontekstin tallennus kantaan
            ctx.SaveChanges();
            //ilmoitukset UIhin, UIn päivitys
            lblMessages.Text = string.Format("Uusi asiakas {0} {1} {2} luotu onnistuneesti.", 
                kusti.firstname, kusti.lastname, kusti.id);
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
                if (kusti.firstname != txtFirstName.Text)
                    kusti.firstname = txtFirstName.Text;
                if (kusti.lastname != txtLastName.Text)
                    kusti.lastname = txtLastName.Text;
                ctx.SaveChanges();
                FillControls();//UI ajantasalle
            }
        }
    }
}