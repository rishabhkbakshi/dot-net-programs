using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Excel = Microsoft.Office.Interop.Excel;
using System.Data;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Reflection;
using System.Collections;

public partial class Default4 : System.Web.UI.Page
{
    public static Int32 intStr;
    public static Int32 intStr2;
    public static Int32 intStr3;
    public static Int32 intStr4;
    public static ArrayList intarr = new ArrayList();
    public static ArrayList intarr2 = new ArrayList();
    public static ArrayList intarr3 = new ArrayList();
    public static ArrayList intarr4 = new ArrayList();

    SqlConnection con = new SqlConnection("Data Source=.;User Id=sa;Password=sqlserver2008;Database=practice");
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private void chu()
    {
        Excel.Application rubricExcelToParse = new Excel.Application();
        rubricExcelToParse.Workbooks.OpenText(@"C:\Users\Rishdik\Documents\Visual Studio 2012\Projects\HandsonRubricApp\HandsonRubricApp\TestId1\Rakesh\SaltId 82\MarkingSheet for SaltId 82.xlsx", Missing.Value, 1, Missing.Value, Excel.XlTextQualifier.xlTextQualifierNone, Missing.Value, Missing.Value, Missing.Value, true, Missing.Value, Missing.Value, Missing.Value, Missing.Value, Missing.Value, Missing.Value, Missing.Value, Missing.Value, Missing.Value);
        Excel.Worksheet excelWorksheet = (Excel.Worksheet)rubricExcelToParse.ActiveSheet;
        Excel.Range range = excelWorksheet.Range["A2", "A65"];
        Excel.Range range2 = excelWorksheet.Range["B2", "B65"];
        Excel.Range range3 = excelWorksheet.Range["G2", "G65"];
        Excel.Range range4 = excelWorksheet.Range["J2", "J65"];

        for (int i = 1; i <= range.Columns.Count; i++)
        {
            if (i == 3 || i == 4 || i == 5 || i == 6 || i == 8 || i == 9 || i == 11 || i == 12 || i == 13) { continue; }
            for (int j = 1; j <= range.Rows.Count; j++)
            {
                double str = (double)(range.Cells[j, i] as Excel.Range).Value2;
                intStr = Convert.ToInt32(str);
                intarr.Insert(j - 1, intStr);
            }
        }
        for (int i = 1; i <= range2.Columns.Count; i++)
        {
            if (i == 3 || i == 4 || i == 5 || i == 6 || i == 8 || i == 9 || i == 11 || i == 12 || i == 13) { continue; }
            for (int j = 1; j <= range2.Rows.Count; j++)
            {
                double str2 = (double)(range2.Cells[j, i] as Excel.Range).Value2;
                intStr2 = Convert.ToInt32(str2);
                intarr2.Insert(j - 1, intStr2);
            }
        }
        for (int i = 1; i <= range3.Columns.Count; i++)
        {
            if (i == 3 || i == 4 || i == 5 || i == 6 || i == 8 || i == 9 || i == 11 || i == 12 || i == 13) { continue; }
            for (int j = 1; j <= range3.Rows.Count; j++)
            {
                double str3 = (double)(range3.Cells[j, i] as Excel.Range).Value2;
                intStr3 = Convert.ToInt32(str3);
                intarr3.Insert(j - 1, intStr3);
            }
        }
        for (int i = 1; i <= range4.Columns.Count; i++)
        {
            if (i == 3 || i == 4 || i == 5 || i == 6 || i == 8 || i == 9 || i == 11 || i == 12 || i == 13) { continue; }
            for (int j = 1; j <= range4.Rows.Count; j++)
            {
                double str4 = (double)(range4.Cells[j, i] as Excel.Range).Value2;
                intStr4 = Convert.ToInt32(str4);
                intarr4.Insert(j - 1, intStr4);
            }
        }
        con.Open();
        for (int i = 0; i <= 4; i++)
        {
            SqlCommand cmd = new SqlCommand("insert into tempforexcel(QUESTION_ID_INSTRUMENT,TEST_ID,CANDIDATE_ID,SCORE_VALUE,MAX_SCORE) values(@QUESTION_ID_INSTRUMENT,@TEST_ID,@CANDIDATE_ID,@SCORE_VALUE,@MAX_SCORE)", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@QUESTION_ID_INSTRUMENT", intarr[i]);
            cmd.Parameters.AddWithValue("@TEST_ID", 1);
            cmd.Parameters.AddWithValue("@CANDIDATE_ID", 23);
            cmd.Parameters.AddWithValue("@SCORE_VALUE", intarr4[i]);
            cmd.Parameters.AddWithValue("@MAX_SCORE", intarr3[i]);
            cmd.ExecuteNonQuery();
        }
        Response.Write("Insert Sucessfully");
        con.Close();
        rubricExcelToParse.Quit();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        chu();
    }
}