using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace ProgressQuest_Client
{
    class SqlExecutor
    {
        SqlConnection cnx = new SqlConnection("Data Source='J-C236-OL-06';Initial Catalog='BD_IdleGame';User ID='AlexMartigny';Password='Orange123';");

        public void changeDB(string change)
        {

        }

        public void changeServer(string change)
        {

        }

        public bool testConnexion()
        {
            cnx.Open();
            return true;
        }

        //public DataTable extractTable()
        //{
        //    return 
        //}

        //public DataTable extractFunction()
        //{
        //    return;
        //}

        //Revoir le retour de classe
        public void extractFunction(string nomFunction, SqlParameter[] param)
        {

        }

        public void executeProc_NoParam()
        {

        }

        public void executeProc_WithParam()
        {

        }

        //Revoir le retour de classe
        public void executeProc_Id()
        {

        }
    }
}
