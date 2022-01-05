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

public partial class Default2 : System.Web.UI.Page
{
    Int64 StudentId;
    public Int64 _StudentId
    {
        set
        {
            StudentId = value;
            BindGrid(StudentId);
        }
    }
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        WebUserControl1.SelectedIndexChanged += new EventHandler(User_SelectedIndexChanged);
    }

    public void BindGrid(long SelectedValue)
    {
        SqlCommand cmd = new SqlCommand("Select StudentId,FirstName,LastName,DOB,Email,PhoneNo,CourseDetail,Branch,RRank from StudentRecord where StudentId=@studentId", con);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@studentId", SelectedValue);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        StudentGrid.DataSource = dt;
        StudentGrid.DataBind();
    }

    public void User_SelectedIndexChanged(object sender, EventArgs e)
    {
        //WebUserControl1.Username = ;
        BindGrid(StudentId);
    }
}
