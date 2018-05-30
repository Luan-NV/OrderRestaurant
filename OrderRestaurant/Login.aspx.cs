using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OrderRestaurant
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["smartHotelConnectionString"].ToString();
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from tbl_Users where UserName =@username and PassWord=@password", conn);
            string pass = md5(PassWord.Text);
            cmd.Parameters.AddWithValue("@username", UserName.Text);
            cmd.Parameters.AddWithValue("@password", pass);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                HttpCookie mycookie = new HttpCookie("LoginCookie");
                mycookie["User_Name"] = dt.Rows[0]["UserName"].ToString();
                mycookie.Expires = DateTime.Now.AddHours(10);
                Response.Cookies.Add(mycookie);
                Response.Redirect("Order.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Username hoặc Password không đúng')</script>");
            }
            conn.Close();
        }

        private static string md5(string sPassword)
        {
            System.Security.Cryptography.MD5CryptoServiceProvider x = new System.Security.Cryptography.MD5CryptoServiceProvider();
            byte[] bs = System.Text.Encoding.UTF8.GetBytes(sPassword);
            bs = x.ComputeHash(bs);
            System.Text.StringBuilder s = new System.Text.StringBuilder();
            foreach (byte b in bs)
            {
                s.Append(b.ToString("x2"));
            }
            return s.ToString();
        }
    }
}