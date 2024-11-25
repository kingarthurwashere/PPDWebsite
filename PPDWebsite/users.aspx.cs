using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PPDWebsite
{
    public partial class users : System.Web.UI.Page
    {
        string sqlConnectionString = "Data Source=.;Initial Catalog=PregnancyPrayer;Integrated Security=true;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null || Session["loginValid"] == null)
            {
                Response.Redirect("login.aspx");
            }

            ltUserName.Text = Session["UserName"].ToString();

            RefreshTable();
        }


        public void RefreshTable()
        {
            string usersTableHTML = string.Empty;
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
                                 
            string commandString = "SELECT * FROM [tblUsers]";
            SqlCommand command = new SqlCommand(commandString, conn);

            SqlDataReader dataReader = command.ExecuteReader();

            int x = 1;

            while (dataReader.Read())
            {
                DateTime dueDate = (DateTime)dataReader["expectedBirthDate"];
                DateTime todayDate = DateTime.Today;

                int theDay = (int)(dueDate - todayDate).TotalDays;
                theDay = 280 - theDay;

                if (theDay >= 280)
                {
                    theDay = 280;
                }

                string source = dataReader["source"].ToString();
                if (source.Trim().Equals(""))
                {
                    source = "Mobile";
                }

                string userHTML = "<tr><td>" + dataReader["firstName"].ToString() + "</td><td>" + dataReader["surname"].ToString() + "</td><td>" + theDay.ToString() + "</td><td>" + dataReader["dateOfRegistration"].ToString() + "</td><td>" +  (dataReader["hasDevotional"].ToString().Equals("True") ? "Yes" : "No") + "</td><td>" + source.Replace("mobile", "Mobile") + "</td><td><a href='user.aspx?id=" + dataReader["id"].ToString() + "'class='btn btn-primary btn-sm'>View</a></td></tr>";

                usersTableHTML += userHTML;

                ++x;
            }

            conn.Close();

            this.ltrSections.Text = usersTableHTML;

        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Session["UserID"] = null;
            Response.Redirect("login.aspx");
        }
    }
}