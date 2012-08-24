using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Net;
using System.IO;

public partial class PayPal_Notify : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
      {                  
         if (IsVerifiedNotification())
         {
            int orderID = Convert.ToInt32(this.Request.Params["custom"]);
            string status = this.Request.Params["payment_status"];
            decimal amount = Convert.ToDecimal(this.Request.Params["mc_gross"],
               CultureInfo.CreateSpecificCulture("en-US"));

            // get the Order object corresponding to the input orderID, 
            // and check that its total matches the input total
            //Order order = Order.GetOrderByID(orderID);
            //decimal origAmount = (order.SubTotal + order.Shipping);
            //if (amount >= origAmount)
            //{
            //   order.StatusID = (int)StatusCode.Verified;
            //   order.Update();
            //}
         }         
      }

      private bool IsVerifiedNotification()
      {
         string response = "";
         string post = Request.Form.ToString() + "&cmd=_notify-validate";
         string serverUrl = "https://www.sandbox.paypal.com/us/cgi-bin/webscr" ;
            

         HttpWebRequest req = (HttpWebRequest)WebRequest.Create(serverUrl);
         req.Method = "POST";
         req.ContentType = "application/x-www-form-urlencoded";
         req.ContentLength = post.Length;

         StreamWriter writer = new StreamWriter(req.GetRequestStream(), System.Text.Encoding.ASCII);
         writer.Write(post);
         writer.Close();

         StreamReader reader = new StreamReader(req.GetResponse().GetResponseStream());
         response = reader.ReadToEnd();
         reader.Close();

         return (response == "VERIFIED");
      }
   }

