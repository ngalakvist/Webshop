using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using BookShop.Commerce;
using System.Diagnostics;
using System.Web.UI.HtmlControls;
using System.IO;

public partial class _Default : BasePage
{
    LinkButton editProduct;
   

    //  MasterPage masterPage;

    // use to select Catergories .Event is generated from the masterpage
    protected void Page_Init(object sender, EventArgs e)
    {
        // Master.treeCategories.SelectedNodeChanged += new EventHandler(selectCategories);

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        ShowBookOwnerEditLink();


    }

    protected void ListView1_DataBound(object sender, EventArgs e)
    {
        //ShowBookOwnerEditLink();

    }
    /// <summary>
    /// Edit my uploaded books
    /// </summary>
    private void ShowBookOwnerEditLink()
    {

        //using (BooksDataContext bookCtx = new BooksDataContext())
        //{

        //    var bookOwner = from p in bookCtx.Products
        //                    where p.UserName == this.User.Identity.Name
        //                    select p;
        //    foreach (var item in bookOwner)
        //    {
        //        editProduct.Visible = true;
        //    }


        //}
    }

    protected void LinkBut_Init(object sender, EventArgs e)
    {
        editProduct = (LinkButton)sender;
    }


    public void SearchAdlidbris(string t)
    {
        ResponseHelper.Redirect("http://www.adlibris.com/se/product.aspx?isbn=" + t, "_blank", "width=600,height=700, ");
         
    }

    /// <summary>
    /// Select by Categories
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>

    /// Load books from the database
    /// </summary>
    protected void LoadBooks()
    {

        using (BooksDataContext cnxt = new BooksDataContext())
        {
            var bookList = from books in cnxt.Products
                           orderby books.ProductID descending
                           select books;

            ListView1.DataSource = bookList;
            ListView1.DataBind();
        }
    }


    protected void ListView1_ItemCommand1(object sender, ListViewCommandEventArgs e)
    {
        // searchBut.OnClientClick=string.Format("{0}.target=’_blank’;", ((HtmlForm)Page.Master.FindControl("form1")).ClientID);

        if (e.CommandName.Equals("search"))
        {
            Label query = ListView1.Items[Convert.ToInt32(e.CommandArgument)].FindControl("ISBNLabel") as Label;

            SearchAdlidbris(query.Text);
        }

    }


    protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        ShowBookOwnerEditLink();
    }

    [System.Web.Services.WebMethod]
    [System.Web.Script.Services.ScriptMethod]
    public static AjaxControlToolkit.Slide[] GetSlides()
    {
        AjaxControlToolkit.Slide[] bookSlide = new AjaxControlToolkit.Slide[8];

        bookSlide[0] = new AjaxControlToolkit.Slide("ProductImages/Brn.jpg", "Book", "Autumn Leaves");
        bookSlide[1] = new AjaxControlToolkit.Slide("ProductImages/asp_net-roadmap-500.jpg", "C#", "C#");
        bookSlide[2] = new AjaxControlToolkit.Slide("ProductImages/mgProfessionalASPNET35.jpg ", "ASP", "ASP.Net");
        bookSlide[3] = new AjaxControlToolkit.Slide("ProductImages/natur1.jpg ", "Dock", "Dock");
        bookSlide[4] = new AjaxControlToolkit.Slide("ProductImages/Brn.jpg", "Barn", "Autumn Leaves");
        bookSlide[5] = new AjaxControlToolkit.Slide("ProductImages/sport.jpg","Sports", "C#");
        bookSlide[6] = new AjaxControlToolkit.Slide("ProductImages/filos ", "Filosofy", "ASP.Net");
        bookSlide[7] = new AjaxControlToolkit.Slide("ProductImages/n.jpg ", "Natur", "Dock");

        return (bookSlide);
    }


}


