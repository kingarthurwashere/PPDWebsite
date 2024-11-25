using PPDWebsite.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;


namespace PPDWebsite.Helpers
{
    public class Utilities
    {
        string sqlConnectionString = "Data Source=.;Initial Catalog=PregnancyPrayer;Integrated Security=true;";

        #region Security
        public static string HashPassword(string pass)
            {
                MD5 zialgorithm = MD5.Create();
                string hashedPass = ASCIIEncoding.ASCII.GetString(zialgorithm.ComputeHash(ASCIIEncoding.ASCII.GetBytes(pass)));
            
                SHA512 sha512 = SHA512Managed.Create();
                Byte[] bytes = Encoding.UTF8.GetBytes(pass);
                Byte[] hash = sha512.ComputeHash(bytes);

                StringBuilder stringBuilder = new StringBuilder();

                int i;
                int hashLen = hash.Length - 1;
                for (i = 0; i <= hashLen; i++)
                {
                    stringBuilder.Append(hash[i].ToString("X2"));
                }

                hashedPass = stringBuilder.ToString();          


                return hashedPass;
            }
        #endregion
       



        #region UserInformation
            public static string GetUserDetails(string userID)
            {
                return "";
            }

        public static int GetUserDays(string userID)
        {
            string sqlConnectionString = "Data Source=.;Initial Catalog=PregnancyPrayer;Integrated Security=true;";
            SqlConnection conn = new SqlConnection(sqlConnectionString);

            int theDay = 0;

            try
            {
                conn.Open();
            }
            catch (Exception ex)
            {
                return 0;
                //show error
            }

            string commString = "SELECT * FROM [tblUsers] WHERE id = " + userID;

            SqlCommand command = new SqlCommand(commString, conn);

            SqlDataReader rdr = command.ExecuteReader();

            if (rdr.HasRows)
            {
                while (rdr.Read())
                {
                    DateTime dueDate = (DateTime)rdr["expectedBirthDate"];
                    DateTime todayDate = DateTime.Today;

                    theDay = (int)(dueDate - todayDate).TotalDays;
                    theDay = 280 - theDay;

                    if (theDay >= 280)
                    {
                        theDay = 280;
                    }
                }
            }
            else
            {
                theDay = 0;
            }

            return theDay;
        }


        public static string GetUserWeek(string day)
        {

            string sqlConnectionString = "Data Source=.;Initial Catalog=PregnancyPrayer;Integrated Security=true;";
            SqlConnection conn = new SqlConnection(sqlConnectionString);

            string theWeek = "0";

            try
            {
                conn.Open();
            }
            catch (Exception ex)
            {
                return "0";
                //show error
            }

            string commString = "SELECT * FROM [tblMainContent] WHERE day = " + day;

            SqlCommand command = new SqlCommand(commString, conn);

            SqlDataReader rdr = command.ExecuteReader();

            if (rdr.HasRows)
            {
                while (rdr.Read())
                {
                    theWeek = rdr["week"].ToString().Trim();   
                    
                }
            }
            else
            {
                theWeek = "0";
            }

            return theWeek;
        }

        public static string GetUserMonth(string week)
        {
            string theMonth = "0";

            int theWeek = Int16.Parse(week);
            int intMonth = (int)(theWeek / 4) + 1;

            if (intMonth >= 9)
            {
                intMonth = 9;
            }
            return intMonth.ToString();
        }
    
        #endregion

        #region General Helpers
        public static bool RecordExists(string table, string field, string value)
            {
                bool exists = false;
                string sqlConnectionString = "Data Source=.;Initial Catalog=PregnancyPrayer;Integrated Security=true;";
                SqlConnection connection = new SqlConnection(sqlConnectionString);

                SqlCommand command = new SqlCommand("Select * from [" + table + "] where [" + field + "] = @recordvalue", connection);
                command.Parameters.Add(new SqlParameter("@recordvalue", value.Trim()));
                try
                {
                    connection.Open();

                    SqlDataReader dataReader = command.ExecuteReader();

                    if (dataReader.Read())
                    {
                        exists = true;
                    }

                    dataReader.Close();

                    connection.Close();
                }
                catch (Exception ex)
                {
                    //Utilities.LogError("RecordExists", ex);
                }

                return exists;
            }

        public static string GetDBUserID(string identifier,string searchBy)
        {

            string userID = "0";
            string sqlConnectionString = "Data Source=.;Initial Catalog=PregnancyPrayer;Integrated Security=true;";
            SqlConnection conn = new SqlConnection(sqlConnectionString);

            try
            {
                conn.Open();
            }
            catch (Exception e)
            {
                return null;
            }

            string commandString = "";

            if (searchBy.Equals("email"))
            {
                commandString = "SELECT * FROM [tblUsers] WHERE LTRIM(email) = '" + identifier + "'";
            }
            else
            {
                commandString = "SELECT * FROM [tblUsers] WHERE LTRIM(phone) = '" + identifier + "'";
            }

            SqlCommand comm = new SqlCommand(commandString, conn);
            SqlDataAdapter adapter = new SqlDataAdapter(comm);
            DataSet dat = new DataSet();

            adapter.Fill(dat);

            try
            {
                DataRow row = dat.Tables[0].Rows[0];
                userID = row["id"].ToString().Trim();
            }
            catch (Exception ex)
            {

            }
            finally
            {
                conn.Close();
            }

            return userID;
        }

