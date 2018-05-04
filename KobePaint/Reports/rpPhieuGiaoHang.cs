using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;
using KobePaint.App_Code;

namespace KobePaint.Reports
{
    public partial class rpPhieuGiaoHang : DevExpress.XtraReports.UI.XtraReport
    {
        public rpPhieuGiaoHang()
        {
            InitializeComponent();
        }
        private void xrLabel8_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            ConvertNumToText num2Text = new ConvertNumToText();
            ((XRLabel)sender).Text = num2Text.replace_special_word(((XRLabel)sender).Text).ToUpper().Trim() + "./.";
        }
    }
}
