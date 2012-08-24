using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Globalization;

/// <summary>
/// Summary description for BasePage
/// </summary>
public class BasePage : System.Web.UI.Page
{
	public BasePage()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    protected override void OnLoad(EventArgs e)
    {
        
    }
    
    // format  the price
    public string FormatPrice(object Price)
    {
        return Convert.ToDouble(Price).ToString("N", CultureInfo.CreateSpecificCulture("ru-RU")) + " kr";
    }
    public string BaseUrl
    {
        get
        {
            string url = this.Request.ApplicationPath;
            if (url.EndsWith("/"))
                return url;  
            else
                return url + "/";
        }
    }

    public static string ConvertToHtml(object content)
    {
        string contentToRet = " ";
        contentToRet =HttpUtility.HtmlEncode(content);
        contentToRet = contentToRet.Replace("  ", "&nbsp;&nbsp;").Replace(
           "\t", "&nbsp;&nbsp;&nbsp;").Replace("\n", "<br>");         
        return contentToRet;
    }
}
