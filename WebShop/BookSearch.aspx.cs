using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BookSearch : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    { 
        if(Request.QueryString==null)
        Response.Redirect("Default.aspx");

    }
    protected void btnAddToCart1_Click(object sender, EventArgs e)
    {
        double Price = double.Parse(((Label)DataList1.Controls[0].FindControl("PriceLabel")).Text);
        string ProductName = ((Label)DataList1.Controls[0].FindControl("NameLabel")).Text;
        string PictureURL = ((Label)DataList1.Controls[0].FindControl("PictureUrlLabel")).Text;
        int ProductID = int.Parse(Request.QueryString["ProductID"]);

        if (Profile.Cart == null)
        {
            Profile.Cart = new BookShop.Commerce.BooksShoppingCart();
        }
        Profile.Cart.Insert(ProductID, Price, 1, ProductName, PictureURL);
        this.Response.Redirect("BookShoppingCartPage.aspx", false);
    }
}
