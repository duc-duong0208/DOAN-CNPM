using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhaHang
{
    public partial class tanggiambanchay : System.Web.UI.MasterPage
    {
        string stcn = ConfigurationManager.ConnectionStrings["connec"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;

            try
            {
                string q = "select *from LoaiMon";
                SqlDataAdapter da = new SqlDataAdapter(q, stcn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                this.DataList1.DataSource = dt;
                this.DataList1.DataBind();
            }
            catch (SqlException ex)
            {
                Response.Write(ex.Message);
            }
        }
        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Server.Transfer("TrangChu.aspx");
        }
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            string maloai = ((LinkButton)sender).CommandArgument;
            Context.Items["ml"] = maloai; Server.Transfer("TrangChu.aspx");
        }
        protected void TangDan_Click(object sender, EventArgs e)
        {
            Server.Transfer("GiaTangDan.aspx");
        }
        protected void GiamDan_Click(object sender, EventArgs e)
        {
            Server.Transfer("GiamDan.aspx");
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            LinkButton tk = (LinkButton)sender;
            string tim = ((TextBox)tk.FindControl("TextBox1")).Text;
            Context.Items["mtimm"] = tim; Server.Transfer("timkiem.aspx");
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            LinkButton tk = (LinkButton)sender;

            string user = ((TextBox)tk.FindControl("txt_user")).Text;
            string pass = ((TextBox)tk.FindControl("txt_pass")).Text;
            string sqladmin = "select * from TaiKhoan where userName='" + user + "' and MatKhau = '" + pass + "'and MaQSH = '1'";
            string sql = "select * from TaiKhoan where userName='" + user + "' and MatKhau = '" + pass + "'and MaQSH = '2'";
            DataTable table = new DataTable();
            DataTable table1 = new DataTable();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter(sqladmin, stcn);
                da.Fill(table);
                SqlDataAdapter da1 = new SqlDataAdapter(sql, stcn);
                da1.Fill(table1);
            }
            catch (SqlException err)
            {
                Response.Write("<b>Error</b>" + err.Message + "<p/>");
            }
            if (table.Rows.Count != 0)
            {
                Server.Transfer("QLTK.aspx");
            }
            else if (table1.Rows.Count != 0)
            {
                Server.Transfer("QLDH.aspx");
            }
            else Response.Write("<script>alert('Tên Đăng Nhập Hoặc Mật Khẩu Không Đúng');</script>");

        }

        protected void BanChay_Click(object sender, EventArgs e)
        {
            Server.Transfer("BanChay.aspx");
        }
    }
}