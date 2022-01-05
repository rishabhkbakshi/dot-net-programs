using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Create : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnCREATE_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("usp_Find", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Username", txtUN.Text);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        cmd.ExecuteReader();
        con.Close();
        if (dt.Rows.Count == 0)
        {
            Insert();
        }
        else
        {
            lblMessage.Text = "User Exists";
        }
    }

    private void Insert()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("usp_Createuser", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Firstname", txtFN.Text);
        cmd.Parameters.AddWithValue("@Lastname", txtLN.Text);
        cmd.Parameters.AddWithValue("@Address", txtA.Text);
        cmd.Parameters.AddWithValue("@Username", txtUN.Text);
        cmd.Parameters.AddWithValue("@Password", txtPW.Text);
        cmd.Parameters.AddWithValue("@PhoneNo", txtP.Text);
        cmd.Parameters.AddWithValue("@Email", txtE.Text);
        cmd.ExecuteNonQuery();
        con.Close();
        lblMessage.Text = "Account Create Sucessfully";
    }
}
