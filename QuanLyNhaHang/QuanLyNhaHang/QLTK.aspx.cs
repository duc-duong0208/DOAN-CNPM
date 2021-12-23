using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhaHang
{
    public partial class QLTK : System.Web.UI.Page
    {  
        string stcn = ConfigurationManager.ConnectionStrings["connec"].ConnectionString;
        ketnoics kn = new ketnoics();//khởi
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Context.Items["ten"] == null)
            {

            }
            else { Label1.Text = Context.Items["ten"].ToString(); }
            if (IsPostBack == false)
            {
                //Gán chuỗi kết nối cho dataSoure của Control(GridView1)
                GridView1.DataSource = kn.laydata("SELECT * FROM TaiKhoan");
                GridView1.DataBind();//load dữ liêu lên đối tượng
                GridView2.DataSource = kn.laydata("SELECT * FROM QuyenSoHuu");
                GridView2.DataBind();//load dữ liêu lên đối tượng
            }

        }
        protected void btnThem_Click1(object sender, EventArgs e)
        {
            TextBox txt_userName= (TextBox)GridView1.FooterRow.FindControl("txt_userName");
            TextBox txt_matkhau = (TextBox)GridView1.FooterRow.FindControl("txt_matkhau");
            TextBox txt_tenngdung = (TextBox)GridView1.FooterRow.FindControl("txt_tenngdung");
            TextBox txt_sdt = (TextBox)GridView1.FooterRow.FindControl("txt_sdt");
            TextBox txt_quyenshohuu = (TextBox)GridView1.FooterRow.FindControl("txt_quyenshohuu");
            string txt_userName1 = txt_userName.Text;
            string txt_matkhau1 = txt_matkhau.Text;
            string txt_tenngdung1 = txt_tenngdung.Text;
            string txt_sdt1 = txt_sdt.Text;
            string txt_quyenshohuu1 = txt_quyenshohuu.Text;
            if(txt_quyenshohuu1=="1" || txt_quyenshohuu1 == "2")
            {
                int kq = kn.xuly("insert into TaiKhoan values ( '" + txt_userName1 + "','" + txt_matkhau1 + "','" + txt_tenngdung1 + "', '" + txt_sdt1 + "', '" + txt_quyenshohuu1 + "')");
                if (kq > 0)//neu cap nhat duoc thi hien thong bao
                {
                    Response.Write("<script>alert('cap nhat thanh công');</script>");
                    GridView1.DataSource = kn.laydata("SELECT * FROM TaiKhoan");
                    GridView1.DataBind();
                }
                else
                {
                    Response.Write("<script>alert('cap nhat không thanh công');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('bạn nhập sai mã quyền sở hữu vui lòng nhập lại đúng');</script>");
            }

        }



        protected void GridView1_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {

            string maloai1 = e.Values["userName"].ToString();
            int kq = kn.capnhat("delete from TaiKhoan  where userName = '" + maloai1 + "'");
            if (kq > 0)//neu cap nhat duoc thi hien thong bao
            {
                Response.Write("<script>alert('Xóa thanh công');</script>");
                GridView1.DataSource = kn.laydata("SELECT * FROM TaiKhoan");
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
            GridView1.DataSource = kn.laydata("SELECT * FROM TaiKhoan");
            GridView1.DataBind();
        }
        ////////////////////////////////////////////////////
        protected void GridView1_RowCancelingEdit1(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;//không lấy giá trị cột nào hết
            GridView1.DataSource = kn.laydata("SELECT * FROM TaiKhoan");
            GridView1.DataBind();
        }
        ////////////////////////////////////////////////////////////

        protected void GridView1_RowUpdating1(object sender, GridViewUpdateEventArgs e)
        {
            string txt_matk1 = e.NewValues["userName"].ToString();
            string MatKhau1 = e.NewValues["MatKhau"].ToString();
            string txt_tenngdung1 = e.NewValues["TenNguoiDung"].ToString();
            string txt_sdt1 = e.NewValues["SDT"].ToString();
            string txt_quyenshohuu1 = e.NewValues["MaQSH"].ToString();
            int kq = kn.capnhat("update TaiKhoan  set MatKhau= '" + MatKhau1 + "',TenNguoiDung= '" + txt_tenngdung1 + "', SDT='" + txt_sdt1 + "', MaQSH='" + txt_quyenshohuu1 + "' where userName='" + txt_matk1 + "'");
            if (kq > 0)//neu cap nhat duoc thi hien thong bao
            {
                Response.Write("<script>alert('Cập nhật thanh công');</script>");
                GridView1.DataSource = kn.laydata("SELECT* FROM TaiKhoan");
                GridView1.EditIndex = -1;
                GridView1.DataBind();
            }
            else
            {
                Response.Write("<script>alert('Cập nhật không thanh công');</script>");
            }
        }
    }
}