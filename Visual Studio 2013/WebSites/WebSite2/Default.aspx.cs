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
using System.Globalization;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        BindGrid();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        DateTime dob = DateTime.ParseExact(TextBox1.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
        //TextBox1.Text = dob.ToString();
        TimeSpan tm = (DateTime.Now - dob);
        int age = (tm.Days / 365);
        Response.Write(age);

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
        SqlCommand cmd = new SqlCommand("select * from student", con);
        cmd.CommandType = CommandType.Text;
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd); ;
        da.Fill(dt);
        RecordGrid.DataSource = dt;
        RecordGrid.DataBind();
    }

    private void Insert()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("Insert into student values(@Fname,@Lname,@Email,@Branch,@PhoneNo)", con);
        cmd.CommandType = CommandType.Text;
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
        SqlCommand cmd = new SqlCommand("update student set FirstName=@Fname ,Lastname=@Lname,Email=@Email,Branch=@Branch,PhoneNo=@PhoneNo where Id=@Id", con);
        cmd.CommandType = CommandType.Text;
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
        SqlCommand cmd = new SqlCommand("Delete from student where Id=@Id", con);
        cmd.CommandType = CommandType.Text;
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