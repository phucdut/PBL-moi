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
    public partial class Thanh_toan : Form
    {
        public Thanh_toan()
        {
            InitializeComponent();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Hoa_don hd = new Hoa_don();
            hd.Show();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Khach_hang kh = new Khach_hang();
            kh.Show();
        }
    }
}
