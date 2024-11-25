using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PPDWebsite
{
    public partial class devotional_edit : System.Web.UI.Page
    {
        string sqlConnectionString = "Data Source=.;Initial Catalog=PregnancyPrayer;Integrated Security=true;";
        string contentID;

        protected void Page_Load(object sender, EventArgs e)
        {

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

            string commandString = "SELECT * FROM [tblDevotional] WHERE id = " + contentID;
            SqlCommand command = new SqlCommand(commandString, conn);

            SqlDataReader dataReader = command.ExecuteReader();


            while (dataReader.Read())
            {
                txtScripture.Text = dataReader["Scripture"].ToString().Trim();
                txtDetail.Text = dataReader["Detail"].ToString().Trim();
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

            string commandString = "UPDATE [tblDevotional] SET Scripture = '" + txtScripture.Text.Replace("'", "''") + "', Detail = '" + txtDetail.Text.Replace("'","''") + "' WHERE id = " + contentID;

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

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Session["UserID"] = null;
            Response.Redirect("login.aspx");
        }
    }
}