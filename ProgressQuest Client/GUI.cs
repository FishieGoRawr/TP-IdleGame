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
        bool m_started;
        int m_speed;
        int m_charID;

        public GUI()
        {
            InitializeComponent();

            controller = new SqlPQ();
            m_started = false;
            m_speed = 1;
            loadCharacterCmb();
        }

        /// <summary>
        /// Start the adventure with selected character.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void BtnStart_Click(object sender, EventArgs e)
        {
            if (m_charID != null)
                Console.WriteLine(controller.Go(m_charID));
        }

        /// <summary>
        /// Creates a DataView with all characters, sort them by level and adds them to a combobox.
        /// </summary>
        public void loadCharacterCmb()
        {
            DataView sortedCharacters = controller.getAllCharactersSorted("CharLevel");

            foreach (DataRowView character in sortedCharacters)
            {
                ComboBoxItem temp = new ComboBoxItem("Name: " + character["CharName"].ToString() + " | Level: " + character["CharLevel"].ToString(), (int)character["CharID"]);
                cmbCharacter.Items.Add(temp);
            }
        }

        public void loadLsbCharacterLoot()
        {
            lsbLoot.Items.Clear();

            ComboBoxItem selectedCharacter = (ComboBoxItem)cmbCharacter.SelectedItem;
            DataView sortedLoot = controller.getAllCharacterLootSorted(selectedCharacter.getID());

            foreach (DataRowView loot in sortedLoot)
                lsbLoot.Items.Add(loot["Name"].ToString() + " | Value: " + loot["Value"].ToString() + "GP | Qty: " + loot["Qty"].ToString());
        }

        private void CmbCharacter_SelectedIndexChanged(object sender, EventArgs e)
        {
            ComboBoxItem selectedCharacter = (ComboBoxItem)cmbCharacter.SelectedItem;
            m_charID = selectedCharacter.getID();
            loadLsbCharacterLoot();
            setInfoLabel();
        }

        public void setInfoLabel()
        {
            DataView info = controller.getAllCharactersInfo(m_charID);
            DataRowView character = info[0];

            charName.Text = character["Name"].ToString();
            charRace.Text = character["Race"].ToString();
            charLvl.Text = character["Level"].ToString();
            charGP.Text = character["GP"].ToString();
            charStr.Text = character["Str"].ToString();
            charCon.Text = character["Con"].ToString();
            charDex.Text = character["Dex"].ToString();
            charInt.Text = character["Intel"].ToString();
            charWis.Text = character["Wis"].ToString();
            charLck.Text = character["Luck"].ToString();

            ExpProgressbar.Maximum = (int)character["Level"] * 100;
            ExpProgressbar.Value = (int)character["Exp"];

            healthProgressbar.Value = (int)character["CurrHP"];
            manaProgressbar.Value = 100;
        }

        private void BtnStop_Click(object sender, EventArgs e)
        {
            if (m_charID != 0)
            {
                object[,] charID = new object[1, 2];
                charID[0, 0] = "@CharID";
                charID[0, 1] = m_charID;
                controller.resetDefaultTesting(charID);
            }
        }
    }
}
