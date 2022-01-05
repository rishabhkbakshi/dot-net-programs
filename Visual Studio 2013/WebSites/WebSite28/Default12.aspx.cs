using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;
using System.Text;

public partial class Default12 : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dt = showData();
        grdViewData.DataSource = dt;
        grdViewData.DataBind();
        DataTable dt2 = getData();
        drgViewData2.DataSource = dt2;
        drgViewData2.DataBind();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        DataTable dt = showData();
        FileStream fs = new FileStream(Server.MapPath("~/Chu.xml"), FileMode.Append, FileAccess.Write);
        StreamWriter w = new StreamWriter(fs);
        w.BaseStream.Seek(0, SeekOrigin.End);
        w.Write("<" + dt.TableName + ">");
        foreach (DataRow row in dt.Rows)
        {
            w.Write("<item>");
            for (int i = 0; i < dt.Columns.Count; i++)
            {
                w.Write("<" + dt.Columns[i].ColumnName + ">" + row[i].ToString() + "</" + dt.Columns[i].ColumnName + ">");
            }
            w.Write("</item>");
        }
        w.Write("</" + dt.TableName + ">");
        w.Flush(); 
        w.Close();
        fs.Close();
    }

    private DataTable getData()
    {
        string xmlDocString = Server.MapPath("~/Chu.xml");

        DataSet dataSet = new DataSet();
        dataSet.ReadXml(xmlDocString);

        return dataSet.Tables[0];
    }

    private DataTable showData()
    {
        SqlCommand cmd = new SqlCommand("Select top 20 * from Excel_Table ", con);
        cmd.CommandType = CommandType.Text;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable("XmlData");
        da.Fill(dt);
        return dt;
    }
}