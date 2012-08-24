using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PayPal_OrderCompleted : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int orderId = (Convert.ToInt32(this.Request.QueryString["ID"]));

        using (BooksDataContext cntx = new BooksDataContext())
        {
            Order bookOrders = cntx.Orders.Single(bk => bk.OrderID == orderId);
             bookOrders.Status = 1; 
             cntx.SubmitChanges(); 
            var books = cntx.OrderLines.Where(bl => bl.OrderID == orderId);

             foreach (var item in books)
             {
                 item.Status = 1;
                 cntx.SubmitChanges();
             }
                     
        }

    }
}