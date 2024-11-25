using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Web.Services;
using PPDWebsite.Helpers;

namespace PPDWebsite
{
    public partial class journal_list : System.Web.UI.Page
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


            RefreshTable();
        }

        protected void cmdAttach_Click(object sender, EventArgs e)
        {
           
        }

        public void RefreshTable()
        {
            string usersTableHTML = string.Empty;
            SqlConnection conn = new SqlConnection(sqlConnectionString);

            string htmlText = "";
            htmlText = File.ReadAllText(Server.MapPath("~/reusable_literals/journal.txt"));

            try
            {
                conn.Open();
            }
            catch (Exception ex)
            {
                //return ex.ToString();
                //show error
            }


            string commandString = "SELECT * FROM [tblJournals] WHERE userID = " + userID + " ORDER BY id DESC";
            SqlCommand command = new SqlCommand(commandString, conn);

            SqlDataReader dataReader = command.ExecuteReader();

        
            int x = 0;
            string bookline;

            while (dataReader.Read())
            {
                bookline = htmlText.Replace("SUMMARY", dataReader["topic"].ToString() + "...").Replace("JID",dataReader["id"].ToString()).Replace("JDATE", DateTime.Parse(dataReader["date"].ToString()).ToShortDateString() + " (Day " + dataReader["pregnancyDay"].ToString() + ")" );
               
                usersTableHTML += bookline;

                ++x;
            }

            conn.Close();

            if (x == 1)
            {
                lblRecordCount.Text = "1 entry";
            }
            else
            {
                lblRecordCount.Text = x.ToString() + " entries";
            }


            this.ltrJournal.Text = usersTableHTML;

        }


        [WebMethod]
        public static string DeleteJournalEntry(string jid)
        {
            string result = "0";

            SqlConnection conn = new SqlConnection("Data Source=.;Initial Catalog=PregnancyPrayer;Integrated Security=true;");

            try
            {
                conn.Open();

                string commandString = "DELETE FROM [tblJournals] WHERE id = " + jid;
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