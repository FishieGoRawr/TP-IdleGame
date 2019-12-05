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
        MethodInvoker updateProgress;
        MethodInvoker clearProgress;
        MethodInvoker refreshCompletedDungeons;
        MethodInvoker refreshDungeonName;
        MethodInvoker refreshDungeonKC;
        MethodInvoker refreshEquip;

        public GUI()
        {
            InitializeComponent();

            controller = new SqlPQ();
            m_running = false;
            m_speed = 750;
            loadCharacterCmb();
            cmbCharacter.SelectedIndex = 0;
            returnString = "";

            setCompletedDungeonLsb();
            setDungeonName();
            setEquipement();

            refreshDungeonKC = delegate { setDungeonKillcount(); };
            refreshDungeonName = delegate { setDungeonName(); };
            refresh = delegate { this.Refresh(); };
            refreshLootLsb = delegate { loadLsbCharacterLoot(); };
            refreshLog = delegate { addEventToLog(returnString); };
            refreshCharInfos = delegate { setInfoLabel(); };
            updateProgress = delegate { updateStatusProgress(); };
            clearProgress = delegate { clearStatusProgress(); };
            refreshCompletedDungeons = delegate { setCompletedDungeonLsb(); };
            refreshEquip = delegate { setEquipement(); };

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
                    m_speed = 750;
                    break;
                case 2:
                    m_speed = 375;
                    break;
                case 3:
                    m_speed = 187;
                    break;
                case 4:
                    m_speed = 93;
                    break;
                case 5:
                    m_speed = 42;
                    break;
                case 6:
                    m_speed = 21;
                    break;
                default:
                    m_speed = 750;
                    break;
            }
        }

        private void Go()
        {
            returnString = "";

            while (m_running)
            {
                while (statusProgress.Value != statusProgress.Maximum)
                {
                    Thread.Sleep(1);
                    this.Invoke(updateProgress);
                }


                returnString = controller.Go(m_charID);

                if (returnString.Contains("GoblinBurger")) //Dungeon completed
                {
                    this.Invoke(refreshCompletedDungeons);
                }

                if (returnString.StartsWith("A strange"))
                    this.Invoke(refreshDungeonName);

                if (returnString.StartsWith("You finally ended"))
                    this.Invoke(refreshDungeonKC);

                if (returnString.Contains("You bought") || returnString.Contains("goblin thief"))
                    this.Invoke(refreshEquip);

                    this.Invoke(refreshLootLsb);
                this.Invoke(refreshCharInfos);
                this.Invoke(refreshLog);
                this.Invoke(refresh);
                this.Invoke(clearProgress);
            }
        }

        public void updateStatusProgress()
        {
            int progressSpeed = (10000 / m_speed);

            if (statusProgress.Value + progressSpeed > statusProgress.Maximum)
                statusProgress.Value = statusProgress.Maximum;
            else
                statusProgress.Value = statusProgress.Value + progressSpeed;

            //statusProgress.Value = statusProgress.Value + 1;
        }

        public void clearStatusProgress()
        {
            statusProgress.Value = 0;
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

        private void setCompletedDungeonLsb()
        {
            DataView view = controller.getCharacterCompletedDungeons(m_charID);

            lsbCompletedDungeon.Items.Clear();

            foreach (DataRowView row in view)
                lsbCompletedDungeon.Items.Add(row[0] + " | " + row[1] + "x");
        }

        private void setDungeonName()
        {
            DataView view = controller.getDungeonName(m_charID);

            if (view.Count > 0)
            {
                DataRowView character = view[0];
                lblDunName.Text = character[0].ToString();
                prgDunProg.Value = 0;
            }
        }

        private void setDungeonKillcount()
        {
            DataView view = controller.getDungeonKC(m_charID);
            DataRowView character = view[0];

            prgDunProg.Value = 25 - (int)character[0];
        }

        private void setEquipement()
        {
            DataView view = controller.getCharacterEquip(m_charID);
            DataRowView equip = view[0];

            if (equip[0].ToString() != "")
                lblCharHead.Text = equip[0].ToString();
            else lblCharHead.Text = "None";

            equip = view[1];
            if (equip[0].ToString() != "")
                lblCharTorso.Text = equip[0].ToString();
            else lblCharTorso.Text = "None";

            equip = view[2];
            if (equip[0].ToString() != "")
                lblCharLegs.Text = equip[0].ToString();
            else lblCharLegs.Text = "None";

            equip = view[3];
            if (equip[0].ToString() != "")
                lblCharBoots.Text = equip[0].ToString();
            else lblCharBoots.Text = "None";

            equip = view[4];
            if (equip[0].ToString() != "")
                lblCharGloves.Text = equip[0].ToString();
            else lblCharGloves.Text = "None";

            equip = view[5];
            if (equip[0].ToString() != "")
                lblCharWeapon.Text = equip[0].ToString();
            else lblCharWeapon.Text = "None";

            equip = view[6];
            if (equip[0].ToString() != "")
                lblCharRing.Text = equip[0].ToString();
            else lblCharRing.Text = "None";

            equip = view[7];
            if (equip[0].ToString() != "")
                lblCharNeck.Text = equip[0].ToString();
            else lblCharNeck.Text = "None";
        }
    }
}