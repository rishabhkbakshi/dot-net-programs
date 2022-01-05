using System;
using System.Collections.Specialized ;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page 
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Rishabh"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindEmployeeDetails();
        }
    }

    protected void BindEmployeeDetails()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("Employeeinfo_SELECT", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        con.Close();
        if (ds.Tables[0].Rows.Count > 0)
        {
           Grid.DataSource = ds;
           Grid.DataBind();
        }
        else
        {
            ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
            Grid.DataSource = ds;
            Grid.DataBind();
            int columncount = Grid.Rows[0].Cells.Count;
            Grid.Rows[0].Cells.Clear();
            Grid.Rows[0].Cells.Add(new TableCell());
            Grid.Rows[0].Cells[0].ColumnSpan = columncount;
            Grid.Rows[0].Cells[0].Text = "No Records Found";
        }
    }

}
