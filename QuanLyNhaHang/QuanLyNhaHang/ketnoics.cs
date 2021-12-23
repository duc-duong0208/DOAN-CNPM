using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace QuanLyNhaHang
{
    public class ketnoics
    {
        SqlConnection con;
        private void layknoi()
        {
            //khởi tạo giá trị cho đối tượng SqlConnection
            con = new SqlConnection(@"Data Source=TUANLT\SQLEXPRESS;Initial Catalog=DATH;Integrated Security=True");
            con.Open();//mở kết nối


        }
        //xây dựng hàm đóng kết nối
        private void dongketnoi()
        {
            if (con.State == ConnectionState.Open)//nếu kết nối đang mở
                con.Close();
        }
        //cập nhật dữ liêu
        public int capnhat(string sql)
        {
            int kq = 0;
            try
            {
                layknoi();
                SqlCommand cmd = new SqlCommand(sql, con);
                kq = cmd.ExecuteNonQuery();//thuc thi cau len khong can truy van
            }
            catch
            {
                kq = 0;
            }
            finally
            {
                dongketnoi();
            }
            return kq;
        }

        public DataTable laydata(string sql)
        {
            DataTable dt = new DataTable();
            try
            {
                layknoi();
                SqlDataAdapter adap = new SqlDataAdapter(sql, con);
                adap.Fill(dt);

            }

            catch
            {
                dt = null;
            }
            finally
            {
                dongketnoi();
            }
            return dt;
        }
        public int xuly(string sql)
        {


            int kq = 0;
            try
            {
                layknoi();
                SqlCommand cmd = new SqlCommand(sql, con);
                kq = cmd.ExecuteNonQuery();//thuc thi cau len khong can truy van
            }
            catch
            {
                kq = 0;
            }
            finally
            {
                dongketnoi();
            }
            return kq;
        }
    }
}