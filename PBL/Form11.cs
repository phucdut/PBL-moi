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
    public partial class Form11 : Form
    {
        private Button currentButton;
        private Random random;
        private int tempIndex;
        private Form activeForm;
        public Form11()
        {
            InitializeComponent();
            random = new Random();
        }
        private Color SelectThemeColor()
        {
            int index = random.Next(ThemeColor.ColorList.Count);
            while(tempIndex == index)
            {
               index = random.Next(ThemeColor.ColorList.Count);
            }
            tempIndex = index;
            string color = ThemeColor.ColorList[index];
            return ColorTranslator.FromHtml(color);
        }
        private void ActivateButton(object btnSender)
        {
            if(btnSender != null)
            {
                if(currentButton != (Button)btnSender)
                {
                    DisableButton();
                    Color color = SelectThemeColor();
                    currentButton = (Button)btnSender;
                    currentButton.BackColor = color;
                    currentButton.ForeColor = Color.White;
                    currentButton.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
                    panel2.BackColor = color;
                    panel3.BackColor = ThemeColor.ChangeColorBrigthness(color, -0.3);
                }
            }
        }
        private void DisableButton()
        {
            foreach(Control previousBtn in panel1.Controls)
            {
                if(previousBtn.GetType() == typeof(Button))
                {
                    previousBtn.BackColor = Color.FromArgb(51, 51, 76);
                    previousBtn.ForeColor = Color.Gainsboro;
                    previousBtn.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));

                }
            }
        }

        private void OpenChildForm(Form chilForm, object btnSender)
        {
            if(activeForm != null)
            {
                activeForm.Close();
            }
            ActivateButton(btnSender);
            activeForm = chilForm;
            chilForm.TopLevel = false;
            chilForm.FormBorderStyle = FormBorderStyle.None;
            chilForm.Dock = DockStyle.Fill;
            this.panelDesktopPane.Controls.Add(chilForm);
            this.panelDesktopPane.Tag = chilForm;
            chilForm.BringToFront();
            chilForm.Show();
            label1.Text = chilForm.Text;
        }
        private void btnTC_Click(object sender, EventArgs e)
        {
            OpenChildForm(new FormCN.Trang_chu(), sender);
        }

        private void btnNV_Click(object sender, EventArgs e)
        {
            OpenChildForm(new FormCN.Nhan_vien(), sender);
        }

        private void btnKH_Click(object sender, EventArgs e)
        {
            OpenChildForm(new FormCN.Khach_hang(), sender);
        }

        private void btnHH_Click(object sender, EventArgs e)
        {
            OpenChildForm(new FormCN.Hang_hoa(), sender);
        }

        private void btnDT_Click(object sender, EventArgs e)
        {
            OpenChildForm(new FormCN.Doanh_thu(), sender);
        }

        private void btnHS_Click(object sender, EventArgs e)
        {
            OpenChildForm(new FormCN.Ho_so(), sender);
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            this.Close();
        }

    }
}
