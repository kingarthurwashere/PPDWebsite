using PPDWebsite.Helpers;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.IO;

namespace PPDWebsite
{
    public partial class user : System.Web.UI.Page
    {
        string sqlConnectionString = "Data Source=.;Initial Catalog=PregnancyPrayer;Integrated Security=true;";
        string userID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null || Session["loginValid"] == null)
            {
                Response.Redirect("login.aspx");
            }

            ltUserName.Text = Session["UserName"].ToString();

            userID = Request.QueryString["id"];
           
            loadUserInfo();
        }

        public void loadUserInfo()
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

            string commandString = "SELECT * FROM [tblUsers] WHERE id = " + userID;
            SqlCommand command = new SqlCommand(commandString, conn);

            SqlDataReader dataReader = command.ExecuteReader();


            while (dataReader.Read())
            {
                string userHTML = "<tr><td>" + dataReader["firstName"].ToString() + "</td><td>" + dataReader["surname"].ToString() + "</td><td>" + dataReader["currentPregnancyDay"].ToString() + "</td><td>" + dataReader["dateOfRegistration"].ToString() + "</td><td><a href='user.aspx?id=" + dataReader["id"].ToString() + "'class='btn btn-primary btn-sm'>View</a></td></tr>";

                lblUsername.Text = dataReader["firstName"].ToString() + " " + dataReader["surname"].ToString();
                lblEmailAd.Text = dataReader["email"].ToString();
                lblPhoneNo.Text = dataReader["phone"].ToString();
                lblRegDate.Text = DateTime.Parse(dataReader["dateOfRegistration"].ToString()).ToShortDateString();
                lblLastLogin.Text = dataReader["lastLoginDate"].ToString();

                lblJournalEntries.Text = getJournalCount();
                lblLoginCount.Text = dataReader["loginCount"].ToString();
                lblSavedPrayers.Text = getBookmarkCount();

                lblDay.Text = "Day " + Helpers.Utilities.GetUserDays(userID).ToString();
            }

            conn.Close();

        }

        public string getJournalCount()
        {
            string count = "1";

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

            string commandString = "SELECT COUNT (*) FROM [tblJournals] WHERE userID = " + userID;
            SqlCommand command = new SqlCommand(commandString, conn);

            count = command.ExecuteScalar().ToString();

            conn.Close();

            return count;
        }

        public string getBookmarkCount()
    {
        string count = "1";

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

        string commandString = "SELECT COUNT (*) FROM [tblBookmarks] WHERE userID = " + userID;
        SqlCommand command = new SqlCommand(commandString, conn);

        count = command.ExecuteScalar().ToString();

        conn.Close();

        return count;
    }

        protected void cmdExportJournal_Click(object sender, EventArgs e)
        {
            //try
            //{
                Document pdfDoc = new Document(PageSize.A4, 25, 10, 25, 10);
                PdfWriter pdfWriter = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
                //pdfDoc.Open();

                string imageFilePath = Server.MapPath("~/img/journal/back_1.png");
                iTextSharp.text.Image jpg = iTextSharp.text.Image.GetInstance(imageFilePath);
                
                jpg.ScaleToFit(3000, 770);

                //If you want to choose image as background then,
                jpg.Alignment = iTextSharp.text.Image.UNDERLYING;

                //If you want to give absolute/specified fix position to image.
                jpg.SetAbsolutePosition(30, 50);
            
                pdfDoc.Open();

            //*****************************************************************************************
            //
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
            
            string commandString = "SELECT * FROM [tblJournals] ORDER BY id DESC";
            SqlCommand command = new SqlCommand(commandString, conn);

            SqlDataReader dataReader = command.ExecuteReader();
           
            while (dataReader.Read())
            {
                //string userHTML = "<tr><td>" + "<b>Day " + dataReader["day"].ToString() + "</b></td><td>" + dataReader["prayer"].ToString().Substring(0, 100) + "...</td><td><a onclick=\"setEditSectionForm('" + dataReader["id"].ToString() + ");\" data-toggle='modal' data-target='#myModalNew' class='btn btn-primary'>View Prayer</a></td></tr>";
                string week = Helpers.Utilities.GetWeekForDay(dataReader["pregnancyDay"].ToString());
                string day = dataReader["pregnancyDay"].ToString();
                string text = dataReader["notes"].ToString();
                string prayer = Helpers.Utilities.GetPrayerText(dataReader["prayer"].ToString());

                pdfDoc.NewPage();

                pdfDoc.Add(jpg);

                //drawing the week                
                PdfContentByte cbWeek = pdfWriter.DirectContent;
                ColumnText weekColumn = new ColumnText(cbWeek);
                weekColumn.SetSimpleColumn(new Phrase(new Chunk(week, FontFactory.GetFont(FontFactory.HELVETICA, 32, Font.NORMAL))),
                                            100, 50, 72 * 3, 745, 0, Element.ALIGN_TOP);
                weekColumn.Go();

                //drawing the day               
                PdfContentByte cbDay = pdfWriter.DirectContent;
                ColumnText dayColumn = new ColumnText(cbDay);
                dayColumn.SetSimpleColumn(new Phrase(new Chunk(day, FontFactory.GetFont(FontFactory.HELVETICA, 32, Font.NORMAL))),
                                            100, 50, 72 * 3, 620, 0, Element.ALIGN_TOP);
                dayColumn.Go();

                //drawing journal text                
                PdfContentByte cb = pdfWriter.DirectContent;
                //cb.SetLineWidth(1);
                //cb.Rectangle(32, 190, 525, 340);
                //cb.Stroke();
                ColumnText ct = new ColumnText(cb);
                ct.SetSimpleColumn(new Phrase(new Chunk(text, FontFactory.GetFont(FontFactory.HELVETICA, 16, Font.NORMAL))),
                                    32, -200, 525, 340, 16, Element.ALIGN_TOP);
                ct.Alignment = Element.ALIGN_TOP | Element.ALIGN_LEFT;
                ct.Go();


                //drawing journal text
                
                PdfContentByte cbPrayer = pdfWriter.DirectContent;
                //cbPrayer.SetLineWidth(1);
                //cbPrayer.Rectangle(32, 100, 525, 10);
                //cbPrayer.Stroke();
                ColumnText ctPrayer = new ColumnText(cb);
                ctPrayer.SetSimpleColumn(new Phrase(new Chunk(prayer, FontFactory.GetFont(FontFactory.HELVETICA, 16, Font.NORMAL))),
                                    32, -100, 525, 140, 16, Element.ALIGN_TOP);
                ctPrayer.Alignment = Element.ALIGN_TOP | Element.ALIGN_LEFT;
                ctPrayer.Go();

                
            }

            conn.Close();


            

            pdfDoc.Close();

                Response.Buffer = true;
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition", "attachment;filename=Journal.pdf");
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.Write(pdfDoc);
                Response.End();

            //}
            //catch (Exception ex)
            ///{ Response.Write(ex.Message); }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Document doc = new Document(PageSize.LETTER);
            PdfWriter writer = PdfWriter.GetInstance(doc, Response.OutputStream);
            doc.Open();
            PdfContentByte cb = writer.DirectContent;
            ColumnText column1 = new ColumnText(cb);
            column1.SetSimpleColumn(72, 72, 72 * 3, 72 * 10);
            column1.AddElement(new Paragraph("sample text"));
            column1.Go();
            doc.Close();

            Response.Buffer = true;
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=Example.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Write(doc);
            Response.End();
        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Session["UserID"] = null;
            Response.Redirect("login.aspx");
        }
    }


    
}
