using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        btnfirst.Enabled = true; ;
        btnprevious.Enabled = true;
        if (!IsPostBack)
        {
            binddata();
        }
    }

    public void binddata()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("usp_PagingSelect", con);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView2.DataSource = ds;
        GridView2.DataBind();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("usp_PagingInsert", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Name", txtName.Text);
        cmd.Parameters.AddWithValue("@City", txtcity.Text);
        cmd.ExecuteNonQuery();
        con.Close();
        lblResponse.Text = "Insert Sucessfully";
        binddata();
    }

    protected void btnselect_Click(object sender, EventArgs e)
    {
        if (txtselect.Text == "")
        {
            lblResponse.Text = "Enter The No.";
        }
        else
        {
            int num = Convert.ToInt32(txtselect.Text);
            con.Open();
            SqlCommand cmd = new SqlCommand("usp_PagingSelectId", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id", txtselect.Text);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            if (GridView1.Rows.Count == num)
            {
                GridView1.DataSource = "";
                GridView1.DataBind();
            }
            else
            {
                lblResponse.Text = "Row Id is not Found";
            }
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }

    protected void btnfirst_Click(object sender, EventArgs e)
    {
        GridView2.PageIndex = 0;
        btnprevious.Enabled = false;
        btnfirst.Enabled = false;
        btnnext.Enabled = true;
        btnlast.Enabled = true;
        binddata();
    }

    protected void btnlast_Click(object sender, EventArgs e)
    {
        GridView2.PageIndex = GridView2.PageCount;
        btnlast.Enabled = false;
        btnprevious.Enabled = true;
        btnnext.Enabled = false;
        binddata();
    }

    protected void btnnext_Click(object sender, EventArgs e)
    {
        int i = GridView2.PageIndex + 1;
        if (i <= GridView2.PageCount)
        {
            GridView2.PageIndex = i;
            btnfirst.Enabled = true;
            btnlast.Enabled = true;
            btnprevious.Enabled = true;
        }
        if (GridView2.PageCount - 1 == GridView2.PageIndex)
        {
            btnnext.Enabled = false;
            btnlast.Enabled = false;
        }
        binddata();
    }

    protected void btnprevious_Click(object sender, EventArgs e)
    {
        int i = GridView2.PageCount;
        if (GridView2.PageIndex > 0)
        {
            GridView2.PageIndex = GridView2.PageIndex - 1;
            btnlast.Enabled = true;
        }
        if (GridView2.PageIndex == 0)
        {
            btnfirst.Enabled = false;
        }
        if (GridView2.PageCount - 1 == GridView2.PageIndex + 1)
        {
            btnnext.Enabled = true;
        }
        if (GridView2.PageIndex == 0)
        {
            btnprevious.Enabled = false;
        }
        binddata();
    }

    protected void Gridview2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView2.PageIndex = e.NewPageIndex;
        binddata();
    }
}