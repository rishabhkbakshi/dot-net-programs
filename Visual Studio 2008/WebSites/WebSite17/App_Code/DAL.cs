using System;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
//using System.BLL;


/// <summary>
/// Summary description for DAL
/// </summary>
public class DAL
{
	public DAL()
	{
		//
		// TODO: Add constructor logic here
		//
    }

    public int InsertUserInformation(string Username, string Password, string Firstname, string Lastname, string Email, string PhoneNo, string Location)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Rishabh"].ConnectionString);
        SqlCommand cmd = new SqlCommand("usp_User_Insert", con);
        cmd.CommandType = CommandType.StoredProcedure;
        con.Open();
        try
        {
            cmd.Parameters.AddWithValue("@Username", Username);
            cmd.Parameters.AddWithValue("@Password", Password);
            cmd.Parameters.AddWithValue("@Firstname", Firstname);
            cmd.Parameters.AddWithValue("@Lastname", Lastname);
            cmd.Parameters.AddWithValue("@Email", Email);
            cmd.Parameters.AddWithValue("@PhoneNo", PhoneNo);
            cmd.Parameters.AddWithValue("@Location", Location);
            return cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            cmd.Dispose();
            con.Close();
        }
    }

}

