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
            FirstGridViewRow();
        }
    }

    private void FirstGridViewRow()
    {
        DataTable dtEmployee = new DataTable();
        DataColumn dcEmployee = new DataColumn();
        dcEmployee = new DataColumn("RowNumber", typeof(string));
        dtEmployee.Columns.Add(dcEmployee);
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
        drEmployee["RowNumber"] = 1;
        drEmployee["EmployeeCode"] = string.Empty;
        drEmployee["EmployeeName"] = string.Empty;
        drEmployee["PhoneNo"] = string.Empty;
        drEmployee["Email"] = string.Empty;
        drEmployee["DateOfBirth"] = string.Empty;
        dtEmployee.Rows.Add(drEmployee);
        ViewState["CurrentTable"] = dtEmployee;
        grvEmployeeDetails.DataSource = dtEmployee;
        grvEmployeeDetails.DataBind();
    }

    protected void bt1_Click(object sender, EventArgs e)
    {
        AddNewRow();
    }

    private void AddNewRow()
    {
        int rowIndex = 0;

        if (ViewState["CurrentTable"] != null)
        {
            DataTable dtEmployee = (DataTable)ViewState["CurrentTable"];
            DataRow drEmployee = dtEmployee.NewRow();
            if (dtEmployee.Rows.Count > 0)
            {
                for (int i = 1; i <= dtEmployee.Rows.Count; i++)
                {
                    TextBox TextBoxCode = grvEmployeeDetails.Rows[rowIndex].Cells[1].FindControl("txt_Code") as TextBox;
                    TextBox TextBoxName = grvEmployeeDetails.Rows[rowIndex].Cells[2].FindControl("txt_Name") as TextBox;
                    TextBox TextBoxPhone = grvEmployeeDetails.Rows[rowIndex].Cells[3].FindControl("txt_Phone") as TextBox;
                    TextBox TextBoxEmail = grvEmployeeDetails.Rows[rowIndex].Cells[4].FindControl("txt_Email") as TextBox;
                    TextBox TextBoxDOB = grvEmployeeDetails.Rows[rowIndex].Cells[5].FindControl("txt_DOB") as TextBox;
                    drEmployee = dtEmployee.NewRow();
                    drEmployee["RowNumber"] = i + 1;
                    dtEmployee.Rows[i - 1]["EmployeeCode"] = TextBoxCode.Text;
                    dtEmployee.Rows[i - 1]["EmployeeName"] = TextBoxName.Text;
                    dtEmployee.Rows[i - 1]["PhoneNo"] = TextBoxPhone.Text;
                    dtEmployee.Rows[i - 1]["Email"] = TextBoxEmail.Text;
                    dtEmployee.Rows[i - 1]["DateOfBirth"] = TextBoxDOB.Text;
                    rowIndex++;
                }
                dtEmployee.Rows.Add(drEmployee);
                ViewState["CurrentTable"] = dtEmployee;
                grvEmployeeDetails.DataSource = dtEmployee;
                grvEmployeeDetails.DataBind();
            }
        }
        else
        {
            Response.Write("ViewState is null");
        }
        SetPreviousData();
    }


    private void SetPreviousData()
    {
        int rowIndex = 0;
        if (ViewState["CurrentTable"] != null)
        {
            DataTable dtEmployee = (DataTable)ViewState["CurrentTable"];
            if (dtEmployee.Rows.Count > 0)
            {
                for (int i = 0; i < dtEmployee.Rows.Count; i++)
                {
                    TextBox TextBoxCode = grvEmployeeDetails.Rows[rowIndex].Cells[1].FindControl("txt_Code") as TextBox;
                    TextBox TextBoxName = grvEmployeeDetails.Rows[rowIndex].Cells[2].FindControl("txt_Name") as TextBox;
                    TextBox TextBoxPhone = grvEmployeeDetails.Rows[rowIndex].Cells[3].FindControl("txt_Phone") as TextBox;
                    TextBox TextBoxEmail = grvEmployeeDetails.Rows[rowIndex].Cells[4].FindControl("txt_Email") as TextBox;
                    TextBox TextBoxDOB = grvEmployeeDetails.Rows[rowIndex].Cells[5].FindControl("txt_DOB") as TextBox;
                    TextBoxCode.Text = dtEmployee.Rows[i]["EmployeeCode"].ToString();
                    TextBoxName.Text = dtEmployee.Rows[i]["EmployeeName"].ToString();
                    TextBoxPhone.Text = dtEmployee.Rows[i]["PhoneNo"].ToString();
                    TextBoxEmail.Text = dtEmployee.Rows[i]["Email"].ToString();
                    TextBoxDOB.Text = dtEmployee.Rows[i]["DateOfBirth"].ToString();
                    rowIndex++;
                }
            }
        }
    }

    protected void grvStudentDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        SetRowData();
        if (ViewState["CurrentTable"] != null)
        {
            DataTable dtEmployee = (DataTable)ViewState["CurrentTable"];
            DataRow drEmployee = dtEmployee.NewRow(); ;
            int rowIndex = Convert.ToInt32(e.RowIndex);
            if (dtEmployee.Rows.Count > 1)
            {
                dtEmployee.Rows.Remove(dtEmployee.Rows[rowIndex]);
                drEmployee = dtEmployee.NewRow();
                ViewState["CurrentTable"] = dtEmployee;
                grvEmployeeDetails.DataSource = dtEmployee;
                grvEmployeeDetails.DataBind();
                for (int i = 0; i < grvEmployeeDetails.Rows.Count - 1; i++)
                {
                    grvEmployeeDetails.Rows[i].Cells[0].Text = Convert.ToString(i + 1);
                }
                SetPreviousData();
            }
        }
    }

    private void SetRowData()
    {
        int rowIndex = 0;

        if (ViewState["CurrentTable"] != null)
        {
            DataTable dtEmployee = (DataTable)ViewState["CurrentTable"];
            DataRow drEmployee = dtEmployee.NewRow(); ;
            if (dtEmployee.Rows.Count > 0)
            {
                for (int i = 1; i <= dtEmployee.Rows.Count; i++)
                {
                    TextBox TextBoxCode = grvEmployeeDetails.Rows[rowIndex].Cells[1].FindControl("txt_Code") as TextBox;
                    TextBox TextBoxName = grvEmployeeDetails.Rows[rowIndex].Cells[2].FindControl("txt_Name") as TextBox;
                    TextBox TextBoxPhone = grvEmployeeDetails.Rows[rowIndex].Cells[3].FindControl("txt_Phone") as TextBox;
                    TextBox TextBoxEmail = grvEmployeeDetails.Rows[rowIndex].Cells[4].FindControl("txt_Email") as TextBox;
                    TextBox TextBoxDOB = grvEmployeeDetails.Rows[rowIndex].Cells[5].FindControl("txt_DOB") as TextBox;
                    drEmployee = dtEmployee.NewRow();
                    drEmployee["RowNumber"] = i + 1;
                    dtEmployee.Rows[i - 1]["EmployeeCode"] = TextBoxCode.Text;
                    dtEmployee.Rows[i - 1]["EmployeeName"] = TextBoxName.Text;
                    dtEmployee.Rows[i - 1]["PhoneNo"] = TextBoxPhone.Text;
                    dtEmployee.Rows[i - 1]["Email"] = TextBoxEmail.Text;
                    dtEmployee.Rows[i - 1]["DateOfBirth"] = TextBoxDOB.Text;
                    rowIndex++;
                }

                ViewState["CurrentTable"] = dtEmployee;
                grvEmployeeDetails.DataSource = dtEmployee;
                grvEmployeeDetails.DataBind();
            }
        }
        else
        {
            Response.Write("ViewState is null");
        }
        SetPreviousData();
    }
}
