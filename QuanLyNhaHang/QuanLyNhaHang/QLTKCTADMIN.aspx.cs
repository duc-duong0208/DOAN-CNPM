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
    public partial class QLTKCTADMIN : System.Web.UI.Page
    {
        string stcn = ConfigurationManager.ConnectionStrings["connec"].ConnectionString;
        ketnoics kn = new ketnoics();//khởi
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                    string tim = Context.Items["ct"].ToString();
                    string q = "select * from NhanVien where maTK ='" + tim + "'";
                string qadmin = "select * from Admin where maTK ='" + tim + "'";
                try
                {
                    SqlDataAdapter da1 = new SqlDataAdapter(qadmin, stcn);
                    DataTable dt1 = new DataTable(); da1.Fill(dt1);
                    this.GridView1.DataSource = dt1; this.GridView1.DataBind();
                    SqlDataAdapter da = new SqlDataAdapter(q, stcn);
                    DataTable dt = new DataTable(); da.Fill(dt);
                    this.GridView2.DataSource = dt; this.GridView2.DataBind();
                }
                catch (SqlException ex) { Response.Write(ex.Message); }
            }
        }
        protected void btnThem_Click1(object sender, EventArgs e)
        {

            TextBox txt_tendn = (TextBox)GridView1.FooterRow.FindControl("txt_tendn1");
            TextBox txt_mk = (TextBox)GridView1.FooterRow.FindControl("txt_mk1");
            TextBox txt_mtk = (TextBox)GridView1.FooterRow.FindControl("txt_mtk1");


            string txt_tendn1 = txt_tendn.Text;
            string txt_mk1 = txt_mk.Text;
            string txt_mtk1 = txt_mtk.Text;
            string qq = "select TaiKhoan.maTK from TaiKhoan,Admin " +
                " where TaiKhoan.maTK=Admin.maTK and TaiKhoan.maTK='" + txt_mtk1 + "'";
            SqlDataAdapter daa = new SqlDataAdapter(qq, stcn);
            DataTable dtt = new DataTable(); daa.Fill(dtt);
            int m = 0;
            foreach (DataRow row in dtt.Rows)
            {
                int xet = Convert.ToInt32(row["maTK"]);
                m = m + xet;
            }
            if (m != 0)
            {
                int kq = kn.xuly("insert into Admin values ( '" + txt_tendn1 + "', '" + txt_mk1 + "', '" + txt_mtk1 + "')");
                if (kq > 0)//neu cap nhat duoc thi hien thong bao
                {
                    Response.Write("<script>alert('cap nhat thanh công');</script>");
                    GridView1.DataSource = kn.laydata("SELECT * FROM Admin");
                    GridView1.DataBind();
                }
                else
                {
                    Response.Write("<script>alert('cap nhat không thanh công');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Yêu cầu thêm danh sách tài khoản người dùng để có đúng mã tài khoản hoặc bạn nhập lại đúng mã tài khoản');</script>");
                Server.Transfer("QLTK.aspx");

            }
        }



        protected void GridView1_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {

            string maloai1 = e.Values["TenDN"].ToString();
            int kq = kn.capnhat("delete from Admin  where TenDN = '" + maloai1 + "'");
            if (kq > 0)//neu cap nhat duoc thi hien thong bao
            {
                Response.Write("<script>alert('Xóa thanh công');</script>");
                GridView1.DataSource = kn.laydata("SELECT * FROM Admin");
                GridView1.DataBind();

            }
            else
            {
                Response.Write("<script>alert('Xóa không thanh công');</script>");

            }


        }

        protected void GridView1_RowEditing1(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GridView1.DataSource = kn.laydata("SELECT * FROM Admin");
            GridView1.DataBind();
        }
        ////////////////////////////////////////////////////
        protected void GridView1_RowCancelingEdit1(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;//không lấy giá trị cột nào hết
            GridView1.DataSource = kn.laydata("SELECT * FROM Admin");
            GridView1.DataBind();
        }
        ////////////////////////////////////////////////////////////

        protected void GridView1_RowUpdating1(object sender, GridViewUpdateEventArgs e)
        {
            string txt_matk1 = e.NewValues["maTK"].ToString();
            string txt_tendn1 = e.NewValues["TenDN"].ToString();
            string txt_mk1 = e.NewValues["MatKhau"].ToString();
            int kq = kn.capnhat("update Admin  set  MatKhau='" + txt_mk1 + "', maTK='" + txt_matk1 + "' where TenDN='" + txt_tendn1 + "'");
            if (kq > 0)//neu cap nhat duoc thi hien thong bao
            {
                Response.Write("<script>alert('Cập nhật thanh công');</script>");
                GridView1.DataSource = kn.laydata("SELECT* FROM Admin");
                GridView1.EditIndex = -1;
                GridView1.DataBind();
            }
            else
            {
                Response.Write("<script>alert('Cập nhật không thanh công');</script>");
            }
        }
        protected void btnThem1_Click1(object sender, EventArgs e)
        {

            TextBox txt_tendn = (TextBox)GridView2.FooterRow.FindControl("txt_tendn");
            TextBox txt_mk = (TextBox)GridView2.FooterRow.FindControl("txt_mk");
            TextBox txt_mtk = (TextBox)GridView2.FooterRow.FindControl("txt_mtk");


            string txt_tendn1 = txt_tendn.Text;
            string txt_mk1 = txt_mk.Text;
            string txt_mtk1 = txt_mtk.Text;

            string qq = "select TaiKhoan.maTK from TaiKhoan,NhanVien " +
               " where TaiKhoan.maTK=NhanVien.maTK and TaiKhoan.maTK='" + txt_mtk1 + "'";
            SqlDataAdapter daa = new SqlDataAdapter(qq, stcn);
            DataTable dtt = new DataTable(); daa.Fill(dtt);
            int m = 0;
            foreach (DataRow row in dtt.Rows)
            {
                int xet = Convert.ToInt32(row["maTK"]);
                m = m + xet;
            }
            if (m != 0) { 
            int kq = kn.xuly("insert into NhanVien values ( '" + txt_tendn1 + "', '" + txt_mk1 + "', '" + txt_mtk1 + "')");
            if (kq > 0)//neu cap nhat duoc thi hien thong bao
            {
                Response.Write("<script>alert('cap nhat thanh công');</script>");
                GridView2.DataSource = kn.laydata("SELECT * FROM NhanVien");
                GridView2.DataBind();
            }
            else
            {
                Response.Write("<script>alert('cap nhat không thanh công');</script>");
            }
            }
            else
            {
                Response.Write("<script>alert('Yêu cầu thêm danh sách tài khoản người dùng để có đúng mã tài khoản hoặc bạn nhập lại đúng mã tài khoản');</script>");
                Server.Transfer("QLTK.aspx");

            }
        }



        protected void GridView2_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {

            string maloai1 = e.Values["TenDN"].ToString();
            int kq = kn.capnhat("delete from NhanVien  where TenDN = '" + maloai1 + "'");
            if (kq > 0)//neu cap nhat duoc thi hien thong bao
            {
                Response.Write("<script>alert('Xóa thanh công');</script>");
                GridView2.DataSource = kn.laydata("SELECT * FROM NhanVien");
                GridView2.DataBind();

            }
            else
            {
                Response.Write("<script>alert('Xóa không thanh công');</script>");

            }


        }

        protected void GridView2_RowEditing1(object sender, GridViewEditEventArgs e)
        {
            GridView2.EditIndex = e.NewEditIndex;
            GridView2.DataSource = kn.laydata("SELECT * FROM NhanVien");
            GridView2.DataBind();
        }
        ////////////////////////////////////////////////////
        protected void GridView2_RowCancelingEdit1(object sender, GridViewCancelEditEventArgs e)
        {
            GridView2.EditIndex = -1;//không lấy giá trị cột nào hết
            GridView2.DataSource = kn.laydata("SELECT * FROM TaiKhoan");
            GridView2.DataBind();
        }
        ////////////////////////////////////////////////////////////

        protected void GridView2_RowUpdating1(object sender, GridViewUpdateEventArgs e)
        {
            string txt_matk1 = e.NewValues["maTK"].ToString();
            string txt_tendn1 = e.NewValues["TenDN"].ToString();
            string txt_mk1 = e.NewValues["MatKhau"].ToString();
            int kq = kn.capnhat("update NhanVien  set  MatKhau='" + txt_mk1 + "', maTK='" + txt_matk1 + "' where TenDN='" + txt_tendn1 + "'");
            if (kq > 0)//neu cap nhat duoc thi hien thong bao
            {
                Response.Write("<script>alert('Cập nhật thanh công');</script>");
                GridView2.DataSource = kn.laydata("SELECT* FROM NhanVien");
                GridView2.EditIndex = -1;
                GridView2.DataBind();
            }
            else
            {
                Response.Write("<script>alert('Cập nhật không thanh công');</script>");
            }
        }
    }
}