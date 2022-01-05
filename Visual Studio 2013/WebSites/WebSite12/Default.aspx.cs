using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindUserDetails();
        }
    }
    protected void BindUserDetails()
    {
        SqlCommand cmd = new SqlCommand("usp_studentSelect", con);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        gvDetails.DataSource = dt;
        gvDetails.DataBind();
    }
    protected void btnYes_Click(object sender, ImageClickEventArgs e)
    {
        int userid = Convert.ToInt32(ViewState["UserId"]);
        con.Open();
        SqlCommand cmd = new SqlCommand("usp_studentDelete", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Id", userid);
        cmd.ExecuteNonQuery();
        con.Close();
        lblresult.Text = ViewState["UserName"] + " Details deleted successfully";
        BindUserDetails();
    }
    protected void btnDelete_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton btndetails = sender as ImageButton;
        GridViewRow gvrow = (GridViewRow)btndetails.NamingContainer;
        ViewState["UserId"] = gvDetails.DataKeys[gvrow.RowIndex].Value.ToString();
        ViewState["UserName"] = gvrow.Cells[0].Text;
        lblUser.Text = "Are you sure you want to delete " + ViewState["UserName"] + " Details?";
        ModalPopupExtender1.Show();
    }

}