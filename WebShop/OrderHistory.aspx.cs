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

public partial class OrderHistory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        using (BooksDataContext bookData = new BooksDataContext())
        {
            var orderHis = from book in bookData.OrderLines
                           //join orders in bookData.Orders on book.OrderID  equals orders.OrderID
                           where book.UserName == this.User.Identity.Name
                           orderby book.OrderDate descending
                           select book;
            Repeater1.DataSource = orderHis;
            Repeater1.DataBind();
        }

    }
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

    }

    protected void btn_SubmitFeedBack_Click(object sender, EventArgs e)
    {
       
         

    }
}
