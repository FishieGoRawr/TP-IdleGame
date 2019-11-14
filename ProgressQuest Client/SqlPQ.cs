using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace ProgressQuest_Client
{
    public class SqlPQ
    {
        SqlExecutor executor;
        SqlConnection cnx;

        public SqlPQ()
        {
            executor = new SqlExecutor();
            cnx = executor.GetConnection();
        }

        public void getAllCharacters()
        {
            DataTable table = new DataTable();
            table = executor.executeView("SELECT * FROM viewAllCharacters");

            foreach(DataRow row in table.Rows)
            {
                foreach (DataColumn col in table.Columns)
                {
                    Console.WriteLine(row[col].ToString());
                }
            }
        }
    }
}
