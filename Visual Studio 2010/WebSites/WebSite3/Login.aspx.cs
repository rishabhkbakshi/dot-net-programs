using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Login : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("usp_User", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Username", txtUserName.Text);
        cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            Session["UserName"] = txtUserName.Text;
            Response.Redirect("After Login.aspx");
        }
        else
        {
            Response.Write("Invalid Username & password");
        }
        con.Close();
    }
    protected void btnCreate_Click(object sender, EventArgs e)
    {
        Response.Redirect("CreateAccount.aspx");
    }
}