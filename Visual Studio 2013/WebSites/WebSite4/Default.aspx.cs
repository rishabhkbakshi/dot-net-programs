using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        bind();
    }

    private void bind()
    {
        SqlCommand cmd = new SqlCommand("select * from student", con);
        cmd.CommandType = CommandType.Text;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            lblBindID.Text = Convert.ToString(dt.Rows[i]["Id"]);
            lblBindFirstname.Text = Convert.ToString(dt.Rows[i]["Firstname"]);
            lblBindLastname.Text = Convert.ToString(dt.Rows[i]["Lastname"]);
            lblBindEmail.Text = Convert.ToString(dt.Rows[i]["Email"]);
            lblBindBranch.Text = Convert.ToString(dt.Rows[i]["Branch"]);
            lblBindPhone.Text = Convert.ToString(dt.Rows[i]["PhoneNo"]);
        }
    }


    private void Check()
    {
        foreach (ListItem li in chklist.Items)
        {
            if (chkColor.Checked == true)
            {
                li.Selected = true;
            }
            else
            {
                li.Selected = false;
            }
        }
    }
    protected void chkColor_CheckedChanged(object sender, EventArgs e)
    {
        Check();
        if (chkColor.Checked == true)
        {
            rbtn.Checked = true;
        }
        else
        {
            rbtn.Checked = false;
        }
    }

    protected void chklist_SelectedIndexChanged(object sender, EventArgs e)
    {
        int sum=0;
        foreach (ListItem li in chklist.Items)
        {
            sum = sum + Convert.ToInt32(li.Selected);
        }
        if (chklist.Items.Count == sum)
        {
            chkColor.Checked = true;
        }
        else
        {
            chkColor.Checked = false;
        }
    }
}