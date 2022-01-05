using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;

public partial class ApplyToLeave : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Designation"] != null)
        {
            lblResponseType.Text = "Welcome" + " " + Session["Designation"].ToString();
            BindLeaveGrid();
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void btnApply_Click(object sender, EventArgs e)
    {
        Apply();
        BindLeaveGrid();
    }

    private void Apply()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("LeaveRequestInsert", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@LeaveFrom", txtFromDate.Text);
        cmd.Parameters.AddWithValue("@LeaveTo", txtToDate.Text);
        cmd.Parameters.AddWithValue("@LeaveType", txtLeaveType.Text);
        cmd.Parameters.AddWithValue("@Reason", txtLeaveReason.Text);
        cmd.Parameters.AddWithValue("@Status", "Pending with Manager");
        cmd.ExecuteNonQuery();
        con.Close();
    }

    private void BindLeaveGrid()
    {
        SqlCommand cmd = new SqlCommand("LeaveRequestSelect", con);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        LeaveGrid.DataSource = dt;
        LeaveGrid.DataBind();
    }

    protected void lnkbtnLogOut_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Clear();
        Response.Redirect("Login.aspx");
    }

    protected void LeaveGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int RequestId = Convert.ToInt32(LeaveGrid.DataKeys[e.RowIndex].Value);
        CancelRequest(RequestId);
        lblCancelRequest.Text = "Request Id-> " + "<u>" + "<b>" + 
                                "<font size=4>" + RequestId + "</font>" + 
                                "</b>" + "</u>" + "  is Completely Cancel";
        BindLeaveGrid();
    }

    private void CancelRequest(int RequestId)
    {
        SqlCommand cmd = new SqlCommand("DeleteLeaveRequest", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Id", RequestId);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        LeaveGrid.DataSource = dt;
        LeaveGrid.DataBind();
    }
}