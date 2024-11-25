using PPDWebsite.AppCode;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PPDWebsite.Helpers;
using System.Web.Services;
using System.Web.Script.Serialization;

namespace PPDWebsite
{
    public partial class dashboard : System.Web.UI.Page
    {
        string sqlConnectionString = "Data Source=.;Initial Catalog=PregnancyPrayer;Integrated Security=true;";
        
        string actualClientDay, currentDailyDev, currentWeeklyDev, currentScripture, currentPrayer, currentDetail, currentDay, currentWeek, weeklyNotes, trimesterNotes;
        string hasDevotional;
        string userID;

        protected void cmdSavePrayer_Click(object sender, EventArgs e)
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

            string commString = "INSERT INTO tblBookmarks (day, prayer, userID) VALUES (" + currentDay + ", '" + currentPrayer + "', " + userID + ")";

            SqlCommand command = new SqlCommand(commString, conn);
            try
            {
                command.ExecuteNonQuery();
                ShowSaveAlert();

            }catch(Exception ex)
            {
                ShowFailedAlert();
            }
           
            conn.Close();
            
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] == null)
            {
                Response.Redirect("login.aspx");
            }

            userID = (string)Session["userID"];

            Session["hasDevotional"] = doesHaveDevotional().ToString();
            hasDevotional = (string)Session["hasDevotional"];

            //display users name
            string theName = Utilities.GetDBUserFullName(userID, "id");
            lblUsersName.Text = theName;

            if (!IsPostBack)
            {
                currentDay = Utilities.GetUserDays(Session["userID"].ToString()).ToString();
                
                Session["currentDay"] = currentDay;
                actualClientDay = currentDay;
                Session["actualDay"] = actualClientDay;

                cmdNext.Visible = false;
            }
            else
            {
                currentDay = Session["currentDay"].ToString();
            }

            if (hasDevotional.ToUpper().Equals("TRUE"))
            {
                divDevotional.Visible = true;
                divBuyDevotional.Visible = false;
            }else
            {
                divDevotional.Visible = false;
                divBuyDevotional.Visible = true;
            }
            
            currentWeek = Utilities.GetUserWeek(currentDay);


            this.displayDevelopmentImage();

            this.displayUserContent(currentDay);
            this.displayDevotionalUserContent(currentDay);

        }

        protected void cmdPrevious_Click(object sender, EventArgs e)
        {
            if (!currentDay.Equals("1"))
            {
                int intDay = Int16.Parse(currentDay);
                //decrement the day
                intDay = intDay - 1;
                       
                currentDay = intDay.ToString();
                Session["currentDay"] = currentDay;

                currentWeek = Utilities.GetUserWeek(currentDay);

                this.displayDevelopmentImage();

                this.displayUserContent(currentDay);
                this.displayDevotionalUserContent(currentDay);

                cmdNext.Visible = true;
            }
        }

        protected void cmdNext_Click(object sender, EventArgs e)
        {
            if (!currentDay.Equals(Session["actualDay"]))
            {
                int intDay = Int16.Parse(currentDay);
                //decrement the day
                intDay = intDay + 1;

                currentDay = intDay.ToString();
                Session["currentDay"] = currentDay;

                currentWeek = Utilities.GetUserWeek(currentDay);

                this.displayDevelopmentImage();

                this.displayUserContent(currentDay);
                this.displayDevotionalUserContent(currentDay);

                if (currentDay.Equals(Session["actualDay"]))
                {
                    cmdNext.Visible = false;
                }
            }
            else
            {
                cmdNext.Visible = false;
            }
            
        }

        public void displayUsersname()
        {
            string theName = Utilities.GetDBUserFullName(userID,"id");
            lblUsersName.Text = theName;
        }


        public void displayDevelopmentImage()
        {
            string theMonth = Utilities.GetUserMonth(currentWeek);

            imgDevelopment.ImageUrl = "~/img/months/month_" + theMonth + ".png";
        }

        public void displayUserContent(string theDay)
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

            string commString = "SELECT * FROM [tblMainContent] WHERE day = " + theDay;

            SqlCommand command = new SqlCommand(commString, conn);

            SqlDataReader rdr = command.ExecuteReader();

            if (rdr.HasRows)
            {
                while (rdr.Read())
                {

                    currentDailyDev = rdr["dailydev"].ToString();
                    currentWeeklyDev = rdr["weeklydev"].ToString();
                    currentPrayer = rdr["prayer"].ToString();

                    //assigning the data to the relevant label
                    lblDevotionalDay.Text = "DAY " + currentDay;
                    lblDailyDev.Text = currentDailyDev;
                    lblDayNumber2.Text = "DAY " + currentDay;
                    lblPrayer.Text = currentPrayer;
                }
            }
            else
            {
                Console.Write("no data found");
            }
        }

        protected void ShowSaveAlert()
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "showSaveAlert();", true);
        }

        protected void ShowFailedAlert()
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "showFailedAlert();", true);
        }

        public void displayDevotionalUserContent(string theDay)
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

            string commString = "SELECT * FROM [tblDevotional] WHERE Day = " + theDay;

            SqlCommand command = new SqlCommand(commString, conn);

            SqlDataReader rdr = command.ExecuteReader();

            if (rdr.HasRows)
            {
                while (rdr.Read())
                {

                    currentScripture = rdr["Scripture"].ToString();
                    currentDetail = rdr["Detail"].ToString();
                    trimesterNotes = GetTrimesterDetail(rdr["Trimester"].ToString());
                    weeklyNotes = GetWeeklyDetail(rdr["Week"].ToString());

                    lblDayNumber.Text = "DAY " + currentDay;
                    lblDailyDev.Text = currentDailyDev;
                    lblDayNumber2.Text = "DAY " + currentDay;
                    lblScripture.Text = currentScripture;
                    lblDetail.Text = currentDetail;

                    lblTrimester.Text = trimesterNotes;
                    lblWeekly.Text = weeklyNotes;
                }
            }
            else
            {
                Console.Write("no data found");
            }
        }

        public string GetWeeklyDetail(string week)
        {
            string detail = string.Empty;

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

            string commString = "SELECT * FROM [tblDevotionalWeekly] WHERE Week = " + week;

            SqlCommand command = new SqlCommand(commString, conn);

            SqlDataReader rdr = command.ExecuteReader();

            if (rdr.HasRows)
            {
                while (rdr.Read())
                {

                    detail = rdr["Detail"].ToString();
                }
            }
            else
            {
                Console.Write("no data found");
            }

            return detail;
        }

        public string GetTrimesterDetail(string trimester)
        {
            string detail = string.Empty;

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

            string commString = "SELECT * FROM [tblDevotionalTrimesters] WHERE Trimester = " + trimester;

            SqlCommand command = new SqlCommand(commString, conn);

            SqlDataReader rdr = command.ExecuteReader();

            if (rdr.HasRows)
            {
                while (rdr.Read())
                {

                    detail = rdr["Detail"].ToString();
                }
            }
            else
            {
                Console.Write("no data found");
            }

            return detail;
        }

        private bool doesHaveDevotional ()
        {
            bool has = false;

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

            string commString = "SELECT * FROM [tblUsers] WHERE id = " + userID;

            SqlCommand command = new SqlCommand(commString, conn);

            SqlDataReader rdr = command.ExecuteReader();
			try
			{
				if (rdr.HasRows)
				{
					while (rdr.Read())
					{
						has = bool.Parse(rdr["hasDevotional"].ToString());
					}
				}
				else
				{
                
				}
			}catch(Exception ex)
			{

			}
           

            return has;
        }

        [WebMethod]
        public static string CompletePurchase(string details)
        {
            
            JavaScriptSerializer jsonSerializer = new JavaScriptSerializer();
            dynamic dobj = jsonSerializer.Deserialize<dynamic>(details);
            string create_time = dobj["create_time"].ToString();
            string id = dobj["id"].ToString();
            string status = dobj["status"].ToString();
            string email = dobj["payer"]["email_address"];
            string payer_id = dobj["payer"]["payer_id"];
            string value = dobj["purchase_units"][0]["amount"]["value"];
            string currency_code = dobj["purchase_units"][0]["amount"]["currency_code"];


            if (status.Equals("COMPLETED"))
            {
                savePayPalData(create_time, id, status, email, payer_id, value, currency_code);
            }

            return "1";
        }

        public static void savePayPalData(string create_time, string id, string status, string email, string payer_id, string value, string currency_code)
        {
            string userID = HttpContext.Current.Session["userID"].ToString();

            string sqlConnectionString = "Data Source=.;Initial Catalog=PregnancyPrayer;Integrated Security=true;";
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


            string commandString = "INSERT INTO PayPalTransactions (userID, create_time, transaction_id, status, email, payer_id, value, currency_code) VALUES ('" +
                userID + "','" +
                create_time + "','" +
                id + "','" +
                status + "','" +
                email + "','" +
                payer_id + "','" +
                value + "','" +
                currency_code + "'); UPDATE tblUsers SET hasDevotional = 1 WHERE ID = " + userID;

            try
            {
                SqlCommand comm = new SqlCommand(commandString, conn);
                comm.ExecuteNonQuery();

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