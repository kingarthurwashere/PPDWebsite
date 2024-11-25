using PPDWebsite.Helpers;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PPDWebsite
{
    public partial class settings : System.Web.UI.Page
    {
        string userID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] == null)
            {
                Response.Redirect("login.aspx");
            }

            userID = (string)Session["userID"];

            //display users name
            string theName = Utilities.GetDBUserFullName(userID, "id");
            lblUsersName.Text = theName;

            if (!IsPostBack)
            {
                loadProfileData();
            }
           
        }

        public void loadProfileData()
        {
            string sqlConnectionString = "Data Source=.;Initial Catalog=PregnancyPrayer;Integrated Security=true;";
            SqlConnection conn = new SqlConnection(sqlConnectionString);

            int theDay = 0;

            try
            {
                conn.Open();
            }
            catch (Exception ex)
            {
                Response.Redirect("Dashboard.aspx", false);
            }

            string commString = "SELECT * FROM [tblUsers] WHERE id = " + userID;

            SqlCommand command = new SqlCommand(commString, conn);

            SqlDataReader rdr = command.ExecuteReader();

            if (rdr.HasRows)
            {
                while (rdr.Read())
                {
                    DateTime dueDate = (DateTime)rdr["expectedBirthDate"];

                    txtFirstName.Text = rdr["firstName"].ToString().Trim();
                    txtSurname.Text = rdr["surname"].ToString().Trim();
                    txtEmail.Text = rdr["email"].ToString().Trim();
                    txtMobile.Text = rdr["phone"].ToString().Trim();
                    txtDueDate.Text = dueDate.ToShortDateString().Trim();
                }
            }
            else
            {
                theDay = 0;
            }
        }

        protected void cmdUpdate_Click(object sender, EventArgs e)
        {
            string sqlConnectionString = "Data Source=.;Initial Catalog=PregnancyPrayer;Integrated Security=true;";
            SqlConnection conn = new SqlConnection(sqlConnectionString);

            int theDay = 0;

            try
            {
                conn.Open();
            }
            catch (Exception ex)
            {
                Response.Redirect("Dashboard.aspx", false);
            }

            string commString = "UPDATE tblUsers SET firstName = '" + txtFirstName.Text + "', surname = '" + txtSurname.Text + "', email = '" + txtEmail.Text + "', phone = '" + txtMobile.Text + "', expectedBirthDate = '" + DateTime.Parse(txtDueDate.Text).ToShortDateString() + "' WHERE id = " + userID;

            SqlCommand command = new SqlCommand(commString, conn);

            int result = command.ExecuteNonQuery();

            conn.Close();

            loadProfileData();
            string theName = Utilities.GetDBUserFullName(userID, "id");
            lblUsersName.Text = theName;

        }
    }
}