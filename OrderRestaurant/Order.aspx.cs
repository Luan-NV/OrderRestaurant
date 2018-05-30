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

        }

        [WebMethod]
        public static string GetTables()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["smartHotelConnectionString"].ToString();
            SqlConnection conn;
            conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand sqlCommand = new SqlCommand("dbo.sp_GetTables", conn);
            sqlCommand.CommandType = CommandType.StoredProcedure;

            SqlParameter result = new SqlParameter("@output", SqlDbType.NVarChar, 1500);
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