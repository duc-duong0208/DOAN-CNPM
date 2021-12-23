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
    public partial class timkiem : System.Web.UI.Page
    {
        string stcn = ConfigurationManager.ConnectionStrings["connec"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
            string q; if (Context.Items["mtimm"] == null)
                q = "select * from MonAn";

            else
            {
                string tim = Context.Items["mtimm"].ToString();
                q = "select * from MonAn where TenMonAn LIKE '%" + tim + "%' or MaLoaiMon LIKE '%" + tim + "%' or TenMonAn='"+tim+"' ";
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