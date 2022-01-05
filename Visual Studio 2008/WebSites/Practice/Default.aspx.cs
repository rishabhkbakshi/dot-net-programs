using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class _Default : System.Web.UI.Page 
{
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
            Databind();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {   
        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        SqlCommand cmd = new SqlCommand("UserDetails_Insert", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@FirstName", SqlDbType.NVarChar).Value = txtFirstName.Text;
        cmd.Parameters.Add("MiddleName", SqlDbType.NVarChar).Value = txtMiddleName.Text;
        cmd.Parameters.Add("LastName", SqlDbType.NVarChar).Value = txtLastName.Text;
        cmd.Parameters.Add("Age", SqlDbType.Float).Value = txtAge.Text;
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    protected void gvUserDetails_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        txtFirstName.Text = gvUserDetails.Rows[e.RowIndex].Cells[0].Text;
        txtMiddleName.Text = gvUserDetails.Rows[e.RowIndex].Cells[1].Text;
        txtLastName.Text = gvUserDetails.Rows[e.RowIndex].Cells[2].Text;
        txtAge.Text = gvUserDetails.Rows[e.RowIndex].Cells[3].Text;     
    }
    protected void Databind()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        SqlCommand cmd = new SqlCommand("UserDetails_select", con);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        gvUserDetails.DataSource = dt;
        gvUserDetails.DataBind();
        Session["UserDetails"] = dt;

    }
    protected void gvUserDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
    }
    protected void gvUserDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvUserDetails.PageIndex = e.NewPageIndex;
        gvUserDetails.DataSource = dt;
        gvUserDetails.DataBind();
    }
    protected void UpdateRow()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        SqlCommand cmd = new SqlCommand("UserDetails_Update", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@FirstName", SqlDbType.NVarChar).Value = txtFirstName.Text;
        cmd.Parameters.Add("@MiddleName", SqlDbType.NVarChar).Value = txtMiddleName.Text;
        cmd.Parameters.Add("@LastName", SqlDbType.NVarChar).Value = txtLastName.Text;
        cmd.Parameters.Add("@Age", SqlDbType.NVarChar).Value = txtAge.Text;
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        UpdateRow();
    }
}
