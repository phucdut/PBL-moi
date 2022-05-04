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
    public partial class Trang_chu : Form
    {
        public Trang_chu()
        {
            InitializeComponent();
            this.Text = "Trang chủ";
        }

        private void button24_Click(object sender, EventArgs e)
        {
            Thanh_toan tt = new Thanh_toan();
            tt.Show();
        }
    }
}
