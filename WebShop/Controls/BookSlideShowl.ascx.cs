using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Controls_BookSlideShowl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadImagesForSlideShow();

    }

    private void LoadImagesForSlideShow()
    {
        // Path to photos folder
        var photosRelativePath = "~/BookImages/";
        var photosFilePath = this.Server.MapPath(photosRelativePath);

        // Get list of img files from photos folder
        var photos = from file in new DirectoryInfo(photosFilePath).GetFiles()
                     where (file.Name.EndsWith(".jpg", StringComparison.InvariantCultureIgnoreCase)
                     || file.Name.EndsWith(".gif", StringComparison.InvariantCultureIgnoreCase)
                     || file.Name.EndsWith(".png", StringComparison.InvariantCultureIgnoreCase))
                     select photosRelativePath + file.Name;


        // Return photos as string array
        lstPhotos.DataSource = photos.ToArray();
        lstPhotos.DataBind();
    }
}