using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PBL.FormCN
{
    public partial class Ho_so : Form
    {
        public Ho_so()
        {
            InitializeComponent();
            this.Text = "Hồ sơ";
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Tai_khoan f = new Tai_khoan();
            f.Show();
        }
    }
}
