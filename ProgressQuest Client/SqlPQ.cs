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
        DataTable table;

        public SqlPQ()
        {
            executor = new SqlExecutor();
            table = new DataTable();
        }

        public DataTable getAllLoots()
        {
            table.Clear();
            table = executor.executeView("SELECT * FROM viewAllLoots");
            return table;
        }

        public DataTable getAllCharacters()
        {
            table.Clear();
            table = executor.executeView("SELECT * FROM viewAllCharacters");
            return table;
        }
    }
}
