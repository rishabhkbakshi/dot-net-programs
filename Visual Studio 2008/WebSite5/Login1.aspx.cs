using System;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;

public partial class Default3 : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("usp_User", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Username", txtUser.Text);
            cmd.Parameters.AddWithValue("@Password", txtPass.Text);
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                Session["Submit"] = txtUser.Text;
                Response.Redirect("AfterLogin1.aspx");
            }
            else
            {
                lbl1.Text = "Invalid username & Password";
            }
            con.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}
