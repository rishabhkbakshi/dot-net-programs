using System;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class _Default : System.Web.UI.Page 
{
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        BindGrid();
    }
    private void BindGrid()
    {
        DataColumn dc = new DataColumn();
        dc = new DataColumn("Category", typeof(string));
        dt.Columns.Add(dc);
        dc = new DataColumn("Value", typeof(string));
        dt.Columns.Add(dc);

        DataRow dr = dt.NewRow();
        dr["Category"] = "Cat1";
        dr["Value"] = "Val1";
        dt.Rows.Add(dr);

        dr = dt.NewRow();
        dr["Category"] = "Cat2";
        dr["Value"] = "Val2";
        dt.Rows.Add(dr);

        dr = dt.NewRow();
        dr["Category"] = "Cat3";
        dr["Value"] = "Val3";
        dt.Rows.Add(dr);

        dr = dt.NewRow();
        dr["Category"] = "Cat4";
        dr["Value"] = "Val4";
        dt.Rows.Add(dr);

        dr = dt.NewRow();
        dr["Category"] = "Cat2";
        dr["Value"] = "Val5";
        dt.Rows.Add(dr);

        dr = dt.NewRow();
        dr["Category"] = "Cat3";
        dr["Value"] = "Val6";
        dt.Rows.Add(dr);

        dr = dt.NewRow();
        dr["Category"] = "Cat1";
        dr["Value"] = "Val7";
        dt.Rows.Add(dr);

        dr = dt.NewRow();
        dr["Category"] = "Cat4";
        dr["Value"] = "Val8";
        dt.Rows.Add(dr);

        dr = dt.NewRow();
        dr["Category"] = "Cat3";
        dr["Value"] = "Val9";
        dt.Rows.Add(dr);

        dr = dt.NewRow();
        dr["Category"] = "Cat2";
        dr["Value"] = "Val10";
        dt.Rows.Add(dr);

        dr = dt.NewRow();
        dr["Category"] = "Cat1";
        dr["Value"] = "Val11";
        dt.Rows.Add(dr);

        dr = dt.NewRow();
        dr["Category"] = "Cat4";
        dr["Value"] = "Val12";
        dt.Rows.Add(dr);

        dr = dt.NewRow();
        dr["Category"] = "Cat2";
        dr["Value"] = "Val13";
        dt.Rows.Add(dr);

        dr = dt.NewRow();
        dr["Category"] = "Cat4";
        dr["Value"] = "Val14";
        dt.Rows.Add(dr);

        dr = dt.NewRow();
        dr["Category"] = "Cat1";
        dr["Value"] = "Val15";
        dt.Rows.Add(dr);

        dr = dt.NewRow();
        dr["Category"] = "Cat3";
        dr["Value"] = "Val16";
        dt.Rows.Add(dr);

        Grid.DataSource = dt;
        Grid.DataBind();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        PivotGrid.DataSource = transform(dt);
        PivotGrid.DataBind();
    }
    private DataTable transform(DataTable dt)
    {
        DataTable table = new DataTable();
        DataTable tableNew = new DataTable();
        tableNew = dt.DefaultView.ToTable(true, "Category");
        for (int i = 0; i < tableNew.Rows.Count; i++)
        {
            table.Columns.Add(Convert.ToString(tableNew.Rows[i][0]));
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
