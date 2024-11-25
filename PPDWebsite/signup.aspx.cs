using PPDWebsite.App_Code;
using PPDWebsite.Helpers;
using PPDWebsite.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PPDWebsite
{
    public partial class signup : System.Web.UI.Page
    {

        string sqlConnectionString = "Data Source=.;Initial Catalog=PregnancyPrayer;Integrated Security=true;";

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void cmdSignUp_Click(object sender, EventArgs e)
        {
            ShowMissingInfoMessage("Please enter a name");

            string name = txtFirstName.Text;
            string surname = txtSurname.Text;
            string email = txtEmail.Text;
            string phone = txtMobile.Text;
            string pass1 = txtPassword.Text;
            string pass2 = txtPasswordConfirm.Text;
            string facebookID = "-";
            DateTime dueDate = DateTime.Parse(txtDueDate.Text);

            SqlConnection conn = new SqlConnection(sqlConnectionString);

            if (name.Equals(""))
            {
                return;
            }

            try
            {
                conn.Open();
            }
            catch (Exception ex)
            {
                //return ex.ToString();
                //show error
            }


            string commandString = "INSERT INTO tblUsers ([firstName] ,[surname],[email],[phone],[facebookID],[dateOfRegistration],[currentPregnancyDay],[dateOfConception],[expectedBirthDate],[password], [hasJournal], [hasDevotional],[source]) OUTPUT INSERTED.ID VALUES ('" +
                name + "','" +
                surname + "','" +
                email + "','" +
                phone + "','" +
                facebookID + "','" +
                DateTime.Now.ToShortDateString() + "'," +
                "0" + ",'" +
                dueDate.AddDays(-280) + "','" +
                dueDate + "','" +
                Utilities.HashPassword(pass1) + "'," +
                "0" + "," +
                "0" + ",'" +
                "web" + "')";

            try
            {
                SqlCommand comm = new SqlCommand(commandString, conn);
                Int32 newId = (Int32)comm.ExecuteScalar();

                Session["userID"] = newId.ToString();

                SendRegistrationEmail(email, name, pass1);

                Response.Redirect("dashboard.aspx");
            }catch(Exception ex)
            {

            }finally
            {
                conn.Close();
            }
            
                


        }

        private void SendRegistrationEmail(string email, string name, string password)
        {
            EmailBundle bundle = new EmailBundle();
            bundle.subject = "Pregnancy Prayer App";
            bundle.recipient = email;
            bundle.body = "Dear " + name + ",<br/<br/>Thank you for signing up for the Pregnancy Prayer Guide WebApp.<br /><br />Below are your credentials:<br /><br /> Username : " + email + "<br />Password: " + password;

            EmailUtilities utilities = new EmailUtilities();
            utilities.SendEmail(bundle);
        }


        protected void ShowMessage(string errMessage)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "showErrorAlert('" + errMessage + "');", true);
        }

        protected void ShowMissingInfoMessage(string errMessage)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "showMissingInfoAlert('" + errMessage + "');", true);
        }
    }
}