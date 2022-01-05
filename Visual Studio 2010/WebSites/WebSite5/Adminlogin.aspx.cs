using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnadminlogin_Click(object sender, EventArgs e)
    {
        Finduser();
    }
    private void Finduser()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("usp_User", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Username", txtAdminUser.Text);
        cmd.Parameters.AddWithValue("@Password", txtAdminPass.Text);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            Session["Admin"] = txtAdminUser.Text;
            Response.Redirect("AfteradminLogin.aspx");
        }
        else
        {
            lblValidation.Text = "Invalid Username & Password";
        }
        con.Close();
    }
}
