using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InstitutionalInterfaceUtilities
{
    public partial class Utilities
    {

        public static string DBCONNECTIONSTRING(string database)
        {
            //return @"Data Source=VMI238911\CENTRICSQL1;Initial Catalog=TestDB;Integrated Security=True;";
            return @"Data Source=.;Initial Catalog=PregnancyPrayer;Integrated Security=True;";
        }


        //Insert, Update and Delete records
        public static int ExecuteNonQuery(SqlCommand sqlCommand, string database = "")
        {
            int x = -1;

            using (SqlConnection connection = new SqlConnection(DBCONNECTIONSTRING(database)))
            {
                try
                {
                    sqlCommand.Connection = connection;

                    connection.Open();

                    x = sqlCommand.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    //Utilities.LogError("ExecuteNonQuery", ex);
                    WriteToEventLog(ex.ToString());
                }
            }

            return x;
        }

        public static int ExecuteNonQuery(string sqlCommandText, string database = "")
        {
            int x = -1;

            using (SqlConnection connection = new SqlConnection(DBCONNECTIONSTRING(database)))
            {
                using (SqlCommand sqlCommand = new SqlCommand(sqlCommandText, connection))
                {
                    try
                    {
                        connection.Open();

                        x = sqlCommand.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        WriteToEventLog(ex.ToString());
                        //Utilities.LogError("ExecuteNonQuery", ex);
                    }
                }
            }

            return x;
        }

        //Insert new record and return new record Id
        public static int ExecuteNewRecord(SqlCommand sqlCommand, string database = "")
        {
            int x = -1;

            sqlCommand.CommandText += ";SELECT CAST(scope_identity() AS int);";

            using (SqlConnection connection = new SqlConnection(DBCONNECTIONSTRING(database)))
            {
                try
                {
                    sqlCommand.Connection = connection;

                    connection.Open();

                    x = (int)sqlCommand.ExecuteScalar();
                }
                catch (Exception ex)
                {
                    WriteToEventLog(ex.ToString()); ;
                }
            }

            return x;
        }

        public static int ExecuteNewRecord(string sqlCommandText, string database = "")
        {
            int x = -1;

            WriteToEventLog("saving");

            sqlCommandText += ";SELECT CAST(scope_identity() AS int);";

            using (SqlConnection connection = new SqlConnection(DBCONNECTIONSTRING(database)))
            {
                using (SqlCommand sqlCommand = new SqlCommand(sqlCommandText, connection))
                {
                    try
                    {
                        connection.Open();

                        x = (int)sqlCommand.ExecuteScalar();
                    }
                    catch (Exception ex)
                    {
                        //WriteToEventLog(ex.ToString());;
                        WriteToEventLog(ex.ToString());

                        if (ex.ToString().Contains("Violation of PRIMARY KEY constraint"))
                        {
                            //the item will have been saved already
                            x = -2;
                        }
                    }
                }
            }

            return x;
        }

        //Read single value from database
        public static string ExecuteScalar(SqlCommand sqlCommand, string database = "")
        {
            string scalarValue = string.Empty;

            using (SqlConnection connection = new SqlConnection(DBCONNECTIONSTRING(database)))
            {
                try
                {
                    sqlCommand.Connection = connection;

                    connection.Open();

                    Object scalarObject = sqlCommand.ExecuteScalar();

                    if (scalarObject.GetType() == typeof(System.DateTime))
                    {
                        scalarValue = ((System.DateTime)scalarObject).ToShortDateString();
                    }
                    else
                    {
                        scalarValue = scalarObject.ToString();
                    }
                }
                catch (Exception ex)
                {
                    //Utilities.LogError("ExecuteScalar", ex);
                    WriteToEventLog(ex.ToString());
                }
            }

            return scalarValue;
        }

        public static string ExecuteScalar(string sqlCommandText, string database = "")
        {
            string scalarValue = string.Empty;

            using (SqlConnection connection = new SqlConnection(DBCONNECTIONSTRING(database)))
            {
                using (SqlCommand sqlCommand = new SqlCommand(sqlCommandText, connection))
                {
                    try
                    {
                        connection.Open();

                        Object scalarObject = sqlCommand.ExecuteScalar();

                        if (scalarObject.GetType() == typeof(System.DateTime))
                        {
                            scalarValue = ((System.DateTime)scalarObject).ToShortDateString();
                        }
                        else
                        {
                            scalarValue = scalarObject.ToString();
                        }
                    }
                    catch (Exception ex)
                    {
                        WriteToEventLog("failed");
                        //Utilities.LogError("ExecuteScalar", ex);
                        WriteToEventLog(ex.ToString());
                    }
                }
            }

            return scalarValue;
        }

        public static void WriteToEventLog(string sEvent)
        {
            string sSource;
            string sLog;

            sSource = "PsychometricTest";
            sLog = "Application";

            try
            {
                if (!EventLog.SourceExists(sSource))
                    EventLog.CreateEventSource(sSource, sLog);

                EventLog.WriteEntry(sSource, sEvent);
                //EventLog.WriteEntry(sSource, sEvent,EventLogEntryType.Warning, 234);

            }
            catch (Exception ex)
            {

            }

            try
            {
                System.IO.File.AppendAllText(@"C:\Moore Stephens\" + "errors.txt", sEvent);
            }
            catch (Exception ex)
            {

            }

        }
        //Read list of values from database
        public static List<string> ExecuteList(string sqlCommandText, string database = "")
        {
            List<string> listValues = new List<string>();

            DatabaseReader reader = ExecuteReader(sqlCommandText, database);
            while (reader.Reader.Read())
            {
                listValues.Add(reader.Reader.GetValue(0).ToString());
            }
            return listValues;
        }

        //Read database recordset
        public static DatabaseReader ExecuteReader(string sqlCommandText, string database = "")
        {
            return new DatabaseReader(sqlCommandText, database);
        }

        public class DatabaseReader
        {
            public SqlDataReader Reader;
            SqlConnection Connection;
            SqlCommand Command;

            public DatabaseReader(string sqlCommandText, string database = "")
            {
                this.Connection = new SqlConnection(DBCONNECTIONSTRING(database));
                this.Command = new SqlCommand(sqlCommandText, this.Connection);

                try
                {
                    this.Connection.Open();

                    this.Reader = this.Command.ExecuteReader();
                }
                catch (Exception ex)
                {
                   // Utilities.LogError("DataBaseReader", ex);
                    WriteToEventLog(ex.ToString());
                    this.Close();
                }
            }

            public void Close()
            {
                if (this.Connection != null)
                {
                    try { this.Connection.Close(); }
                    catch
                    { //ignore attempt to close closed connection
                    }
                    this.Connection.Dispose();
                }
            }
        }

        //Get distinct values in a recordset
        public static string[] GetColumnFieldValues(string fieldName, string table, string condition)
        {
            string fieldValues = string.Empty;

            try
            {
                Utilities.DatabaseReader dr = Utilities.ExecuteReader("Select distinct([" + fieldName + "]) from [" + table + "] where " + condition + " ;");

                while (dr.Reader.Read())
                {
                    fieldValues += "|" + dr.Reader[fieldName].ToString();
                }

                dr.Close();
            }
            catch (Exception ex)
            {
                //Utilities.LogError("GetColumnFieldValues", ex);
            }

            return fieldValues.Split(new char[] { '|' }, StringSplitOptions.RemoveEmptyEntries);
        }

        //Check if record exists
        public static bool EntityExists(string table, string condition)
        {
            bool exists = false;

            try
            {
                Utilities.DatabaseReader dr = Utilities.ExecuteReader("Select * from [" + table + "] where " + condition + " ;");

                while (dr.Reader.Read())
                {
                    exists = true;
                }

                dr.Close();
            }
            catch (Exception ex)
            {
                exists = false;

                //Utilities.LogError("EntityExists", ex);
            }

            return exists;
        }

        //Set entity record value
        public static int SetEntityFieldValue(string table, string field, int value, string condition)
        {
            return Utilities.ExecuteNonQuery("Update [" + table + "] Set [" + field + "] = " + value + " where " + condition + ";");
        }

        public static int SetEntityFieldValue(string table, string field, double value, string condition)
        {
            return Utilities.ExecuteNonQuery("Update [" + table + "] Set [" + field + "] = " + value + " where " + condition + ";");
        }

        public static int SetEntityFieldValue(string table, string field, string value, string condition)
        {
            return Utilities.ExecuteNonQuery("Update [" + table + "] Set [" + field + "] = '" + value + "' where " + condition + ";");
        }

        //Count records
        public static int GetCount(string countColumn, string table, string condition)
        {
            return int.Parse(Utilities.ExecuteScalar("Select count([" + countColumn + "]) as total from [" + table + "] where " + condition + ";"));
        }

        //Get entity field value
        public static string GetEntityField(string field, string table, string condition)
        {
            return Utilities.ExecuteScalar("Select [" + field + "] from [" + table + "] where " + condition + ";");
        }

        //Get entity name value
        public static string GetEntityName(string table, string entityId)
        {
            return Utilities.ExecuteScalar("Select [Name] from [" + table + "] where Id = " + entityId + ";");
        }


    }
}