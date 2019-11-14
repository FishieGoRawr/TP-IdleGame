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
        SqlPQ accessDB;

        public Form1()
        {
            accessDB = new SqlPQ();
            InitializeComponent();
        }

        private void Button1_Click(object sender, EventArgs e)
        {
            sqlExec = new SqlExecutor();
        }

        private void BtnTest_Click(object sender, EventArgs e)
        {
            sqlExec = new SqlExecutor();
            sqlExec.changeDatabase("lmao");
        }

        private void BtnStart_Click(object sender, EventArgs e)
        {
            accessDB.getAllCharacters();
        }
    }
}
