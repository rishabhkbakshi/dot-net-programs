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
        BindGrid();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        long Id = 0;
        if (ViewState["ID"] != null)
        {
            Id = Convert.ToInt64(ViewState["ID"]);
            ViewState["ID"] = null;
            updateRow(Id);
        }
        else
        {
            InsertToGrid();
        }
    }

    private void InsertToGrid()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("usp_Insert", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Name", txtname.Text);
        cmd.Parameters.AddWithValue("@Lname", txtLname.Text);
        cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
        cmd.Parameters.AddWithValue("@Rank", txtRank.Text);
        cmd.Parameters.AddWithValue("@Branch", drop.SelectedItem.Text);
        cmd.ExecuteNonQuery();
        con.Close();
        BindGrid();
    }

    private void BindGrid()
    {
        con.Open();
        SqlCommand cmd= new SqlCommand("usp_Select",con);
        Grid.DataSource = cmd.ExecuteReader();
        Grid.DataBind();
        con.Close();
    }

    protected void Grid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        long Id = Convert.ToInt64(Grid.DataKeys[e.RowIndex].Value);
        deleteRow(Id);
    }

    private void deleteRow(long Id)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("usp_Delete", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Id", Id);
        cmd.ExecuteNonQuery();
        con.Close();
        BindGrid();
    }

    protected void Grid_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        ViewState["ID"] = Grid.DataKeys[e.RowIndex].Value;
        txtname.Text = Grid.Rows[e.RowIndex].Cells[1].Text;
        txtLname.Text = Grid.Rows[e.RowIndex].Cells[2].Text;
        txtPhone.Text = Grid.Rows[e.RowIndex].Cells[3].Text;
        txtRank.Text = Grid.Rows[e.RowIndex].Cells[4].Text;
        ListItem lstitmDrop = drop.Items.FindByText(Grid.Rows[e.RowIndex].Cells[5].Text);
        if (lstitmDrop != null)
        {
            drop.ClearSelection();
            lstitmDrop.Selected = true;
        }
    }

    private void updateRow(long Id)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("usp_Update", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Id", Id);
        cmd.Parameters.AddWithValue("@Name", txtname.Text);
        cmd.Parameters.AddWithValue("@Lname", txtLname.Text);
        cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
        cmd.Parameters.AddWithValue("@Rank", txtRank.Text);
        cmd.Parameters.AddWithValue("@Branch", drop.SelectedItem.Text);
        cmd.ExecuteNonQuery();
        con.Close();
        BindGrid();
    }
}
