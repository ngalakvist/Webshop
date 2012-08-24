using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
 

public partial class MyBooks : BasePage
{
  
    List<Sales> MySalesList = new List<Sales>();
    protected void Page_Load(object sender, EventArgs e)
    {
       
        PopulateHistoryandSales();
    }

    private void PopulateHistoryandSales()
    {
        using (BooksDataContext bookData = new BooksDataContext())
        {
            var myBooks = from book in bookData.Products
                          where book.UserName == this.User.Identity.Name
                          orderby book.ProductID descending
                          select new { book.ProductID, book.Name, book.Price, book.ISBN };
            GridView1.DataSource = myBooks;
            GridView1.DataBind();
        }

        using (BooksDataContext bookData = new BooksDataContext())
        {

            var orderHis = from book in bookData.Products
                           join ordLine in bookData.OrderLines on book.ProductID equals ordLine.ProductID
                           where book.UserName == this.User.Identity.Name
                           orderby ordLine.OrderDate descending
                           select new
                           {
                               title = book.Name,
                               quantity = ordLine.Quantity,
                               total = ordLine.Price,
                           };
            Sales sales = new Sales();
            foreach (var item in orderHis)
            {
                sales.Title = item.title;
                sales.Quantity = item.quantity;
                sales.Total = (decimal)item.total;
                MySalesList.Add(sales);
            }
            GridView2.DataSource = MySalesList;
            GridView2.DataBind();

        }
    }


    protected void DetailsView1_ItemCreated(object sender, EventArgs e)
    {
         
    }
    
}
