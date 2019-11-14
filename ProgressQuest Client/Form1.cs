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
            //sqlExec = new SqlExecutor();
            //object[,] param = new object[2, 2];

            //param[0, 0] = "@name";
            //param[0, 1] = "Lmao";
            //param[1, 0] = "@value";
            //param[1, 1] = 10;

            //sqlExec.executeSP("spCreateLoot", param);

            sqlExec = new SqlExecutor();

        }

        private void CheckBox3_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void CheckBox2_CheckedChanged(object sender, EventArgs e)
        {

        }
    }
}
