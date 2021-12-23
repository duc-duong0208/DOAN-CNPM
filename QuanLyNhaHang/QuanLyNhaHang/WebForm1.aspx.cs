using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhaHang
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string stcn = ConfigurationManager.ConnectionStrings["connec"].ConnectionString;
        ketnoics kn = new ketnoics();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Context.Items["ten"] == null)
            {

            }
            if (IsPostBack == false)
            {
             
                GridView1.DataSource = kn.laydata("SELECT * FROM TaiKhoan");
                GridView1.DataBind();

                GridView2.DataSource = kn.laydata("SELECT * FROM QuyenSoHuu");
                GridView2.DataBind();
            }

        }
    }
}