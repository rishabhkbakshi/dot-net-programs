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
using System.IO;

public partial class Default3 : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=.;User Id=sa;Password=sqlserver2008;Database=practice");
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string path = @"C:\Users\rishabh\Documents\Visual Studio 2012\WebSites\WebSite28\MarkingSheet for SaltId 47.xlsx";
        String connectionString = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + path + ";Extended Properties=Excel 12.0;Persist Security Info=False";
        OleDbConnection xlConn = new OleDbConnection(connectionString);
        xlConn.Open();
        OleDbCommand selectCmd = new OleDbCommand("Select [Question No#],[Max score],[Score] from [Sheet1$]", xlConn);
        OleDbDataAdapter xlAdapter = new OleDbDataAdapter(selectCmd);
        DataTable xlDataTable = new DataTable();
        xlAdapter.Fill(xlDataTable);
        
        DataView dv = new DataView(xlDataTable);
        dv.RowFilter = "[Question No#]='1'";


        //for (int i = 1; i < 5; i++)
        //{
        //    dv.RowFilter = "[Question No#] = " + i + " AND [Max score] = " + 2;
        //}

        //DataTable dt = new DataTable();
        //dt = dv.ToTable();


        //object x = xlDataTable.Compute("sum([Max score])", "[Question No#] = 1");

        List<DataTable> result = xlDataTable.AsEnumerable()
           .GroupBy(row => row.Field<double>("Question No#"))
           .Select(g => g.CopyToDataTable())
           .ToList();

        DataSet ds = new DataSet("Questions");
        for (int i = 0; i < result.Count; i++)
        {
            ds.Tables.Add(result[i]);
        }

        for (int i = 0; i < ds.Tables.Count; i++)
        {
            DataRow totalsRow = ds.Tables[i].NewRow();
            foreach (DataColumn col in ds.Tables[i].Columns)
            {
                int colTotal = 0;

                foreach (DataRow row in col.Table.Rows)
                {
                    colTotal += Int32.Parse(row[col].ToString());
                }
                totalsRow[col.ColumnName] = colTotal;
            }
            ds.Tables[i].Rows.Add(totalsRow);
        }

        DataSet dw = new DataSet();
        dw.Merge(ds);
        int l = 0;
        for (int i = 0; i < ds.Tables.Count; i++)
        {
            for (int j = 0; j < ds.Tables[i].Rows.Count; j++)
            {
                string str = ds.Tables[i].Rows[j]["Question No#"].ToString();
                int k = i + 1;
                if (str.Equals(k.ToString()))
                {
                    dw.Tables[i].Rows.RemoveAt(l);
                }
            }
        }
        for (int i = 0; i < dw.Tables.Count; i++)
        {
            int p = i + 1;

            for (int j = 0; j < dw.Tables[i].Rows.Count; j++)
            {
                dw.Tables[i].Rows[j]["Question No#"] = p;
            }
        }

        List<DataTable> list = new List<DataTable>(); 
        foreach (DataTable dtf in dw.Tables)
        {
            list.Add(dtf);
        }

        DataTable table = new DataTable("TblUnion");
        table.BeginLoadData();
        foreach (DataTable t in list)
        {
            table.Merge(t);
        }

        for (int i = 0; i <= xlDataTable.Columns.Count - 1; i++)
        {
            for (int j = 0; j <= xlDataTable.Rows.Count - 1; j++)
            {
                string variable = xlDataTable.Rows[j][i].ToString();
                con.Open();
                SqlCommand cmd = new SqlCommand("Insert into Excel_Table(Id,name,designation) values(@Id,@name,@designation)", con);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@Id", 1);
                cmd.Parameters.AddWithValue("@name", 1);
                cmd.Parameters.AddWithValue("@designation", variable);
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
        Response.Write("Insert Sucessfully");
    }
}