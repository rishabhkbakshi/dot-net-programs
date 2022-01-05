using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [System.Web.Services.WebMethod]
    [System.Web.Script.Services.ScriptMethod]
    public static string[] GetFirstNameList(string prefixText)
    {
        SqlConnection con = new SqlConnection("server=192.168.9.204; Database=rishabh; User ID=sa; Password=sqlserver2005;");
        SqlCommand cmd = new SqlCommand("Student_Regestration_FirstNameSelect", con);
        con.Open();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@PrefixText", prefixText);
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        con.Close();
        List<string> FirstName = new List<string>();
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            FirstName.Add(ds.Tables[0].Rows[i][0].ToString());
        }
        return FirstName.ToArray();
    }
}
