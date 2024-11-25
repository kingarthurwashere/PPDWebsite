using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PPDWebsite
{
    public partial class settings_1 : System.Web.UI.Page
    {

        string sqlConnectionString = "Data Source=.;Initial Catalog=PregnancyPrayer;Integrated Security=true;";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cmdNext_Click(object sender, EventArgs e)
        {
            string userID = (string)Session["userID"];
            string theDay, theMonth, theYear;
            theDay = ddlDay.SelectedValue;
            theMonth = ddlMonth.SelectedValue;
            theYear = ddlYear.SelectedValue;
            
            DateTime theDate = DateTime.ParseExact(theDay + "/" + theMonth + "/" + theYear, "d/M/yyyy", new CultureInfo("en-US"));
            
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
            
            string commandString = "UPDATE [tblUsers] SET expectedBirthDate = '" + theDate.ToShortDateString() + "' WHERE id = " + userID;

            try
            {
                SqlCommand comm = new SqlCommand(commandString, conn);
                comm.ExecuteNonQuery();

                Response.Redirect("settings-2.aspx");
            }
            catch (Exception ex)
            {

            }
            finally
            {
                conn.Close();
            }
        }
    }
}