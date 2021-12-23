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
    public partial class DatMon : System.Web.UI.Page
    {
        ketnoics kn = new ketnoics();

        string stcn = ConfigurationManager.ConnectionStrings["connec"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Page.IsPostBack) return;
                try
                {
                    string q = "select DonDatMon.MaMonAn,TenMonAn,DonGia,SoLuong,HinhAnh," +
                        "SoLuong*DonGia as thanhtien from DonDatMon,MonAn " +
                        " where MonAn.MaMonAn = DonDatMon.MaMonAn";
                    SqlDataAdapter da = new SqlDataAdapter(q, stcn);
                    DataTable dt = new DataTable(); da.Fill(dt);
                    this.GridView1.DataSource = dt; this.GridView1.DataBind();                 //Tính tổng thành tiền: duyệt dataTable  
                    double tong = 0;
                    foreach (DataRow row in dt.Rows)
                    {
                        double thanhtienpk = Convert.ToDouble(row["thanhtien"]);
                        tong = tong + thanhtienpk;
                    }

                    this.Label1.Text = "Tổng thành tiền: " + tong + " VND";
                }
                catch (SqlException ex)
                {
                    Response.Write(ex.Message);
                }
            }
        }

        protected void GridView1_RowEditing1(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GridView1.DataSource = kn.laydata("SELECT DonDatMon.MaMonAn,TenMonAn,DonGia,SoLuong,HinhAnh," +
                    "SoLuong*DonGia as thanhtien from DonDatMon,MonAn " +
                    " where MonAn.MaMonAn = DonDatMon.MaMonAn");
            GridView1.DataBind();
        }
        ////////////////////////////////////////////////////
        protected void GridView1_RowCancelingEdit1(object sender, GridViewCancelEditEventArgs e)
        {

            GridView1.EditIndex = -1;
            GridView1.DataSource = kn.laydata("SELECT DonDatMon.MaMonAn,TenMonAn,DonGia,SoLuong,HinhAnh," +
                    "SoLuong*DonGia as thanhtienpk from DonDatMon,MonAn " +
                    " where MonAn.MaMonAn = DonDatMon.MaMonAn");
            GridView1.DataBind();
        }


        protected void GridView1_RowUpdating1(object sender, GridViewUpdateEventArgs e)
        {
            string txt_matk1 = e.NewValues["MaMonAn"].ToString();
            string txt_tenngdung1 = e.NewValues["SoLuong"].ToString();

            int kq = kn.capnhat("update DonDatMon  set SoLuong= '" + txt_tenngdung1 + "' where MaMonAn='" + txt_matk1 + "'");
            if (kq > 0)//neu cap nhat duoc thi hien thong bao
            {
                Response.Write("<script>alert('Cập nhật thanh công');</script>");
                GridView1.DataSource = kn.laydata("SELECT DonDatMon.MaMonAn,TenMonAn,DonGia,SoLuong,HinhAnh," +
                    "SoLuong*DonGia as thanhtien from DonDatMon,MonAn " +
                    " where MonAn.MaMonAn = DonDatMon.MaMonAn");
                string q = "select DonDatMon.MaMonAn,TenMonAn,DonGia,SoLuong,HinhAnh," +
                        "SoLuong*DonGia as thanhtien from DonDatMon,MonAn " +
                        " where MonAn.MaMonAn = DonDatMon.MaMonAn";
                SqlDataAdapter da = new SqlDataAdapter(q, stcn);
                DataTable dt = new DataTable(); da.Fill(dt);
                this.GridView1.DataSource = dt; this.GridView1.DataBind();          
                double tong = 0;
                foreach (DataRow row in dt.Rows)
                {
                    double thanhtienpk = Convert.ToDouble(row["thanhtien"]);
                    tong = tong + thanhtienpk;
                }

                this.Label1.Text = "Tổng thành tiền: " + tong + " VND";
                GridView1.EditIndex = -1;
                GridView1.DataBind();
            }
            else
            {
                Response.Write("<script>alert('Cập nhật không thanh công');</script>");
            }
        }

        protected void GridView1_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {
            string maloai1 = e.Values["MaMonAn"].ToString();
            int kq = kn.capnhat("delete from DonDatMon  where MaMonAn = " + maloai1);
            if (kq > 0)//neu cap nhat duoc thi hien thong bao
            {
                Response.Write("<script>alert('Xóa thanh công');</script>");
                GridView1.DataSource = kn.laydata("SELECT MaMonAn FROM* DonDatMon");
                GridView1.DataSource = kn.laydata("SELECT DonDatMon.MaMonAn,TenMonAn,DonGia,SoLuong,HinhAnh," +
                    "SoLuong*DonGia as thanhtien from DonDatMon,MonAn " +
                    " where MonAn.MaMonAn = DonDatMon.MaMonAn");
                string q = "select DonDatMon.MaMonAn,TenMonAn,DonGia,SoLuong,HinhAnh," +
                       "SoLuong*DonGia as thanhtien from DonDatMon,MonAn " +
                       " where MonAn.MaMonAn = DonDatMon.MaMonAn";
                SqlDataAdapter da = new SqlDataAdapter(q, stcn);
                DataTable dt = new DataTable(); da.Fill(dt);
                this.GridView1.DataSource = dt; this.GridView1.DataBind();
                double tong = 0;
                foreach (DataRow row in dt.Rows)
                {
                    double thanhtienpk = Convert.ToDouble(row["thanhtien"]);
                    tong = tong + thanhtienpk;
                }

                this.Label1.Text = "Tổng thành tiền: " + tong + " VND";
                GridView1.DataBind();


            }
            else
            {
                Response.Write("<script>alert('Xóa không thanh công');</script>");

            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

            Context.Items["hoten"] = TextBox_hoten.Text;
            Context.Items["phone"] = TextBox_phone.Text;
            Context.Items["ngay"] = TextBox_ngay.Text;
            Context.Items["sl"] = TextBox_sl.Text;
            Context.Items["time"] = TextBox_time.Text;


            foreach (ListItem item in RadioButtonListanhchi.Items)
            {

                if (item.Selected)
                {

                    Context.Items["who"] += item.Text;
                }
            }
            foreach (ListItem item in RadioButtonList_hinhthucchonban.Items)
            {

                if (item.Selected)
                {

                    Context.Items["hinhthuc"] += item.Text + "";
                }
            }
            string q = "select DonDatMon.MaMonAn,TenMonAn,DonGia,SoLuong,HinhAnh," +
                    "SoLuong*DonGia as thanhtien from DonDatMon,MonAn " +
                    " where MonAn.MaMonAn = DonDatMon.MaMonAn";
            SqlDataAdapter da = new SqlDataAdapter(q, stcn);
            DataTable dt = new DataTable(); da.Fill(dt);
            double tong = 0;
            foreach (DataRow row in dt.Rows)
            {
                double thanhtienpk = Convert.ToDouble(row["thanhtien"]);
                tong = tong + thanhtienpk;
            }
            DateTime date = DateTime.Now;
            if (Convert.ToInt32(TextBox_ngay.Text.Substring(0, 4)) >= Convert.ToInt32(date.Year.ToString()))
            {
                if(Convert.ToInt32(TextBox_ngay.Text.Substring(5, 2)) >= Convert.ToInt32(date.Month.ToString()))
                {
                    if (Convert.ToInt32(TextBox_ngay.Text.Substring(8, 2)) >= Convert.ToInt32(date.Day.ToString()))
                    {
                        Server.Transfer("DatHang.aspx");
                       
                    }
                    else
                    {
                        Response.Write("<script>alert('Xác Nhận Đơn Đặt Hàng Không Thành Công Moi Bạn Nhập Lại Đúng ');</script>");
                        Server.Transfer("DatMon.aspx");
                    }
                }
            }
          
            Context.Items["thanhtoan"] = tong;
            // 8-2 ngay 5-2
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {


            Server.Transfer("TrangChu.aspx");

        }
    }


}