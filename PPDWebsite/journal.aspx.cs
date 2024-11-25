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
    public partial class journal : System.Web.UI.Page
    {
        string jid;
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


            jid = Request.QueryString["entry"];

            GetJournalDetails();
        }

        protected void cmdAttach_Click(object sender, EventArgs e)
        {
           
        }

        public void GetJournalDetails()
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


            string commandString = "SELECT * FROM [tblJournals] WHERE id = " + jid;
            SqlCommand command = new SqlCommand(commandString, conn);

            SqlDataReader dataReader = command.ExecuteReader();

            int x = 0;
           
            while (dataReader.Read())
            {
                lblJournalHeading.Text = dataReader["topic"].ToString();
                lblCreatedDate.Text = DateTime.Parse(dataReader["date"].ToString()).ToShortDateString();
                lblJournalBody.Text = dataReader["notes"].ToString();

                ltrDeleteButton.Text = @"<a class='btn btn-pink btn-block' onclick='deleteEntry(" + jid + ")'><i class='ti-trash'>&nbsp;</i>Delete Entry</a>";
                
                //load the attached images
                string fileName = dataReader["attachments"].ToString();
				string imageLink = dataReader["firebaseDownloadUrl"].ToString();

                if (fileName.Equals("-"))
                {
                    imgGallery.Visible = false;
                }

                imgAttachment.Text = "<img alt='Attachment' src='" + imageLink + "' style='height:100%;'/>";

                ++x;
            }

            conn.Close();
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