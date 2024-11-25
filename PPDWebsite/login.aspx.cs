using PPDWebsite.AppCode;
using PPDWebsite.Helpers;
using PPDWebsite.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PPDWebsite
{
    public partial class login : System.Web.UI.Page
    {
        string sqlConnectionString = "Data Source=.;Initial Catalog=PregnancyPrayer;Integrated Security=true;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["userID"] = null;
            }
        }

        protected void cmdLogin_Click(object sender, EventArgs e)
        {

            string userName = username.Text;
            string stringPassword = password.Text;
            string pass = Utilities.HashPassword(stringPassword);
            string loginResponse = "failed";


            //start with looking in the admins table
                LoginModel l = new LoginModel();
                l.userName = userName;
                l.password = stringPassword;

                loginResponse = Login(l).ToString();

                if (loginResponse.Equals("1"))
                {
                    SystemUserModel t = GetUserAccount(l.userName);

                    Session["loginValid"] = "true";
                    Session["UserName"] = t.Name + " " + t.Surname;
                    Session["UserID"] = t.ID;
                    Session["UserEmail"] = t.Email;

                    Response.Redirect("admin.aspx", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "failedalert('" + "Username or password incorrect!" + "');", true);
                    Session["loginValid"] = "false";
                }
                


            SqlConnection conn = new SqlConnection(sqlConnectionString);

            try
            {
                conn.Open();
            }
            catch (Exception ex)
            {
                //return ex.ToString();
                //show error
            }

            string cnt = "0";
            string commandString = "";
            string searchBy = "";

            if (userName.Contains("@"))
            {
                //then an email is being used for login
                searchBy = "email";
               commandString =  "SELECT COUNT (*) FROM [tblUsers] WHERE LTRIM(email) = '" + userName + "' AND LTRIM(password) = '" + pass + "'";
            }
            else
            {
                searchBy = "phone";
                commandString = "SELECT COUNT (*) FROM [tblUsers] WHERE LTRIM(phone) = '" + userName + "' AND LTRIM(password) = '" + pass + "'";
            }


            try
            {
                SqlCommand comm = new SqlCommand(commandString, conn);
                cnt = comm.ExecuteScalar().ToString();
            }
            catch (Exception ex)
            {
                cnt = ex.Message;
            }
            finally
            {
                conn.Close();
            }

            if (cnt != "1")
            {
                loginResponse = "failed";
                ShowMessage();
                //BootAlert.BootstrapAlert(lblMsg, "Error! Database connection failed. Wrong credentials", BootAlert.BootstrapAlertType.Danger);
            }
            else
            {
                //get the userID and store it as a session variable
                Session["userID"] = Utilities.GetDBUserID(userName, searchBy);

                loginResponse = Utilities.GetUserDetails(userName);
                Response.Redirect("dashboard.aspx");
            }                    

           
        }

        protected void cmdSignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("signup.aspx");
        }


        public string ForgotPassword()
        {
            return "1";
        }

        public string ResetPassword(string cashierNumber)
        {
            return "";
        }


        protected void ShowMessage()
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "showAlert();", true);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }


        public static int Login(LoginModel l)
        {
            string pass = HashPassword(l.password.Trim());
            int loginResponse = 0;

            SqlConnection conn = new SqlConnection( InstitutionalInterfaceUtilities.Utilities.DBCONNECTIONSTRING(""));

            try
            {
                conn.Open();
            }
            catch (Exception ex)
            {
                //return ex.ToString();
                //show error
            }

            int cnt = 0;
            string commandString = "";
            string searchBy = "";

            searchBy = "email";
            commandString = "SELECT COUNT (*) FROM [SystemUsers] WHERE LTRIM(Email) = '" + l.userName.Trim() + "' AND LTRIM(Password) = '" + pass + "'";

            try
            {
                SqlCommand comm = new SqlCommand(commandString, conn);
                cnt = (int)comm.ExecuteScalar();
            }
            catch (Exception ex)
            {
                //cnt = ex.Message;
            }
            finally
            {
                conn.Close();
            }

            if (cnt < 1)
            {
                loginResponse = -1;

            }
            else
            {
                loginResponse = 1;

            }

            return loginResponse;
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

        public static SystemUserModel GetUserAccount(string email)
        {
            SystemUserModel t = new SystemUserModel();

            string commandText = "SELECT * FROM SystemUsers WHERE LTRIM(Email) = '" + email + "'";

            InstitutionalInterfaceUtilities.Utilities.DatabaseReader reader = new InstitutionalInterfaceUtilities.Utilities.DatabaseReader(commandText, "");

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

            return t;
        }
    }
}