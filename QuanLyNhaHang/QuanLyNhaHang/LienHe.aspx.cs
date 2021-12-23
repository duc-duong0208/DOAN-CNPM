using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhaHang
{
    public partial class LienHe : System.Web.UI.Page
    {
        ketnoics kn = new ketnoics();
        protected void Page_Load(object sender, EventArgs e)
        {
         
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        { string txt_time = DateTime.Now.ToString();
            string m1 = txt_hoten.Text;
            string m2 = txt_dienthoai.Text;
            string m3 = txtemail.Text;
            string m4 = txtnoidung.Text;           
            kn.xuly("insert into LienHe values ('" + m1 + "','" + m2 + "','" + m3 + "','" + m4 + "','" + txt_time + "')");
            Response.Write("<script>alert('Liên Hệ Thành Công');</script>");

        }
    }
}