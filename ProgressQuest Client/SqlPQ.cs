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
        int selectedCharID { get; set; }

        /// <summary>
        /// SqlPQ (Controller) constructor.
        /// </summary>
        public SqlPQ()
        {
            selectedCharID = new int();
            executor = new SqlExecutor();
            table = new DataTable();
        }

        /// <summary>
        /// Get all characters from the database.
        /// </summary>
        /// <returns></returns>
        public DataTable getAllCharacters()
        {
            table.Clear();
            table = executor.executeView("SELECT * FROM viewAllCharacters");
            return table;
        }

        /// <summary>
        /// Get all loots from the database.
        /// </summary>
        /// <returns></returns>
        public DataTable getAllLoots()
        {
            table.Clear();
            table = executor.executeView("SELECT * FROM viewAllLoots");
            return table;
        }

        /// <summary>
        /// Get all characters from the database and sort them by a given value (Existing column in DB).
        /// </summary>
        /// <param name="sortedBy">Existing column in DB table.</param>
        /// <returns>Sorted DataView of all characters.</returns>
        public DataView getAllCharactersSorted(string sortedBy)
        {
            DataView view = new DataView(executor.executeView("SELECT * FROM viewAllCharacters"));
            view.Sort = sortedBy + " DESC";

            return view;
        }

        public DataView getAllCharacterLootSorted(int characterID)
        {
            DataView view = new DataView(executor.executeView("SELECT * FROM fnGetCharacterLoot(" + characterID + ")"));
            view.Sort = "Value DESC";

            return view;
        }

        public DataView getAllCharactersInfo(int characterID)
        {
            DataView view = new DataView(executor.executeView("SELECT * FROM fnGetCharacterInfos(" + characterID + ")"));

            return view;
        }

        public void setQuest()
        {
            DataView view = new DataView(executor.executeView("SELECT * FROM fnGetAllQuests"));
        }
    }
}
