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
            SelectRecord();
        }
        if (Session["Admin"] != null)
        {
            lblWelcome.Text = "Welcome" + "  " + Session["Admin"].ToString();
        }
        else
        {
            Response.Redirect("AdminSession.aspx");
        }
    }
    protected void btnLogOut_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Clear();
        Response.Redirect("AdminLogin.aspx");
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
    protected void Submit(object sender, EventArgs e)
    {
        long Student_Id = 0;
        if (ViewState["Student_Id"] != null)
        {
            Student_Id = Convert.ToInt64(ViewState["Student_Id"]);
            ViewState["Student_Id"] = null;
            UpdateRecord(Student_Id);
        }
        else
        {
            InsertRecord();
        }
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
        lblUserResponse.Text = "";
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
    private void SelectRecord()
    {
        SqlCommand cmd = new SqlCommand("usp_SelectStudent", con);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        gvStudentDetails.DataSource = dt;
        gvStudentDetails.DataBind();
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
        SelectRecord();
    }
    private void UpdateRecord(long Student_Id)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("usp_UpdateStudent", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Student_Id", Student_Id);
        cmd.Parameters.AddWithValue("@Firstname", txtFirstName.Text);
        cmd.Parameters.AddWithValue("@Lastname", txtLastName.Text);
        cmd.Parameters.AddWithValue("@DOB", txtDate.Text);
        cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
        cmd.Parameters.AddWithValue("@PhoneNo", txtPhone.Text);
        cmd.Parameters.AddWithValue("@CourseDetail", radiolstDegree.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@Branch", radiolstDegree.SelectedValue == "1" ? DrpListBranch.SelectedItem.Text : "");
        cmd.Parameters.AddWithValue("@RRank", txtRR.Text);
        cmd.ExecuteNonQuery();
        con.Close();
        lblUserResponse.Text = "Updation Sucessfully";
        SelectRecord();
    }
    private void DeleteRecord(long Student_Id)
    {
        SqlCommand cmd = new SqlCommand("usp_DeleteStudent", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Student_Id", Student_Id);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        lblUserResponse.Text = "Deletion Sucessfully";
        SelectRecord();
    }
    protected void gvStudentDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        long Student_Id = Convert.ToInt64(gvStudentDetails.DataKeys[e.RowIndex].Value);
        DeleteRecord(Student_Id);
    }
    protected void gvStudentDetails_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        ViewState["Student_Id"] = gvStudentDetails.DataKeys[e.RowIndex].Value;
        txtFirstName.Text = gvStudentDetails.Rows[e.RowIndex].Cells[1].Text;
        txtLastName.Text = gvStudentDetails.Rows[e.RowIndex].Cells[2].Text;
        txtDate.Text = gvStudentDetails.Rows[e.RowIndex].Cells[3].Text;
        txtEmail.Text = gvStudentDetails.Rows[e.RowIndex].Cells[4].Text;
        txtPhone.Text = gvStudentDetails.Rows[e.RowIndex].Cells[5].Text;
        ListItem lstitmRB = radiolstDegree.Items.FindByText(gvStudentDetails.Rows[e.RowIndex].Cells[6].Text);
        if (lstitmRB != null)
        {
            radiolstDegree.ClearSelection();
            lstitmRB.Selected = true;
        }
        ListItem lstItemDrp = DrpListBranch.Items.FindByText(gvStudentDetails.Rows[e.RowIndex].Cells[7].Text);
        if (lstItemDrp != null)
        {
            DrpListBranch.ClearSelection();
            lstItemDrp.Selected = true;
        }
        txtRR.Text = gvStudentDetails.Rows[e.RowIndex].Cells[8].Text;
    }

    [System.Web.Services.WebMethod]
    [System.Web.Script.Services.ScriptMethod]
    public static string[] GetFirstNameList(string prefixText)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        SqlCommand cmd = new SqlCommand("usp_GetFirstName", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Firstname", prefixText);
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        List<string> FirstName = new List<string>();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            FirstName.Add(dt.Rows[i][0].ToString());
        }
        return FirstName.ToArray();
    }

    [System.Web.Services.WebMethod]
    [System.Web.Script.Services.ScriptMethod]
    public static string[] GetLastNameList(string prefixText)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        SqlCommand cmd = new SqlCommand("usp_GetLastName", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Lastname", prefixText);
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        List<string> LastName = new List<string>();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            LastName.Add(dt.Rows[i][0].ToString());
        }
        return LastName.ToArray();
    }
}