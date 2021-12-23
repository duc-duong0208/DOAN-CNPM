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
    public partial class ChiTietSP : System.Web.UI.Page
    {
        string stcn = ConfigurationManager.ConnectionStrings["connec"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;

            string q;
            if (Context.Items["mh"] == null)
                q = "select * from MonAn";
            else
            {
                string mahang = Context.Items["mh"].ToString();
                q = "select * from MonAn where MaMonAn = '" + mahang + "'";
            }
            try
            {
                SqlDataAdapter da = new SqlDataAdapter(q, stcn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                this.DataList1.DataSource = dt;
                this.DataList1.DataBind();
            }
            catch (SqlException ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            LinkButton mua = (LinkButton)sender;
            string mahang = mua.CommandArgument.ToString();//lấy biến Argument ở button
            DataListItem item = (DataListItem)mua.Parent;
            string soluong = ((TextBox)item.FindControl("TextBox1")).Text;
            int i = Convert.ToInt32(soluong);
            //
            string q2 = "select * from DonDatMon where MaMonAn = '" + mahang + "'";
            SqlDataAdapter da2 = new SqlDataAdapter(q2, stcn);
            DataTable dt2 = new DataTable(); da2.Fill(dt2);
            this.DataList1.DataSource = dt2;
            int id = 0; ;
            foreach (DataRow row in dt2.Rows)
            {

                int i2 = Convert.ToInt32(row["SoLuong"]);
                id = i2;
            }
            if (i<1 || i>10 || (10-id<=0) )
            {
                Response.Write("<script>alert('Bạn nhập sai số lượng vui lòng nhập lại');</script>");
                string q = "select * from MonAn "
                         + "where MaMonAn='" + mahang + "'";
                SqlDataAdapter da = new SqlDataAdapter(q, stcn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                this.DataList1.DataSource = dt;
                this.DataList1.DataBind();
            }
            else 
            {
                //nếu chưa đăng nhập thì ko làm gì

                SqlConnection con = new SqlConnection(stcn);
                con.Open();
                string query = "select * from DonDatMon "
                           + "where MaMonAn='" + mahang + "'";
                SqlCommand command = new SqlCommand(query, con);
                SqlDataReader reader = command.ExecuteReader(); //thực thi câu lệnh SQL
                if (reader.Read())
                {
                    reader.Close();
                    command = new SqlCommand(
                          "update DonDatMon set SoLuong= Soluong +" + soluong
                          + " where MaMonAn='" + mahang + "'", con);
                }
                else
                {
                    reader.Close();
                    command = new SqlCommand("Insert into DonDatMon "
                           + "(MaMonAn,SoLuong)"
                         + "values( '" + mahang + "'," + soluong + ")", con);
                }
                command.ExecuteNonQuery();
                con.Close();
                Server.Transfer("DatMon.aspx");
            }
        }


        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            LinkButton mua = (LinkButton)sender;
            string mahang = mua.CommandArgument.ToString();
            int i = 1;
            SqlConnection con = new SqlConnection(stcn);
            con.Open();
            string query = "select * from MonAn "
                       + "where MaMonAn='" + mahang + "'";
            SqlCommand command = new SqlCommand(query, con);
            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                reader.Close();
                command = new SqlCommand(
                      "update MonAn set tym= tym +" + i
                      + " where MaMonAn='" + mahang + "'", con);
            }
            command.ExecuteNonQuery();
            con.Close();
            string q = "select * from MonAn where MaMonAn = '" + mahang + "'";

            SqlDataAdapter da = new SqlDataAdapter(q, stcn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            this.DataList1.DataSource = dt;
            this.DataList1.DataBind();

        }
    }
}