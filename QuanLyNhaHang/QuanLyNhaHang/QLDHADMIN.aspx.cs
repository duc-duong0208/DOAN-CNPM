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
    public partial class QLDHADMIN : System.Web.UI.Page
    {
        string stcn = ConfigurationManager.ConnectionStrings["connec"].ConnectionString;
        ketnoics kn = new ketnoics();//khởi
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Context.Items["ten"] == null)
            {

            }
            else { Label1.Text = Context.Items["ten"].ToString(); }
            if (!Page.IsPostBack) { 
            string q; if (Context.Items["ctdsd"] == null)
                q = "select * from QLDH";

            else
            {
                string tim = Context.Items["ctdsd"].ToString();
                q = "select * from QLDH where HoTenKH ='" + tim + "'";
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

            TextBox txt_tenkhachhang = (TextBox)GridView1.FooterRow.FindControl("txt_tenkhachhang");
            TextBox txt_sdt = (TextBox)GridView1.FooterRow.FindControl("txt_sdt");
            TextBox txt_sl = (TextBox)GridView1.FooterRow.FindControl("txt_sl");
            TextBox txt_ngay = (TextBox)GridView1.FooterRow.FindControl("txt_ngay");
            TextBox txt_time = (TextBox)GridView1.FooterRow.FindControl("txt_time");
            TextBox txt_tongtien = (TextBox)GridView1.FooterRow.FindControl("txt_tongtien");
            DropDownList txt_htdb = (DropDownList)GridView1.FooterRow.FindControl("txt_htdb");
            TextBox txt_tttt = (TextBox)GridView1.FooterRow.FindControl("txt_tttt");


            string txt_tenngdung1 = txt_tenkhachhang.Text;
            string txt_sdt1 = txt_sdt.Text;
            string txt_sl1 = txt_sl.Text;
            string txt_ngay1 = txt_ngay.Text;
            string txt_time1 = txt_time.Text;
            string txt_tongtien1 = txt_tongtien.Text;
            string txt_htdb1 = txt_htdb.Text;
            string txt_tttt1 = txt_tttt.Text;
            int kq = kn.xuly("insert into QLDH values ( '" + txt_tenngdung1 + "', '" + txt_sdt1 + "','" + txt_htdb1 + "', '" + txt_sl1 + "', '" + txt_ngay1 + "', '" + txt_time1 + "', '" + txt_tongtien1 + "', '" + txt_tttt1 + "')");
            if (kq > 0)//neu cap nhat duoc thi hien thong bao
            {
                Response.Write("<script>alert('cap nhat thanh công');</script>");
                GridView1.DataSource = kn.laydata("SELECT * FROM QLDH");
                GridView1.DataBind();
            }
            else
            {
                Response.Write("<script>alert('cap nhat không thanh công');</script>");
            }

        }



        protected void GridView1_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {

            string maloai1 = e.Values["ID"].ToString();
            int kq = kn.capnhat("delete from QLDH  where ID = " + maloai1);
            int qq = kn.capnhat("delete from DonDatMonCT  where ID = " + maloai1);

            if (kq > 0)//neu cap nhat duoc thi hien thong bao
            {
                Response.Write("<script>alert('Xóa thanh công');</script>");
                GridView1.DataSource = kn.laydata("SELECT * FROM QLDH");
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
            GridView1.DataSource = kn.laydata("SELECT * FROM QLDH");
            GridView1.DataBind();
        }
        ////////////////////////////////////////////////////
        protected void GridView1_RowCancelingEdit1(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;//không lấy giá trị cột nào hết
            GridView1.DataSource = kn.laydata("SELECT * FROM QLDH");
            GridView1.DataBind();
        }
        ////////////////////////////////////////////////////////////

        protected void GridView1_RowUpdating1(object sender, GridViewUpdateEventArgs e)
        {
            string txt_matk1 = e.NewValues["ID"].ToString();
            string txt_tenngdung1 = e.NewValues["HoTenKH"].ToString();
            string txt_sdt1 = e.NewValues["SDT"].ToString();
            string txt_htdb = e.NewValues["HinhThucDatBan"].ToString();
            string txt_sln = e.NewValues["SoLuongNguoi"].ToString();
            string txt_ngay = e.NewValues["Ngay"].ToString();
            string txt_time = e.NewValues["Time"].ToString();
            string txt_tttt = e.NewValues["TinhTrangTT"].ToString();
            int kq = kn.capnhat("update QLDH  set HoTenKH= '" + txt_tenngdung1 + "', SDT='" + txt_sdt1 + "', HinhThucDatBan='" + txt_htdb + "', SoLuongNguoi='" + txt_sln + "', Ngay='" + txt_ngay + "', Time='" + txt_time + "', TinhTrangTT='" + txt_tttt + "' where ID='" + txt_matk1 + "'");
            if (kq > 0)//neu cap nhat duoc thi hien thong bao
            {
                Response.Write("<script>alert('Cập nhật thanh công');</script>");
                GridView1.DataSource = kn.laydata("SELECT* FROM QLDH");
                GridView1.EditIndex = -1;
                GridView1.DataBind();
            }
            else
            {
                Response.Write("<script>alert('Cập nhật không thanh công');</script>");
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string mahang = ((Button)sender).CommandArgument;
            Context.Items["ctdh"] = mahang;
            Server.Transfer("XemCTDH.aspx");
        }
    }
}