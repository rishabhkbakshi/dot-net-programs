using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;



public partial class _Default : System.Web.UI.Page 
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindDropdown();
        }
    }

    private void BindDropdown()
    {
        SqlCommand cmd = new SqlCommand("select StudentId,FirstName from StudentRecord", con);
        cmd.CommandType = CommandType.Text;
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        DrpStudent.DataSource = dt;
        DrpStudent.DataTextField = "FirstName";
        DrpStudent.DataValueField = "StudentId";
        DrpStudent.DataBind();
        DrpStudent.Items.Insert(0, new ListItem("--Select--"));
    }

    protected void DrpStudent_SelectedIndexChanged(object sender, EventArgs e)
    {
       //TestControl1.BindGrid(DrpStudent.SelectedValue);
        TestControl1.StudentId = Convert.ToInt64(DrpStudent.SelectedValue);
    }
}

