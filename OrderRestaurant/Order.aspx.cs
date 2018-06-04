using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Data;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OrderRestaurant
{
    public partial class Order : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ListItem listItem = new ListItem("Tất cả", "AllArea");
            string connectionString = ConfigurationManager.ConnectionStrings["smartHotelConnectionString"].ToString();
            SqlConnection conn;
            conn = new SqlConnection(connectionString);
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter("sp_GetArea", conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            da.Fill(ds);
            DropDownList1.DataSource = ds;
            DropDownList1.DataBind();
            DropDownList1.DataTextField = "Name";
            DropDownList1.DataValueField = "ID";
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(DropDownList1.Items.Count, listItem);
        }

        [WebMethod]
        public static string GetTablesRunFirst()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["smartHotelConnectionString"].ToString();
            SqlConnection conn;
            conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand sqlCommand = new SqlCommand("dbo.sp_GetTablesRunFirst", conn);
            sqlCommand.CommandType = CommandType.StoredProcedure;

            SqlParameter result = new SqlParameter("@output", SqlDbType.NVarChar, 4000);
            result.Direction = ParameterDirection.Output;
            sqlCommand.Parameters.Add(result);
            sqlCommand.ExecuteNonQuery();
            sqlCommand.Dispose();
            conn.Close();

            string returnValue = result.Value.ToString();
            return returnValue;
        }

        [WebMethod]
        public static string GetTablesAfterRunFirst(string ID)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["smartHotelConnectionString"].ToString();
            SqlConnection conn;
            conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand sqlCommand = new SqlCommand("dbo.sp_GetTablesAfterRunFirst", conn);
            sqlCommand.CommandType = CommandType.StoredProcedure;

            SqlParameter paramID = new SqlParameter("@ID", SqlDbType.NVarChar, 100);
            paramID.Direction = ParameterDirection.Input;
            paramID.Value = ID;
            sqlCommand.Parameters.Add(paramID);

            SqlParameter result = new SqlParameter("@output", SqlDbType.NVarChar, 4000);
            result.Direction = ParameterDirection.Output;
            sqlCommand.Parameters.Add(result);
            sqlCommand.ExecuteNonQuery();
            sqlCommand.Dispose();
            conn.Close();

            string returnValue = result.Value.ToString();
            return returnValue;
        }
    }
}