using PPDWebsite.Helpers;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PPDWebsite
{
    public partial class bookmarks : System.Web.UI.Page
    {

        string sqlConnectionString = "Data Source=.;Initial Catalog=PregnancyPrayer;Integrated Security=true;";
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

            RefreshTable();
        }


        public void RefreshTable()
        {
            string usersTableHTML = string.Empty;
            SqlConnection conn = new SqlConnection(sqlConnectionString);

            string htmlText = "";
            htmlText = File.ReadAllText(Server.MapPath("~/reusable_literals/bookmark.txt"));

            try
            {
                conn.Open();
            }
            catch (Exception ex)
            {
                //return ex.ToString();
                //show error
            }


            string commandString = "SELECT * FROM [tblBookmarks] WHERE userID = " + userID;
            SqlCommand command = new SqlCommand(commandString, conn);

            SqlDataReader dataReader = command.ExecuteReader();


            int x = 0;
            string bookline;

            while (dataReader.Read())
            {
                try
                {
                    //string userHTML = "<tr><td>" + "<b>Day " + dataReader["day"].ToString() + "</b></td><td>" + dataReader["prayer"].ToString().Substring(0, 100) + "...</td><td><a onclick=\"setEditSectionForm('" + dataReader["id"].ToString() + ");\" data-toggle='modal' data-target='#myModalNew' class='btn btn-primary'>View Prayer</a></td></tr>";

                    bookline = htmlText.Replace("DAYNO", "Day " + dataReader["day"].ToString()).Replace("SUMMARY", dataReader["prayer"].ToString().Substring(0, 100) + "...").Replace("BOOKMARKID", dataReader["id"].ToString()) ;
                
                    usersTableHTML += bookline;
                    ++x;
                }catch(Exception ex)
                {

                }
                

                
            }

            conn.Close();

            if (x == 1)
            {
                lblRecordCount.Text = "1 entry";
            }else
            {
                lblRecordCount.Text = x.ToString() + " entries";
            }

           
            this.ltrPrayers.Text = usersTableHTML;

        }

        protected void cmdBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("dashboard.aspx");
        }

        protected void cmdViewBookmark_Click(object sender, EventArgs e)
        {
            string dayNo = cmdViewBookmark.CommandArgument.ToString();
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
