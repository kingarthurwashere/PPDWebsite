﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PPDWebsite
{
    public partial class devotional_management : System.Web.UI.Page
    {
        string sqlConnectionString = "Data Source=.;Initial Catalog=PregnancyPrayer;Integrated Security=true;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null || Session["loginValid"] == null)
            {
                Response.Redirect("login.aspx");
            }

            ltUserName.Text = Session["UserName"].ToString();
            RefreshTable();
        }

        public void RefreshTable()
        {
            string usersTableHTML = string.Empty;
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

            string commandString = "SELECT * FROM [tblDevotional] ORDER BY day ASC";
            SqlCommand command = new SqlCommand(commandString, conn);

            SqlDataReader dataReader = command.ExecuteReader();

            int x = 1;

            while (dataReader.Read())
            {
                string userHTML = "<tr><td>" + dataReader["Day"].ToString() + "</td><td>" + dataReader["Scripture"].ToString() + "</td><td>" + dataReader["Detail"].ToString() + "</td><td><a href='devotional_edit.aspx?id=" + dataReader["id"].ToString() + "'class='btn btn-primary btn-sm'>Edit Content</a></td></tr>";

                usersTableHTML += userHTML;

                ++x;
            }

            conn.Close();

            this.ltrContent.Text = usersTableHTML;

        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Session["UserID"] = null;
            Response.Redirect("login.aspx");
        }
    }
}