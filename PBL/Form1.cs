using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PBL
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            txtname.Focus();
            txtpass.Focus();
        }

        private void butExit_Click(object sender, EventArgs e)
        {
            this.Close();
        }
        private void dangnhap()
        {
            Form11 fn2 = new Form11();
            if (txtname.Text.Length == 0 && txtpass.Text.Length == 0)
                MessageBox.Show("Bạn chưa đăng nhập mật khẩu");
            else
                if (this.txtname.Text.Length == 0)
                    MessageBox.Show("Bạn chưa nhập Username");
                else
                    if (this.txtpass.Text.Length == 0)
                        MessageBox.Show("Bạn chưa nhập Password");
                    else
                        if (this.txtname.Text == "admin" && this.txtpass.Text == "admin")
                            fn2.Show();
                        else
                            MessageBox.Show("Mật khẩu của bạn không đúng!");
        }
        private void butDN_Click(object sender, EventArgs e)
        {
            dangnhap();
        }

        
    }
}
