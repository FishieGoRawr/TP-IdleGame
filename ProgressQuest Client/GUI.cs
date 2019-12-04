using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ProgressQuest_Client
{
    public partial class GUI : Form
    {
        SqlPQ controller;
        bool m_running;
        int m_speed;
        int m_charID;
        Thread mainLoop;
        string returnString;
        MethodInvoker refresh;
        MethodInvoker refreshLootLsb;
        MethodInvoker refreshLog;
        MethodInvoker refreshCharInfos;
        MethodInvoker refreshHealth;

        public GUI()
        {
            InitializeComponent();

            controller = new SqlPQ();
            m_running = false;
            m_speed = 1000;
            loadCharacterCmb();
            cmbCharacter.SelectedIndex = 0;
            returnString = "";

            refresh = delegate { this.Refresh(); };
            refreshLootLsb = delegate { loadLsbCharacterLoot(); };
            refreshLog = delegate { addEventToLog(returnString); };
            refreshCharInfos = delegate { setInfoLabel(); };
            refreshHealth = delegate { };

            mainLoop = new Thread(new ThreadStart(Go));
        }

        /// <summary>
        /// Start the adventure with selected character.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void BtnStart_Click(object sender, EventArgs e)
        {
            m_running = true;

            if (!mainLoop.IsAlive)
                mainLoop.Start();
            else
                mainLoop.Resume();
        }

        private void BtnStop_Click(object sender, EventArgs e)
        {
            m_running = false;
            mainLoop.Suspend();

            //TESTING
            //if (m_charID != 0)
            //{
            //    object[,] charID = new object[1, 2];
            //    charID[0, 0] = "@CharID";
            //    charID[0, 1] = m_charID;
            //    controller.resetDefaultTesting(charID);
            //}
        }

        private void trkSpeed_ValueChanged(object sender, EventArgs e)
        {
            switch (trkSpeed.Value)
            {
                case 1:
                    m_speed = 1500;
                    break;
                case 2:
                    m_speed = 750;
                    break;
                case 3:
                    m_speed = 375;
                    break;
                case 4:
                    m_speed = 187;
                    break;
                case 5:
                    m_speed = 94;
                    break;
                case 6:
                    m_speed = 46;
                    break;
                default:
                    m_speed = 1500;
                    break;
            }
        }

        private void Go()
        {
            returnString = "";

            while (m_running)
            {
                Thread.Sleep(m_speed);

                returnString = controller.Go(m_charID);

                if (returnString.StartsWith("You searched") || returnString.StartsWith("You sold"))
                    this.Invoke(refreshLootLsb);

                if (returnString.StartsWith("You sold"))
                    this.Invoke(refreshCharInfos);

                if (returnString.Contains("kicked your butt"))
                    this.Invoke(refreshCharInfos);
                    

                this.Invoke(refreshLog);
                this.Invoke(refresh);
            }
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

            ExpProgressbar.Maximum = (int)character["Level"] * 150;
            ExpProgressbar.Value = (int)character["Exp"];

            healthProgressbar.Value = (int)character["CurrHP"];
            manaProgressbar.Value = 100;
        }

        private void addEventToLog(string ev)
        {
            lsbLog.Items.Add(ev);
            lsbLog.TopIndex = lsbLog.Items.Count - 1;
        }

        private bool isCharacterSelected()
        {
            if (cmbCharacter.SelectedIndex == -1)
                return false;
            else return true;
        }
    }
}