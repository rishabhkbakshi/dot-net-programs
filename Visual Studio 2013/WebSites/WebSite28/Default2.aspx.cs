using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    private String strConnection = "Data Source=.;User Id=sa;Password=sqlserver2008;Database=Practice";
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        //file upload path
        string path = Server.MapPath(fileuploadExcel.PostedFile.FileName);
        //Create connection string to Excel work book
        string excelConnectionString = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + path + ";Extended Properties=Excel 12.0;Persist Security Info=False";
        //Create Connection to Excel work book
        OleDbConnection excelConnection = new OleDbConnection(excelConnectionString);
        //Create OleDbCommand to fetch data from Excel
        OleDbCommand cmd = new OleDbCommand("Select [ID],[Name],[Designation] from [Sheet 1$]", excelConnection);
        OleDbDataAdapter da = new OleDbDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        excelConnection.Open();
        OleDbDataReader dReader;
        dReader = cmd.ExecuteReader();
        SqlBulkCopy sqlBulk = new SqlBulkCopy(strConnection);
        //Give your Destination table name
        sqlBulk.DestinationTableName = "Excel_table";
        sqlBulk.WriteToServer(dReader);
        excelConnection.Close();
        Response.Write("Insert Sucessfully");


        //String connectionString = connectionString = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + HttpContext.Current.Server.MapPath(path) + ";Extended Properties=Excel 12.0;Persist Security Info=False";
        //OleDbConnection xlConn = new OleDbConnection(connectionString);
        //xlConn.Open();
        //OleDbCommand selectCmd = new OleDbCommand("SELECT [Score] FROM [Group A$]", xlConn);
        //OleDbDataAdapter xlAdapter = new OleDbDataAdapter(selectCmd);
        //DataTable xlDataset = new DataTable();
        //xlAdapter.Fill(xlDataset);
        //for (int i = 0; i <= xlDataset.Columns.Count - 1; i++)
        //{
        //    for (int j = 0; j <= xlDataset.Rows.Count - 1; j++)
        //    {
        //        string variable = xlDataset.Rows[j][i].ToString();
        //        con.Open();
        //        MySqlCommand cmd = new MySqlCommand("Insert into scores(test_id,CANDIDATE_ID,SCORE_VALUE) values(@test_id,@CANDIDATE_ID,@SCORE_VALUE)", con);
        //        cmd.CommandType = CommandType.Text;
        //        cmd.Parameters.AddWithValue("@test_id", lstboxTextId.SelectedItem.Text);
        //        cmd.Parameters.AddWithValue("@CANDIDATE_ID", candidateStrReplace);
        //        cmd.Parameters.AddWithValue("@SCORE_VALUE", variable);
        //        cmd.ExecuteNonQuery();
        //        con.Close();
        //    }
        //}


    }
}
