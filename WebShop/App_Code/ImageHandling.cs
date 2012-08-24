using System;
using System.Drawing;
using System.Drawing.Imaging;
using System.Web;

public class ImageHandling
{
  /// <summary>
  /// Generate a thumbnail image, for uploaded files
  /// </summary>
  /// <param name="SourceImagePath">The path of the source image</param>
  /// <param name="TargetImagePath">The path of the target thumbnail image</param>
  /// <remarks></remarks>
  public static void GenerateThumbnail(string SourceImagePath, string TargetImagePath)
  {
    using (Image image1 = Image.FromFile(SourceImagePath))
    {
      short num1 = (short) Math.Round((double) (image1.Height * 0.25));
      short num2 = (short) Math.Round((double) (image1.Width * 0.25));
      Image.GetThumbnailImageAbort abort1 = new Image.GetThumbnailImageAbort(ImageHandling.ThumbnailCallback);
      using (Image image2 = image1.GetThumbnailImage(num2, num1, abort1, IntPtr.Zero))
      {
        image2.Save(TargetImagePath, ImageFormat.Gif);
      }
    }
  }
 
  public static bool ThumbnailCallback()
  {
    return false;
  }
 

}