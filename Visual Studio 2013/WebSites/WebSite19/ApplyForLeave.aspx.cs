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

public partial class _Default : System.Web.UI.Page
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
            Response.Redirect("ApplyLogin.aspx");
        }
    }

    protected void btnApply_Click(object sender, EventArgs e)
    {
        Apply();
        BindLeaveGrid();
    }

    private int Apply()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("usp_LeaveInsert", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@FromDate ", txtFromDate.Text);
        cmd.Parameters.AddWithValue("@ToDate", txtToDate.Text);
        cmd.Parameters.AddWithValue("@LeaveType", txtLeaveType.Text);
        cmd.Parameters.AddWithValue("@LeaveReason", txtLeaveReason.Text);
        cmd.Parameters.AddWithValue("@RequestStatus", "Pending with Manager");
        int LeaveId = Convert.ToInt32(cmd.ExecuteScalar());
        lblCancelRequest.Text = "Your LeaveRequest Id is"+" -> " + 
                                "<b>" + "<u>" + LeaveId + "</u>" + "</b>"
                                +" "+ "and" + " " +"Pending With Manager";
        con.Close();
        return LeaveId;
    }

    private void BindLeaveGrid()
    {
        SqlCommand cmd = new SqlCommand("usp_LeaveSelect", con);
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
        Response.Redirect("ApplyLogin.aspx");
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
        SqlCommand cmd = new SqlCommand("usp_DeleteLeaveRequest", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Id", RequestId);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        LeaveGrid.DataSource = dt;
        LeaveGrid.DataBind();
    }
}