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
    public partial class BanChay : System.Web.UI.Page
    {
        string stcn = ConfigurationManager.ConnectionStrings["connec"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
            {
                string q = "select DISTINCT DonDatMonCT.MaMonAn,MonAn.TenMonAn,DonGia,HinhAnh from MonAn,DonDatMonCT where" +
                    " MonAn.MaMonAn = DonDatMonCT.MaMonAn and SoLuong>9";
                try
                {
                    SqlDataAdapter da = new SqlDataAdapter(q, stcn);
                    DataTable dt = new DataTable(); da.Fill(dt);
                    this.DataList1.DataSource = dt; this.DataList1.DataBind();
                }
                catch (SqlException ex) { Response.Write(ex.Message); }
        }
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            string mahang = ((LinkButton)sender).CommandArgument;
            Context.Items["mh"] = mahang; Server.Transfer("ChiTietSP.aspx");
        }
    }
}