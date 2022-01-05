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
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //BindGrid();
            Grdview();
        }
    }

    private void Grdview()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Rishabh"].ConnectionString);
        SqlCommand cmd = new SqlCommand("Employeeinfo_SELECT", con);
        con.Open();
        cmd.CommandType = CommandType.StoredProcedure;
        grid_Show.DataSource = cmd.ExecuteReader();
        grid_Show.DataBind();
        con.Close();
    }

    private void BindGrid()
    {
        DataTable dtEmployee = new DataTable();
        DataColumn dcEmployee = new DataColumn();
        dcEmployee = new DataColumn("EmployeeCode", typeof(string));
        dtEmployee.Columns.Add(dcEmployee);
        dcEmployee = new DataColumn("EmployeeName", typeof(string));
        dtEmployee.Columns.Add(dcEmployee);
        dcEmployee = new DataColumn("PhoneNo", typeof(string));
        dtEmployee.Columns.Add(dcEmployee);
        dcEmployee = new DataColumn("Email", typeof(string));
        dtEmployee.Columns.Add(dcEmployee);
        dcEmployee = new DataColumn("DateOfBirth", typeof(string));
        dtEmployee.Columns.Add(dcEmployee);
        DataRow drEmployee = dtEmployee.NewRow();
        drEmployee["EmployeeCode"] = "";
        drEmployee["EmployeeName"] = "";
        drEmployee["PhoneNo"] = "";
        drEmployee["Email"] = "";
        drEmployee["DateOfBirth"] = "";
        dtEmployee.Rows.Add(drEmployee);
        grid_Employee.DataSource = dtEmployee;
        grid_Employee.DataBind();
    }

    protected void Btn_Add_Click(object sender, EventArgs e)
    {
        AddNewRow();
    }

    private void AddNewRow()
    {
        DataTable dtEmployee = new DataTable();
        DataColumn dcEmployee = new DataColumn();
        DataRow drEmployee = dtEmployee.NewRow();
        dcEmployee = new DataColumn("EmployeeCode", typeof(string));
        dtEmployee.Columns.Add(dcEmployee);
        dcEmployee = new DataColumn("EmployeeName", typeof(string));
        dtEmployee.Columns.Add(dcEmployee);
        dcEmployee = new DataColumn("PhoneNo", typeof(string));
        dtEmployee.Columns.Add(dcEmployee);
        dcEmployee = new DataColumn("Email", typeof(string));
        dtEmployee.Columns.Add(dcEmployee);
        dcEmployee = new DataColumn("DateOfBirth", typeof(string));
        dtEmployee.Columns.Add(dcEmployee);
        foreach (GridViewRow gvRow in grid_Employee.Rows)
        {
            drEmployee = dtEmployee.NewRow();
            TextBox txt_Code = gvRow.FindControl("txt_Code") as TextBox;
            TextBox txt_Name = gvRow.FindControl("txt_Name") as TextBox;
            TextBox txt_Phone = gvRow.FindControl("txt_Phone") as TextBox;
            TextBox txt_Email = gvRow.FindControl("txt_Email") as TextBox;
            TextBox txt_DOB = gvRow.FindControl("txt_DOB") as TextBox;
            drEmployee["EmployeeCode"] = txt_Code.Text;
            drEmployee["EmployeeName"] = txt_Name.Text;
            drEmployee["PhoneNo"] = txt_Phone.Text;
            drEmployee["Email"] = txt_Email.Text;
            drEmployee["DateOfBirth"] = txt_DOB.Text;
            dtEmployee.Rows.Add(drEmployee);
        }
        drEmployee = dtEmployee.NewRow();
        drEmployee["EmployeeCode"] = string.Empty;
        drEmployee["EmployeeName"] = string.Empty;
        drEmployee["PhoneNo"] = string.Empty;
        drEmployee["Email"] = string.Empty;
        drEmployee["DateOfBirth"] = string.Empty;
        dtEmployee.Rows.Add(drEmployee);
        grid_Employee.DataSource = dtEmployee;
        grid_Employee.DataBind();
    }

    protected void grid_Employee_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Remove")
        {
            //Delete from gridview
            DataTable dtEmployee = new DataTable();
            DataRow drEmployee = dtEmployee.NewRow();
            DataColumn dcEmployee = new DataColumn();
            dcEmployee = new DataColumn("EmployeeCode", typeof(string));
            dtEmployee.Columns.Add(dcEmployee);
            dcEmployee = new DataColumn("EmployeeName", typeof(string));
            dtEmployee.Columns.Add(dcEmployee);
            dcEmployee = new DataColumn("PhoneNo", typeof(string));
            dtEmployee.Columns.Add(dcEmployee);
            dcEmployee = new DataColumn("Email", typeof(string));
            dtEmployee.Columns.Add(dcEmployee);
            dcEmployee = new DataColumn("DateOfBirth", typeof(string));
            dtEmployee.Columns.Add(dcEmployee);
            GridViewRow gvEmpRow = (e.CommandSource as LinkButton).NamingContainer as GridViewRow;
            int RowIndex = gvEmpRow.RowIndex;
            foreach (GridViewRow gvRow in grid_Employee.Rows)
            {
                drEmployee = dtEmployee.NewRow();
                TextBox txt_Code = gvRow.FindControl("txt_Code") as TextBox;
                TextBox txt_Name = gvRow.FindControl("txt_Name") as TextBox;
                TextBox txt_Phone = gvRow.FindControl("txt_Phone") as TextBox;
                TextBox txt_Email = gvRow.FindControl("txt_Email") as TextBox;
                TextBox txt_DOB = gvRow.FindControl("txt_DOB") as TextBox;
                drEmployee["EmployeeCode"] = txt_Code.Text;
                drEmployee["EmployeeName"] = txt_Name.Text;
                drEmployee["PhoneNo"] = txt_Phone.Text;
                drEmployee["Email"] = txt_Email.Text;
                drEmployee["DateOfBirth"] = txt_DOB.Text;
                dtEmployee.Rows.Add(drEmployee);
            }
            dtEmployee.Rows.RemoveAt(RowIndex);
            grid_Employee.DataSource = dtEmployee;
            grid_Employee.DataBind();
        }
    }

    protected void Btn_Insert_Click(object sender, EventArgs e)
    {
        Insert();
        InsertionAgain();
        Grdview();
    }

    private void Insert()
    {
        try
        {
            DataTable dtEmployee = new DataTable();
            DataRow drEmployee = dtEmployee.NewRow();
            DataColumn dcEmployee = new DataColumn();
            dcEmployee = new DataColumn("EmployeeCode", typeof(string));
            dtEmployee.Columns.Add(dcEmployee);
            dcEmployee = new DataColumn("EmployeeName", typeof(string));
            dtEmployee.Columns.Add(dcEmployee);
            dcEmployee = new DataColumn("PhoneNo", typeof(string));
            dtEmployee.Columns.Add(dcEmployee);
            dcEmployee = new DataColumn("Email", typeof(string));
            dtEmployee.Columns.Add(dcEmployee);
            dcEmployee = new DataColumn("DateOfBirth", typeof(string));
            dtEmployee.Columns.Add(dcEmployee);
            foreach (GridViewRow gvRow in grid_Employee.Rows)
            {
                drEmployee = dtEmployee.NewRow();
                TextBox txt_Code = gvRow.FindControl("txt_Code") as TextBox;
                TextBox txt_Name = gvRow.FindControl("txt_Name") as TextBox;
                TextBox txt_Phone = gvRow.FindControl("txt_Phone") as TextBox;
                TextBox txt_Email = gvRow.FindControl("txt_Email") as TextBox;
                TextBox txt_DOB = gvRow.FindControl("txt_DOB") as TextBox;
                drEmployee["EmployeeCode"] = txt_Code.Text;
                drEmployee["EmployeeName"] = txt_Name.Text;
                drEmployee["PhoneNo"] = txt_Phone.Text;
                drEmployee["Email"] = txt_Email.Text;
                drEmployee["DateOfBirth"] = txt_DOB.Text;
                dtEmployee.Rows.Add(drEmployee);
            }
            grid_Employee.DataSource = dtEmployee;
            grid_Employee.DataBind();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void InsertionAgain()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Rishabh"].ConnectionString);
        con.Open();
        foreach (GridViewRow gvRow in grid_Employee.Rows)
        {
            SqlCommand cmd = new SqlCommand("Employeeinfo_Insert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            TextBox txt_Code = gvRow.FindControl("txt_Code") as TextBox;
            TextBox txt_Name = gvRow.FindControl("txt_Name") as TextBox;
            TextBox txt_Phone = gvRow.FindControl("txt_Phone") as TextBox;
            TextBox txt_Email = gvRow.FindControl("txt_Email") as TextBox;
            TextBox txt_DOB = gvRow.FindControl("txt_DOB") as TextBox;
            cmd.Parameters.AddWithValue("@EmployeeCode", txt_Code.Text);
            cmd.Parameters.AddWithValue("@EmployeeName", txt_Name.Text);
            cmd.Parameters.AddWithValue("@PhoneNo", txt_Phone.Text);
            cmd.Parameters.AddWithValue("@Email", txt_Email.Text);
            cmd.Parameters.AddWithValue("@DOB", Convert.ToDateTime(txt_DOB.Text).ToString("dd.MM.yyyy"));
            cmd.ExecuteNonQuery();
        }
        Response.Write("Sucessfully");
        con.Close();
    }
}
