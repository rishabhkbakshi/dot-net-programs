using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnL_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        SqlCommand cmd = new SqlCommand("usp_User", con);
        cmd.CommandType = CommandType.StoredProcedure;
        con.Open();
        cmd.Parameters.AddWithValue("@Username", txtU.Text);
        cmd.Parameters.AddWithValue("@Password", txtP.Text);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            Session["Login"] = txtU.Text;
            Response.Redirect("AfterLogin.aspx");
        }
        else
        {
            lblMes.Text = "Invalid Username or Password";
        }
        con.Close();
    }
    protected void btnC_Click(object sender, EventArgs e)
    {
        Response.Redirect("Create.aspx");
    }
}
