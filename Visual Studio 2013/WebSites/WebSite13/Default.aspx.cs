using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGridData();
        }
    }
    protected void BindGridData()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("usp_ModelPopUpSelect", con);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        gvdetails.DataSource = dt;
        gvdetails.DataBind();
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("usp_ModelPopUpUpdate", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Id", Convert.ToInt32(lblID.Text));
        cmd.Parameters.AddWithValue("@FirstName", txtfname.Text);
        cmd.Parameters.AddWithValue("@LastName", txtlname.Text);
        cmd.Parameters.AddWithValue("@City", txtCity.Text);
        cmd.Parameters.AddWithValue("@Designation", txtDesg.Text);
        cmd.ExecuteNonQuery();
        con.Close();
        lblresult.Text = lblusername.Text + " " + "Details Updated Successfully";
        BindGridData();
    }
    protected void imgbtn_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton btndetails = sender as ImageButton;
        GridViewRow gvrow = (GridViewRow)btndetails.NamingContainer;
        lblID.Text = gvdetails.DataKeys[gvrow.RowIndex].Value.ToString();
        lblusername.Text = gvrow.Cells[3].Text;
        txtfname.Text = gvrow.Cells[4].Text;
        txtlname.Text = gvrow.Cells[5].Text;
        txtCity.Text = gvrow.Cells[6].Text;
        txtDesg.Text = gvrow.Cells[7].Text;
        this.ModalPopupExtender1.Show();
    }
    protected void imgbtnAdd_Click(object sender, ImageClickEventArgs e)
    {
        this.ModalPopupExtender2.Show();
    }
    protected void btnInsert_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("usp_ModelPopUpInsert", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@UserName", txtUserADD.Text);
        cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
        cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
        cmd.Parameters.AddWithValue("@City", txtCityAdd.Text);
        cmd.Parameters.AddWithValue("@Designation", txtDesignation.Text);
        cmd.ExecuteNonQuery();
        con.Close();
        lblresult.Text = "Details Insert Successfully";
        BindGridData();
    }
    protected void imgbtnDelete_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton btndetails = sender as ImageButton;
        GridViewRow gvrow = (GridViewRow)btndetails.NamingContainer;
        lblID.Text = gvdetails.DataKeys[gvrow.RowIndex].Value.ToString();
        con.Open();
        SqlCommand cmd = new SqlCommand("usp_ModelPopUpDelete", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Id", gvdetails.DataKeys[gvrow.RowIndex].Value.ToString());
        cmd.ExecuteNonQuery();
        con.Close();
        lblresult.Text = "Details Delete Successfully";
        BindGridData();
    }
}