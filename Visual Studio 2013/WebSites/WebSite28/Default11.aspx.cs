using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;

public partial class Default11 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            OleDbConnection xlConn;
            string str = Server.MapPath(FileUpload1.PostedFile.FileName);
            string connectionString = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + str + ";Extended Properties=Excel 12.0;Persist Security Info=False";
            using (xlConn = new OleDbConnection(connectionString))
            {
                xlConn.Open();
                DataTable xlDtCheckColumn = xlConn.GetSchema("Columns");

                OleDbCommand xlCmdSelectScores = new OleDbCommand("Select * from [Sheet1$]", xlConn);
                OleDbDataAdapter xlDaSelectScores = new OleDbDataAdapter(xlCmdSelectScores);
                DataTable xlDtSelectScores = new DataTable();
                xlDaSelectScores.Fill(xlDtSelectScores);
                xlConn.Close();
            }
        }
    }
}