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

public partial class NewShop :BasePage
{
   
    protected void LinqDataSource1_Inserting1(object sender, LinqDataSourceInsertEventArgs e)
    {
       Product books = (Product)e.NewObject;
        books.UserName = User.Identity.Name;
        Session["ID"] = books.UserName;
        books.AddedDate = DateTime.Now;
        books.Status = 1;
        books.UnitsInStock = 1;
    }
 
    protected void LinqDataSource1_Inserted(object sender, LinqDataSourceStatusEventArgs e)
    {
       
    }
    protected void FileUploaded(object sender, PictureUpload.FileUploadEventArgs e)
    {
        TextBox boundControl = (TextBox)DetailsView1.FindControl("txtPictureURL");
        boundControl.Text = e.FileName;
    }

    protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
     //   e.Values["UpdateDateTime"] = DateTime.Now;

    }


    protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}
