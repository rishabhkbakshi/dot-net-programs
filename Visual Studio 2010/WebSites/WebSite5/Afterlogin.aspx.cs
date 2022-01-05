using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindBranchDropDown();
        }
        if (Session["UserName"] != null)
        {
            lblWelcome.Text = "Welcome" + "  " + Session["UserName"].ToString();
        }
        else
        {
            Response.Redirect("Session.aspx");
        }
    }
    protected void btnLogOut_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Clear();
        Response.Redirect("Login.aspx");
    }
    private void BindBranchDropDown()
    {
        SqlCommand cmd = new SqlCommand("usp_BranchSelect", con);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        DrpListBranch.DataTextField = "Branch";
        DrpListBranch.DataValueField = "BranchId";
        DrpListBranch.DataSource = dt;
        DrpListBranch.DataBind();
        DrpListBranch.Items.Insert(0, new ListItem("--Select--"));
    }
    private void InsertRecord()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("usp_InsertStudent", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Firstname", txtFirstName.Text);
        cmd.Parameters.AddWithValue("@Lastname", txtLastName.Text);
        cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
        cmd.Parameters.AddWithValue("@DOB", txtDate.Text);
        cmd.Parameters.AddWithValue("@PhoneNo", txtPhone.Text);
        cmd.Parameters.AddWithValue("@CourseDetail", radiolstDegree.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@Branch", radiolstDegree.SelectedValue == "1" ? DrpListBranch.SelectedItem.Text : "");
        cmd.Parameters.AddWithValue("@RRank", txtRR.Text);
        cmd.ExecuteNonQuery();
        con.Close();
        lblUserResponse.Text = "Insert sucessfully";
    }
    protected void Submit(object sender, EventArgs e)
    {
        InsertRecord();
    }
    protected void Clear(object sender, EventArgs e)
    {
        txtFirstName.Text = string.Empty;
        txtLastName.Text = string.Empty;
        txtEmail.Text = string.Empty;
        txtPhone.Text = string.Empty;
        txtDate.Text = string.Empty;
        txtRR.Text = string.Empty;
        radiolstDegree.ClearSelection();
        DrpListBranch.ClearSelection();
        DrpListBranch.Visible = false;
    }
    protected void RB_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (radiolstDegree.SelectedValue == "1")
        {
            DrpListBranch.Visible = true;
        }
        else
        {
            DrpListBranch.Visible = false;
        }
    }
}