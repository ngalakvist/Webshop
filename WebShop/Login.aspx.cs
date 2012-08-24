using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Login1_LoggedIn(object sender, EventArgs e)
    {
       //Session["Username"] = User.Identity.Name.ToString();
      
       // Response.Redirect("Default.aspx");
    }
     
}
