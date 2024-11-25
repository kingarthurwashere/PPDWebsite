using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PPDWebsite
{
    public partial class content_edit : System.Web.UI.Page
    {
        string sqlConnectionString = "Data Source=.;Initial Catalog=PregnancyPrayer;Integrated Security=true;";
        string contentID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null || Session["loginValid"] == null)
            {
                Response.Redirect("login.aspx");
            }
            ltUserName.Text = Session["UserName"].ToString();

            contentID = Request.QueryString["id"];
            
            if (!IsPostBack)
            {
                displayContent();
            }
            
        }

        public void displayContent()
        {
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

            string commandString = "SELECT * FROM [tblMainContent] WHERE id = " + contentID;
            SqlCommand command = new SqlCommand(commandString, conn);

            SqlDataReader dataReader = command.ExecuteReader();


            while (dataReader.Read())
            {
                txtDailyDev.Text = dataReader["dailyDev"].ToString().Trim();
                txtWeekly.Text = dataReader["weeklyDev"].ToString().Trim();
                txtPrayer.Text = dataReader["prayer"].ToString().Trim();
                lblDay.Text = "Day " + dataReader["day"].ToString().Trim();
                
            }

            conn.Close();
        }


        protected void cmdSaveContent_Click(object sender, EventArgs e)
        {
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

            string commandString = "UPDATE [tblMainContent] SET dailyDev = '" + txtDailyDev.Text.Replace("'", "''") + "', weeklyDev = '" + txtWeekly.Text.Replace("'", "''") + "', prayer = '" + txtPrayer.Text.Replace("'", "''") + "' WHERE id = " + contentID;

            try
            {
                SqlCommand comm = new SqlCommand(commandString, conn);
                comm.ExecuteNonQuery();

                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successalert();", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "failedalert();", true);
            }
            finally
            {
                conn.Close();
            }
        }
    }
}