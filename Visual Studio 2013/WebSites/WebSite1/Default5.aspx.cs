using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class Default5 : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["constr"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
            BindData1();
            gvbind();
        }
    }

    /// <summary>
    /// DataGrid RowEditing
    /// </summary>
    public void BindData()
    {
        SqlCommand cmd = new SqlCommand("Select * from DataGridEmp", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        Grid.DataSource = dt;
        Grid.DataBind();
    }
    protected void Grid_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        Grid.CurrentPageIndex = e.NewPageIndex;
        BindData();
        BindData1();
    }
    protected void Grid_EditCommand(object source, DataGridCommandEventArgs e)
    {
        Grid.EditItemIndex = e.Item.ItemIndex;
        BindData();
        BindData1();
    }
    protected void Grid_CancelCommand(object source, DataGridCommandEventArgs e)
    {
        Grid.EditItemIndex = -1;
        BindData();
        BindData1();
    }
    protected void Grid_DeleteCommand(object source, DataGridCommandEventArgs e)
    {
        Int64 EmpId = (Int64)(Grid.DataKeys[e.Item.ItemIndex]);
        SqlCommand cmd = new SqlCommand("Delete from DataGridEmp where EmpId=" + EmpId, con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        Grid.EditItemIndex = -1;
        BindData();
        BindData1();
    }
    protected void Grid_UpdateCommand(object source, DataGridCommandEventArgs e)
    {
        con.Open();
        Int64 EmpId = (Int64)(Grid.DataKeys[e.Item.ItemIndex]);
        SqlCommand cmd = new SqlCommand("Update DataGridEmp set F_Name=@F_Name,L_Name=@L_Name,City=@City,EmailId=@EmailId,EmpJoining=@EmpJoining where EmpId=@EmpId", con);
        cmd.Parameters.Add("@EmpId", SqlDbType.VarChar).Value = EmpId;
        cmd.Parameters.Add("@F_Name", SqlDbType.VarChar).Value = ((TextBox)e.Item.Cells[1].Controls[0]).Text;
        cmd.Parameters.Add("@L_Name", SqlDbType.VarChar).Value = ((TextBox)e.Item.Cells[2].Controls[0]).Text;
        cmd.Parameters.Add("@City", SqlDbType.VarChar).Value = ((TextBox)e.Item.Cells[3].Controls[0]).Text;
        cmd.Parameters.Add("@EmailId", SqlDbType.VarChar).Value = ((TextBox)e.Item.Cells[4].Controls[0]).Text;
        cmd.Parameters.Add("@EmpJoining", SqlDbType.DateTime).Value = DateTime.Now.ToString();
        cmd.ExecuteNonQuery();
        Grid.EditItemIndex = -1;
        BindData();
        BindData1();
        con.Close();
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("Insert into DataGridEmp (F_Name,L_Name,City,EmailId,EmpJoining) values('" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "')", con);
        cmd.ExecuteNonQuery();
        con.Close();
        BindData();
        BindData1();
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default5.aspx", false);
    }
    protected void btnOk_Click(object sender, EventArgs e)
    {
        BindData();
        BindData1();
    }
    public void BindData1()
    {
        SqlCommand cmd = new SqlCommand("Select * from DataGridEmp", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        Grid1.DataSource = dt;
        Grid1.DataBind();
    }


    /// <summary>
    /// Gridview Row Editing
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        gvbind();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        gvbind();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label lbldeleteid = (Label)row.FindControl("EmpId");
        con.Open();
        SqlCommand cmd = new SqlCommand("delete FROM DataGridEmp where EmpId='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        gvbind();
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        gvbind();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int EmpId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label lblID = (Label)row.FindControl("EmpId");
        TextBox textFName = (TextBox)row.Cells[1].Controls[0];
        TextBox textLName = (TextBox)row.Cells[2].Controls[0];
        TextBox textCity = (TextBox)row.Cells[3].Controls[0];
        TextBox textEmail = (TextBox)row.Cells[4].Controls[0];
        TextBox textEmpJoin = (TextBox)row.Cells[5].Controls[0];
        GridView1.EditIndex = -1;
        con.Open();
        SqlCommand cmd = new SqlCommand("Update DataGridEmp set F_Name=@F_Name,L_Name=@L_Name,City=@City,EmailId=@EmailId,EmpJoining=@EmpJoining where EmpId=@EmpId", con);
        cmd.Parameters.AddWithValue("@EmpId", EmpId);
        cmd.Parameters.AddWithValue("@F_Name", textFName.Text);
        cmd.Parameters.AddWithValue("@L_Name", textLName.Text);
        cmd.Parameters.AddWithValue("@City", textCity.Text);
        cmd.Parameters.AddWithValue("@EmailId", textEmail.Text);
        cmd.Parameters.AddWithValue("@EmpJoining", textEmpJoin.Text);
        cmd.ExecuteNonQuery();
        con.Close();
        gvbind();
    }
    protected void gvbind()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("Select * from DataGridEmp", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        con.Close();
        if (ds.Tables[0].Rows.Count > 0)
        {
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        else
        {
            ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
            GridView1.DataSource = ds;
            GridView1.DataBind();
            int columncount = GridView1.Rows[0].Cells.Count;
            GridView1.Rows[0].Cells.Clear();
            GridView1.Rows[0].Cells.Add(new TableCell());
            GridView1.Rows[0].Cells[0].ColumnSpan = columncount;
            GridView1.Rows[0].Cells[0].Text = "No Records Found";
        }

    }
}