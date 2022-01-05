using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;

public partial class Default12 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGridview();
        }
    }
    protected void BindGridview()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("UserId", typeof(Int32));
        dt.Columns.Add("UserName", typeof(string));
        dt.Columns.Add("Education", typeof(string));
        dt.Columns.Add("Location", typeof(string));
        dt.Rows.Add(1, "SureshDasari", "B.Tech", "Chennai");
        dt.Rows.Add(2, "MadhavSai", "MBA", "Nagpur");
        dt.Rows.Add(3, "MaheshDasari", "B.Tech", "Nuzividu");
        dt.Rows.Add(4, "SureshDasari", "B.Tech", "Chennai");
        gvDetails.DataSource = dt;
        gvDetails.DataBind();
    }
    protected void gvDetails_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridViewRow gvRow = e.Row;
        if (gvRow.RowType == DataControlRowType.Header)
        {
            GridViewRow gvrow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
            TableCell cell0 = new TableCell();
            cell0.Text = "Age Group";
            cell0.HorizontalAlign = HorizontalAlign.Center;
            cell0.ColumnSpan = 2;
            TableCell cell1 = new TableCell();
            cell1.Text = "No. Of Employees";
            cell1.HorizontalAlign = HorizontalAlign.Center;
            cell1.ColumnSpan = 2;
            gvrow.Cells.Add(cell0);
            gvrow.Cells.Add(cell1);
            gvDetails.Controls[0].Controls.AddAt(0, gvrow);
        }
    }
}