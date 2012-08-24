using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using BookShop.Commerce;
using System.Globalization;

public partial class BooksShoppingCart : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Profile.Cart == null)
        {
            Profile.Cart = new BookShop.Commerce.BooksShoppingCart();

        }
        if (!Page.IsPostBack)
        {
            BindGrid();
        }
        if (Profile.Cart.Items.Count == 0)
        {
            TotalLabel.Visible = false;
        }

    }
    protected void CartGrid_RowEditing(object sender, GridViewEditEventArgs e)
    {
        CartGrid.EditIndex = e.NewEditIndex;
        BindGrid();
    }
    protected void CartGrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
       
    }
    protected void CartGrid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        UpdateTotals();

    }
    protected void CartGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = Convert.ToInt32(CartGrid.DataKeys[e.RowIndex][0]);
        Profile.Cart.UpdateItemQuantity(id, -1);
        BindGrid();

    }
    private void BindGrid()
    {
        CartGrid.DataSource = Profile.Cart.Items;
        DataBind();

        TotalLabel.Text = Profile.Cart.Total.ToString("N", CultureInfo.CreateSpecificCulture("ru-RU")) + " kr";
    }

    protected void btnUpdateTotals_Click(object sender, EventArgs e)
    {
        UpdateTotals();

    }

    protected void UpdateTotals()
    {
        // update the quantities
        foreach (GridViewRow row in CartGrid.Rows)
        {
            int id = Convert.ToInt32(CartGrid.DataKeys[row.RowIndex][0]);
            int quantity = Convert.ToInt32((row.FindControl("txtQuantity") as TextBox).Text);
            this.Profile.Cart.UpdateItemQuantity(id, quantity);
        }
        BindGrid();

    }

    protected void CartGrid_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        UpdateTotals();
    }
    public string FormatPrice(object Price)
    {
        return Convert.ToDecimal(Price).ToString("N", CultureInfo.CreateSpecificCulture("ru-RU")) + " kr";
    }
}
