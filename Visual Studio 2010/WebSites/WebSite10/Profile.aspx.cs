using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Search"] != null)
        {
            lblUser.Text = Session["Search"].ToString();
            ImageGrid();
        }
        else
        {
            Response.Redirect("AfterLogin.aspx");
        }
    }

    protected void lnkbtnProfile_Click(object sender, EventArgs e)
    {
        BindMail();
        UserProfileGrid.Visible = true;
    }

    private void ImageGrid()
    {
        SqlCommand cmd = new SqlCommand("usp_UserProfileImage", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@UserName", Session["Search"]);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        UserImageGrid.DataSource = dt;
        UserImageGrid.DataBind();
    }

    private void BindMail()
    {
        SqlCommand cmd = new SqlCommand("usp_UserProfile", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@UserName", Session["Search"]);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        UserProfileGrid.DataSource = dt;
        UserProfileGrid.DataBind();
    }

    private void AddFriend()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("usp_AddFriend", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@UserName", Session["Search"]);
        cmd.ExecuteNonQuery();
        con.Close();
        lblResponse.Text = "Now you are Friend with " + " " + Session["Email"].ToString();
    }

    protected void btnStatus_Click(object sender, EventArgs e)
    {
        AddFriend();
    }
}