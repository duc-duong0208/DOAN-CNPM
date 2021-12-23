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
    public partial class QLML : System.Web.UI.Page
    {
        ketnoics kn = new ketnoics();//khởi
        string stcn = ConfigurationManager.ConnectionStrings["connec"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Context.Items["ten"] == null)
                {

                }
                else { Label2.Text = Context.Items["ten"].ToString(); }
                if (IsPostBack == false)
                {
                    //Gán chuỗi kết nối cho dataSoure của Control(GridView1)
                    GridView1.DataSource = kn.laydata("SELECT * FROM LoaiMon");
                    GridView1.DataBind();//load dữ liêu lên đối tượng
                }
            }
        }
        protected void btnThem_Click1(object sender, EventArgs e)
        {
            TextBox txt_loaimonan = (TextBox)GridView1.FooterRow.FindControl("txt_loaimonan");
            TextBox txttenloai = (TextBox)GridView1.FooterRow.FindControl("txttenloai");
            string txt_loaimonan1 = txt_loaimonan.Text;
            string txttenloai1 = txttenloai.Text;
            int kq = kn.xuly("insert into LoaiMon values ('" + txt_loaimonan1 + "','"+ txttenloai1 + "')");
            if (kq > 0)//neu cap nhat duoc thi hien thong bao
            {
                Response.Write("<script>alert('cap nhat thanh công');</script>");
                GridView1.DataSource = kn.laydata("SELECT * FROM LoaiMon");
                GridView1.DataBind();
            }
            else
            {
                Response.Write("<script>alert('cap nhat không thanh công');</script>");
            }
        }



        protected void GridView1_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {

            string maloai1 = e.Values["MaLoaiMon"].ToString();
            int qq = kn.capnhat("delete from MonAn  where MaLoaiMon = " + maloai1);
            int kq = kn.capnhat("delete from LoaiMon  where MaLoaiMon = " + maloai1);
            if (kq > 0)//neu cap nhat duoc thi hien thong bao
            {
                Response.Write("<script>alert('Xóa thanh công');</script>");
                GridView1.DataSource = kn.laydata("SELECT MaLoaiMon FROM* LoaiMon");
                GridView1.DataSource = kn.laydata("SELECT * FROM LoaiMon");
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
            GridView1.DataSource = kn.laydata("SELECT * FROM LoaiMon");
            GridView1.DataBind();
        }
        ////////////////////////////////////////////////////
        protected void GridView1_RowCancelingEdit1(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;//không lấy giá trị cột nào hết
            GridView1.DataSource = kn.laydata("SELECT * FROM LoaiMon");
            GridView1.DataBind();
        }
        ////////////////////////////////////////////////////////////

        protected void GridView1_RowUpdating1(object sender, GridViewUpdateEventArgs e)
        {
            string txt_matk1 = e.NewValues["MaLoaiMon"].ToString();
            string txt_tenngdung1 = e.NewValues["TenLoaiMon"].ToString();
           

            int kq = kn.capnhat("update LoaiMon  set TenLoaiMon= '" + txt_tenngdung1 + "' where MaLoaiMon='" + txt_matk1 + "'");
            if (kq > 0)//neu cap nhat duoc thi hien thong bao
            {
                Response.Write("<script>alert('Cập nhật thanh công');</script>");
                GridView1.DataSource = kn.laydata("SELECT* FROM LoaiMon");
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
            Context.Items["ctsp"] = mahang;
            Server.Transfer("QLSP.aspx");
        }
    }
}