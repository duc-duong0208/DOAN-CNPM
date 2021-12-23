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
    public partial class XemCTDH : System.Web.UI.Page
    {
        string stcn = ConfigurationManager.ConnectionStrings["connec"].ConnectionString;
        ketnoics kn = new ketnoics();//khởi
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //Code display data

                string q; if (Context.Items["ctdh"] == null)
                    q = "select * from DonDatMonCT";

                else
                {
                    string tim = Context.Items["ctdh"].ToString();
                    q = "select * from DonDatMonCT where ID ='" + tim + "'";
                }
                try
                {
                    SqlDataAdapter da = new SqlDataAdapter(q, stcn);
                    DataTable dt = new DataTable(); da.Fill(dt);
                    this.GridView1.DataSource = dt; this.GridView1.DataBind();
                }
                catch (SqlException ex) { Response.Write(ex.Message); }
            }
        }
        protected void btnThem_Click1(object sender, EventArgs e)
        {

            TextBox txt_tenkhachhang = (TextBox)GridView1.FooterRow.FindControl("txt_mamonan");
            TextBox txt_sdt = (TextBox)GridView1.FooterRow.FindControl("txt_tenmonan");
            TextBox txt_sl = (TextBox)GridView1.FooterRow.FindControl("txt_soluong");
            TextBox txt_ngay = (TextBox)GridView1.FooterRow.FindControl("txt_idd");

            string txt_tenngdung1 = txt_tenkhachhang.Text;
            string txt_sdt1 = txt_sdt.Text;
            string txt_sl1 = txt_sl.Text;
            string txt_ngay1 = txt_ngay.Text;

            string qq = "select DonDatMonCT.MaMonAn,QLDH.ID from QLDH,DonDatMonCT " +
                  " where QLDH.ID=DonDatMonCT.ID and QLDH.ID='" + txt_ngay1 + "'";
            SqlDataAdapter daa = new SqlDataAdapter(qq, stcn);
            DataTable dtt = new DataTable(); daa.Fill(dtt);
            int m = 0;
            foreach (DataRow row in dtt.Rows)
            {
                int xet = Convert.ToInt32(row["ID"]);
                m = m + xet;
            }

            if (m != 0)
            {          
            int kq = kn.xuly("insert into DonDatMonCT values ('" + txt_tenngdung1 + "', '" + txt_sdt1 + "', '" + txt_sl1 + "', '" + txt_ngay1 + "')");
            if (kq > 0)//neu cap nhat duoc thi hien thong bao
            {
                Response.Write("<script>alert('cap nhat thanh công');</script>");
                    GridView1.DataSource = kn.laydata("select * from DonDatMonCT where ID = '" + txt_ngay1 + "'");
                    GridView1.DataBind();
                string q = "select DonDatMonCT.MaMonAn,DonGia,SoLuong," +
                  "SoLuong*DonGia as thanhtienpk from MonAn,DonDatMonCT " +
                  " where DonDatMonCT.MaMonAn=MonAn.MaMonAn and ID='" + txt_ngay1 + "'";
                SqlDataAdapter da = new SqlDataAdapter(q, stcn);
                DataTable dt = new DataTable(); da.Fill(dt);
                double tong = 0;
                foreach (DataRow row1 in dt.Rows)
                {
                    double thanhtienpk = Convert.ToDouble(row1["thanhtienpk"]);
                    tong = tong + thanhtienpk;
                }
                int kw = kn.capnhat("update QLDH  set TongTien= '" + tong + "' where ID='" + txt_ngay1 + "'");
                if (kw > 0)
                {
                    Response.Write("<script>alert('Cập nhật đơn hàng thành công');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('cap nhat không thanh công');</script>");
            }
            }
            else
            {
                Response.Write("<script>alert('ID phải trùng khóa với ID của quản lý đơn hàng, Mời bạn thêm mới đơn hàng hoặc nhập lại chính xác khóa ID');</script>");
                Server.Transfer("QLDHADMIN.aspx");
            }

        }



        protected void GridView1_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {

            string maloai1 = e.Values["STT"].ToString();
            string txt_idd = e.Values["ID"].ToString();
            int kq = kn.capnhat("delete from DonDatMonCT  where STT = " + maloai1);
            if (kq > 0)//neu cap nhat duoc thi hien thong bao
            {
                Response.Write("<script>alert('Xóa thanh công');</script>");
                GridView1.DataSource = kn.laydata("select * from DonDatMonCT where ID = '" + txt_idd + "'");
                GridView1.DataBind();
                string q = "select DonDatMonCT.MaMonAn,DonGia,SoLuong," +
                   "SoLuong*DonGia as thanhtienpk from MonAn,DonDatMonCT " +
                   " where DonDatMonCT.MaMonAn=MonAn.MaMonAn and ID='" + txt_idd + "'";
                SqlDataAdapter da = new SqlDataAdapter(q, stcn);
                DataTable dt = new DataTable(); da.Fill(dt);
                double tong = 0;
                foreach (DataRow row in dt.Rows)
                {
                    double thanhtienpk = Convert.ToDouble(row["thanhtienpk"]);
                    tong = tong + thanhtienpk;
                }
                int kw = kn.capnhat("update QLDH  set TongTien= '" + tong + "' where ID='" + txt_idd + "'");
                if (kw > 0)
                {
                    Response.Write("<script>alert('Cập nhật đơn hàng thành công');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Xóa không thanh công');</script>");

            }



        }

        protected void GridView1_RowEditing1(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;

            GridView1.DataSource = kn.laydata("SELECT * FROM DonDatMonCT");
            GridView1.DataBind();
        }
        ////////////////////////////////////////////////////
        protected void GridView1_RowCancelingEdit1(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;//không lấy giá trị cột nào hết
            GridView1.DataSource = kn.laydata("SELECT * FROM DonDatMonCT");
            GridView1.DataBind();
        }
        ////////////////////////////////////////////////////////////

        protected void GridView1_RowUpdating1(object sender, GridViewUpdateEventArgs e)
        {
            string txt_STT = e.NewValues["STT"].ToString();
            string txt_mamoan = e.NewValues["MaMonAn"].ToString();
            string txt_tenmonan = e.NewValues["TenMonAn"].ToString();
            string txt_SoLuong = e.NewValues["SoLuong"].ToString();
            string txt_idd = e.NewValues["ID"].ToString();
           
            int kq = kn.capnhat("update DonDatMonCT  set MaMonAn= '" + txt_mamoan + "', TenMonAn='" + txt_tenmonan + "', SoLuong='" + txt_SoLuong + "', ID='" + txt_idd + "' where STT='" + txt_STT + "'");
            if (kq > 0)//neu cap nhat duoc thi hien thong bao
            {
                Response.Write("<script>alert('Cập nhật thanh công');</script>");
                GridView1.DataSource = kn.laydata("select * from DonDatMonCT where ID = '" + txt_idd + "'");
                GridView1.EditIndex = -1;
                GridView1.DataBind();
                string q = "select DonDatMonCT.MaMonAn,DonGia,SoLuong," +
                    "SoLuong*DonGia as thanhtienpk from MonAn,DonDatMonCT " +
                    " where DonDatMonCT.MaMonAn=MonAn.MaMonAn and ID='" + txt_idd+"'";
                SqlDataAdapter da = new SqlDataAdapter(q, stcn);
                DataTable dt = new DataTable(); da.Fill(dt);
                double tong = 0;
                foreach (DataRow row in dt.Rows)
                {
                    double thanhtienpk = Convert.ToDouble(row["thanhtienpk"]);
                    tong = tong + thanhtienpk;
                }
                int kw=kn.capnhat("update QLDH  set TongTien= '" + tong + "' where ID='" + txt_idd + "'");
                if (kw > 0)
                {
                    Response.Write("<script>alert('Cập nhật đơn hàng thành công');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Cập nhật không thanh công');</script>");
            }
           
            
        }
    }
}