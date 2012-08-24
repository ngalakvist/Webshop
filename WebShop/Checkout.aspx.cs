using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.UI.WebControls;
using BookShop.Commerce;
using System.Web.Security;
using System.Text;
using System.Text.RegularExpressions;

partial class Checkout : System.Web.UI.Page
{
    int globalOrderId = 0;
    string payPalUrl = "";
    double cartTotal;
    double subTotal;
    void Page_Load(object sender, System.EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Profile.Cart == null)
            {
                NoCartlabel.Visible = true;
                Wizard1.Visible = false;
            }

            if (User.Identity.IsAuthenticated)
                Wizard1.ActiveStepIndex = 1;
            else
                Wizard1.ActiveStepIndex = 0;
        }
    }

    protected void chkUseProfileAddress_CheckedChanged(object sender, System.EventArgs e)
    {
        // fill the delivery address from the profile, but only if it's empty
        // we don't want to overwrite the values
        if (chkUseProfileAddress.Checked && (txtName.Text.Trim() == ""))
        {
            txtName.Text = Profile.Name;
            txtAddress.Text = Profile.Address;
            txtCity.Text = Profile.City;
            txtCounty.Text = Profile.County;
            txtPostCode.Text = Profile.PostCode;
            txtCountry.Text = Profile.Country;
        }

    }

    protected void Wizard1_FinishButtonClick(object sender, System.Web.UI.WebControls.WizardNavigationEventArgs e)
    {
        try
        {
            BooksDataContext cntx = new BooksDataContext();

            Order ord = new Order();
            ord.MemberName = User.Identity.Name;
            ord.Name = ((TextBox)Wizard1.FindControl("txtName")).Text;
            ord.OrderDate = DateTime.Now;
            ord.Address = ((TextBox)Wizard1.FindControl("txtAddress")).Text;
            ord.Country = ((TextBox)Wizard1.FindControl("txtCounty")).Text;
            ord.County = ((TextBox)Wizard1.FindControl("txtCountry")).Text;
            ord.OrderSentDate = DateTime.Now;
            ord.PostCode = ((TextBox)Wizard1.FindControl("txtPostCode")).Text;
            ord.SubTotal = (decimal)Profile.Cart.Total;
            ord.Total = (decimal)Profile.Cart.Total;
            ord.TrackingID = 0;
            ord.TransactionID = 0;
            ord.Status = 0;
            cntx.Orders.InsertOnSubmit(ord);
            cntx.SubmitChanges();
            globalOrderId = ord.OrderID;

            OrderLine ordL = new OrderLine();
            ordL.OrderID = globalOrderId;
            ordL.UserName = User.Identity.Name;
            ordL.OrderDate = DateTime.Now;
            foreach (var item in Profile.Cart.Items)
            {
                ordL.ProductID = item.ProductID;
                ordL.Quantity = (short)item.Quantity;
                ordL.Price = (decimal)item.Price;
                ordL.ProductName = item.ProductName;
                cntx.OrderLines.InsertOnSubmit(ordL);
                cntx.SubmitChanges();
            }
        }
        catch (Exception ex)
        {
            CreateOrderErrorLabel.Visible = true;
        }


        //Store totals
        cartTotal = Profile.Cart.Total;
        subTotal = Profile.Cart.Total;

        Profile.Cart.Clear();
        // start Payment Procedures
        payPalUrl = GetPayPalPaymentUrl(cartTotal, subTotal);

        // we will only reach here if the order has been created sucessfully
        // so clear the cart
        // go to url
        this.Response.Redirect(payPalUrl, false);

    }



    protected void Wizard1_NextButtonClick(object sender, System.Web.UI.WebControls.WizardNavigationEventArgs e)
    {
        if (e.CurrentStepIndex == 0)
        {
            System.Web.UI.WebControls.Login l = (System.Web.UI.WebControls.Login)Wizard1.FindControl("Login1") as System.Web.UI.WebControls.Login;

            if (Membership.ValidateUser(l.UserName, l.Password))
            {
                FormsAuthentication.SetAuthCookie(l.UserName, l.RememberMeSet);
                e.Cancel = false;
            }
            else
            {
                l.InstructionText = "Your login attempt was not successful. Please try again.";
                l.InstructionTextStyle.ForeColor = System.Drawing.Color.Red;

                e.Cancel = true;
            }
        }
        else
        {
            if (!User.Identity.IsAuthenticated)
            {
                e.Cancel = true;
                Wizard1.ActiveStepIndex = 0;
            }
        }
    }

    protected void Wizard1_ActiveStepChanged(object sender, System.EventArgs e)
    {
        if (!User.Identity.IsAuthenticated)
            Wizard1.ActiveStepIndex = 0;

        if (Wizard1.ActiveStepIndex == 2)
        {
            repOrderDetails.DataSource = Profile.Cart.Items;
            repOrderDetails.DataBind();
            lblSubtotal.Text = Profile.Cart.Total.ToString();
            lblTotal.Text = Profile.Cart.Total.ToString();
            lblFirstName.Text = Profile.Name;
            lblPostalCode.Text = Profile.PostCode;
            lblCountry.Text = Profile.Country;
            lblState.Text = Profile.County;

        }
    }
    public static string RemoveText(string key)
    {
        return Regex.Replace(key, "[^.0-9]", "");
    }


    private string GetPayPalPaymentUrl(double sTotal, double total)
    {
        string serverUrl = "https://www.sandbox.paypal.com/us/cgi-bin/webscr";
        string amount = RemoveText(sTotal.ToString());
        string mainTotal = RemoveText(total.ToString());
        string currencyCode = "USD";

        string baseUrl = HttpContext.Current.Request.Url.AbsoluteUri.Replace(
           HttpContext.Current.Request.Url.PathAndQuery, "") + HttpContext.Current.Request.ApplicationPath;
        if (!baseUrl.EndsWith("/"))
            baseUrl += "/";

        string notifyUrl = HttpUtility.UrlEncode(baseUrl + "PayPal/Notify.aspx");
        string returnUrl = HttpUtility.UrlEncode(baseUrl + "PayPal/OrderCompleted.aspx?ID=" + this.globalOrderId.ToString());
        string cancelUrl = HttpUtility.UrlEncode(baseUrl + "PayPal/OrderCancelled.aspx");
        string business = HttpUtility.UrlEncode(Profile.Email);
        string itemName = HttpUtility.UrlEncode("Order #" + globalOrderId.ToString());
        StringBuilder url = new StringBuilder();
        url.AppendFormat(
           "{0}?cmd=_xclick&upload=1&rm=2&no_shipping=1&no_note=1&currency_code={1}&business={2}&item_number={3}&custom={3}&item_name={4}&amount={5}&shipping={6}&notify_url={7}&return={8}&cancel_return={9}",
           serverUrl, currencyCode, business, this.globalOrderId, itemName,
           amount, mainTotal, notifyUrl, returnUrl, cancelUrl);

        return url.ToString();

    }
}
