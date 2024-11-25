using PPDWebsite.Helpers;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PPDWebsite
{
    public partial class devotional : System.Web.UI.Page
    {
        string sqlConnectionString = "Data Source=.;Initial Catalog=PregnancyPrayer;Integrated Security=true;";
        string actualClientDay, currentDailyDev, currentWeeklyDev, currentScripture, currentDetail, currentDay, currentWeek, weeklyNotes, trimesterNotes;

        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] == null)
            {
                Response.Redirect("login.aspx");
            }

            string userID = (string)Session["userID"];

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


            currentWeek = Utilities.GetUserWeek(currentDay);

            this.displayDevelopmentImage();

            this.displayUserContent(currentDay);

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

        protected void ShowSaveAlert()
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "showSaveAlert();", true);
        }

        protected void ShowFailedAlert()
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "showFailedAlert();", true);
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
    }
}