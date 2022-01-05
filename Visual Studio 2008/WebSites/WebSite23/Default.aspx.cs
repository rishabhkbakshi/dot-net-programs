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
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        con.Open();
        int num = Convert.ToInt32(txtSearch.Text);
        SqlCommand cmd = new SqlCommand("usp_Search", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Id", num);
        Grid.DataSource = cmd.ExecuteReader();
        Grid.DataBind();
        if (Grid.Rows.Count < num)
        {
            Grid.DataSource = null;
            Grid.DataBind();
            Response.Write("<script language=javascript> alert('Not Found')</script>");
        }
        con.Close();
    }
}
