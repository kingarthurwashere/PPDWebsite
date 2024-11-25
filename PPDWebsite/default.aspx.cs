using PPDWebsite.App_Code;
using PPDWebsite.AppCode;
using PPDWebsite.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static PPDWebsite.AppCode.JournalGeneration;

namespace PPDWebsite
{
    public partial class _default : System.Web.UI.Page
    {
      protected void Page_Load(object sender, EventArgs e)
      {
      }

    protected void cmdSendMessage_Click(object sender, EventArgs e)
    {

           
            EmailBundle bundle = new EmailBundle();
            bundle.subject = "New PPG Message";
            bundle.recipient = "info@pregnancyprayerguide.com";
            bundle.body = "Good day,<br/<br/>A new submission has come from the PPG Website with the following details: <br /><br /> Name : " + txtName.Text + "<br />Email Address: " + txtEmail.Text + "<br />Subject: " + txtSubject.Text + "<br />Message: " + txtMessage.Text;

            EmailUtilities utilities = new EmailUtilities();
            utilities.SendEmail(bundle);

    }
  }
}