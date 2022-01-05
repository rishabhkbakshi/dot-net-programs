using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class WebUserControl2 : System.Web.UI.UserControl
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);

    //public delegate void SelectedIndexHandler(object sender, EventArgs e);

    public event EventHandler SelectedIndexChanged;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindDrop();
        }
    }

    public void BindDrop()
    {
        SqlCommand cmd = new SqlCommand("select StudentId,FirstName from StudentRecord", con);
        cmd.CommandType = CommandType.Text;
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        DrpStudent.DataSource = dt;
        DrpStudent.DataTextField = "Firstname";
        DrpStudent.DataValueField = "StudentId";
        DrpStudent.DataBind();
        DrpStudent.Items.Insert(0, new ListItem("--Select--"));
    }

    protected void DrpStudent_SelectedIndexChanged(object sender, EventArgs e)
    {
        SelectedIndexChanged(sender, e);
    }
}

//public string Username
//{
//    get { return DrpStudent.SelectedValue; }
//    set { DrpStudent.SelectedValue = value; }
//}}