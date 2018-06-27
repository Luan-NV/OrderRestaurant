using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OrderRestaurant
{
    public partial class Content : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static string getSubMenu()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["smartHotelConnectionString"].ToString();
            SqlConnection conn;
            conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand sqlCommand = new SqlCommand("dbo.sp_GetSubMenu", conn);
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
        public static string getFood(string input)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["smartHotelConnectionString"].ToString();
            SqlConnection conn;
            conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand sqlCommand = new SqlCommand("dbo.sp_GetFood", conn);
            sqlCommand.CommandType = CommandType.StoredProcedure;

            SqlParameter paramInput = new SqlParameter("@input", SqlDbType.NVarChar);
            paramInput.Direction = ParameterDirection.Input;
            paramInput.Value = input;
            sqlCommand.Parameters.Add(paramInput);

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