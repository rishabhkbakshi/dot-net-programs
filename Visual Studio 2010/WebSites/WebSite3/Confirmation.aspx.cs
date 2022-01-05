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

public partial class Confirmation : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        string userquerystring = Request.QueryString["User Id"].ToString();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand("usp_SELECTUPDATE", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@ID", userquerystring);
        lblConfirmation.Text = Convert.ToString(cmd.ExecuteScalar());
        con.Close();
    }
}