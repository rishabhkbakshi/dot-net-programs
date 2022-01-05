using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.DataVisualization.Charting;
using System.Data;
using System.Drawing;
using System.Drawing.Imaging;
using System.Drawing.Drawing2D;
using System.Drawing.Text;
//using Microsoft.Office.Interop.Excel;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        System.Data.DataTable dt = new System.Data.DataTable();
        dt.Columns.Add("Testing Knowledge");
        dt.Columns.Add("Points");
        dt.Columns.Add("Total Points");
        dt.Columns.Add("Score");
        DataRow dr1 = dt.NewRow();
        dr1.ItemArray = new object[] { "Test Analysis and Design", 8, 61, 1.3 };
        dt.Rows.Add(dr1);
        DataRow dr2 = dt.NewRow();
        dr2.ItemArray = new object[] { "Test Management and Reporting", 6, 19, 3.2 };
        dt.Rows.Add(dr2);
        DataRow dr3 = dt.NewRow();
        dr3.ItemArray = new object[] { "Test implementation and execution", 45, 100, 4.5 };
        dt.Rows.Add(dr3);
        DataRow dr4 = dt.NewRow();
        dr4.ItemArray = new object[] { "Test Process", 0, 14, 0.0 };
        dt.Rows.Add(dr4);
        DataRow dr5 = dt.NewRow();
        dr5.ItemArray = new object[] { "Test Tools", 5, 12, 4.2 };
        dt.Rows.Add(dr5);
        DataRow dr6 = dt.NewRow();
        dr6.ItemArray = new object[] { "Testing Concepts", 9, 20, 4.5 };
        dt.Rows.Add(dr6);
        DataRow dr7 = dt.NewRow();
        dr7.ItemArray = new object[] { "Test Planning and Control", 2, 18, 1.1 };
        dt.Rows.Add(dr7);
        Chart aRadarChart = new Chart();
        aRadarChart.Width = Unit.Pixel(1200);
        aRadarChart.Height = Unit.Pixel(900);
        aRadarChart.DataSource = dt;
        // Add title 
        aRadarChart.Titles.Add(new Title("Testing Knowledge",Docking.Top,new Font("Calibri",25f,FontStyle.Bold),Color.Black));

        // Add a legend 
        Legend lgnd = new Legend();
        lgnd.Enabled = true;
        aRadarChart.Legends.Add(lgnd);

        //Important: add ChartArea, otherwise no graph will be shown
        ChartArea ca = new ChartArea("myChartArea");
        aRadarChart.ChartAreas.Add(ca);

        string car = String.Empty;
        for (int i = 1; i < dt.Columns.Count; i++)
        {
            car = dt.Columns[i].ColumnName;

            aRadarChart.Series.Add(car);//Name of the series :Volvo and Toyota
            aRadarChart.Series[car].YValueMembers = car;//Either Volvo or Toyota
            aRadarChart.Series[car].XValueMember = dt.Columns[0].ColumnName;//Criteria
            //Define here: what kind of Chart you want
            aRadarChart.Series[car].ChartType = SeriesChartType.Radar;
        }

        //binding data
        aRadarChart.DataBind();
        //Add Chart to a PlaceHolder Control
        placeholder.Controls.Add(aRadarChart);
        //Page.Controls.Add(aRadarChart);

        //for saving image
        aRadarChart.SaveImage(Server.MapPath("NewFolder1/Sample.jpg"));
    }
}

