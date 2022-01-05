using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        UserLogin();
    }

    private void UserLogin()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("usp_UserTypeLogin", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Designation", drpdownDesignation.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@Username", txtUsername.Text);
        cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            Session["Designation"] = txtUsername.Text;
            if (drpdownDesignation.SelectedValue == "0")
            {
                Response.Redirect("ApplyForLeave.aspx");
            }
            else if (drpdownDesignation.SelectedValue == "1")
            {
                Response.Redirect("ManagerApprooval.aspx");
            }
            else
            {
                Response.Redirect("HRApprooval.aspx");
            }
        }
        else
        {
            lblResponse.Text = "Invalid Username & password";
        }
    }
}