using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MyProfile : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
             
            txtName.Text = Profile.Name;
            txtAddress.Text = Profile.Address;
            txtCity.Text = Profile.City;
            txtCounty.Text = Profile.County;
            txtPostCode.Text = Profile.PostCode;
            txtCountry.Text = Profile.Country;
            txtEmail.Text = Profile.Email;
             
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {

            Profile.Name = txtName.Text;
            Profile.Address = txtAddress.Text;
            Profile.City = txtCity.Text ;
            Profile.County = txtCounty.Text ;
            Profile.PostCode = txtPostCode.Text;
            Profile.Country = txtCountry.Text ;
            Profile.Email = txtEmail.Text;
        }
           
    }

    
   
}
