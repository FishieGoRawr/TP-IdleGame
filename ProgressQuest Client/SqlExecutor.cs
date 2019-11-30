using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace ProgressQuest_Client
{
    /// <summary>
    /// Principal tool to communicate with DB
    /// </summary>
    class SqlExecutor
    {
        string cnxString = ""; ///<summary>Connection string required to access database.</summary>
        string database = "BD_IdleGame"; ///<summary>Database name.</summary>
        string server = "J-C236-OL-06"; ///<summary>Database server address.</summary>
        string user = "AlexMartigny"; ///<summary>Username to connect to database.</summary>
        string pass = "Banane123"; ///<summary>Password for above user.</summary>
        SqlConnection cnx; ///<summary>Complete connection to database.</summary>

        // ---------- CLASS RELATED METHODS (CONSTRUCTORS, ACCESSORS...) ----------       
        /// <summary>
        /// Default constructor. Create a connection without validating it.
        /// </summary>
        public SqlExecutor()
        {
            cnxString = "Data Source='" + server + "';Initial Catalog='" + database + "';User ID='" + user + "';Password='" + pass + "'";
            this.cnx = new SqlConnection(cnxString);
        }

        /// <summary>
        /// Create and validate a connection using the specified values.
        /// </summary>
        /// <param name="server">Create a connection to this server.</param>
        /// <param name="database">Create a connection using this database.</param>
        /// <param name="user">Create a connection using this username.</param>
        /// <param name="pass">Create a connection using this password.</param>
        public SqlExecutor(string server, string database, string user, string pass)
        {
            try
            {
                cnxString = "Data Source='" + server + "';Initial Catalog='" + database + "';User ID='" + user + "';Password='" + pass + "'";
                this.cnx = new SqlConnection(cnxString);
            }
            catch (Exception e)
            {
                Console.WriteLine("Failure: {0}", e.Message);
            }
        }

        /// <summary>
        /// Accessor for the SqlConnection object that contains informations on our database connection.
        /// </summary>
        /// <returns>SqlConnection object.</returns>
        public SqlConnection getConnection()
        {
            return cnx;
        }
        // ------------------------------------------------------------------------

        // ---------- SERVER RELATED JUNK ----------        
        /// <summary>
        /// Change the server name of an existing connection.
        /// </summary>
        /// <param name="newServer">Server name to change to.</param>
        public void changeServer(string newServer)
        {
            string tempServer = server;

            try
            {
                server = newServer;
                cnxString = "Data Source='" + server + "';Initial Catalog='" + database + "';User ID='" + user + "';Password='" + pass + "'";
                cnx = new SqlConnection(cnxString);

                cnx.Open();

                Console.WriteLine("Successfully changed server for: {0}", server);
            }
            catch (SqlException e)
            {
                server = tempServer;
                Console.WriteLine("Failure: {0}", e.Message);
                Console.WriteLine("Reverting changes...\nDone!");
            }
        }

        /// <summary>
        /// Change the database of an existing connection.
        /// </summary>
        /// <param name="newDatabase">Database to change to.</param>
        public void changeDatabase(string newDatabase)
        {
            string tempDatabase = database;

            try
            {
                database = newDatabase;
                cnxString = "Data Source='" + server + "';Initial Catalog='" + database + "';User ID='" + user + "';Password='" + pass + "'";
                cnx = new SqlConnection(cnxString);

                cnx.Open();

                Console.WriteLine("Successfully changed database for: {0}", database);
            }
            catch (SqlException e)
            {
                database = newDatabase;
                Console.WriteLine("Failure: {0}", e.Message);
                Console.WriteLine("Reverting changes...\nDone!");
            }
        }

        /// <summary>
        /// Change the credentials (User & password) of an existing connection.
        /// </summary>
        /// <param name="newUser">Username to change to.</param>
        /// <param name="newPass">Password to change to.</param>
        public void changeCredentials(string newUser, string newPass)
        {
            string tempUser = user, tempPass = pass;

            try
            {
                user = newUser;
                pass = newPass;
                cnxString = "Data Source='" + server + "';Initial Catalog='" + database + "';User ID='" + newUser + "';Password='" + newPass + "'";
                cnx = new SqlConnection(cnxString);

                cnx.Open();
            }
            catch (Exception e)
            {
                user = tempUser;
                pass = tempPass;
                Console.WriteLine("Failure: {0}", e.Message);
                Console.WriteLine("Reverting changes...\n Done!");
            }
        }

        /// <summary>
        /// Validate the connection at any given point in time with the constructed connection string.
        /// </summary>
        public void validateServer()
        {
            try
            {
                Console.WriteLine("Connecting to: {0}", cnxString);
                using (SqlConnection connection = new SqlConnection(cnxString))
                {
                    Console.WriteLine("Executing: {0}", "SELECT 1");

                    SqlCommand command = new SqlCommand("SELECT 1", connection);

                    connection.Open();
                    Console.WriteLine("SQL Connection successful.");

                    command.ExecuteScalar();
                    Console.WriteLine("SQL Query execution successful.");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Failure: {0}", ex.Message);
            }
        }
        // -----------------------------------------

        // ---------- COMMUNICATION WITH DATABASE ----------        
        /// <summary>
        /// Sends a query to the SQL server requesting an existing view.
        /// </summary>
        /// <param name="viewName">View name (server-side)</param>
        /// <returns>DataTable containing what the view returned.</returns>
        public DataTable executeView(string viewName)
        {
            DataTable table = new DataTable();
            SqlCommand cmd = new SqlCommand(viewName, cnx);

            cnx.Open();
            table.Load(cmd.ExecuteReader());
            cnx.Close();

            return table;
        }

        /// <summary>
        /// Execute a simple stored procedure on the SQL server. The stored procedure doesn't take any args.
        /// </summary>
        /// <param name="spName">Stored procedure name.</param>
        public void executeSP(string spName)
        {
            SqlCommand cmd = new SqlCommand(spName, cnx);

            cnx.Open();
            cmd.ExecuteNonQuery();
            cnx.Close();
        }

        public string executeGo(int CharID, string actionString)
        {
            SqlCommand cmd = new SqlCommand("spGo", cnx);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CharID", CharID);

            SqlParameter paramReturnText = new SqlParameter("@paramReturnText", SqlDbType.NVarChar, 2048);
            paramReturnText.Value = actionString;
            paramReturnText.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(paramReturnText);

            cnx.Open();
            cmd.ExecuteNonQuery();
            actionString = (string)cmd.Parameters["@paramReturnText"].Value;
            cnx.Close();

            return actionString;
        }

        /// <summary>
        /// Execute a complex stored procedure on the SQL server that takes one or more args.
        /// </summary>
        /// <param name="spName">Stored procedure name.</param>
        /// <param name="paramList">2D Array of type "object". Contain the parameter name for the SQL query (Ex.: @name) and the value of said parameter.</param>
        public void executeSP(string spName, object[,] paramList)
        {
            SqlCommand cmd = new SqlCommand(spName, cnx);
            cmd.CommandType = CommandType.StoredProcedure;

            for (int i = 0; i < paramList.GetLength(0); i++)
            {
                string paramName = paramList[i, 0].ToString();
                var paramValue = paramList[i, 1];
                cmd.Parameters.AddWithValue(paramName, paramValue);
            }

            cnx.Open();
            cmd.ExecuteNonQuery();
            cnx.Close();
        }
        // -------------------------------------------------
    }
}