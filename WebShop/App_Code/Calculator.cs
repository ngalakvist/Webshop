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
/// Summary description for Calculator
/// </summary>
public class Calculator
{
  public double Add(double a, double b)
  {
    return a + b;
  }

  public double Subtract(double a, double b)
  {
    return a - b;
  }

  public double Multiply(double a, double b)
  {
    return a * b;
  }

  public double Divide(double a, double b)
  {
    return a / b;
  }

	public Calculator()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}
