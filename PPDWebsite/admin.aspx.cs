using PPDWebsite.Helpers;
using PPDWebsite.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PPDWebsite
{
    public partial class admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null || Session["loginValid"] == null)
            {
                Response.Redirect("login.aspx");
            }

            ltUserName.Text = Session["UserName"].ToString();
        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Session["UserID"] = null;
            Response.Redirect("login.aspx");
        }

        [WebMethod]
        public static object GetRegistrationsInYear()
        {
            int x = 0;

            List<int> dataStringMobile = new List<int>();
            List<int> dataStringWeb = new List<int>();

            int startMonth = 0;
            int endMonth = 1;

            List<String> labelsArr = new List<string>();
            labelsArr.AddRange(new string[] { "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" });
                startMonth = 1;
                endMonth = 13;
      

            for (var i = startMonth; i < endMonth; i++)
            {
                    dataStringMobile.Add(getSumForMonth(i, "mobile"));
                    dataStringWeb.Add(getSumForMonth(i, "web"));
              
                x++;
            }

            string[] colors = { "rgba(153, 102, 255, 0.5)", "rgba(255, 159, 64, 0.5)" };
            List<String> colorsArr = new List<string>(colors);

            List<Object> chartData = new List<object>();
            chartData.Add(labelsArr);

                chartData.Add(dataStringMobile);
                chartData.Add(dataStringWeb);
           
            return chartData;
        }

        private static int getSumForMonth(int month, string source)
        {
            string total = String.Empty;
            int year = DateTime.Now.Year;

            List<UserModel> users = Utilities.GetRegisteredUsers();
            List<UserModel> filteredUsers = Utilities.GetRegisteredUsers();

          
            filteredUsers = users.Where(o => o.dateOfRegistration.Month == month && o.source.Equals(source)).ToList();
          
            int count = filteredUsers.Count();

            return count;
        }

    }
}