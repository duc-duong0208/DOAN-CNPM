using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhaHang
{
    public partial class XemLienHeADMIN : System.Web.UI.Page
    {

        ketnoics kn = new ketnoics();//khởi

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Context.Items["ten"] == null)
                {

                }
                else { Label1.Text = Context.Items["ten"].ToString(); }
                if (IsPostBack == false)
                {
                    //Gán chuỗi kết nối cho dataSoure của Control(GridView1)
                    GridView1.DataSource = kn.laydata("SELECT * FROM LienHe");
                    GridView1.DataBind();//load dữ liêu lên đối tượng
                }
            }
        }
        protected void btnThem_Click1(object sender, EventArgs e)
        {

        }



        protected void GridView1_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {

            string maloai1 = e.Values["MaLH"].ToString();
            int kq = kn.capnhat("delete from LienHe  where MaLH = '" + maloai1 + "'");
            if (kq > 0)//neu cap nhat duoc thi hien thong bao
            {
                Response.Write("<script>alert('Xóa thanh công');</script>");
                GridView1.DataSource = kn.laydata("SELECT * FROM LienHe");
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
            GridView1.DataSource = kn.laydata("SELECT * FROM LienHe");
            GridView1.DataBind();

        }
        ////////////////////////////////////////////////////
        protected void GridView1_RowCancelingEdit1(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;//không lấy giá trị cột nào hết
            GridView1.DataSource = kn.laydata("SELECT * FROM LienHe");
            GridView1.DataBind();

        }
        ////////////////////////////////////////////////////////////

        protected void GridView1_RowUpdating1(object sender, GridViewUpdateEventArgs e)
        {
            string txt_matk1 = e.NewValues["MaLH"].ToString();
            string txt_hoten = e.NewValues["HoTenLH"].ToString();
            string txt_sdt = e.NewValues["DienThoai"].ToString();
            string txt_email = e.NewValues["Email"].ToString();
            string txt_noidung = e.NewValues["NoiDung"].ToString();
            string txt_time = e.NewValues["TimeLH"].ToString();
            int kq = kn.capnhat("update LienHe  set HoTenLH= '" + txt_hoten + "',DienThoai= '" + txt_sdt + "', Email='" + txt_email + "', NoiDung='" + txt_noidung + "', TimeLH='" + txt_time + "' where MaLH='" + txt_matk1 + "'");
            if (kq > 0)//neu cap nhat duoc thi hien thong bao
            {
                Response.Write("<script>alert('Cập nhật thanh công');</script>");
                GridView1.DataSource = kn.laydata("SELECT* FROM LienHe");
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