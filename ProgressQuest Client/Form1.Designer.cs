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
            this.btnTestCnx = new System.Windows.Forms.Button();
            this.btnTest = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btnTestCnx
            // 
            this.btnTestCnx.Location = new System.Drawing.Point(389, 327);
            this.btnTestCnx.Name = "btnTestCnx";
            this.btnTestCnx.Size = new System.Drawing.Size(134, 56);
            this.btnTestCnx.TabIndex = 0;
            this.btnTestCnx.Text = "Tester la connection";
            this.btnTestCnx.UseVisualStyleBackColor = true;
            this.btnTestCnx.Click += new System.EventHandler(this.Button1_Click);
            // 
            // btnTest
            // 
            this.btnTest.Location = new System.Drawing.Point(237, 327);
            this.btnTest.Name = "btnTest";
            this.btnTest.Size = new System.Drawing.Size(134, 56);
            this.btnTest.TabIndex = 1;
            this.btnTest.Text = "Tests divers";
            this.btnTest.UseVisualStyleBackColor = true;
            this.btnTest.Click += new System.EventHandler(this.BtnTest_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(783, 758);
            this.Controls.Add(this.btnTest);
            this.Controls.Add(this.btnTestCnx);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnTestCnx;
        private System.Windows.Forms.Button btnTest;
    }
}

