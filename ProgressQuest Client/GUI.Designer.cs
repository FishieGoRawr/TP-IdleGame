namespace ProgressQuest_Client
{
    partial class GUI
    {
        /// <summary>
        /// Variable nécessaire au concepteur.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Nettoyage des ressources utilisées.
        /// </summary>
        /// <param name="disposing">true si les ressources managées doivent être supprimées ; sinon, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Code généré par le Concepteur Windows Form

        /// <summary>
        /// Méthode requise pour la prise en charge du concepteur - ne modifiez pas
        /// le contenu de cette méthode avec l'éditeur de code.
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.lsbLoot = new System.Windows.Forms.ListBox();
            this.label7 = new System.Windows.Forms.Label();
            this.cmbCharacter = new System.Windows.Forms.ComboBox();
            this.healthProgressbar = new System.Windows.Forms.ProgressBar();
            this.manaProgressbar = new System.Windows.Forms.ProgressBar();
            this.label8 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.charHead = new System.Windows.Forms.Label();
            this.charTorso = new System.Windows.Forms.Label();
            this.charWeapon2 = new System.Windows.Forms.Label();
            this.charRing2 = new System.Windows.Forms.Label();
            this.charRing1 = new System.Windows.Forms.Label();
            this.charWeapon1 = new System.Windows.Forms.Label();
            this.charNeck = new System.Windows.Forms.Label();
            this.charGloves = new System.Windows.Forms.Label();
            this.charLegs = new System.Windows.Forms.Label();
            this.charBoots = new System.Windows.Forms.Label();
            this.charLck = new System.Windows.Forms.Label();
            this.charWis = new System.Windows.Forms.Label();
            this.charCon = new System.Windows.Forms.Label();
            this.charDex = new System.Windows.Forms.Label();
            this.charInt = new System.Windows.Forms.Label();
            this.charStr = new System.Windows.Forms.Label();
            this.txtStatus = new System.Windows.Forms.Label();
            this.splitter1 = new System.Windows.Forms.Splitter();
            this.splitter2 = new System.Windows.Forms.Splitter();
            this.statusProgress = new System.Windows.Forms.ProgressBar();
            this.speed = new System.Windows.Forms.TrackBar();
            this.btnStop = new System.Windows.Forms.Button();
            this.btnStart = new System.Windows.Forms.Button();
            this.label18 = new System.Windows.Forms.Label();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.pendingQuest = new System.Windows.Forms.GroupBox();
            this.questProgressbar = new System.Windows.Forms.ProgressBar();
            this.dungeon3 = new System.Windows.Forms.CheckBox();
            this.dungeon2 = new System.Windows.Forms.CheckBox();
            this.dungeon1 = new System.Windows.Forms.CheckBox();
            this.completedQuest = new System.Windows.Forms.ListView();
            this.label10 = new System.Windows.Forms.Label();
            this.charRace = new System.Windows.Forms.Label();
            this.charGP = new System.Windows.Forms.Label();
            this.charLvl = new System.Windows.Forms.Label();
            this.charName = new System.Windows.Forms.Label();
            this.label20 = new System.Windows.Forms.Label();
            this.label21 = new System.Windows.Forms.Label();
            this.label22 = new System.Windows.Forms.Label();
            this.label23 = new System.Windows.Forms.Label();
            this.label11 = new System.Windows.Forms.Label();
            this.ExpProgressbar = new System.Windows.Forms.ProgressBar();
            ((System.ComponentModel.ISupportInitialize)(this.speed)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.pendingQuest.SuspendLayout();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(366, 90);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(71, 20);
            this.label1.TabIndex = 0;
            this.label1.Text = "Strength";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(598, 91);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(87, 20);
            this.label2.TabIndex = 1;
            this.label2.Text = "Inteligence";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(366, 166);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(71, 20);
            this.label3.TabIndex = 2;
            this.label3.Text = "Dexterity";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(366, 127);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(94, 20);
            this.label4.TabIndex = 3;
            this.label4.Text = "Constitution";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(598, 126);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(66, 20);
            this.label5.TabIndex = 4;
            this.label5.Text = "Wisdom";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(598, 159);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(43, 20);
            this.label6.TabIndex = 5;
            this.label6.Text = "Luck";
            // 
            // lsbLoot
            // 
            this.lsbLoot.FormattingEnabled = true;
            this.lsbLoot.ItemHeight = 20;
            this.lsbLoot.Location = new System.Drawing.Point(359, 373);
            this.lsbLoot.Name = "lsbLoot";
            this.lsbLoot.Size = new System.Drawing.Size(486, 324);
            this.lsbLoot.TabIndex = 6;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(355, 350);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(41, 20);
            this.label7.TabIndex = 7;
            this.label7.Text = "Loot";
            // 
            // cmbCharacter
            // 
            this.cmbCharacter.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbCharacter.FormattingEnabled = true;
            this.cmbCharacter.Location = new System.Drawing.Point(350, 26);
            this.cmbCharacter.Name = "cmbCharacter";
            this.cmbCharacter.Size = new System.Drawing.Size(335, 28);
            this.cmbCharacter.TabIndex = 8;
            this.cmbCharacter.SelectedIndexChanged += new System.EventHandler(this.CmbCharacter_SelectedIndexChanged);
            // 
            // healthProgressbar
            // 
            this.healthProgressbar.ForeColor = System.Drawing.Color.Red;
            this.healthProgressbar.Location = new System.Drawing.Point(865, 593);
            this.healthProgressbar.Name = "healthProgressbar";
            this.healthProgressbar.Size = new System.Drawing.Size(441, 32);
            this.healthProgressbar.TabIndex = 9;
            // 
            // manaProgressbar
            // 
            this.manaProgressbar.Location = new System.Drawing.Point(865, 665);
            this.manaProgressbar.Name = "manaProgressbar";
            this.manaProgressbar.Size = new System.Drawing.Size(441, 32);
            this.manaProgressbar.TabIndex = 10;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(861, 570);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(56, 20);
            this.label8.TabIndex = 11;
            this.label8.Text = "Health";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(861, 642);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(49, 20);
            this.label9.TabIndex = 12;
            this.label9.Text = "Mana";
            // 
            // charHead
            // 
            this.charHead.AutoSize = true;
            this.charHead.Location = new System.Drawing.Point(1063, 127);
            this.charHead.Name = "charHead";
            this.charHead.Size = new System.Drawing.Size(48, 20);
            this.charHead.TabIndex = 13;
            this.charHead.Text = "Head";
            // 
            // charTorso
            // 
            this.charTorso.AutoSize = true;
            this.charTorso.Location = new System.Drawing.Point(1062, 231);
            this.charTorso.Name = "charTorso";
            this.charTorso.Size = new System.Drawing.Size(49, 20);
            this.charTorso.TabIndex = 14;
            this.charTorso.Text = "Torso";
            // 
            // charWeapon2
            // 
            this.charWeapon2.AutoSize = true;
            this.charWeapon2.Location = new System.Drawing.Point(1214, 314);
            this.charWeapon2.Name = "charWeapon2";
            this.charWeapon2.Size = new System.Drawing.Size(82, 20);
            this.charWeapon2.TabIndex = 15;
            this.charWeapon2.Text = "Weapon 2";
            // 
            // charRing2
            // 
            this.charRing2.AutoSize = true;
            this.charRing2.Location = new System.Drawing.Point(1162, 353);
            this.charRing2.Name = "charRing2";
            this.charRing2.Size = new System.Drawing.Size(55, 20);
            this.charRing2.TabIndex = 16;
            this.charRing2.Text = "Ring 2";
            // 
            // charRing1
            // 
            this.charRing1.AutoSize = true;
            this.charRing1.Location = new System.Drawing.Point(948, 342);
            this.charRing1.Name = "charRing1";
            this.charRing1.Size = new System.Drawing.Size(55, 20);
            this.charRing1.TabIndex = 18;
            this.charRing1.Text = "Ring 1";
            // 
            // charWeapon1
            // 
            this.charWeapon1.AutoSize = true;
            this.charWeapon1.Location = new System.Drawing.Point(874, 314);
            this.charWeapon1.Name = "charWeapon1";
            this.charWeapon1.Size = new System.Drawing.Size(82, 20);
            this.charWeapon1.TabIndex = 17;
            this.charWeapon1.Text = "Weapon 1";
            // 
            // charNeck
            // 
            this.charNeck.AutoSize = true;
            this.charNeck.Location = new System.Drawing.Point(1050, 176);
            this.charNeck.Name = "charNeck";
            this.charNeck.Size = new System.Drawing.Size(74, 20);
            this.charNeck.TabIndex = 19;
            this.charNeck.Text = "Necklace";
            // 
            // charGloves
            // 
            this.charGloves.AutoSize = true;
            this.charGloves.Location = new System.Drawing.Point(874, 248);
            this.charGloves.Name = "charGloves";
            this.charGloves.Size = new System.Drawing.Size(58, 20);
            this.charGloves.TabIndex = 21;
            this.charGloves.Text = "Gloves";
            // 
            // charLegs
            // 
            this.charLegs.AutoSize = true;
            this.charLegs.Location = new System.Drawing.Point(1062, 379);
            this.charLegs.Name = "charLegs";
            this.charLegs.Size = new System.Drawing.Size(44, 20);
            this.charLegs.TabIndex = 22;
            this.charLegs.Text = "Legs";
            // 
            // charBoots
            // 
            this.charBoots.AutoSize = true;
            this.charBoots.Location = new System.Drawing.Point(1063, 472);
            this.charBoots.Name = "charBoots";
            this.charBoots.Size = new System.Drawing.Size(51, 20);
            this.charBoots.TabIndex = 23;
            this.charBoots.Text = "Boots";
            // 
            // charLck
            // 
            this.charLck.AutoSize = true;
            this.charLck.Location = new System.Drawing.Point(732, 159);
            this.charLck.Name = "charLck";
            this.charLck.Size = new System.Drawing.Size(14, 20);
            this.charLck.TabIndex = 29;
            this.charLck.Text = "-";
            // 
            // charWis
            // 
            this.charWis.AutoSize = true;
            this.charWis.Location = new System.Drawing.Point(732, 126);
            this.charWis.Name = "charWis";
            this.charWis.Size = new System.Drawing.Size(14, 20);
            this.charWis.TabIndex = 28;
            this.charWis.Text = "-";
            // 
            // charCon
            // 
            this.charCon.AutoSize = true;
            this.charCon.Location = new System.Drawing.Point(500, 127);
            this.charCon.Name = "charCon";
            this.charCon.Size = new System.Drawing.Size(14, 20);
            this.charCon.TabIndex = 27;
            this.charCon.Text = "-";
            // 
            // charDex
            // 
            this.charDex.AutoSize = true;
            this.charDex.Location = new System.Drawing.Point(500, 166);
            this.charDex.Name = "charDex";
            this.charDex.Size = new System.Drawing.Size(14, 20);
            this.charDex.TabIndex = 26;
            this.charDex.Text = "-";
            // 
            // charInt
            // 
            this.charInt.AutoSize = true;
            this.charInt.Location = new System.Drawing.Point(732, 91);
            this.charInt.Name = "charInt";
            this.charInt.Size = new System.Drawing.Size(14, 20);
            this.charInt.TabIndex = 25;
            this.charInt.Text = "-";
            // 
            // charStr
            // 
            this.charStr.AutoSize = true;
            this.charStr.Location = new System.Drawing.Point(500, 90);
            this.charStr.Name = "charStr";
            this.charStr.Size = new System.Drawing.Size(14, 20);
            this.charStr.TabIndex = 24;
            this.charStr.Text = "-";
            // 
            // txtStatus
            // 
            this.txtStatus.AutoSize = true;
            this.txtStatus.Location = new System.Drawing.Point(355, 720);
            this.txtStatus.Name = "txtStatus";
            this.txtStatus.Size = new System.Drawing.Size(316, 20);
            this.txtStatus.TabIndex = 30;
            this.txtStatus.Text = "Status of the game, ex: Player hit a monster";
            // 
            // splitter1
            // 
            this.splitter1.Location = new System.Drawing.Point(0, 0);
            this.splitter1.Name = "splitter1";
            this.splitter1.Size = new System.Drawing.Size(3, 796);
            this.splitter1.TabIndex = 31;
            this.splitter1.TabStop = false;
            // 
            // splitter2
            // 
            this.splitter2.Location = new System.Drawing.Point(3, 0);
            this.splitter2.Name = "splitter2";
            this.splitter2.Size = new System.Drawing.Size(327, 796);
            this.splitter2.TabIndex = 32;
            this.splitter2.TabStop = false;
            // 
            // statusProgress
            // 
            this.statusProgress.Location = new System.Drawing.Point(359, 748);
            this.statusProgress.Name = "statusProgress";
            this.statusProgress.Size = new System.Drawing.Size(947, 27);
            this.statusProgress.TabIndex = 33;
            // 
            // speed
            // 
            this.speed.Cursor = System.Windows.Forms.Cursors.Default;
            this.speed.LargeChange = 3;
            this.speed.Location = new System.Drawing.Point(904, 34);
            this.speed.Maximum = 2;
            this.speed.Name = "speed";
            this.speed.Size = new System.Drawing.Size(222, 69);
            this.speed.TabIndex = 60;
            // 
            // btnStop
            // 
            this.btnStop.Location = new System.Drawing.Point(1145, 26);
            this.btnStop.Name = "btnStop";
            this.btnStop.Size = new System.Drawing.Size(151, 33);
            this.btnStop.TabIndex = 35;
            this.btnStop.Text = "Stop";
            this.btnStop.UseVisualStyleBackColor = true;
            this.btnStop.Click += new System.EventHandler(this.BtnStop_Click);
            // 
            // btnStart
            // 
            this.btnStart.Location = new System.Drawing.Point(731, 23);
            this.btnStart.Name = "btnStart";
            this.btnStart.Size = new System.Drawing.Size(151, 33);
            this.btnStart.TabIndex = 36;
            this.btnStart.Text = "Start";
            this.btnStart.UseVisualStyleBackColor = true;
            this.btnStart.Click += new System.EventHandler(this.BtnStart_Click);
            // 
            // label18
            // 
            this.label18.AutoSize = true;
            this.label18.Location = new System.Drawing.Point(913, 8);
            this.label18.Name = "label18";
            this.label18.Size = new System.Drawing.Size(56, 20);
            this.label18.TabIndex = 61;
            this.label18.Text = "Speed";
            // 
            // pictureBox1
            // 
            this.pictureBox1.Image = global::ProgressQuest_Client.Properties.Resources.téléchargement;
            this.pictureBox1.Location = new System.Drawing.Point(865, 100);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(441, 432);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 63;
            this.pictureBox1.TabStop = false;
            // 
            // pendingQuest
            // 
            this.pendingQuest.Controls.Add(this.questProgressbar);
            this.pendingQuest.Controls.Add(this.dungeon3);
            this.pendingQuest.Controls.Add(this.dungeon2);
            this.pendingQuest.Controls.Add(this.dungeon1);
            this.pendingQuest.Location = new System.Drawing.Point(24, 26);
            this.pendingQuest.Name = "pendingQuest";
            this.pendingQuest.Size = new System.Drawing.Size(286, 275);
            this.pendingQuest.TabIndex = 64;
            this.pendingQuest.TabStop = false;
            this.pendingQuest.Text = "Pending Dungeons...";
            // 
            // questProgressbar
            // 
            this.questProgressbar.Location = new System.Drawing.Point(6, 237);
            this.questProgressbar.Name = "questProgressbar";
            this.questProgressbar.Size = new System.Drawing.Size(274, 32);
            this.questProgressbar.TabIndex = 65;
            // 
            // dungeon3
            // 
            this.dungeon3.AutoSize = true;
            this.dungeon3.Location = new System.Drawing.Point(6, 85);
            this.dungeon3.Name = "dungeon3";
            this.dungeon3.Size = new System.Drawing.Size(147, 24);
            this.dungeon3.TabIndex = 65;
            this.dungeon3.Text = "Dungeon Name";
            this.dungeon3.UseVisualStyleBackColor = true;
            // 
            // dungeon2
            // 
            this.dungeon2.AutoSize = true;
            this.dungeon2.Location = new System.Drawing.Point(6, 55);
            this.dungeon2.Name = "dungeon2";
            this.dungeon2.Size = new System.Drawing.Size(147, 24);
            this.dungeon2.TabIndex = 64;
            this.dungeon2.Text = "Dungeon Name";
            this.dungeon2.UseVisualStyleBackColor = true;
            // 
            // dungeon1
            // 
            this.dungeon1.AutoSize = true;
            this.dungeon1.Location = new System.Drawing.Point(6, 25);
            this.dungeon1.Name = "dungeon1";
            this.dungeon1.Size = new System.Drawing.Size(147, 24);
            this.dungeon1.TabIndex = 63;
            this.dungeon1.Text = "Dungeon Name";
            this.dungeon1.UseVisualStyleBackColor = true;
            // 
            // completedQuest
            // 
            this.completedQuest.HideSelection = false;
            this.completedQuest.Location = new System.Drawing.Point(24, 342);
            this.completedQuest.Name = "completedQuest";
            this.completedQuest.Size = new System.Drawing.Size(286, 433);
            this.completedQuest.TabIndex = 65;
            this.completedQuest.UseCompatibleStateImageBehavior = false;
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(20, 316);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(164, 20);
            this.label10.TabIndex = 66;
            this.label10.Text = "Completed Dungeons";
            // 
            // charRace
            // 
            this.charRace.AutoSize = true;
            this.charRace.Location = new System.Drawing.Point(500, 257);
            this.charRace.Name = "charRace";
            this.charRace.Size = new System.Drawing.Size(14, 20);
            this.charRace.TabIndex = 76;
            this.charRace.Text = "-";
            // 
            // charGP
            // 
            this.charGP.AutoSize = true;
            this.charGP.Location = new System.Drawing.Point(732, 220);
            this.charGP.Name = "charGP";
            this.charGP.Size = new System.Drawing.Size(14, 20);
            this.charGP.TabIndex = 75;
            this.charGP.Text = "-";
            // 
            // charLvl
            // 
            this.charLvl.AutoSize = true;
            this.charLvl.Location = new System.Drawing.Point(732, 257);
            this.charLvl.Name = "charLvl";
            this.charLvl.Size = new System.Drawing.Size(14, 20);
            this.charLvl.TabIndex = 74;
            this.charLvl.Text = "-";
            // 
            // charName
            // 
            this.charName.AutoSize = true;
            this.charName.Location = new System.Drawing.Point(500, 220);
            this.charName.Name = "charName";
            this.charName.Size = new System.Drawing.Size(14, 20);
            this.charName.TabIndex = 73;
            this.charName.Text = "-";
            // 
            // label20
            // 
            this.label20.AutoSize = true;
            this.label20.Location = new System.Drawing.Point(366, 257);
            this.label20.Name = "label20";
            this.label20.Size = new System.Drawing.Size(47, 20);
            this.label20.TabIndex = 70;
            this.label20.Text = "Race";
            // 
            // label21
            // 
            this.label21.AutoSize = true;
            this.label21.Location = new System.Drawing.Point(598, 220);
            this.label21.Name = "label21";
            this.label21.Size = new System.Drawing.Size(86, 20);
            this.label21.TabIndex = 69;
            this.label21.Text = "Gold Piece";
            // 
            // label22
            // 
            this.label22.AutoSize = true;
            this.label22.Location = new System.Drawing.Point(598, 257);
            this.label22.Name = "label22";
            this.label22.Size = new System.Drawing.Size(46, 20);
            this.label22.TabIndex = 68;
            this.label22.Text = "Level";
            // 
            // label23
            // 
            this.label23.AutoSize = true;
            this.label23.Location = new System.Drawing.Point(366, 220);
            this.label23.Name = "label23";
            this.label23.Size = new System.Drawing.Size(51, 20);
            this.label23.TabIndex = 67;
            this.label23.Text = "Name";
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(367, 309);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(76, 20);
            this.label11.TabIndex = 77;
            this.label11.Text = "Next level";
            // 
            // ExpProgressbar
            // 
            this.ExpProgressbar.ForeColor = System.Drawing.Color.GreenYellow;
            this.ExpProgressbar.Location = new System.Drawing.Point(456, 304);
            this.ExpProgressbar.Name = "ExpProgressbar";
            this.ExpProgressbar.Size = new System.Drawing.Size(389, 32);
            this.ExpProgressbar.TabIndex = 66;
            // 
            // GUI
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1323, 796);
            this.Controls.Add(this.ExpProgressbar);
            this.Controls.Add(this.label11);
            this.Controls.Add(this.charRace);
            this.Controls.Add(this.charGP);
            this.Controls.Add(this.charLvl);
            this.Controls.Add(this.charName);
            this.Controls.Add(this.label20);
            this.Controls.Add(this.label21);
            this.Controls.Add(this.label22);
            this.Controls.Add(this.label23);
            this.Controls.Add(this.label10);
            this.Controls.Add(this.completedQuest);
            this.Controls.Add(this.pendingQuest);
            this.Controls.Add(this.label18);
            this.Controls.Add(this.btnStart);
            this.Controls.Add(this.btnStop);
            this.Controls.Add(this.statusProgress);
            this.Controls.Add(this.splitter2);
            this.Controls.Add(this.splitter1);
            this.Controls.Add(this.txtStatus);
            this.Controls.Add(this.charLck);
            this.Controls.Add(this.charWis);
            this.Controls.Add(this.charCon);
            this.Controls.Add(this.charDex);
            this.Controls.Add(this.charInt);
            this.Controls.Add(this.charStr);
            this.Controls.Add(this.charBoots);
            this.Controls.Add(this.charLegs);
            this.Controls.Add(this.charGloves);
            this.Controls.Add(this.charNeck);
            this.Controls.Add(this.charRing1);
            this.Controls.Add(this.charWeapon1);
            this.Controls.Add(this.charRing2);
            this.Controls.Add(this.charWeapon2);
            this.Controls.Add(this.charTorso);
            this.Controls.Add(this.charHead);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.manaProgressbar);
            this.Controls.Add(this.healthProgressbar);
            this.Controls.Add(this.cmbCharacter);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.lsbLoot);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.speed);
            this.Name = "GUI";
            this.Text = "Form1";
            ((System.ComponentModel.ISupportInitialize)(this.speed)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.pendingQuest.ResumeLayout(false);
            this.pendingQuest.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.ListBox lsbLoot;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.ComboBox cmbCharacter;
        private System.Windows.Forms.ProgressBar healthProgressbar;
        private System.Windows.Forms.ProgressBar manaProgressbar;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Label charHead;
        private System.Windows.Forms.Label charTorso;
        private System.Windows.Forms.Label charWeapon2;
        private System.Windows.Forms.Label charRing2;
        private System.Windows.Forms.Label charRing1;
        private System.Windows.Forms.Label charWeapon1;
        private System.Windows.Forms.Label charNeck;
        private System.Windows.Forms.Label charGloves;
        private System.Windows.Forms.Label charLegs;
        private System.Windows.Forms.Label charBoots;
        private System.Windows.Forms.Label charLck;
        private System.Windows.Forms.Label charWis;
        private System.Windows.Forms.Label charCon;
        private System.Windows.Forms.Label charDex;
        private System.Windows.Forms.Label charInt;
        private System.Windows.Forms.Label charStr;
        private System.Windows.Forms.Label txtStatus;
        private System.Windows.Forms.Splitter splitter1;
        private System.Windows.Forms.Splitter splitter2;
        private System.Windows.Forms.ProgressBar statusProgress;
        private System.Windows.Forms.TrackBar speed;
        private System.Windows.Forms.Button btnStop;
        private System.Windows.Forms.Button btnStart;
        private System.Windows.Forms.Label label18;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.GroupBox pendingQuest;
        private System.Windows.Forms.CheckBox dungeon3;
        private System.Windows.Forms.CheckBox dungeon2;
        private System.Windows.Forms.CheckBox dungeon1;
        private System.Windows.Forms.ProgressBar questProgressbar;
        private System.Windows.Forms.ListView completedQuest;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.Label charRace;
        private System.Windows.Forms.Label charGP;
        private System.Windows.Forms.Label charLvl;
        private System.Windows.Forms.Label charName;
        private System.Windows.Forms.Label label20;
        private System.Windows.Forms.Label label21;
        private System.Windows.Forms.Label label22;
        private System.Windows.Forms.Label label23;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.ProgressBar ExpProgressbar;
    }
}

