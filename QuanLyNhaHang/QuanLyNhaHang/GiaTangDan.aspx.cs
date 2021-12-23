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
    public partial class GiaTangDan : System.Web.UI.Page
    {
        string stcn = ConfigurationManager.ConnectionStrings["connec"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
            string q;
            if (Context.Items["ml"] == null)
               q = "select * from MonAn ORDER BY DonGia";
            else
            {
                string maloai = Context.Items["ml"].ToString();
                q = "select * from MonAn where MaLoaiMon = '" + maloai + "'";
            }
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