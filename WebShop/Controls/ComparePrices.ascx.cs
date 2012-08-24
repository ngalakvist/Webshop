using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;

public partial class Controls_ComparePrices : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnCompare_Click(object sender, EventArgs e)
    {
        SearchGoogle(txtBkTitle.Text);
     }
    static void SearchGoogle(string t)
    {
        Process.Start( "http://www.adlibris.com/se/searchresult.aspx?search=" + t);
    }

}
