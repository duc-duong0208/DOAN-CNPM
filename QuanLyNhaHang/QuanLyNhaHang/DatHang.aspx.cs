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
    public partial class DatHang : System.Web.UI.Page
    {
        string stcn = ConfigurationManager.ConnectionStrings["connec"].ConnectionString;
        ketnoics kn = new ketnoics();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (IsPostBack == false)
                {
                    //Gán chuỗi kết nối cho dataSoure của Control(GridView1)
                    GridView1.DataSource = kn.laydata("SELECT DonDatMon.MaMonAn,TenMonAn,DonGia,SoLuong,HinhAnh," +
                        "SoLuong*DonGia as thanhtienpk from DonDatMon,MonAn " +
                        " where MonAn.MaMonAn = DonDatMon.MaMonAn");
                    GridView1.DataBind();//load dữ liêu lên đối tượng
                }

                if (Context.Items["who"] != null && Context.Items["hoten"] != null && Context.Items["phone"] != null && Context.Items["ngay"] != null && Context.Items["sl"] != null && Context.Items["hinhthuc"] != null)
                {
                    Label3.Text = Context.Items["who"].ToString();
                    Label4.Text = Context.Items["hoten"].ToString();
                    Label6.Text = Context.Items["phone"].ToString();
                    Label5.Text = Context.Items["ngay"].ToString();
                    Label8.Text = Context.Items["sl"].ToString();
                    Label7.Text = Context.Items["time"].ToString();
                    Label9.Text = Context.Items["hinhthuc"].ToString();
                    Label1.Text = Convert.ToString(Context.Items["thanhtoan"]);
                }
                else
                {
                    Response.Write("<script>alert('Bạn Chưa Nhập Đầy Đủ Thông Tin, Mời Bạn Nhập Lại');</script>");
                    Server.Transfer("DatMon.aspx");
                }


                string tenloai = Context.Items["hoten"].ToString();
                string phone = Context.Items["phone"].ToString();
                string time = Context.Items["time"].ToString();
                string ngay = Context.Items["ngay"].ToString();
                string cachnhan = Context.Items["hinhthuc"].ToString();
                string hinhthuc = Context.Items["sl"].ToString();
                string tongtien = Convert.ToString(Context.Items["thanhtoan"]);
                string tttt = "chưa";
                int kq = kn.xuly("insert into QLDH" + " OUTPUT inserted.ID " + "values ('" + tenloai + "','" + phone + "','" + cachnhan + "','" + hinhthuc + "','" + ngay + "','" + time + "','" + tongtien + "','" + tttt + "')");
                if (kq > 0)//neu cap nhat duoc thi hien thong bao
                {
                    Response.Write("<script>alert('Xác Nhận Đơn Đặt Hàng Thành Công');</script>");

                }
                else
                {
                    Response.Write("<script>alert(' không thanh công, mời bạn thử lại');</script>");
                }
                string q2 = "select ID from QLDH";
                SqlDataAdapter da2 = new SqlDataAdapter(q2, stcn);
                DataTable dt2 = new DataTable(); da2.Fill(dt2);
                this.GridView1.DataSource = dt2;
                int id = 0; ;
                foreach (DataRow row in dt2.Rows)
                {

                    int i = Convert.ToInt32(row["ID"]);
                    id = i;
                }
                int kk = id;
                kn.xuly("insert into DonDatMonCT (MaMonAn,TenMonAn,SoLuong,ID)" + " OUTPUT inserted.STT " + " SELECT DonDatMon.MaMonAn,MonAn.TenMonAn,SoLuong,'" + kk + "'" + " from DonDatMon,MonAn " +
              " where MonAn.MaMonAn = DonDatMon.MaMonAn");
            }
        }

        protected void idgui_Click(object sender, EventArgs e)
        {
            string txt_time = DateTime.Now.ToString();
            string m1 = txt_hoten.Text;
            string m2 = txt_dienthoai.Text;
            string m3 = txtemail.Text;
            string m4 = txtnoidung.Text;
            kn.xuly("insert into LienHe values ('" + m1 + "','" + m2 + "','" + m3 + "','" + m4 + "','" + txt_time + "')");
            Response.Write("<script>alert('Liên Hệ Thành Công');</script>");
            Server.Transfer("TrangChu.aspx");
        }
    }

}