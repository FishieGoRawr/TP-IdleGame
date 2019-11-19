﻿using System;
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
        }
    }
}