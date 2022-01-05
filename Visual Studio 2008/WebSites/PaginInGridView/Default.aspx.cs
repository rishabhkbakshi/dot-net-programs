using System;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;

public partial class _Default : System.Web.UI.Page 
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        BindGrid();
    }
    private void BindGrid()
    {
        SqlCommand cmd = new SqlCommand("usp_User_Select", con);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        PageGrid.DataSource = dt;
        PageGrid.DataBind();
    }
    protected void PageGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        PageGrid.PageIndex = e.NewPageIndex;
        BindGrid();
    }
}
