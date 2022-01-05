using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class _Default : System.Web.UI.Page
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
                Session["Admin"] = txtUser.Text;
                Response.Redirect("Admin1.aspx");
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
