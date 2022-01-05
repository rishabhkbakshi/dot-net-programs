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
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnadd_Click(object sender, EventArgs e)
    {
        Insert();
    }
    private void Insert()
    {
        if (ViewState["data"] != null)
        {
            dt = ViewState["data"] as DataTable;
        }
        else
        {
            DataColumn dc = new DataColumn("Id", typeof(string));
            dt.Columns.Add(dc);
            dc = new DataColumn("Name", typeof(string));
            dt.Columns.Add(dc);
            dc = new DataColumn("City", typeof(string));
            dt.Columns.Add(dc);
            dc = new DataColumn("Phone", typeof(string));
            dt.Columns.Add(dc);
            dc = new DataColumn("Email", typeof(string));
            dt.Columns.Add(dc);
            dc = new DataColumn("Age", typeof(string));
            dt.Columns.Add(dc);
            Grid.DataSource = dt;
            Grid.DataBind();
        }
        DataRow dr = dt.NewRow();
        dr["Id"] = txtId.Text;
        dr["Name"] = txtname.Text;
        dr["City"] = txtcity.Text;
        dr["Phone"] = txtphone.Text;
        dr["Email"] = txtemail.Text;
        dr["Age"] = txtage.Text;
        dt.Rows.Add(dr);
        Grid.DataSource = dt;
        ViewState["data"] = dt;
        Grid.DataBind();
    }
    protected void btnclr_Click(object sender, EventArgs e)
    {
        txtId.Text = " ";
        txtname.Text = " ";
        txtcity.Text = " ";
        txtphone.Text = " ";
        txtemail.Text = " ";
        txtage.Text = " ";
    }
    protected void btndel_Click(object sender, EventArgs e)
    {
        if (ViewState["data"] != null)
        {
            dt = ViewState["data"] as DataTable;
            int num = Convert.ToInt32(txtdel.Text);
            if (dt.Rows.Count == num)
            {
                dt.Rows.RemoveAt(num - 1);
                Grid.DataSource = dt;
                Grid.DataBind();
                Response.Write("Deleletion sucessfully");
            }
            else
            {
                Response.Write("No Row Found");
            }
        }
    }
    protected void btnInst_Click(object sender, EventArgs e)
    {
        InsertMulti();
    }
    private void InsertMulti()
    {
        foreach (GridViewRow Grow in Grid.Rows)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("usp_Datatable", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Name", Grow.Cells[1].Text);
            cmd.Parameters.AddWithValue("@City", Grow.Cells[2].Text);
            cmd.Parameters.AddWithValue("@Phone", Grow.Cells[3].Text);
            cmd.Parameters.AddWithValue("@Email", Grow.Cells[4].Text);
            cmd.Parameters.AddWithValue("@Age", Grow.Cells[5].Text);
            cmd.ExecuteNonQuery();
            con.Close();
        }
        Response.Write("Insert Successfully");
    }
}
