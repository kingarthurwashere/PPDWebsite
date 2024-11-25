using PPDWebsite.Helpers;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PPDWebsite
{
    public partial class bookmark : System.Web.UI.Page
    {
        string sqlConnectionString = "Data Source=.;Initial Catalog=PregnancyPrayer;Integrated Security=true;";

        string userID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] == null)
            {
                Response.Redirect("login.aspx");
            }

            userID = Session["userID"].ToString();
            //display users name
            string theName = Utilities.GetDBUserFullName(userID, "id");
            lblUsersName.Text = theName;


            String bid = Request.QueryString["id"];

            displayUserContent(bid);
        }

        public void displayUsersname(String bid)
        {
            string theName = Utilities.GetDBUserFullName(userID, "id");
            lblUsersName.Text = theName;
        }

        public void displayUserContent(string bid)
        {
            SqlConnection conn = new SqlConnection(sqlConnectionString);
            String prayerDay, prayer;

            try
            {
                conn.Open();
            }
            catch (Exception ex)
            {
                //return ex.ToString();
                //show error
            }

            string commString = "SELECT * FROM [tblBookmarks] WHERE id = " + bid ;

            SqlCommand command = new SqlCommand(commString, conn);

            SqlDataReader rdr = command.ExecuteReader();

            if (rdr.HasRows)
            {
                while (rdr.Read())
                {

                    prayerDay = rdr["day"].ToString();
                    prayer = rdr["prayer"].ToString();
                   
                    //assigning the data to the relevant label
                    lblBookmarkHeading.Text = "DAY " + prayerDay;
                    lblBookmarkBody.Text = prayer;

                    ltrDeleteButton.Text = @"<a class='btn btn-pink btn-block' onclick='deleteBookmark(" + bid + ")'><i class='ti-trash'>&nbsp;</i>Delete Entry</a>";

                }
            }
            else
            {
                Console.Write("no data found");
            }
        }

        [WebMethod]
        public static string DeleteBookmarkEntry(string jid)
        {
            string result = "0";

            SqlConnection conn = new SqlConnection("Data Source=.;Initial Catalog=PregnancyPrayer;Integrated Security=true;");

            try
            {
                conn.Open();

                string commandString = "DELETE FROM [tblBookmarks] WHERE id = " + jid;
                SqlCommand command = new SqlCommand(commandString, conn);

                command.ExecuteNonQuery();

                result = "1";

            }
            catch (Exception ex)
            {
                //return ex.ToString();
                //show error
            }


            return result;
        }
    }
}