using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnCreate_Click(object sender, EventArgs e)
    {
        Response.Redirect("AccountCreation.aspx");
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        Login();
    }
    private void Login()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("usp_UserLogin", con);
        cmd.CommandType = CommandType.StoredProcedure; 
        cmd.Parameters.AddWithValue("@Email", txtUserName.Text);
        cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            Session["Email"] = txtUserName.Text; 
            Response.Redirect("AfterLogin.aspx");
        }
        else
        {
            Response.Write("Invalid Username & Password");
        }
        con.Close();
    }
}