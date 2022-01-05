using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=.;User Id=sa;Password=sqlserver2008;Database=Practice");
    SqlCommand cmd;
    SqlDataAdapter da;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGridview();
        }
    }
    // This method is used to bind gridview from database
    protected void BindGridview()
    {
        con.Open();
        cmd = new SqlCommand("select * from PhoneCompanyRwWithNew order by Priority asc", con);
        da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        con.Close();
        gvUserInfo.DataSource = ds;
        gvUserInfo.DataBind();
        GridViewRow FirstRow = gvUserInfo.Rows[0];
        Button btnUp = (Button)FirstRow.FindControl("btnUp");
        btnUp.Enabled = false;
        GridViewRow LastRow = gvUserInfo.Rows[gvUserInfo.Rows.Count - 1];
        Button btnDown = (Button)LastRow.FindControl("btnDown");
        btnDown.Enabled = false;
    }
    protected void gvUserInfo_RowDataCommand(object sender, GridViewCommandEventArgs e)
    {
        int index = 0;
        GridViewRow gvrow;
        GridViewRow previousRow;
        if (e.CommandName == "Up")
        {
            index = Convert.ToInt32(e.CommandArgument);
            gvrow = gvUserInfo.Rows[index];
            previousRow = gvUserInfo.Rows[index - 1];
            int mobilePriority = Convert.ToInt32(gvUserInfo.DataKeys[gvrow.RowIndex].Value.ToString());
            int mobileId = Convert.ToInt32(gvrow.Cells[0].Text);
            int previousId = Convert.ToInt32(previousRow.Cells[0].Text);
            con.Open();
            cmd = new SqlCommand("update PhoneCompanyRwWithNew set Priority='" + (mobilePriority - 1) + "' where MobileId='" + mobileId + "'; update PhoneCompanyRwWithNew set Priority='" + (mobilePriority) + "' where MobileId='" + previousId + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
        }
        if (e.CommandName == "Down")
        {
            index = Convert.ToInt32(e.CommandArgument);
            gvrow = gvUserInfo.Rows[index];
            previousRow = gvUserInfo.Rows[index + 1];
            int mobilePriority = Convert.ToInt32(gvUserInfo.DataKeys[gvrow.RowIndex].Value.ToString());
            int mobileId = Convert.ToInt32(gvrow.Cells[0].Text);
            int previousId = Convert.ToInt32(previousRow.Cells[0].Text);
            con.Open();
            cmd = new SqlCommand("update PhoneCompanyRwWithNew set Priority='" + (mobilePriority + 1) + "' where MobileId='" + mobileId + "'; update PhoneCompanyRwWithNew set Priority='" + (mobilePriority) + "' where MobileId='" + previousId + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
        }
        BindGridview();
    }
    protected void btnUpload_Click(object sender, EventArgs e)
    {

    }
}