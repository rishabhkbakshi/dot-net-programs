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

public partial class ApproveByHR : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Designation"] != null)
        {
            lblResponseType.Text = "Welcome" + " " + Session["Designation"].ToString();
            BindHRGrid();
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void lnkbtnLogOut_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Clear();
        Response.Redirect("Login.aspx");
    }

    private void BindHRGrid()
    {
        SqlCommand cmd = new SqlCommand("usp_PendingWithHR", con);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        LeaveHRGrid.DataSource = dt;
        LeaveHRGrid.DataBind();
    }

    protected void btnHRApprove_Click(object sender, EventArgs e)
    {
        Button ApproveManager = sender as Button;
        GridViewRow gvrow = (GridViewRow)ApproveManager.NamingContainer;
        con.Open();
        int RequestId = Convert.ToInt32(LeaveHRGrid.DataKeys[gvrow.RowIndex].Value);
        SqlCommand cmd = new SqlCommand("ApproveHRRequestSelect", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Id", RequestId);
        cmd.ExecuteNonQuery();
        lblHRRequestId.Text = "Request Id->  " + "<u>" + "<b>" +
                              "<font size=4>" + RequestId + "</font>" +
                              "</b>" + "</u>" + "  is Completed";
        con.Close();
        BindHRGrid();
    }
}