using System.Web;
using System.Web.UI.WebControls;

partial class UpdateProducts : System.Web.UI.Page
{
  protected void btnNewItem_Click( object sender,  System.EventArgs e)
  {
    DetailsView1.ChangeMode(DetailsViewMode.Insert);
  }

  protected void SqlDataSource2_Inserted( object sender,  System.Web.UI.WebControls.SqlDataSourceStatusEventArgs e)
  {
    DataList1.DataBind();
    DetailsView1.DataBind();
  }

  protected void SqlDataSource2_Updated( object sender,  System.Web.UI.WebControls.SqlDataSourceStatusEventArgs e)
  {
    DataList1.DataBind();
    DetailsView1.DataBind();
  }

  protected void FileUploaded( object sender,  PictureUpload.FileUploadEventArgs e)
  {
    TextBox boundControl = (TextBox)DetailsView1.FindControl("txtPictureURL");
    boundControl.Text = e.FileName;
  }

  protected void SqlDataSource2_Deleted( object sender,  System.Web.UI.WebControls.SqlDataSourceStatusEventArgs e)
  {
    DataList1.DataBind();
    DetailsView1.DataBind();
  }

  protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
  {

  }
}
