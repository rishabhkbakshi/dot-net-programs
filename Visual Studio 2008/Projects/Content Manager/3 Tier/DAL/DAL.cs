using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace DAL
{
    public class DAL
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

        public string  Insert(BOL.BOL objInsert)
        {
            SqlCommand cmd = new SqlCommand("UserDetails_Insert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@FirstName", objInsert.FirstName);
            cmd.Parameters.Add("@MiddleName", objInsert.MiddleName);
            cmd.Parameters.Add("@LastName", objInsert.LastName);
            cmd.Parameters.Add("@Age", objInsert.Age);
            cmd.Parameters.Add("@MaritalStatus", objInsert.MaritalStatus);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            string result = string.Empty;
            return result;
        }
        public static DataTable Select()
        {

            SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            SqlCommand cmd = new SqlCommand("UserDetails_select", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;   
        }
      
    }
}
