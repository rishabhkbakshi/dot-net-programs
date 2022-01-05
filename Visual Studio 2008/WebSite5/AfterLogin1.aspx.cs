using System;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;

public partial class Default2 : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Submit"] != null)
        {
            lblWelcome.Text = "Welcome " + Session["Submit"].ToString();
            //BindGrid();
        }
        else
        {
            Response.Redirect("SessionExpire.aspx");
        }
    }

    protected void RB_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (radiolstDegree.SelectedValue == "1")
        {
            DrpListBranch.Visible = true;
            BindDropDownlist();
        }
        else
        {
            DrpListBranch.Visible = false;
        }
    }

    protected void Submit(object sender, EventArgs e)
    {
        InsertData();
    }

    private void InsertData()
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
            lblUserResponse.Text = "Insertion Sucessfully";
            cmd.ExecuteNonQuery();
            con.Close();
            //BindGrid();
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
    }

    protected void btnLogOut_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Clear();
        Response.Redirect("Login1.aspx");
    }
}

