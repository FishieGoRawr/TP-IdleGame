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

        public string Go(int CharID)
        {
            string tempString = "";
            return tempString = executor.executeGo(CharID, tempString);
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

        /// <summary>
        /// Get all character loot sorted by descending value.
        /// </summary>
        /// <param name="characterID">Character ID</param>
        /// <returns>DataView with all loot from selected character.</returns>
        public DataView getAllCharacterLootSorted(int characterID)
        {
            DataView view = new DataView(executor.executeView("SELECT * FROM fnGetCharacterLoot(" + characterID + ")"));
            view.Sort = "Value DESC";

            return view;
        }

        /// <summary>
        /// Get all character infos (Stats, GP, level, exp...)
        /// </summary>
        /// <param name="characterID">Character ID</param>
        /// <returns>All infos from selected character.</returns>
        public DataView getAllCharactersInfo(int characterID)
        {
            DataView view = new DataView(executor.executeView("SELECT * FROM fnGetCharacterInfos(" + characterID + ")"));

            return view;
        }

        /// <summary>
        /// Get the completed dungeons for the selected character.
        /// </summary>
        /// <param name="characterID">Character ID</param>
        /// <returns>DataView of the selected character completed dungeons.</returns>
        public DataView getCharacterCompletedDungeons(int characterID)
        {
            DataView view = new DataView(executor.executeView("SELECT * FROM fnGetCompletedDungeons(" + characterID + ")"));

            return view;
        }

        /// <summary>
        /// Get the name of the selected character current dungeon.
        /// </summary>
        /// <param name="characterID">Character ID</param>
        /// <returns></returns>
        public DataView getDungeonName(int characterID)
        {
            DataView view = new DataView(executor.executeView("SELECT * FROM fnGetActiveDungeonName(" + characterID + ")"));

            return view;
        }

        /// <summary>
        /// Get the selected character's killcount for the current dungeon.
        /// </summary>
        /// <param name="characterID">Character ID</param>
        /// <returns>DataView with all of the character's completed dungeons.</returns>
        public DataView getDungeonKC(int characterID)
        {
            DataView view = new DataView(executor.executeView("SELECT * FROM fnGetDungeonKC(" + characterID + ")"));

            return view;
        }

        /// <summary>
        /// Get the selected character equipement names.
        /// </summary>
        /// <param name="characterID">Character ID</param>
        /// <returns>DataView with the name of all of the selected character's equipement.</returns>
        public DataView getCharacterEquip(int characterID)
        {
            DataView view = new DataView(executor.executeView("SELECT * FROM fnGetCharacterEquiped(" + characterID + ")"));

            return view;
        }
    }
}
