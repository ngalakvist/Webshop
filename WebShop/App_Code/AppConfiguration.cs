using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

/// <summary>
/// Summary description for AppConfiguration
/// </summary>
public class AppConfiguration
{
	public static string FromAddress
	{
		get
		{
			string result = ConfigurationManager.AppSettings.Get("FromAddress");
			if (!string.IsNullOrEmpty(result))
			{
				return result;
			}
			throw new Exception("Appsetting FromAddress not found in web.config file");
		}
	}

	public static string FromName
	{
		get
		{
			string result = ConfigurationManager.AppSettings.Get("FromName");
			if (!string.IsNullOrEmpty(result))
			{
				return result;
			}
			throw new Exception("Appsetting FromName not found in web.config file");
		}
	}

	public static string ToAddress
	{
		get
		{
			string result = ConfigurationManager.AppSettings.Get("ToAddress");
			if (!string.IsNullOrEmpty(result))
			{
				return result;
			}
			throw new Exception("Appsetting ToAddress not found in web.config file");
		}
	}

	public static string ToName
	{
		get
		{
			string result = ConfigurationManager.AppSettings.Get("ToName");
			if (!string.IsNullOrEmpty(result))
			{
				return result;
			}
			throw new Exception("Appsetting ToName not found in web.config file");
		}
	}

	public static bool SendMailOnError
	{
		get
		{
			string result = ConfigurationManager.AppSettings.Get("SendMailOnError");
			if (!string.IsNullOrEmpty(result))
			{
				return Convert.ToBoolean(result);
			}
			throw new Exception("Appsetting SendMailOnError not found in web.config file");
		}
	}

}
