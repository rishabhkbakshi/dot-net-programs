<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.IO;

public class Handler : IHttpHandler {
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    
    public void ProcessRequest (HttpContext context)
    {
        con.Open();
        string ID = context.Request.QueryString["ImageID"];
        SqlCommand cmd = new SqlCommand("ImageId", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Id", Convert.ToInt64(ID));
        SqlDataReader dr = cmd.ExecuteReader();
        dr.Read();
        context.Response.BinaryWrite((byte[])dr[3]);
        con.Close();
        context.Response.End();
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}