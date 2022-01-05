using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;


public partial class _Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        btnfirst.Enabled = true; ;
        btnprevious.Enabled = true;
        if (!IsPostBack)
        {
            BindGrid();
        }
    }
    protected void btnfirst_Click(object sender, EventArgs e)
    {
        PageGrid.PageIndex = 0;
        btnprevious.Enabled = false;
        btnfirst.Enabled = false;
        btnnext.Enabled = true;
        btnlast.Enabled = true;
        BindGrid();
    }
    protected void btnnext_Click(object sender, EventArgs e)
    {
        int i = PageGrid.PageIndex + 1;
        if (i <= PageGrid.PageCount)
        {
            PageGrid.PageIndex = i;
            btnfirst.Enabled = true;
            btnlast.Enabled = true;
            btnprevious.Enabled = true;
        }
        if (PageGrid.PageCount - 1 == PageGrid.PageIndex)
        {
            btnnext.Enabled = false;
            btnlast.Enabled = false;

        }
        BindGrid();

    }
    protected void btnprevious_Click(object sender, EventArgs e)
    {
        int i = PageGrid.PageCount;
        if (PageGrid.PageIndex > 0)
        {
            PageGrid.PageIndex = PageGrid.PageIndex - 1;
            btnlast.Enabled = true;
        }
        if (PageGrid.PageIndex == 0)
        {
            btnfirst.Enabled = false;
        }
        if (PageGrid.PageCount - 1 == PageGrid.PageIndex + 1)
        {
            btnnext.Enabled = true;
        }
        if (PageGrid.PageIndex == 0)
        {
            btnprevious.Enabled = false;
        }
        BindGrid();
    }
    protected void btnlast_Click(object sender, EventArgs e)
    {
        PageGrid.PageIndex = PageGrid.PageCount;
        btnlast.Enabled = false;
        btnprevious.Enabled = true;
        btnnext.Enabled = false;
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
