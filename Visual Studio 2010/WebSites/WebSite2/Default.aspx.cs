using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        BindGrid();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string ProcName = string.Empty;
        long Id = 0;
        if (ViewState["Grid"] != null)
        {
            Id = Convert.ToInt64(ViewState["Grid"]);
            ViewState["Grid"] = null;
            Update(Id);
        }
        else
        {
            Insert();
        }
    }

    private void BindGrid()
    {
        SqlCommand cmd = new SqlCommand("usp_studentSelect", con);
        cmd.CommandType = CommandType.StoredProcedure;
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd); ;
        da.Fill(dt);
        RecordGrid.DataSource = dt;
        RecordGrid.DataBind();
    }

    private void Insert()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("usp_studentInsert", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Fname", txtFname.Text);
        cmd.Parameters.AddWithValue("@Lname", txtLname.Text);
        cmd.Parameters.AddWithValue("@Email", txtemail.Text);
        cmd.Parameters.AddWithValue("@Branch", txtBranch.Text);
        cmd.Parameters.AddWithValue("@PhoneNo", txtPhone.Text);
        cmd.ExecuteNonQuery();
        con.Close();
        BindGrid();
    }

    private void Update(long Id)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("usp_studentUpdate", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Id", Id);
        cmd.Parameters.AddWithValue("@Fname", txtFname.Text);
        cmd.Parameters.AddWithValue("@Lname", txtLname.Text);
        cmd.Parameters.AddWithValue("@Email", txtemail.Text);
        cmd.Parameters.AddWithValue("@Branch", txtBranch.Text);
        cmd.Parameters.AddWithValue("@PhoneNo", txtPhone.Text);
        cmd.ExecuteNonQuery();
        con.Close();
        BindGrid();
    }

    private void Delete(long Id)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("usp_studentDelete", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Id", Id);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        con.Close();
        BindGrid();
    }

    protected void RecordGrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        ViewState["Grid"] = RecordGrid.DataKeys[e.RowIndex].Value;
        txtFname.Text = RecordGrid.Rows[e.RowIndex].Cells[1].Text;
        txtLname.Text = RecordGrid.Rows[e.RowIndex].Cells[2].Text;
        txtemail.Text = RecordGrid.Rows[e.RowIndex].Cells[3].Text;
        txtBranch.Text = RecordGrid.Rows[e.RowIndex].Cells[4].Text;
        txtPhone.Text = RecordGrid.Rows[e.RowIndex].Cells[5].Text;
    }

    protected void RecordGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        long Id = Convert.ToInt64(RecordGrid.DataKeys[e.RowIndex].Value);
        Delete(Id);
    }
}