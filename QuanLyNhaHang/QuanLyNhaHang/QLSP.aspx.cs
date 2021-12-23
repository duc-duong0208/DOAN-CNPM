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
    public partial class QLSP : System.Web.UI.Page
    {
        string stcn = ConfigurationManager.ConnectionStrings["connec"].ConnectionString;
        ketnoics kn = new ketnoics();//khởi
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Context.Items["ten"] == null)
                {

                }
                else { Label1.Text = Context.Items["ten"].ToString(); }
                string q; if (Context.Items["ctsp"] == null)
                    q = "select * from MonAn";

                else
                {
                    string tim = Context.Items["ctsp"].ToString();
                    q = "select * from MonAn where MaLoaiMon ='" + tim + "'";
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
            TextBox txt_loaimonan = (TextBox)GridView1.FooterRow.FindControl("txt_loaimonan");
            TextBox txt_tenmonan = (TextBox)GridView1.FooterRow.FindControl("txt_tenmonan");
            FileUpload txthinh = (FileUpload)GridView1.FooterRow.FindControl("FileUpload1");
            TextBox txt_mota = (TextBox)GridView1.FooterRow.FindControl("txt_mota");
            TextBox txt_dongia = (TextBox)GridView1.FooterRow.FindControl("txt_dongia");
            TextBox txt_tym = (TextBox)GridView1.FooterRow.FindControl("txt_tym");

            string txt_loaimonan1 = txt_loaimonan.Text;
            string txt_tenmonan1 = txt_tenmonan.Text;
            
            string txt_mota1 = txt_mota.Text;
            string txt_dongia1 = txt_dongia.Text;
            string txt_tym1 = txt_tym.Text;

            string fileName = "~/Images/" + txthinh.FileName ;
            string filePath = MapPath(fileName);
            txthinh.SaveAs(filePath);


            string qq = "select MonAn.MaMonAn,LoaiMon.MaLoaiMon from MonAn,LoaiMon " +
                  " where MonAn.MaMonAn=LoaiMon.MaLoaiMOn and LoaiMon.MaLoaiMon='" + txt_loaimonan1 + "'";
            SqlDataAdapter daa = new SqlDataAdapter(qq, stcn);
            DataTable dtt = new DataTable(); daa.Fill(dtt);
            int m = 0;
            foreach (DataRow row in dtt.Rows)
            {
                int xet = Convert.ToInt32(row["MaLoaiMon"]);
                m = m + xet;
            }
            if (m != 0)
            {

                int kq = kn.xuly("insert into MonAn values ( '" + txt_loaimonan1 + "', '" + txt_tenmonan1 + "', '" + txthinh.FileName + "', '" + txt_mota1 + "', '" + txt_dongia1 + "','" + txt_tym1 + "')");
                if (kq > 0)//neu cap nhat duoc thi hien thong bao
                {
                    Response.Write("<script>alert('cap nhat thanh công');</script>");
                    GridView1.DataSource = kn.laydata("SELECT * FROM MonAn");
                    GridView1.DataBind();
                }
                else
                {
                    Response.Write("<script>alert('cap nhat không thanh công');</script>");
                }
            }
            else
            {

                Response.Write("<script>alert('không tồn tại mã loại món phù hợp, mời bạn thêm mã hoặc nhập lại!!!');</script>");
                Server.Transfer("QLML.aspx");
            }

        }



        protected void GridView1_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {

            string maloai1 = e.Values["MaMonAn"].ToString();
            int kq = kn.capnhat("delete from MonAn  where MaMonAn = " + maloai1);
            if (kq > 0)//neu cap nhat duoc thi hien thong bao
            {
                Response.Write("<script>alert('Xóa thanh công');</script>");
                GridView1.DataSource = kn.laydata("SELECT MaMonAn FROM* MonAn");
                GridView1.DataSource = kn.laydata("SELECT * FROM MonAn");
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
            GridView1.DataSource = kn.laydata("SELECT * FROM MonAn");
            GridView1.DataBind();
        }
        ////////////////////////////////////////////////////
        protected void GridView1_RowCancelingEdit1(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;//không lấy giá trị cột nào hết
            GridView1.DataSource = kn.laydata("SELECT * FROM MonAn");
            GridView1.DataBind();
        }
        ////////////////////////////////////////////////////////////
       
        protected void GridView1_RowUpdating1(object sender, GridViewUpdateEventArgs e)
        { 
            string txt_matk1 = e.NewValues["MaMonAn"].ToString();
            string txt_tenngdung1 = e.NewValues["MaLoaiMon"].ToString();
            string txt_sdt1 = e.NewValues["TenMonAn"].ToString();
            string txt_tendn1 = e.NewValues["HinhAnh"].ToString();
            string txt_mk1 = e.NewValues["MoTa"].ToString();
            string txt_quyenshohuu1 = e.NewValues["DonGia"].ToString();
            string txt_tym = e.NewValues["tym"].ToString();

            int kq = kn.capnhat("update MonAn  set MaLoaiMon= '" + txt_tenngdung1 + "', TenMonAn='" + txt_sdt1 + "', HinhAnh='" + txt_tendn1 + "', MoTa='" + txt_mk1 + "', DonGia='" + txt_quyenshohuu1 + "',tym='" + txt_tym +"' where MaMonAn='" + txt_matk1 + "'");
            if (kq > 0)//neu cap nhat duoc thi hien thong bao
            {
                Response.Write("<script>alert('Cập nhật thanh công');</script>");
                GridView1.DataSource = kn.laydata("SELECT* FROM MonAn");
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