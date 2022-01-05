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
    protected void btnSend_Click(object sender, EventArgs e)
    {
        CheckMailAccount();
    }

    private void SendMail()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("usp_InsertMail", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@FromMail", txtTo.Text);
        cmd.Parameters.AddWithValue("@Subject", txtSubject.Text);
        cmd.Parameters.AddWithValue("@Message", txtMessage.Text);
        cmd.ExecuteNonQuery();
        con.Close();
    }

    private void CheckMailAccount()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("usp_CheckUser", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Email", txtTo.Text);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        con.Close();
        if (dt.Rows.Count == 1)
        {
            SendMail();
            Response.Write("Mail Send Sucessfully");
        }
        else
        {
            Response.Write("User not Exist");
        }
    }
}