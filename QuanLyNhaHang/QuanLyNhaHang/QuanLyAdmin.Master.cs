using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhaHang
{
    public partial class QuanLyAdmin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            string ten = "Quản Lý Tài Khoản";
            Context.Items["ten"] = ten;
            Server.Transfer("QLTK.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            string ten = "Quản Lý Đơn hàng";
            Context.Items["ten"] = ten;
            Server.Transfer("QLDHADMIN.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            string ten = "Quản Lý Sản Phẩm";
            Context.Items["ten"] = ten;
            Server.Transfer("QLML.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            string ten = "Thống Kê";
            Context.Items["ten"] = ten;
            Server.Transfer("ThongKe.aspx");
        }
        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            string ten = "Danh Sách Đen";
            Context.Items["ten"] = ten;
            Server.Transfer("ThongKe.aspx");
        }
        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            string ten = "Liên Hệ";
            Context.Items["ten"] = ten;
            Server.Transfer("XemLienHeADMIN.aspx");
        }
    }
}