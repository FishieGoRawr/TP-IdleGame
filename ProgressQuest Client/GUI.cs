using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ProgressQuest_Client
{
    public partial class GUI : Form
    {
        SqlPQ controller;

        public GUI()
        {
            InitializeComponent();

            controller = new SqlPQ();
            loadCharacterCmb();
        }

        /// <summary>
        /// Start the adventure with selected character.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void BtnStart_Click(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// Creates a DataView with all characters, sort them by level and adds them to a combobox.
        /// </summary>
        public void loadCharacterCmb()
        {
            DataView sortedCharacters = controller.getAllCharactersSorted("Level");

            foreach (DataRowView character in sortedCharacters)
            {
                ComboBoxItem temp = new ComboBoxItem("Name: " + character["Name"].ToString() + " | Level: " + character["Level"].ToString(), (int)character["ID"]);
                cmbCharacter.Items.Add(temp);
            }
        }

        public void loadLsbCharacterLoot()
        {
            lsbLoot.Items.Clear();

            ComboBoxItem selectedCharacter = (ComboBoxItem)cmbCharacter.SelectedItem;
            DataView sortedLoot = controller.getAllCharacterLootSorted(selectedCharacter.getID());

            Console.WriteLine(sortedLoot[0]["Qty"].ToString());

            foreach (DataRowView loot in sortedLoot)
                lsbLoot.Items.Add("Name: " + loot["Name"].ToString() + " | Value: " + loot["Value"].ToString() + " | Quantity: " + loot["Qty"].ToString());
        }

        private void CmbCharacter_SelectedIndexChanged(object sender, EventArgs e)
        {
            loadLsbCharacterLoot();
            setInfoLabel();
        }

        public void setInfoLabel()
        {
            ComboBoxItem selectedCharacter = (ComboBoxItem)cmbCharacter.SelectedItem;
            DataView info = controller.getAllCharactersInfo(selectedCharacter.getID());
            List<String> list = new List<String>();

            string temp;

            for (int i = 0; i < 11; i++)
            {
                list.Add(info[0][i].ToString());
                Console.WriteLine(info[0][i].ToString());
            }

            charName.Text = list.ElementAt(0);
            charRace.Text = list.ElementAt(1);
            charLvl.Text = list.ElementAt(2);
            charGP.Text = list.ElementAt(3);

            int lvl = Convert.ToInt32(list.ElementAt(2));
            ExpProgressbar.Maximum = lvl * 100;
            ExpProgressbar.Value = Convert.ToInt32(list.ElementAt(4));
            
            charStr.Text = list.ElementAt(5);
            charCon.Text = list.ElementAt(6);
            charDex.Text = list.ElementAt(7);
            charInt.Text = list.ElementAt(8);
            charWis.Text = list.ElementAt(9);
            charLck.Text = list.ElementAt(10);
        }
    }
}
