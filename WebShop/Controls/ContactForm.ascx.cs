using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

using System.Net.Mail;
using System.Drawing;

public partial class Controls_ContactForm : System.Web.UI.UserControl
{
  protected void Page_Load(object sender, EventArgs e)
  {

  }

  protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
  {
    if (txtPhoneHome.Text != string.Empty || txtPhoneBusiness.Text != string.Empty)
    {
      args.IsValid = true;
    }
    else
    {
      args.IsValid = false;
    }
  }

  protected void btnSend_Click(object sender, EventArgs e)
  {
    if (Page.IsValid)
    {
        // set up my client configurations if using a gmail account
        SmtpClient mySmtpClient = new SmtpClient();
        mySmtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
        mySmtpClient.EnableSsl = true;
        mySmtpClient.Host = "smtp.gmail.com";
        mySmtpClient.Port = 587; // google client uses this port

        // setup Smtp authentication and verification
        System.Net.NetworkCredential credentials =
        new System.Net.NetworkCredential("ngalatalla@gmail.com", "marygo11se");
        mySmtpClient.UseDefaultCredentials = false;
        mySmtpClient.Credentials = credentials;

        // store all  input  into a file
        string fileName = Server.MapPath("~/App_Data/ContactForm.txt");
        string mailBody = System.IO.File.ReadAllText(fileName);

        //replace file contents with the real message
        mailBody = mailBody.Replace("##Name##", txtName.Text);
        mailBody = mailBody.Replace("##Email##", txtEmailAddress.Text);
        mailBody = mailBody.Replace("##HomePhone##", txtPhoneHome.Text);
        mailBody = mailBody.Replace("##BusinessPhone##", txtPhoneBusiness.Text);
        mailBody = mailBody.Replace("##Comments##", txtComments.Text);

        // set up Mailmessage object
        MailMessage myMessage = new MailMessage();
        myMessage.Subject = "Response from my web site";
        myMessage.Body = mailBody;

        myMessage.From = new MailAddress("ngala@gmail.com", "Ngala Talla");
        myMessage.To.Add(new MailAddress("nta04001@student.mdh.se", "All"));

        //Do some checking in case  of failure or success and send feedback
        try
        {
            mySmtpClient.Send(myMessage);
            lblMessage.Text = "Your message has been successfully sent.";
            FormTable.Visible = false;
        }

        catch (Exception ex)
        {
            lblMessage.ForeColor = Color.Red;
            lblMessage.Text = "Error occured while sending your message." + ex.Message;
        }
    } 
  }
}
