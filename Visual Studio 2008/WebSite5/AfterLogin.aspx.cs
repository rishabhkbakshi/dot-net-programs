using System;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Submit"] != null)
        {
            lblWelcome.Text = "Welcome " + Session["Submit"].ToString();
            BindGrid();
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void RB_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (radiolistdegree.SelectedValue == "1")
        {
            drplistBranch.Visible = true;
            BindDropDownlist();
        }
        else
        {
            drplistBranch.Visible = false;
        }
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
                UpdateData(StudentId);
            }
            else
            {
                InsertData();
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected void gvStudentDetails_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        ViewState["Student_ID"] = gvStudentDetails.DataKeys[e.RowIndex].Value;
        txtFirstName.Text = gvStudentDetails.Rows[e.RowIndex].Cells[1].Text;
        txtLastName.Text = gvStudentDetails.Rows[e.RowIndex].Cells[2].Text;
        txtDate.Text = gvStudentDetails.Rows[e.RowIndex].Cells[3].Text;
        txtEmail.Text = gvStudentDetails.Rows[e.RowIndex].Cells[4].Text;
        txtPhone.Text = gvStudentDetails.Rows[e.RowIndex].Cells[5].Text;
        ListItem lstitmRB = radiolistdegree.Items.FindByText(gvStudentDetails.Rows[e.RowIndex].Cells[6].Text);
        if (lstitmRB != null)
        {
            radiolistdegree.ClearSelection();
            lstitmRB.Selected = true;
        }
        ListItem lstItemDrp = drplistBranch.Items.FindByText(gvStudentDetails.Rows[e.RowIndex].Cells[7].Text);
        if (lstItemDrp != null)
        {
            drplistBranch.ClearSelection();
            lstItemDrp.Selected = true;
        }
        txtRR.Text = gvStudentDetails.Rows[e.RowIndex].Cells[8].Text;
    }

    private void UpdateData(long StudentId)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("usp_UpdateStudent", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Student_Id", StudentId);
            cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
            cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
            cmd.Parameters.AddWithValue("@DOB", txtDate.Text);
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@PhoneNo", txtPhone.Text);
            cmd.Parameters.AddWithValue("@CourseDetail", radiolistdegree.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Branch", radiolistdegree.SelectedValue == "1" ? drplistBranch.SelectedItem.Text : "");
            cmd.Parameters.AddWithValue("@RRank", Convert.ToInt32(txtRR.Text));
            Response.Write("<Script language=javascript> alert('Update Sucessfully')</Script>");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            BindGrid();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void InsertData()
    {
        try
        {
            SqlCommand cmd = new SqlCommand("usp_InsertStudent", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Firstname", txtFirstName.Text);
            cmd.Parameters.AddWithValue("@Lastname", txtLastName.Text);
            cmd.Parameters.AddWithValue("@DOB", txtDate.Text);
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@PhoneNo", txtPhone.Text);
            cmd.Parameters.AddWithValue("@CourseDetail", radiolistdegree.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Branch", radiolistdegree.SelectedValue == "1" ? drplistBranch.SelectedItem.Text : "");
            cmd.Parameters.AddWithValue("@RRank", Convert.ToInt32(txtRR.Text));
            Response.Write("<Script language=javascript> alert('Insertion Sucessfully')</Script>");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            BindGrid();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void BindGrid()
    {
        try
        {
            SqlCommand cmd = new SqlCommand("usp_SelectStudent", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gvStudentDetails.DataSource = dt;
            gvStudentDetails.DataBind();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void BindDropDownlist()
    {
        try
        {
            SqlCommand cmd = new SqlCommand("usp_BranchSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            drplistBranch.DataSource = dt;
            drplistBranch.DataTextField = "Branch";
            drplistBranch.DataValueField = "BranchId";
            drplistBranch.DataBind();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected void gvStudentDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        long StudentId = Convert.ToInt64(gvStudentDetails.DataKeys[e.RowIndex].Value);
        DeleteData(StudentId);
    }

    private void DeleteData(long StudentId)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("usp_DeleteStudent", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Student_Id", StudentId);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            Response.Write("<Script language=javascript> alert('Deletion Sucessfully')</Script>");
            BindGrid();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindGrid();
    }

    protected void time(object sender, EventArgs e)
    {
        label_time.Text = DateTime.Now.ToShortTimeString();
        label_date.Text = DateTime.Now.ToLongDateString();
    }

    protected void Clear(object sender, EventArgs e)
    {
        txtFirstName.Text = "";
        txtLastName.Text = "";
        txtDate.Text = "";
        txtPhone.Text = "";
        txtEmail.Text = "";
        txtRR.Text = "";
        radiolistdegree.ClearSelection();
        drplistBranch.Visible = false;
    }
    protected void btnLogOut_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Clear();
        Response.Redirect("Login.aspx");
    }
}





