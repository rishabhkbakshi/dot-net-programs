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
        BinddynamicTable();
        BindGrid();
    }
    private void BinddynamicTable()
    {
        string str = "select top 40 * from Excel_Table ";
        SqlCommand cmd = new SqlCommand(str, con);
        cmd.CommandType = CommandType.Text;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        Response.Write("<table style='Background-color:yellow;'>");
        Response.Write("<tr><td>Id</td><td>name</td><td>Designation</td></tr>");
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            Response.Write("<tr>");
            Response.Write("<td>" + dt.Rows[i]["Id"].ToString() + "</td>");
            Response.Write("<td>" + dt.Rows[i]["name"].ToString() + "</td>");
            Response.Write("<td>" + dt.Rows[i]["Designation"].ToString() + "</td>");
            Response.Write("</tr>");
        }
        Response.Write("</table>");
    }
    private void BindGrid()
    {
        string str = "Select top 40 * from Excel_Table ";
        SqlCommand cmd = new SqlCommand(str, con);
        cmd.CommandType = CommandType.Text;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        Grid.DataSource = dt;
        Grid.DataBind();
    }
    protected void Grid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Grid.PageIndex = e.NewPageIndex;
        BindGrid();
    }
}