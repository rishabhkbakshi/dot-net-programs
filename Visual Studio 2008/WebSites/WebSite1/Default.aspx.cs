using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        DynamicGrid();
    }
    private void DynamicGrid()
    {
        DataColumn dc = new DataColumn();
        dc = new DataColumn("Category", typeof(string));
        dt.Columns.Add(dc);
        dc = new DataColumn("Value", typeof(string));
        dt.Columns.Add(dc);

        DataRow dr = dt.NewRow();
        dr["Category"] = "cat1";
        dr["Value"] = "val1";
        dt.Rows.Add(dr);

        dr = dt.NewRow();
        dr["Category"] = "cat2";
        dr["Value"] = "val2";
        dt.Rows.Add(dr);

        dr = dt.NewRow();
        dr["Category"] = "cat3";
        dr["Value"] = "val3";
        dt.Rows.Add(dr);

        dr = dt.NewRow();
        dr["Category"] = "cat4";
        dr["Value"] = "val4";
        dt.Rows.Add(dr);

        dr = dt.NewRow();
        dr["Category"] = "cat3";
        dr["Value"] = "val5";
        dt.Rows.Add(dr);

        dr = dt.NewRow();
        dr["Category"] = "cat2";
        dr["Value"] = "val6";
        dt.Rows.Add(dr);

        dr = dt.NewRow();
        dr["Category"] = "cat4";
        dr["Value"] = "val7";
        dt.Rows.Add(dr);

        dr = dt.NewRow();
        dr["Category"] = "cat3";
        dr["Value"] = "val8";
        dt.Rows.Add(dr);

        dr = dt.NewRow();
        dr["Category"] = "cat2";
        dr["Value"] = "val9";
        dt.Rows.Add(dr);

        dr = dt.NewRow();
        dr["Category"] = "cat1";
        dr["Value"] = "val10";
        dt.Rows.Add(dr);

        dr = dt.NewRow();
        dr["Category"] = "cat4";
        dr["Value"] = "val11";
        dt.Rows.Add(dr);

        dr = dt.NewRow();
        dr["Category"] = "cat3";
        dr["Value"] = "val12";
        dt.Rows.Add(dr);

        dr = dt.NewRow();
        dr["Category"] = "cat2";
        dr["Value"] = "val13";
        dt.Rows.Add(dr);

        dr = dt.NewRow();
        dr["Category"] = "cat1";
        dr["Value"] = "val14";
        dt.Rows.Add(dr);

        GridData.DataSource = dt;
        GridData.DataBind();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        GridToShow.DataSource = TransformTable(dt);
        GridToShow.DataBind();
    }
    public DataTable TransformTable(DataTable dt)
    {
        DataTable table = new DataTable();
        DataTable tableNew = new DataTable();
        tableNew = dt.DefaultView.ToTable(true, "Category");
        for (int i = 0; i < tableNew.Rows.Count; i++)
        {
            table.Columns.Add(Convert.ToString(dt.Rows[i][0]));
        }
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            for (int j = 0; j < table.Columns.Count; j++)
            {
                string str = dt.Rows[i]["Value"].ToString();
                if (dt.Rows[i]["Category"].ToString() == table.Columns[j].ToString())
                {
                    DataRow dr = table.NewRow();
                    dr[j] = str;
                    table.Rows.Add(dr);
                }
            }
        }
        return table;
    }
}
