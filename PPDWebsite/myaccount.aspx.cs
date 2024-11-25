using InstitutionalInterfaceUtilities;
using PPDWebsite.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PPDWebsite
{
    public partial class myaccount : System.Web.UI.Page
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

            userID = Session["UserID"].ToString();
            //UserName = Session["UserName"].ToString();


            if (!IsPostBack)
            {
                GetUserAccount(Session["UserEmail"].ToString());
            }
        }

        protected void cmdDoReset_Click(object sender, EventArgs e)
        {
            ResetPassword();
        }

        protected void cmdUpdate_Click(object sender, EventArgs e)
        {

        }

        protected void cmdResetPassword_Click(object sender, EventArgs e)
        {

        }


        public SystemUserModel GetUserAccount(string email)
        {
            SystemUserModel t = new SystemUserModel();

            string commandText = "SELECT * FROM SystemUsers WHERE LTRIM(Email) = '" + email + "'";

            Utilities.DatabaseReader reader = new Utilities.DatabaseReader(commandText, "");

            if (reader.Reader == null)
            {
                return t;
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

                break;
            }

            reader.Close();

            txtFirstName.Text = t.Name;
            txtSurname.Text = t.Surname;
            txtPhone.Text = t.Phone;
            txtEmail.Text = t.Email;

            return t;
        }

        public void ResetPassword()
        {
            if (!txtNewPassword.Text.Equals(txtPassword2.Text))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "failedalert('" + "The two passwords do not match. Please re-enter and try again." + "');", true);
            }

            string sqlQuery = "UPDATE SystemUsers SET Password = '" + HashPassword(txtNewPassword.Text.Trim()) + "' WHERE ID = " + userID;

            int result = Utilities.ExecuteNonQuery(sqlQuery);

            if (result < 1)
            {
                //failed
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "failedalert('" + "An error occured in resetting the password. Please try again." + "');", true);
            }
            else
            {
                //saved
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successalert('" + "Password successfully!" + "');", true);
            }

        }

        public static string HashPassword(string pass)
        {
            MD5 zialgorithm = MD5.Create();
            string hashedPass = ASCIIEncoding.ASCII.GetString(zialgorithm.ComputeHash(ASCIIEncoding.ASCII.GetBytes(pass)));

            SHA512 sha512 = SHA512Managed.Create();
            Byte[] bytes = Encoding.UTF8.GetBytes(pass);
            Byte[] hash = sha512.ComputeHash(bytes);

            StringBuilder stringBuilder = new StringBuilder();

            int i;
            int hashLen = hash.Length - 1;
            for (i = 0; i <= hashLen; i++)
            {
                stringBuilder.Append(hash[i].ToString("X2"));
            }

            hashedPass = stringBuilder.ToString().ToUpper();


            return hashedPass;
        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Session["UserID"] = null;
            Response.Redirect("login.aspx");
        }

    }
}