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
    public partial class ThongKe : System.Web.UI.Page
    {
        string stcn = ConfigurationManager.ConnectionStrings["connec"].ConnectionString;
        ketnoics kn = new ketnoics();//khởi
        protected void Page_Load(object sender, EventArgs e)
        {

            string xet1 = "chua";
            string q = " Select ID,HoTenKH,SDT,HinhThucDatBan,SoLuongNguoi,Ngay,Time,TongTien,TinhTrangTT,SDT,count(TinhTrangTT) FROM QLDH WHERE TinhTrangTT='" + xet1 + "'" + " GROUP BY ID,HoTenKH,SDT,HinhThucDatBan,SoLuongNguoi,Ngay,Time,TongTien,TinhTrangTT,SDT Having count(TinhTrangTT) >=1";
            SqlDataAdapter da = new SqlDataAdapter(q, stcn);
            DataTable dt = new DataTable(); da.Fill(dt);
            this.GridView2.DataSource = dt; this.GridView2.DataBind();
        }
        protected void btnThem_Click1(object sender, EventArgs e)
        {

        }



        protected void GridView1_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {



        }

        protected void GridView1_RowEditing1(object sender, GridViewEditEventArgs e)
        {

        }
        ////////////////////////////////////////////////////
        protected void GridView1_RowCancelingEdit1(object sender, GridViewCancelEditEventArgs e)
        {

        }
        ////////////////////////////////////////////////////////////

        protected void GridView1_RowUpdating1(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string index = DropDownList1.SelectedValue.ToString();
            string index2 = DropDownList2.SelectedValue.ToString();
            string q = "select * from QLDH where Month(Ngay)= " + index + " AND Year(Ngay)=" + index2 + "";
            try
            {
                SqlDataAdapter da = new SqlDataAdapter(q, stcn);
                DataTable dt = new DataTable(); da.Fill(dt);
                this.GridView1.DataSource = dt; this.GridView1.DataBind();
                double tong = 0;
                foreach (DataRow row in dt.Rows)
                {
                    double thanhtienpk = Convert.ToDouble(row["TongTien"]);
                    tong = tong + thanhtienpk;
                }
                this.Label8.Text = tong + " VND";
            }
            catch (SqlException ex) { Response.Write(ex.Message); }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {



        }
        protected void GridView2_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {
            string xet = "xong";
            string maloai1 = e.Values["ID"].ToString();
            int kq = kn.capnhat("update QLDH  set TinhTrangTT= '" + xet + "' where ID='" + maloai1 + "'");
            if (kq > 0)//neu cap nhat duoc thi hien thong bao
            {
                Response.Write("<script>alert('Xóa thanh công');</script>");
                string xet1 = "chua";
                string q = " Select ID,HoTenKH,SDT,HinhThucDatBan,SoLuongNguoi,Ngay,Time,TongTien,TinhTrangTT,SDT,count(TinhTrangTT) FROM QLDH WHERE TinhTrangTT='" + xet1 + "'" + " GROUP BY ID,HoTenKH,SDT,HinhThucDatBan,SoLuongNguoi,Ngay,Time,TongTien,TinhTrangTT,SDT Having count(TinhTrangTT) >=1";
                GridView2.DataSource = kn.laydata(q);
                GridView2.DataBind();
            }
            else
            {
                Response.Write("<script>alert('Xóa không thanh công');</script>");

            }


        }
    }
}