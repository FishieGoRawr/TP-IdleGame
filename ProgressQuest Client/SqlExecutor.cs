using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;



namespace ProgressQuest_Client
{
    /// <summary>
    /// Principal tool to communicate with DB
    /// </summary>
    class SqlExecutor
    {
        string cnxString = "";
        string database = "BD_IdleGame";
        string server = "J-C236-OL-06";
        string user = "AlexMartigny";
        string pass = "Orange123";
        SqlConnection cnx;

        /// <summary>
        /// Default constructor with valid connection
        /// </summary>
        public SqlExecutor()
        {
            cnxString = "Data Source='" + server + "';Initial Catalog='" + database + "';User ID='" + user + "';Password='" + pass + "'";
            this.cnx = new SqlConnection(cnxString);
        }

        /// <summary>
        /// Constructor that takes differerent connection args than default
        /// </summary>
        /// <param name="server"> Server location.</param>
        /// <param name="database"> Database name.</param>
        /// <param name="user"> Username (SQLServer cred).</param>
        /// <param name="pass"> Password (SQLServer cred).</param>
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

        public void validateServer()
        {
            try
            {
                Console.WriteLine("Connecting to: {0}", cnxString);
                using (var connection = new SqlConnection(cnxString))
                {
                    Console.WriteLine("Executing: {0}", "SELECT 1");

                    var command = new SqlCommand("SELECT 1", connection);

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
    }
}
