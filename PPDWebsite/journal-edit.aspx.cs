using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PPDWebsite.AppCode;
using Newtonsoft.Json;
using System.Data.SqlClient;
using PPDWebsite.Helpers;

namespace PPDWebsite
{
    public partial class journal_edit : System.Web.UI.Page
    {
        string sqlConnectionString = "Data Source=.;Initial Catalog=PregnancyPrayer;Integrated Security=true;";
        string buttonText = "<a id='cmdAttachImg' class='btn btn-pink btn-block' style='margin-top:28px' href='#uploadModal' data-toggle='modal'><i class='ti-upload'>&nbsp;</i>Attach Image</a>";
        string selectedFileName = "-";
        string userID;
		string imageDownloadUrl;


		protected void Page_Load(object sender, EventArgs e)
        {   /*
            if (Session["userID"] == null)
            {
                Response.Redirect("login.aspx");
            }

            userID = Session["userID"].ToString();
			*/

			userID = "1";

            //display users name
            string theName = Utilities.GetDBUserFullName(userID, "id");
            lblUsersName.Text = theName;


            if (!IsPostBack)
            {
                ltrPhoto.Text = buttonText;
                /*
                string[] filePaths = Directory.GetFiles(Server.MapPath("~/JournalUploads/"));
                List<ListItem> files = new List<ListItem>();
                foreach (string filePath in filePaths)
                {
                    string fileName = Path.GetFileName(filePath);
                    files.Add(new ListItem(fileName, "~/JournalUploads/" + fileName));
                }
                */
            }
            else
            {
                //string fil = FileUpload1.PostedFile.FileName;
            }
        }

        protected async void cmdAttach_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string fileName = userID + "_" + DateTime.Now.Millisecond + "_" + Path.GetFileName(FileUpload1.PostedFile.FileName);

				imageDownloadUrl = await FireBaseFunctions.UploadFirebaseFile(FileUpload1.PostedFile.InputStream, userID, FileUpload1.PostedFile.FileName); 
                //FileUpload1.PostedFile.SaveAs(Server.MapPath("~/JournalUploads/") + fileName);
                //Response.Redirect(Request.Url.AbsoluteUri);



				/*
                selectedFileName = fileName;
                Session["attachedImage"] = fileName;
                //show the image preview
                string thumbnailText = "";
                thumbnailText = File.ReadAllText(Server.MapPath("~/reusable_literals/imagethumb.txt"));
                thumbnailText = thumbnailText.Replace("FILENAME", "JournalUploads/" + fileName );
                ltrPhoto.Text = thumbnailText;
				*/
            }
        }

        protected void cmdCloseThumb_Click(object sender, EventArgs e)
        {
            selectedFileName = "-";
            Session["attachedImage"] = "-";
            ltrPhoto.Text = buttonText;
        }


       [System.Web.Services.WebMethod]
        public static string closePic()
        {
            //ScriptManager.RegisterStartupScript(journal_edit, this.GetType(), System.Guid.NewGuid().ToString(), "showSaveAlert();", true);
            string thumbnailText = "";
            //thumbnailText = File.ReadAllText(Server.MapPath("~/reusable_literals/imagethumb.txt"));
            thumbnailText = thumbnailText.Replace("FILENAME", "/JournalUploads/" + "pic");
            

            Page page = (Page)HttpContext.Current.Handler;
            Literal ltr = (Literal)page.FindControl("ltrPhoto");

            ltr.Text = thumbnailText;
            return JsonConvert.SerializeObject("1 2 3 testing");
        }

        protected void cmdSave_Click(object sender, EventArgs e)
        {
            string heading = txtJournalHeading.Text;
            string body = txtJournalBody.Text;
            string userID = (string)Session["userID"];
            string pregDay = Helpers.Utilities.GetUserDays(userID).ToString();

            SqlConnection conn = new SqlConnection(sqlConnectionString);

            if (heading.Equals(""))
            {
                return;
            }

            if (body.Equals(""))
            {
                return;
            }

            try
            {
                conn.Open();
            }
            catch (Exception ex)
            {
                //return ex.ToString();
                //show error
            }

            try
            {
                selectedFileName = Session["attachedImage"].ToString();
                if (selectedFileName.Equals(""))
                {
                    selectedFileName = "-";
                }
            }catch(Exception ex)
            {
                selectedFileName = "-";
            }
            
            string commandString = "INSERT INTO tblJournals ([userID] ,[date],[pregnancyDay],[topic],[notes],[attachments]) VALUES ('" +
                userID + "','" +
                DateTime.Now.ToShortDateString() + "'," +
                pregDay + ",'" +
                heading + "','" +
                body + "','" +
                selectedFileName + "')";

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