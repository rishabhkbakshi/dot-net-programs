using System;
using System.Configuration;
using System.Data;
using System.Web;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
//using User interface

namespace Data_Access
{
    public class DAL
    {
        public string Data(Business_Object.BOL InsertO)
        {
            try
            {
                SqlConnection con = new SqlConnection("Data Source=192.168.9.204; User Id=sa; Password=sqlserver2005; Database=rishabh");
                SqlCommand cmd = new SqlCommand("usp_User_Insert", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                cmd.Parameters.AddWithValue("@Username", InsertO.Username);
                cmd.Parameters.AddWithValue("@Password", InsertO.Password);
                cmd.Parameters.AddWithValue("@Firstname", InsertO.Firstname);
                cmd.Parameters.AddWithValue("@Lastname", InsertO.Lastname);
                cmd.Parameters.AddWithValue("@Email", InsertO.Email);
                cmd.Parameters.AddWithValue("@PhoneNo", InsertO.PhoneNo);
                cmd.Parameters.AddWithValue("@Location", InsertO.Location);
                cmd.ExecuteNonQuery();
                con.Close();
                string str = "";
                return str;
                
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static DataTable Datagrid()
        {
            try
            {
                SqlConnection con = new SqlConnection("Data Source=192.168.9.204; User Id=sa; Password=sqlserver2005; Database=rishabh");
                SqlCommand cmd = new SqlCommand("usp_User_Select", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                con.Close();
                return dt;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
