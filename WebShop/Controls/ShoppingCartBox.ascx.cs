using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Globalization;

public partial class Controls_ShoppingCartBox : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Profile.Cart.Items.Count < 1)
            {
                Panel1.Visible = false;
                lblEmpty.Visible = true;
            }
            else
            {
                Panel1.Visible = true;

            }
            BindGrid();
        }
        if (Profile.Cart.Items.Count == 0)
        {
            TotalLabel.Visible = false;
        }


    }
    private void BindGrid()
    {
        RepBooks.DataSource = Profile.Cart.Items;
        DataBind();
        TotalLabel.Text = Profile.Cart.Total.ToString("N", CultureInfo.CreateSpecificCulture("ru-RU")) + " kr";
    }
    public string FormatPrice(object Price)
    {
        return Convert.ToDecimal(Price).ToString("N", CultureInfo.CreateSpecificCulture("ru-RU")) + " kr";
    }

}
