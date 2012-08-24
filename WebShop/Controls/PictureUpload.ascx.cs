using System;
using System.IO;

partial class PictureUpload : System.Web.UI.UserControl
{
  // the class to return to the calling page
  // - it simply contains the relative path of where the file was uploaded
  public class FileUploadEventArgs : EventArgs
  {
    public FileUploadEventArgs(string  FileName)
    {
      _fileName = FileName;
    }

    private string  _fileName;
    public string FileName
    {
      get {return _fileName;}
    }
  }

  // define the delgate for the sucessful uploading event
  public delegate void FileUploadedEventHandler( object sender,  FileUploadEventArgs e);

  // define the event for sucessful upload
  public event FileUploadedEventHandler FileUploaded;

  // the modes for uploading images
  public enum ImageType
  {     
    Product
  }

  private ImageType _uploadImageType;
  public ImageType UploadImageType
  {
    get {return _uploadImageType;}
    set {_uploadImageType = value;}
  }

  protected void btnUpload_Click(object sender, System.EventArgs e)
  {
    string  ImagesFolder = string .Empty;
    string  savePath;
    string  saveFile;

    // upload the file
    if (FileUpload1.HasFile)
    {
      // set the directories
      switch (_uploadImageType)
      {
         
        case ImageType.Product:
          ImagesFolder = "ProductImages";
          break;
      }
      savePath = Path.Combine(Request.PhysicalApplicationPath, ImagesFolder);

      // save the image
      saveFile = Path.Combine(savePath, FileUpload1.FileName);
      FileUpload1.SaveAs(saveFile);

      // for product images we also create a thumbnail
      if (_uploadImageType == ImageType.Product)
      {
        string  newPath = Path.Combine(savePath, "thumb_" + FileUpload1.FileName);
        ImageHandling.GenerateThumbnail(saveFile, newPath);
      }

      // Notify the user that the file was uploaded successfully.
      Status.Text = "Your file was uploaded successfully.";

      // let the parent know that the file was uploaded
      OnFileUploaded(new FileUploadEventArgs(FileUpload1.FileName));
    }
    else
    {
      // Notify the user that a file was not uploaded.
      Status.Text = "You did not specify a file to upload.";
    }

  }

  // declare the event method
  protected virtual void OnFileUploaded( FileUploadEventArgs e)
  {
    // fire the delegate
    FileUploaded(this, e);
  }
}
