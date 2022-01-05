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
using System.IO;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        CheckUser();
    }

    private void InsertUser()
    {
        con.Open();
        Stream InputStream;
        InputStream = Fupload.PostedFile.InputStream;
        int len = Fupload.PostedFile.ContentLength;
        byte[] image = new byte[len];
        InputStream.Read(image, 0, len);
        SqlCommand cmd = new SqlCommand("usp_UserCreation", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@UserName", txtUserName.Text);
        cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
        cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
        cmd.Parameters.AddWithValue("@PhoneNo", txtPhone.Text);
        cmd.Parameters.AddWithValue("@Image", image);
        cmd.ExecuteNonQuery();
        con.Close();
    }

    private void CheckUser()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("usp_CheckUser", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        con.Close();
        if (dt.Rows.Count == 0)
        {
            InsertUser();
            Response.Write("Account Create Sucessfully");
        }
        else
        {
            Response.Write("User Exist");
        }
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        txtUserName.Text = "";
        txtPassword.Text = "";
        txtEmail.Text = "";
        txtPhone.Text = "";
        txtCPassword.Text = "";
    }
}