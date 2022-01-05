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
        if (Session["Email"] != null)
        {
            lblWelcome.Text = " WelCome" + " " + Session["Email"].ToString();
            ImageGrid();
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }
    protected void lnkInbox_Click(object sender, EventArgs e)
    {
        BindMail();
        MailGrid.Visible = true;
    }
    protected void lnkCompose_Click(object sender, EventArgs e)
    {
        Response.Redirect("Mail.aspx");
    }

    private void BindMail()
    {
        SqlCommand cmd = new SqlCommand("usp_UserMail", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Email", Session["Email"]);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        MailGrid.DataSource = dt;
        MailGrid.DataBind();
    }

    private void ImageGrid()
    {
        SqlCommand cmd = new SqlCommand("usp_UserImage", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Email", Session["Email"]);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        ProfileGrid.DataSource = dt;
        ProfileGrid.DataBind();
    }

    protected void lnkSignOut_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Response.Redirect("Login.aspx");
    }

    protected void AllDeleteItem(object sender, EventArgs e)
    {
        CheckBox chkMarkAll = (CheckBox)MailGrid.HeaderRow.FindControl("chkMarkAll");
        if (chkMarkAll.Checked == true)
        {
            for (int i = 0; i < MailGrid.Rows.Count; i++)
            {
                CheckBox chkMark = (CheckBox)MailGrid.Rows[i].Cells[4].FindControl("chkMark");
                chkMark.Checked = true;
            }
        }
        else
        {
            for (int i = 0; i < MailGrid.Rows.Count; i++)
            {
                CheckBox chkMark = (CheckBox)MailGrid.Rows[i].Cells[4].FindControl("chkMark");
                chkMark.Checked = false;
            }
        }
    }

    protected void DeleteItem(object sender, EventArgs e)
    {
        CheckBox chkMarkAll = (CheckBox)MailGrid.HeaderRow.Cells[4].FindControl("chkMarkAll");
        for (int i = 0; i < MailGrid.Rows.Count; i++)
        {
            CheckBox chkMark = (CheckBox)MailGrid.Rows[i].Cells[4].FindControl("chkMark");
            if (chkMark.Checked == false)
            {
                chkMarkAll.Checked = false;
                break;
            }
            else
            {
                chkMarkAll.Checked = true;
            }
        }
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        long MailId = 0;
        for (int i = 0; i < MailGrid.Rows.Count; i++)
        {
            CheckBox chkMark = (CheckBox)MailGrid.Rows[i].Cells[4].FindControl("chkMark");
            if (chkMark.Checked)
            {
                MailId = Convert.ToInt64(MailGrid.Rows[i].Cells[0].Text);
                DeleteMail(MailId);
            }
        }
        BindMail();
    }

    private void DeleteMail(long MailId)
    {
        SqlCommand cmd = new SqlCommand("usp_DeleteMail", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Id", MailId);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        MailGrid.DataSource = dt;
        MailGrid.DataBind();
    }

    [System.Web.Services.WebMethod]
    [System.Web.Script.Services.ScriptMethod]
    public static string[] SearchFriend(string prefixText)
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        SqlCommand cmd = new SqlCommand("usp_FindFriend", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@UserName", prefixText);
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        List<string> Name = new List<string>();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            Name.Add(dt.Rows[i][0].ToString());
        }
        return Name.ToArray();
    }

    protected void btnSearch_Click(object sender, ImageClickEventArgs e)
    {
        Session["Search"] = txtSearch.Text;
        Response.Redirect("Profile.aspx");
    }
}