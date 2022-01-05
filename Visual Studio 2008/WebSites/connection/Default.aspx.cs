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
    protected void btn_Con_Click(object sender, EventArgs e)
    {
        //Connected Architecture
        con.Open();
        SqlCommand cmd = new SqlCommand("usp_Connection_Select", con);
        cmd.CommandType = CommandType.StoredProcedure;
        Grid.DataSource = cmd.ExecuteReader(); ;
        Grid.DataBind();
        con.Close();
    }
    protected void btn_discon_Click(object sender, EventArgs e)
    {
        //Disconnected Architecture
        SqlCommand cmd = new SqlCommand("usp_Connection_Select", con);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        Grid.DataSource = dt;
        Grid.DataBind();
    }
}
