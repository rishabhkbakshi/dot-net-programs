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
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["constr"]);
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private void Insert()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("insert into Temp values(@Fname,@Lname)", con);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@Fname", txtFname.Text);
        cmd.Parameters.AddWithValue("@Lname", txtLname.Text);
        cmd.ExecuteNonQuery();
        con.Close();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Insert();
        Response.Write("Insertion successfully");
    }
}