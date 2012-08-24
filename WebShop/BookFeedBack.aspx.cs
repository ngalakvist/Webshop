using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class BookFeedBack : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //show feedback message textbox if item has no previos messages
        int prodId = Convert.ToInt32(Request.QueryString.Get("ProductID"));
        //using (BooksDataContext cntx = new BooksDataContext())
        //{
        //    var feedBackComments = (from comments in cntx.Comment_tbs
        //                           join prudc in cntx.Products on comments.ProductID equals prudc.ProductID
        //                           where comments.ProductID == prodId
        //                           select comments).Single();


        //        if ( feedBackComments.FeedBackMessage.Length > 0)
        //        {
        //            DetailsView1.Enabled = false;

        //        }




        //}



    }
    protected void feedDetails_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
    {

    }
    protected void feedDetails_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {

    }


    protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        DataList2.DataBind();
        DetailsView1.Enabled = false;
    }

    protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        e.Values["AddedDate"] = DateTime.Now;
        e.Values["AddedBy"] = User.Identity.Name;
        e.Values["ProductID"] = Request.QueryString.Get("ProductID");
    }
    protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
    {

    }
    protected void DetailsView1_Load(object sender, EventArgs e)
    {
        int prodId = Convert.ToInt32(Request.QueryString.Get("ProductID"));
        using (BooksDataContext cntx = new BooksDataContext())
        {
            var feedBackComments = from comments in cntx.Comment_tbs
                                   join prudc in cntx.Products on comments.ProductID equals prudc.ProductID
                                   where comments.ProductID == prodId
                                   select comments;

            foreach (var item in feedBackComments)
            {
                if (item.FeedBackMessage.Length > 0)
                {
                    DetailsView1.Enabled = false;

                }

            }




        }
    }
    protected void DetailsView1_DataBound(object sender, EventArgs e)
    {
        // DetailsView1.Enabled = false;

    }
}
