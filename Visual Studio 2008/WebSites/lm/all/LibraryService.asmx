<%@ WebService Language="C#" Class="LibraryService" %>

using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Data;
using System.Data.SqlClient;


[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
public class LibraryService  : System.Web.Services.WebService {

    [WebMethod]
    public int GetIssueCount(int mid)
    {
        SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
        con.Open();

        SqlCommand cmd = new SqlCommand("select count(*) from issues where mid = " + mid,con);
        int count;

        count = (int) cmd.ExecuteScalar();

        con.Close();
        return count;
       
    }

    [WebMethod]
    public int GetTitlesCount(String author)
    {
        SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
        con.Open();

        SqlCommand cmd = new SqlCommand("select count(*) from titles where  authors like '%" + author + "%'", con);
        int count;

        count = (int)cmd.ExecuteScalar();

        con.Close();
        return count;
     
    }

    [WebMethod]
    public DataSet GetAllMembers()
    {
        SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
        SqlDataAdapter da = new SqlDataAdapter("select * from members", con);
        DataSet ds = new DataSet();
        da.Fill(ds, "Members");
        return ds;

    }

    [WebMethod]
    public DataSet GetTitles(String subject)
    {
        SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
        SqlDataAdapter da = new SqlDataAdapter("select * from titles where subcode = '" + subject + "'", con);
        DataSet ds = new DataSet();
        da.Fill(ds, "Titles");
        return ds;

    }
    
    
    
}

