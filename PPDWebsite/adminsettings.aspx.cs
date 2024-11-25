using InstitutionalInterfaceUtilities;
using PPDWebsite.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PPDWebsite
{
    public partial class adminsettings : System.Web.UI.Page
    {
        string sqlConnectionString = "Data Source=.;Initial Catalog=PregnancyPrayer;Integrated Security=true;";
        string userID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null || Session["loginValid"] == null)
            {
                Response.Redirect("login.aspx");
            }

            ltUserName.Text = Session["UserName"].ToString();
            ListUsers();
        }

        protected void cmdSave_Click(object sender, EventArgs e)
        {
            SystemUserModel c = new SystemUserModel();
            c.Name = txtName.Text;
            c.Surname = txtSurname.Text;
            c.Email = txtEmail.Text;
            c.Phone = txtPhone.Text;
            c.Password = txtPassword.Text;


            string commandText = "INSERT INTO SystemUsers(Username, UserType, Name, Surname, Title, Phone, Email, Password, Active, Locked, CreatedDate, CreatedBy) VALUES ('" +
               "" + c.Email + "'," +
               "" + "1" + ",'" +
               "" + c.Name + "','" +
               "" + c.Surname + "','" +
               "" + "-" + "','" +
               "" + c.Phone + "','" +
               "" + c.Email + "','" +
               "" + c.Password + "'," +
               "" + "1" + "," +
               "" + "0" + ",'" +
               "" + DateTime.Now + "'," +
                "" + userID + ")";

            int response = Utilities.ExecuteNewRecord(commandText);

            if (response < 1)
            {
                //failed
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "failedalert('" + "An error occured in creating the account. Please try again!" + "');", true);
            }
            else
            {
                //saved
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successalert('" + "Account created successfully!" + "');", true);
            }
        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {

        }

        public void ListUsers()
        {
            string tableHTML = "";
            SystemUserModel t = new SystemUserModel();

            string commandText = "SELECT * FROM SystemUsers";

            Utilities.DatabaseReader reader = new Utilities.DatabaseReader(commandText, "");

            if (reader.Reader == null)
            {
                return;
            }

            while (reader.Reader.Read())
            {
                t.ID = (int)reader.Reader["ID"];
                t.Name = reader.Reader["Name"].ToString().Trim();
                t.Surname = reader.Reader["Surname"].ToString().Trim();
                t.Email = reader.Reader["Email"].ToString().Trim();
                t.Phone = reader.Reader["Phone"].ToString().Trim();
                t.Active = (bool)reader.Reader["Active"];
                t.Locked = (bool)reader.Reader["Locked"];


                tableHTML = tableHTML + "<tr class=''><td>" + t.ID.ToString() + "</td><td>" + t.Name.ToString() + "</td><td>" + t.Surname + "</td><td>" + t.Email + "</td><td>" + t.Phone + "</td><td>" + t.Email + "</td></tr>";

            }

            ltData.Text = tableHTML;

            reader.Close();

        }
    }
}