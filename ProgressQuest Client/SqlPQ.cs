using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace ProgressQuest_Client
{
    class SqlPQ
    {
        SqlExecutor executor;
        SqlConnection cnx;

        public SqlPQ()
        {
            executor = new SqlExecutor();
            cnx = executor.getConnection();
        }

        public DataTable getAllLoots()
        {
            DataTable table = new DataTable();
            SqlCommand cmd = new SqlCommand("SELECT * FROM getAllLoots", cnx);

            cnx.Open();
            table.Load(cmd.ExecuteReader());
            cnx.Close();

            return table;
        }
    }
}
