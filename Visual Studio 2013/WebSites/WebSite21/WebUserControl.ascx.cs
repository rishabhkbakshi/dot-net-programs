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

public partial class WebUserControl : System.Web.UI.UserControl
{
    Int64 _StudentId;

    public Int64 StudentId
    {
        set
        {
            _StudentId = value;
            BindGrid(_StudentId);
        }
    }
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private void BindGrid(long SelectedValue)
    {
        SqlCommand cmd = new SqlCommand("Select StudentId,FirstName,LastName,DOB,Email,PhoneNo,CourseDetail,Branch,RRank from StudentRecord where StudentId=@studentId", con);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@StudentId", SelectedValue);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        StudentGrid.DataSource = dt;
        StudentGrid.DataBind();
    }
}
