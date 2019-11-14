namespace ProgressQuest_Client
{
    partial class Form1
    {
        /// <summary>
        /// Variable nécessaire au concepteur.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Nettoyage des ressources utilisées.
        /// </summary>
        /// <param name="disposing">true si les ressources managées doivent être supprimées ; sinon, false.</param>
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
            this.loot = new System.Windows.Forms.ListBox();
            this.label7 = new System.Windows.Forms.Label();
            this.cmbCharacter = new System.Windows.Forms.ComboBox();
            this.healthProgressbar = new System.Windows.Forms.ProgressBar();
            this.manaProgressbar = new System.Windows.Forms.ProgressBar();
            this.label8 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
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
            this.label10 = new System.Windows.Forms.Label();
            this.pendingQuest = new System.Windows.Forms.GroupBox();
            this.dungeon1 = new System.Windows.Forms.CheckBox();
            this.dungeon2 = new System.Windows.Forms.CheckBox();
            this.dungeon3 = new System.Windows.Forms.CheckBox();
            this.questProgressBar = new System.Windows.Forms.ProgressBar();
            this.stats = new System.Windows.Forms.GroupBox();
            this.questName = new System.Windows.Forms.Label();
            this.completedQuest = new System.Windows.Forms.ListView();
            this.label11 = new System.Windows.Forms.Label();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.charHead = new System.Windows.Forms.Label();
            this.charNeck = new System.Windows.Forms.Label();
            this.charTorso = new System.Windows.Forms.Label();
            this.charRing1 = new System.Windows.Forms.Label();
            this.charRing2 = new System.Windows.Forms.Label();
            this.charWeapon1 = new System.Windows.Forms.Label();
            this.charWeapon2 = new System.Windows.Forms.Label();
            this.charLegs = new System.Windows.Forms.Label();
            this.charBoots = new System.Windows.Forms.Label();
            this.charGloves = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.speed)).BeginInit();
            this.pendingQuest.SuspendLayout();
            this.stats.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(6, 34);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(71, 20);
            this.label1.TabIndex = 0;
            this.label1.Text = "Strength";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(6, 147);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(87, 20);
            this.label2.TabIndex = 1;
            this.label2.Text = "Inteligence";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(6, 110);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(71, 20);
            this.label3.TabIndex = 2;
            this.label3.Text = "Dexterity";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(6, 71);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(94, 20);
            this.label4.TabIndex = 3;
            this.label4.Text = "Constitution";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(6, 182);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(66, 20);
            this.label5.TabIndex = 4;
            this.label5.Text = "Wisdom";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(6, 215);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(43, 20);
            this.label6.TabIndex = 5;
            this.label6.Text = "Luck";
            // 
            // loot
            // 
            this.loot.FormattingEnabled = true;
            this.loot.ItemHeight = 20;
            this.loot.Location = new System.Drawing.Point(359, 353);
            this.loot.Name = "loot";
            this.loot.Size = new System.Drawing.Size(486, 324);
            this.loot.TabIndex = 6;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(355, 330);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(41, 20);
            this.label7.TabIndex = 7;
            this.label7.Text = "Loot";
            // 
            // cmbCharacter
            // 
            this.cmbCharacter.FormattingEnabled = true;
            this.cmbCharacter.Location = new System.Drawing.Point(350, 26);
            this.cmbCharacter.Name = "cmbCharacter";
            this.cmbCharacter.Size = new System.Drawing.Size(335, 28);
            this.cmbCharacter.TabIndex = 8;
            this.cmbCharacter.Text = "Charge character";
            // 
            // healthProgressbar
            // 
            this.healthProgressbar.Location = new System.Drawing.Point(865, 573);
            this.healthProgressbar.Name = "healthProgressbar";
            this.healthProgressbar.Size = new System.Drawing.Size(441, 32);
            this.healthProgressbar.TabIndex = 9;
            // 
            // manaProgressbar
            // 
            this.manaProgressbar.Location = new System.Drawing.Point(865, 645);
            this.manaProgressbar.Name = "manaProgressbar";
            this.manaProgressbar.Size = new System.Drawing.Size(441, 32);
            this.manaProgressbar.TabIndex = 10;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(861, 550);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(56, 20);
            this.label8.TabIndex = 11;
            this.label8.Text = "Health";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(861, 622);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(49, 20);
            this.label9.TabIndex = 12;
            this.label9.Text = "Mana";
            // 
            // charLck
            // 
            this.charLck.AutoSize = true;
            this.charLck.Location = new System.Drawing.Point(198, 215);
            this.charLck.Name = "charLck";
            this.charLck.Size = new System.Drawing.Size(74, 20);
            this.charLck.TabIndex = 29;
            this.charLck.Text = "charLuck";
            // 
            // charWis
            // 
            this.charWis.AutoSize = true;
            this.charWis.Location = new System.Drawing.Point(198, 182);
            this.charWis.Name = "charWis";
            this.charWis.Size = new System.Drawing.Size(97, 20);
            this.charWis.TabIndex = 28;
            this.charWis.Text = "charWisdom";
            // 
            // charCon
            // 
            this.charCon.AutoSize = true;
            this.charCon.Location = new System.Drawing.Point(198, 71);
            this.charCon.Name = "charCon";
            this.charCon.Size = new System.Drawing.Size(125, 20);
            this.charCon.TabIndex = 27;
            this.charCon.Text = "charConstitution";
            // 
            // charDex
            // 
            this.charDex.AutoSize = true;
            this.charDex.Location = new System.Drawing.Point(198, 110);
            this.charDex.Name = "charDex";
            this.charDex.Size = new System.Drawing.Size(102, 20);
            this.charDex.TabIndex = 26;
            this.charDex.Text = "charDexterity";
            // 
            // charInt
            // 
            this.charInt.AutoSize = true;
            this.charInt.Location = new System.Drawing.Point(198, 147);
            this.charInt.Name = "charInt";
            this.charInt.Size = new System.Drawing.Size(118, 20);
            this.charInt.TabIndex = 25;
            this.charInt.Text = "charInteligence";
            // 
            // charStr
            // 
            this.charStr.AutoSize = true;
            this.charStr.Location = new System.Drawing.Point(198, 34);
            this.charStr.Name = "charStr";
            this.charStr.Size = new System.Drawing.Size(102, 20);
            this.charStr.TabIndex = 24;
            this.charStr.Text = "charStrength";
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
            this.speed.Location = new System.Drawing.Point(913, 46);
            this.speed.Maximum = 2;
            this.speed.Name = "speed";
            this.speed.Size = new System.Drawing.Size(222, 69);
            this.speed.TabIndex = 60;
            // 
            // btnStop
            // 
            this.btnStop.Location = new System.Drawing.Point(1155, 20);
            this.btnStop.Name = "btnStop";
            this.btnStop.Size = new System.Drawing.Size(151, 33);
            this.btnStop.TabIndex = 35;
            this.btnStop.Text = "Stop";
            this.btnStop.UseVisualStyleBackColor = true;
            // 
            // btnStart
            // 
            this.btnStart.Location = new System.Drawing.Point(742, 20);
            this.btnStart.Name = "btnStart";
            this.btnStart.Size = new System.Drawing.Size(151, 33);
            this.btnStart.TabIndex = 36;
            this.btnStart.Text = "Start";
            this.btnStart.UseVisualStyleBackColor = true;
            // 
            // label18
            // 
            this.label18.AutoSize = true;
            this.label18.Location = new System.Drawing.Point(922, 20);
            this.label18.Name = "label18";
            this.label18.Size = new System.Drawing.Size(56, 20);
            this.label18.TabIndex = 61;
            this.label18.Text = "Speed";
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(24, 26);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(0, 20);
            this.label10.TabIndex = 62;
            // 
            // pendingQuest
            // 
            this.pendingQuest.Controls.Add(this.questName);
            this.pendingQuest.Controls.Add(this.dungeon3);
            this.pendingQuest.Controls.Add(this.dungeon2);
            this.pendingQuest.Controls.Add(this.dungeon1);
            this.pendingQuest.Location = new System.Drawing.Point(28, 26);
            this.pendingQuest.Name = "pendingQuest";
            this.pendingQuest.Size = new System.Drawing.Size(288, 284);
            this.pendingQuest.TabIndex = 63;
            this.pendingQuest.TabStop = false;
            this.pendingQuest.Text = "Pending quest";
            // 
            // dungeon1
            // 
            this.dungeon1.AutoSize = true;
            this.dungeon1.Location = new System.Drawing.Point(22, 72);
            this.dungeon1.Name = "dungeon1";
            this.dungeon1.Size = new System.Drawing.Size(144, 24);
            this.dungeon1.TabIndex = 0;
            this.dungeon1.Text = "Name dungeon";
            this.dungeon1.UseVisualStyleBackColor = true;
            // 
            // dungeon2
            // 
            this.dungeon2.AutoSize = true;
            this.dungeon2.Location = new System.Drawing.Point(22, 99);
            this.dungeon2.Name = "dungeon2";
            this.dungeon2.Size = new System.Drawing.Size(144, 24);
            this.dungeon2.TabIndex = 1;
            this.dungeon2.Text = "Name dungeon";
            this.dungeon2.UseVisualStyleBackColor = true;
            // 
            // dungeon3
            // 
            this.dungeon3.AutoSize = true;
            this.dungeon3.Location = new System.Drawing.Point(22, 129);
            this.dungeon3.Name = "dungeon3";
            this.dungeon3.Size = new System.Drawing.Size(144, 24);
            this.dungeon3.TabIndex = 2;
            this.dungeon3.Text = "Name dungeon";
            this.dungeon3.UseVisualStyleBackColor = true;
            // 
            // questProgressBar
            // 
            this.questProgressBar.Location = new System.Drawing.Point(34, 269);
            this.questProgressBar.Name = "questProgressBar";
            this.questProgressBar.Size = new System.Drawing.Size(276, 32);
            this.questProgressBar.TabIndex = 64;
            // 
            // stats
            // 
            this.stats.Controls.Add(this.charLck);
            this.stats.Controls.Add(this.charWis);
            this.stats.Controls.Add(this.charCon);
            this.stats.Controls.Add(this.charDex);
            this.stats.Controls.Add(this.charInt);
            this.stats.Controls.Add(this.charStr);
            this.stats.Controls.Add(this.label6);
            this.stats.Controls.Add(this.label5);
            this.stats.Controls.Add(this.label4);
            this.stats.Controls.Add(this.label3);
            this.stats.Controls.Add(this.label2);
            this.stats.Controls.Add(this.label1);
            this.stats.Location = new System.Drawing.Point(350, 68);
            this.stats.Name = "stats";
            this.stats.Size = new System.Drawing.Size(393, 250);
            this.stats.TabIndex = 65;
            this.stats.TabStop = false;
            this.stats.Text = "Stats";
            // 
            // questName
            // 
            this.questName.AutoSize = true;
            this.questName.Location = new System.Drawing.Point(18, 42);
            this.questName.Name = "questName";
            this.questName.Size = new System.Drawing.Size(95, 20);
            this.questName.TabIndex = 30;
            this.questName.Text = "Name quest";
            // 
            // completedQuest
            // 
            this.completedQuest.HideSelection = false;
            this.completedQuest.Location = new System.Drawing.Point(28, 353);
            this.completedQuest.Name = "completedQuest";
            this.completedQuest.Size = new System.Drawing.Size(288, 422);
            this.completedQuest.TabIndex = 66;
            this.completedQuest.UseCompatibleStateImageBehavior = false;
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(24, 328);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(130, 20);
            this.label11.TabIndex = 67;
            this.label11.Text = "Completed quest";
            // 
            // pictureBox1
            // 
            this.pictureBox1.Image = global::ProgressQuest_Client.Properties.Resources.téléchargement;
            this.pictureBox1.Location = new System.Drawing.Point(865, 98);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(441, 429);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 68;
            this.pictureBox1.TabStop = false;
            // 
            // charHead
            // 
            this.charHead.AutoSize = true;
            this.charHead.Location = new System.Drawing.Point(1067, 125);
            this.charHead.Name = "charHead";
            this.charHead.Size = new System.Drawing.Size(48, 20);
            this.charHead.TabIndex = 69;
            this.charHead.Text = "Head";
            // 
            // charNeck
            // 
            this.charNeck.AutoSize = true;
            this.charNeck.Location = new System.Drawing.Point(1051, 174);
            this.charNeck.Name = "charNeck";
            this.charNeck.Size = new System.Drawing.Size(74, 20);
            this.charNeck.TabIndex = 70;
            this.charNeck.Text = "Necklace";
            // 
            // charTorso
            // 
            this.charTorso.AutoSize = true;
            this.charTorso.Location = new System.Drawing.Point(1062, 234);
            this.charTorso.Name = "charTorso";
            this.charTorso.Size = new System.Drawing.Size(49, 20);
            this.charTorso.TabIndex = 71;
            this.charTorso.Text = "Torso";
            // 
            // charRing1
            // 
            this.charRing1.AutoSize = true;
            this.charRing1.Location = new System.Drawing.Point(946, 340);
            this.charRing1.Name = "charRing1";
            this.charRing1.Size = new System.Drawing.Size(55, 20);
            this.charRing1.TabIndex = 72;
            this.charRing1.Text = "Ring 1";
            // 
            // charRing2
            // 
            this.charRing2.AutoSize = true;
            this.charRing2.Location = new System.Drawing.Point(1162, 349);
            this.charRing2.Name = "charRing2";
            this.charRing2.Size = new System.Drawing.Size(55, 20);
            this.charRing2.TabIndex = 73;
            this.charRing2.Text = "Ring 2";
            // 
            // charWeapon1
            // 
            this.charWeapon1.AutoSize = true;
            this.charWeapon1.Location = new System.Drawing.Point(881, 307);
            this.charWeapon1.Name = "charWeapon1";
            this.charWeapon1.Size = new System.Drawing.Size(82, 20);
            this.charWeapon1.TabIndex = 74;
            this.charWeapon1.Text = "Weapon 1";
            // 
            // charWeapon2
            // 
            this.charWeapon2.AutoSize = true;
            this.charWeapon2.Location = new System.Drawing.Point(1206, 307);
            this.charWeapon2.Name = "charWeapon2";
            this.charWeapon2.Size = new System.Drawing.Size(82, 20);
            this.charWeapon2.TabIndex = 75;
            this.charWeapon2.Text = "Weapon 2";
            // 
            // charLegs
            // 
            this.charLegs.AutoSize = true;
            this.charLegs.Location = new System.Drawing.Point(1062, 395);
            this.charLegs.Name = "charLegs";
            this.charLegs.Size = new System.Drawing.Size(44, 20);
            this.charLegs.TabIndex = 76;
            this.charLegs.Text = "Legs";
            // 
            // charBoots
            // 
            this.charBoots.AutoSize = true;
            this.charBoots.Location = new System.Drawing.Point(1055, 477);
            this.charBoots.Name = "charBoots";
            this.charBoots.Size = new System.Drawing.Size(51, 20);
            this.charBoots.TabIndex = 77;
            this.charBoots.Text = "Boots";
            // 
            // charGloves
            // 
            this.charGloves.AutoSize = true;
            this.charGloves.Location = new System.Drawing.Point(881, 250);
            this.charGloves.Name = "charGloves";
            this.charGloves.Size = new System.Drawing.Size(58, 20);
            this.charGloves.TabIndex = 78;
            this.charGloves.Text = "Gloves";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1330, 796);
            this.Controls.Add(this.charGloves);
            this.Controls.Add(this.charBoots);
            this.Controls.Add(this.charLegs);
            this.Controls.Add(this.charWeapon2);
            this.Controls.Add(this.charWeapon1);
            this.Controls.Add(this.charRing2);
            this.Controls.Add(this.charRing1);
            this.Controls.Add(this.charTorso);
            this.Controls.Add(this.charNeck);
            this.Controls.Add(this.charHead);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.label11);
            this.Controls.Add(this.completedQuest);
            this.Controls.Add(this.stats);
            this.Controls.Add(this.questProgressBar);
            this.Controls.Add(this.pendingQuest);
            this.Controls.Add(this.label10);
            this.Controls.Add(this.label18);
            this.Controls.Add(this.btnStart);
            this.Controls.Add(this.btnStop);
            this.Controls.Add(this.speed);
            this.Controls.Add(this.statusProgress);
            this.Controls.Add(this.splitter2);
            this.Controls.Add(this.splitter1);
            this.Controls.Add(this.txtStatus);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.manaProgressbar);
            this.Controls.Add(this.healthProgressbar);
            this.Controls.Add(this.cmbCharacter);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.loot);
            this.Name = "Form1";
            this.Text = "Form1";
            ((System.ComponentModel.ISupportInitialize)(this.speed)).EndInit();
            this.pendingQuest.ResumeLayout(false);
            this.pendingQuest.PerformLayout();
            this.stats.ResumeLayout(false);
            this.stats.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
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
        private System.Windows.Forms.ListBox loot;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.ComboBox cmbCharacter;
        private System.Windows.Forms.ProgressBar healthProgressbar;
        private System.Windows.Forms.ProgressBar manaProgressbar;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label label9;
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
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.GroupBox pendingQuest;
        private System.Windows.Forms.CheckBox dungeon1;
        private System.Windows.Forms.CheckBox dungeon3;
        private System.Windows.Forms.CheckBox dungeon2;
        private System.Windows.Forms.ProgressBar questProgressBar;
        private System.Windows.Forms.GroupBox stats;
        private System.Windows.Forms.Label questName;
        private System.Windows.Forms.ListView completedQuest;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Label charHead;
        private System.Windows.Forms.Label charNeck;
        private System.Windows.Forms.Label charTorso;
        private System.Windows.Forms.Label charRing1;
        private System.Windows.Forms.Label charRing2;
        private System.Windows.Forms.Label charWeapon1;
        private System.Windows.Forms.Label charWeapon2;
        private System.Windows.Forms.Label charLegs;
        private System.Windows.Forms.Label charBoots;
        private System.Windows.Forms.Label charGloves;
    }
}