        public static string GetDBUserFirstName(string identifier, string searchBy)
        {

            string userName = "-";
            string sqlConnectionString = "Data Source=.;Initial Catalog=PregnancyPrayer;Integrated Security=true;";
            SqlConnection conn = new SqlConnection(sqlConnectionString);

            try
            {
                conn.Open();
            }
            catch (Exception e)
            {
                return null;
            }

            string commandString = "";

            if (searchBy.Equals("email"))
            {
                commandString = "SELECT * FROM [tblUsers] WHERE LTRIM(email) = '" + identifier + "'";
            }
            else
            {
                commandString = "SELECT * FROM [tblUsers] WHERE LTRIM(phone) = '" + identifier + "'";
            }

            SqlCommand comm = new SqlCommand(commandString, conn);
            SqlDataAdapter adapter = new SqlDataAdapter(comm);
            DataSet dat = new DataSet();

            adapter.Fill(dat);

            try
            {
                DataRow row = dat.Tables[0].Rows[0];
                userName = row["firstName"].ToString().Trim();
            }
            catch (Exception ex)
            {

            }
            finally
            {
                conn.Close();
            }

            return userName;
        }

        public static string GetDBUserFullName(string identifier, string searchBy)
        {

            string userName = "-";
            string sqlConnectionString = "Data Source=.;Initial Catalog=PregnancyPrayer;Integrated Security=true;";
            SqlConnection conn = new SqlConnection(sqlConnectionString);

            try
            {
                conn.Open();
            }
            catch (Exception e)
            {
                return null;
            }

            string commandString = "";

            if (searchBy.Equals("email"))
            {
                commandString = "SELECT * FROM [tblUsers] WHERE LTRIM(email) = '" + identifier + "'";
            }
            else if (searchBy.Equals("phone"))
            {
                commandString = "SELECT * FROM [tblUsers] WHERE LTRIM(phone) = '" + identifier + "'";
            }else if (searchBy.Equals("id"))
            {
                commandString = "SELECT * FROM [tblUsers] WHERE id = " + identifier;
            }

            SqlCommand comm = new SqlCommand(commandString, conn);
            SqlDataAdapter adapter = new SqlDataAdapter(comm);
            DataSet dat = new DataSet();

            adapter.Fill(dat);

            try
            {
                DataRow row = dat.Tables[0].Rows[0];
                userName = row["firstName"].ToString().Trim() + " " + row["surname"].ToString().Trim();
            }
            catch (Exception ex)
            {

            }
            finally
            {
                conn.Close();
            }

            return userName;
        }
        
        public static string GetPrayerText(string contentID)
        {
            string prayer = "-";
            string sqlConnectionString = "Data Source=.;Initial Catalog=PregnancyPrayer;Integrated Security=true;";
            SqlConnection conn = new SqlConnection(sqlConnectionString);

            try
            {
                conn.Open();
            }
            catch (Exception e)
            {
                return null;
            }

            string commandString = "";

            commandString = "SELECT * FROM [tblMainContent] WHERE id = " + contentID;
            

            SqlCommand comm = new SqlCommand(commandString, conn);
            SqlDataAdapter adapter = new SqlDataAdapter(comm);
            DataSet dat = new DataSet();

            adapter.Fill(dat);

            try
            {
                DataRow row = dat.Tables[0].Rows[0];
                prayer = row["prayer"].ToString().Trim();
            }
            catch (Exception ex)
            {

            }
            finally
            {
                conn.Close();
            }

            return prayer;
        }

        public static string GetWeekForDay(string day)
        {
            string week = "-";
            string sqlConnectionString = "Data Source=.;Initial Catalog=PregnancyPrayer;Integrated Security=true;";
            SqlConnection conn = new SqlConnection(sqlConnectionString);

            try
            {
                conn.Open();
            }
            catch (Exception e)
            {
                return null;
            }

            string commandString = "";

            commandString = "SELECT * FROM [tblMainContent] WHERE id = " + day;


            SqlCommand comm = new SqlCommand(commandString, conn);
            SqlDataAdapter adapter = new SqlDataAdapter(comm);
            DataSet dat = new DataSet();

            adapter.Fill(dat);

            try
            {
                DataRow row = dat.Tables[0].Rows[0];
                week = row["week"].ToString().Trim();
            }
            catch (Exception ex)
            {

            }
            finally
            {
                conn.Close();
            }

            return week;
        }
        #endregion

        public static List<UserModel> GetRegisteredUsers()
        {
            List<UserModel> users = new List<UserModel>();

            string commandText = "SELECT * FROM tblUsers";

            InstitutionalInterfaceUtilities.Utilities.DatabaseReader reader = new InstitutionalInterfaceUtilities.Utilities.DatabaseReader(commandText, "");

            if (reader.Reader == null)
            {
                return users;
            }

            while (reader.Reader.Read())
            {
                UserModel u = new UserModel();

                u.id =(int) reader.Reader["id"];
               u.firstName = reader.Reader["firstName"].ToString().Trim();
                u.surname = reader.Reader["surname"].ToString().Trim();
                u.dateOfRegistration = DateTime.Parse(reader.Reader["dateOfRegistration"].ToString());
                u.email = reader.Reader["email"].ToString().Trim();
                u.source = reader.Reader["source"].ToString().Trim();

                users.Add(u);
            }

            reader.Close();

            return users;
        }
    }
}