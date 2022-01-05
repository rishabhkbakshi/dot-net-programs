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
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Rishabh"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGrid();
            if (Session["Submit"] != null)
            {
                lblses.Text = "Welcome " + Session["Submit"].ToString();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

    }

    protected void RB_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RB.SelectedValue == "1")
        {
            DropDownList1.Visible = true;
            BindDropDownlist();
        }
        else
        {
            DropDownList1.Visible = false;
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
        txtEmail.Text = gvStudentDetails.Rows[e.RowIndex].Cells[3].Text;
        txtPhone.Text = gvStudentDetails.Rows[e.RowIndex].Cells[4].Text;
        ListItem lstitmRB = RB.Items.FindByText(gvStudentDetails.Rows[e.RowIndex].Cells[5].Text);
        if (lstitmRB != null)
        {
            RB.ClearSelection();
            lstitmRB.Selected = true;
        }
        txtRR.Text = gvStudentDetails.Rows[e.RowIndex].Cells[7].Text;
        ListItem lstItemDrp = DropDownList1.Items.FindByText(gvStudentDetails.Rows[e.RowIndex].Cells[6].Text);
        if (lstItemDrp != null)
        {
            DropDownList1.ClearSelection();
            lstItemDrp.Selected = true;
        }
    }

    private void InsertData()
    {
        try
        {

            SqlCommand cmd2 = new SqlCommand("usp_Student_Regestration_INSERT", con);
            con.Open();
            cmd2.CommandType = CommandType.StoredProcedure;
            cmd2.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
            cmd2.Parameters.AddWithValue("@LastName", txtLastName.Text);
            cmd2.Parameters.AddWithValue("@Email", txtEmail.Text);
            cmd2.Parameters.AddWithValue("@PhoneNo", txtPhone.Text);
            cmd2.Parameters.AddWithValue("@CourseDetail", RB.SelectedItem.Text);
            cmd2.Parameters.AddWithValue("@Branch", RB.SelectedValue == "1" ? DropDownList1.SelectedItem.Text : "");
            cmd2.Parameters.AddWithValue("@RPETRank", Convert.ToInt32(txtRR.Text));
            int x = cmd2.ExecuteNonQuery();
            if (x > 0)
            {
                Response.Write("<Script language=javascript> alert('Insertion Sucessfully')</Script>");
            }
            else
            {
                Response.Write("<Script language=javascript> alert(' Not Insert.')</Script>");
            }
            con.Close();
            BindGrid();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void UpdateData(long StudentId)
    {
        try
        {
            SqlCommand cmd2 = new SqlCommand("usp_Student_Regestration_UPDATE", con);
            con.Open();
            cmd2.CommandType = CommandType.StoredProcedure;
            cmd2.Parameters.AddWithValue("@Student_ID", StudentId);
            cmd2.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
            cmd2.Parameters.AddWithValue("@LastName", txtLastName.Text);
            cmd2.Parameters.AddWithValue("@Email", txtEmail.Text);
            cmd2.Parameters.AddWithValue("@PhoneNo", txtPhone.Text);
            cmd2.Parameters.AddWithValue("@CourseDetail", RB.SelectedItem.Text);
            cmd2.Parameters.AddWithValue("@Branch", RB.SelectedValue == "1" ? DropDownList1.SelectedItem.Text : "");
            cmd2.Parameters.AddWithValue("@RPETRank", Convert.ToInt32(txtRR.Text));
            int x = cmd2.ExecuteNonQuery();
            if (x > 0)
            {
                Response.Write("<Script language=javascript> alert('Update Sucessfully')</Script>");
            }
            else
            {
                Response.Write("<Script language=javascript> alert('Not Update.')</Script>");
            }
            con.Close();
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
            SqlCommand cmd = new SqlCommand("usp_Student_Regestration_SELECT", con);
            con.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            gvStudentDetails.DataSource = cmd.ExecuteReader();
            gvStudentDetails.DataBind();
            con.Close();
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
            SqlCommand command = new SqlCommand("usp_Branch_SELECT", con);
            con.Open();
            command.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(command);
            da.Fill(dt);
            DropDownList1.DataSource = dt;
            DropDownList1.DataTextField = "Branch";
            DropDownList1.DataValueField = "Branch_ID";
            DropDownList1.DataBind();
            con.Close();

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
            SqlCommand cmd2 = new SqlCommand("usp_Student_Registration_DELETE", con);
            con.Open();
            cmd2.CommandType = CommandType.StoredProcedure;
            cmd2.Parameters.AddWithValue("@Student_Id", StudentId);
            int x = cmd2.ExecuteNonQuery();
            if (x > 0)
            {
                Response.Write("<Script language=javascript> alert('Deletion Sucessfully')</Script>");
            }
            else
            {
                Response.Write("<Script language=javascript> alert('Not Delete')</Script>");
            }
            con.Close();
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

    [System.Web.Services.WebMethod]
    [System.Web.Script.Services.ScriptMethod]
    public static string[] GetFirstNameList(string prefixText)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Rishabh"].ConnectionString);
        SqlCommand cmd = new SqlCommand("Student_Regestration_FirstNameSelect", con);
        con.Open();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@PrefixText", prefixText);
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        con.Close();
        List<string> FirstName = new List<string>();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            FirstName.Add(dt.Rows[i][0].ToString());
        }
        return FirstName.ToArray();
    }

    [System.Web.Services.WebMethod]
    [System.Web.Script.Services.ScriptMethod]
    public static string[] LastNameList(string prefixText)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Rishabh"].ConnectionString);
        SqlCommand cmd = new SqlCommand("Student_Regestration_LastNameSelect", con);
        con.Open();
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
    protected void Clear(object sender, EventArgs e)
    {
        txtFirstName.Text = "";
        txtLastName.Text = "";
        txtPhone.Text = "";
        txtEmail.Text = "";
        txtRR.Text = "";
    }
}





