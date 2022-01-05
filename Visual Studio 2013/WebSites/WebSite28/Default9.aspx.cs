using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;
using System.Reflection;
using System.IO;
using Excel = Microsoft.Office.Interop.Excel;

public partial class Default9 : System.Web.UI.Page
{
    Excel.Application xla13R = new Excel.Application();
    private object missing = Missing.Value;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        string path = @"C:\Users\rishabh\Documents\Visual Studio 2012\WebSites\WebSite28\MarkingSheet for SaltId 47.xls";
        String connectionString = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + path + ";Extended Properties=Excel 12.0;Persist Security Info=False";
        OleDbConnection xlConn = new OleDbConnection(connectionString);
        xlConn.Open();
        OleDbCommand selectCmd = new OleDbCommand("Select * from [Sheet1$]", xlConn);
        OleDbDataAdapter xlAdapter = new OleDbDataAdapter(selectCmd);
        DataTable xlDataTable = new DataTable();
        xlAdapter.Fill(xlDataTable);

        int[] chu = { 4, 7, 9 };

        DataSet ds = new DataSet("DataSetName");
        DataTable dt = new DataTable();
        for (int i = 0; i <= chu.Length - 1; i++)
        {
            ds.Tables.Add("Table" + i);
            ds.Tables[i].Merge(xlDataTable);
            dt.Merge(ds.Tables[i]);
        }

        if (dt != null)
        {
            if (dt.Rows.Count >= 1)
            {
                xla13R.Visible = true;
                Excel.Workbook wb13R = xla13R.Workbooks.Add(Excel.XlWBATemplate.xlWBATWorksheet);
                Excel.Worksheet ws13R = (Excel.Worksheet)wb13R.Worksheets.get_Item(1);
                for (int clms = 1; clms < dt.Columns.Count + 1; clms++)
                {
                    ws13R.Cells[1, clms] = dt.Columns[clms - 1].ToString().ToUpper() + "\t";
                    string myHeader = dt.Columns[clms - 1].ToString().ToUpper();
                }
                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    for (int j = 0; j <= dt.Columns.Count - 1; j++)
                    {
                        string data = dt.Rows[i][j].ToString();
                        ws13R.Cells[i + 2, j + 1] = data;
                    }
                }
                Excel.Range xValues13R = ws13R.Range["A1", "M1"];
                xValues13R.Font.Bold = true;
                xValues13R.WrapText = true;
                ws13R.Columns.AutoFit();
                wb13R.SaveAs("C:\\Users\\rishabh\\Documents\\New folder " + "(" + 1 + ")" + "\\csharp.net-informations1.xlsx", Excel.XlFileFormat.xlOpenXMLWorkbook, Missing.Value, missing, false, false, Excel.XlSaveAsAccessMode.xlNoChange, Excel.XlSaveConflictResolution.xlUserResolution, true, missing, missing, missing);

                wb13R.Close(true, missing, missing);
                xla13R.Quit();
            }
        }
    }
}