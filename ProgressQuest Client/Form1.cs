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
    public partial class Form1 : Form
    {
        SqlExecutor sqlExec;

        public Form1()
        {
            loadCharacterCmb();
            InitializeComponent();
        }

        private void BtnStart_Click(object sender, EventArgs e)
        {

        }

        public void loadCharacterCmb()
        {
            sqlExec.executeView("SELECT * FROM viewAllCharacters");
        }
    }
}
