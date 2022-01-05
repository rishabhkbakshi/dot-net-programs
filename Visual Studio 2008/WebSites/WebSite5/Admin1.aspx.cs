using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Admin"] != null)
        {
            lblWelcome.Text = "Welcome " + Session["Admin"].ToString();
            BindGridRecord();
        }
        else
        {
            Response.Redirect("AdminSessionExpire.aspx");
        }
    }

    protected void btnLogOut_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Clear();
        Response.Redirect("AdminLogin1.aspx");
    }

    protected void Submit(object sender, EventArgs e)
    {
        try
        {
            string ProcName = string.Empty;
            long StudentId = 0;
            if (ViewState["Student_ID"] != null)
            {
                StudentId = Convert.ToInt64(ViewState["Student_ID"]);
                ViewState["Student_ID"] = null;
                UpdateRecord(StudentId);
            }
            else
            {
                InsertRecord();
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void BindGridRecord()
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("usp_SelectStudent", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gvStudentDetails.DataSource = dt;
            gvStudentDetails.DataBind();
            con.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }

    }

    private void BindBranchDropDownlist()
    {
        try
        {
            SqlCommand cmd = new SqlCommand("usp_BranchSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            DrpListBranch.DataSource = dt;
            DrpListBranch.DataTextField = "Branch";
            DrpListBranch.DataValueField = "BranchId";
            DrpListBranch.DataBind();
            DrpListBranch.Items.Insert(0, "--Select--");
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void InsertRecord()
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("usp_InsertStudent", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Firstname", txtFirstName.Text);
            cmd.Parameters.AddWithValue("@Lastname", txtLastName.Text);
            cmd.Parameters.AddWithValue("@DOB", txtDate.Text);
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@PhoneNo", txtPhone.Text);
            cmd.Parameters.AddWithValue("@CourseDetail", radiolstDegree.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Branch", radiolstDegree.SelectedValue == "1" ? DrpListBranch.SelectedItem.Text : "");
            cmd.Parameters.AddWithValue("@RRank", Convert.ToInt32(txtRR.Text));
            lblAdminResponse.Text = "Insertion Sucessfully";
            cmd.ExecuteNonQuery();
            con.Close();
            BindGridRecord();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void UpdateRecord(long StudentId)
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("usp_UpdateStudent", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Student_Id", StudentId);
            cmd.Parameters.AddWithValue("@Firstname", txtFirstName.Text);
            cmd.Parameters.AddWithValue("@Lastname", txtLastName.Text);
            cmd.Parameters.AddWithValue("@DOB", txtDate.Text);
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@PhoneNo", txtPhone.Text);
            cmd.Parameters.AddWithValue("@CourseDetail", radiolstDegree.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Branch", radiolstDegree.SelectedValue == "1" ? DrpListBranch.SelectedItem.Text : "");
            cmd.Parameters.AddWithValue("@RRank", Convert.ToInt32(txtRR.Text));
            lblAdminResponse.Text = "Update Sucessfully";
            cmd.ExecuteNonQuery();
            con.Close();
            BindGridRecord();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void DeleteRecord(long StudentId)
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("usp_DeleteStudent", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Student_Id", StudentId);
            cmd.ExecuteNonQuery();
            con.Close();
            lblAdminResponse.Text = "Deletion Sucessfully";
            BindGridRecord();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected void Clear(object sender, EventArgs e)
    {
        txtFirstName.Text = "";
        txtLastName.Text = "";
        txtDate.Text = "";
        txtPhone.Text = "";
        txtEmail.Text = "";
        txtRR.Text = "";
        radiolstDegree.ClearSelection();
        DrpListBranch.Visible = false;
        DrpListBranch.ClearSelection();
        lblAdminResponse.Text = "";
    }

    protected void RB_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (radiolstDegree.SelectedValue == "1")
        {
            DrpListBranch.Visible = true;
            BindBranchDropDownlist();
        }
        else
        {
            DrpListBranch.Visible = false;
        }
    }

    protected void gvStudentDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        long StudentId = Convert.ToInt64(gvStudentDetails.DataKeys[e.RowIndex].Value);
        DeleteRecord(StudentId);
    }

    protected void gvStudentDetails_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        ViewState["Student_ID"] = gvStudentDetails.DataKeys[e.RowIndex].Value;
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
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
            SqlCommand cmd = new SqlCommand("Student_Regestration_FirstNameSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@PrefixText", prefixText);
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
        catch (Exception ex)
        {
            throw ex;
        }

    }

    [System.Web.Services.WebMethod]
    [System.Web.Script.Services.ScriptMethod]
    public static string[] LastNameList(string prefixText)
    {
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
            SqlCommand cmd = new SqlCommand("Student_Regestration_LastNameSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@PrefixText", prefixText);
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
        catch (Exception ex)
        {
            throw ex;
        }
    }   
}
