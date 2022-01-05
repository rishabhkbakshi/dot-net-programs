using System;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //Binddrop();
            //Bindgrid();
            dynamicgrid();
        }
    }

    protected void btn_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Rishabh"].ConnectionString);
            SqlCommand cmd = new SqlCommand("usp_Name_Insert", con);
            con.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Firstname", txtFname.Text);
            cmd.Parameters.AddWithValue("@Lastname", txtLname.Text);
            cmd.Parameters.AddWithValue("@Branch", drop.SelectedItem.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            Bindgrid();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        Response.Write("Sucessfully");
    }

    private void Binddrop()
    {
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Rishabh"].ConnectionString);
            SqlCommand cmd = new SqlCommand("usp_Branch_Select", con);
            con.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            drop.DataSource = dt;
            drop.DataTextField = "Branch";
            drop.DataValueField = "Id";
            drop.DataBind();
            con.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }

    }

    private void Bindgrid()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Rishabh"].ConnectionString);
        SqlCommand cmd = new SqlCommand("usp_Name_Select", con);
        con.Open();
        cmd.CommandType = CommandType.StoredProcedure;
        Grid.DataSource = cmd.ExecuteReader();
        Grid.DataBind();
        con.Close();
    }

    private void dynamicgrid()
    {
        DataTable dt = new DataTable();
        DataColumn dc = new DataColumn();
        dc = new DataColumn("Firstname", typeof(string));
        dt.Columns.Add(dc);
        dc = new DataColumn("Lastname", typeof(string));
        dt.Columns.Add(dc);
        dc = new DataColumn("Branch", typeof(string));
        dt.Columns.Add(dc);
        DataRow dr = dt.NewRow();
        dr["Firstname"] = "";
        dr["Lastname"] = "";
        dr["Branch"] = "";
        dt.Rows.Add(dr);
        Grid2.DataSource = dt;
        Grid2.DataBind();
    }

    protected void btn_add_Click(object sender, EventArgs e)
    {
        addnewrow();
    }

    private void addnewrow()
    {
        DataTable dt = new DataTable();
        DataColumn dc = new DataColumn();
        dc = new DataColumn("Firstname", typeof(string));
        dt.Columns.Add(dc);
        dc = new DataColumn("Lastname", typeof(string));
        dt.Columns.Add(dc);
        dc = new DataColumn("Branch", typeof(string));
        dt.Columns.Add(dc);
        DataRow dr = dt.NewRow();
        foreach (GridViewRow gvrow in Grid2.Rows)
        {
            dr = dt.NewRow();
            TextBox txt_Fname = gvrow.FindControl("txt_Fname") as TextBox;
            TextBox txt_Lname = gvrow.FindControl("txt_Lname") as TextBox;
            DropDownList drop2 = gvrow.FindControl("drop2") as DropDownList;
            dr["Firstname"] = txt_Fname.Text;
            dr["Lastname"] = txt_Lname.Text;
            dr["Branch"] = drop2.SelectedItem.Text;
            dt.Rows.Add(dr);
        }
        dr = dt.NewRow();
        dr["Firstname"] = "";
        dr["Lastname"] = "";
        dr["Branch"] = "";
        dt.Rows.Add(dr);
        Grid2.DataSource = dt;
        Grid2.DataBind();
    }

    protected void btn_sub_Click(object sender, EventArgs e)
    {
        Submit();
        //Insertion();
        //Bindgrid();
    }

    private void Submit()
    {
        DataTable dt = new DataTable();
        DataRow dr = dt.NewRow();
        DataColumn dc = new DataColumn();
        dc = new DataColumn("Firstname", typeof(string));
        dt.Columns.Add(dc);
        dc = new DataColumn("Lastname", typeof(string));
        dt.Columns.Add(dc);
        dc = new DataColumn("Branch", typeof(string));
        dt.Columns.Add(dc);
        foreach (GridViewRow gvrow in Grid2.Rows)
        {
            dr = dt.NewRow();
            TextBox txt_Fname = gvrow.FindControl("txt_Fname") as TextBox;
            TextBox txt_Lname = gvrow.FindControl("txt_Lname") as TextBox;
            DropDownList drop2 = gvrow.FindControl("drop2") as DropDownList;
            dr["Firstname"] = txt_Fname.Text;
            dr["Lastname"] = txt_Lname.Text;
            dr["Branch"] = drop2.SelectedItem.Text;
            dt.Rows.Add(dr);
        }
        Grid2.DataSource = dt;
        Grid2.DataBind();
    }

    private void Insertion()
    {
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Rishabh"].ConnectionString);
            con.Open();
            foreach (GridViewRow gvrow in Grid2.Rows)
            {
                SqlCommand cmd = new SqlCommand("usp_Name_Insert", con);
                cmd.CommandType = CommandType.StoredProcedure;
                TextBox txt_Fname = gvrow.FindControl("txt_Fname") as TextBox;
                TextBox txt_Lname = gvrow.FindControl("txt_Lname") as TextBox;
                DropDownList drop2 = gvrow.FindControl("drop2") as DropDownList;
                cmd.Parameters.AddWithValue("@Firstname", txt_Fname.Text);
                cmd.Parameters.AddWithValue("@Lastname", txt_Lname.Text);
                cmd.Parameters.AddWithValue("@Branch", drop2.SelectedItem.Text);
                cmd.ExecuteNonQuery();
            }
            Response.Write("Sucessfully");
            con.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected void Grid2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Remove")
        {
            DataTable dt = new DataTable();
            DataRow dr = dt.NewRow();
            DataColumn dc = new DataColumn();
            dc = new DataColumn("Firstname", typeof(string));
            dt.Columns.Add(dc);
            dc = new DataColumn("Lastname", typeof(string));
            dt.Columns.Add(dc);
            dc = new DataColumn("Branch", typeof(string));
            dt.Columns.Add(dc);
            GridViewRow gvRow = (e.CommandSource as LinkButton).NamingContainer as GridViewRow;
            int RowIndex = gvRow.RowIndex;
            foreach (GridViewRow gvrow in Grid2.Rows)
            {
                dr = dt.NewRow();
                TextBox txt_Fname = gvrow.FindControl("txt_Fname") as TextBox;
                TextBox txt_Lname = gvrow.FindControl("txt_Lname") as TextBox;
                DropDownList drop2 = gvrow.FindControl("drop2") as DropDownList;
                dr["Firstname"] = txt_Fname.Text;
                dr["Lastname"] = txt_Lname.Text;
                dr["Branch"] = drop2.SelectedItem.Text;
                dt.Rows.Add(dr);
            }
            dt.Rows.RemoveAt(RowIndex);
            Grid2.DataSource = dt;
            Grid2.DataBind();
        }
    }
}
