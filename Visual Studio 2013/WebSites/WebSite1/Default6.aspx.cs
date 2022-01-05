using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default6 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            BindEmp();
    }
    public void BindEmp()
    {
        EmployeesDataClassesDataContext dbEmp = new EmployeesDataClassesDataContext();
        var LINQQuery = from emp in dbEmp.Employees
                        select emp;
        dlEmployee.DataSource = LINQQuery;
        dlEmployee.DataBind();
    }

    protected void dlEmployee_EditCommand(object source, DataListCommandEventArgs e)
    {
        dlEmployee.EditItemIndex = e.Item.ItemIndex;
        BindEmp();
    }
    protected void dlEmployee_UpdateCommand(object source, DataListCommandEventArgs e)
    {
        string EmpID = "";
        Label lblTemp = dlEmployee.Items[e.Item.ItemIndex].FindControl("EmpIDLabel1") as Label;
        if (lblTemp != null)
        {
            EmpID = lblTemp.Text;
            EmployeesDataClassesDataContext dbEmp = new EmployeesDataClassesDataContext();
            Employee empTemp = (from emp in dbEmp.Employees
                                where emp.EmployeeID == int.Parse(EmpID)
                                select emp).Single();

            TextBox txtTemp = dlEmployee.Items[e.Item.ItemIndex].FindControl("EmpNameTextBox") as TextBox;
            if (txtTemp != null)
                empTemp.EmployeeName = txtTemp.Text;

            txtTemp = dlEmployee.Items[e.Item.ItemIndex].FindControl("txtDept") as TextBox;
            if (txtTemp != null)
                empTemp.Department = txtTemp.Text;

            txtTemp = dlEmployee.Items[e.Item.ItemIndex].FindControl("txtAddress") as TextBox;
            if (txtTemp != null)
                empTemp.Address = txtTemp.Text;

            txtTemp = dlEmployee.Items[e.Item.ItemIndex].FindControl("txtCity") as TextBox;
            if (txtTemp != null)
                empTemp.City = txtTemp.Text;

            txtTemp = dlEmployee.Items[e.Item.ItemIndex].FindControl("txtState") as TextBox;
            if (txtTemp != null)
                empTemp.State = txtTemp.Text;

            txtTemp = dlEmployee.Items[e.Item.ItemIndex].FindControl("txtCountry") as TextBox;
            if (txtTemp != null)
                empTemp.Country = txtTemp.Text;

            dbEmp.SubmitChanges();
            dlEmployee.EditItemIndex = -1;
            BindEmp();
        }
    }
    protected void dlEmployee_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        EmployeesDataClassesDataContext dbEmp = new EmployeesDataClassesDataContext();
        Label lblTemp = dlEmployee.Items[e.Item.ItemIndex].FindControl("EmpIDLabel") as Label;
        if (lblTemp != null)
        {
            string EmpID = lblTemp.Text;
            Employee empTemp = (from emp in dbEmp.Employees
                                where emp.EmployeeID == int.Parse(EmpID)
                                select emp).Single();
            dbEmp.Employees.DeleteOnSubmit(empTemp);
            dbEmp.SubmitChanges();
            BindEmp();
        }
    }
    protected void dlEmployee_CancelCommand(object source, DataListCommandEventArgs e)
    {
        dlEmployee.EditItemIndex = -1;
        BindEmp();
    }
    protected void dlEmployee_ItemCommand(object source, DataListCommandEventArgs e)
    {
        string CommandName = e.CommandName;
        if (CommandName == "Insert")
        {
            EmployeesDataClassesDataContext dbEmp = new EmployeesDataClassesDataContext();
            Employee empTemp = new Employee();

            TextBox txtTemp = e.Item.FindControl("EmpNameTextBox") as TextBox;
            if (txtTemp != null)
                empTemp.EmployeeName = txtTemp.Text;

            txtTemp = e.Item.FindControl("txtDept") as TextBox;
            if (txtTemp != null)
                empTemp.Department = txtTemp.Text;

            txtTemp = e.Item.FindControl("txtAddress") as TextBox;
            if (txtTemp != null)
                empTemp.Address = txtTemp.Text;

            txtTemp = e.Item.FindControl("txtCity") as TextBox;
            if (txtTemp != null)
                empTemp.City = txtTemp.Text;

            txtTemp = e.Item.FindControl("txtState") as TextBox;
            if (txtTemp != null)
                empTemp.State = txtTemp.Text;

            txtTemp = e.Item.FindControl("txtCountry") as TextBox;
            if (txtTemp != null)
                empTemp.Country = txtTemp.Text;

            dbEmp.Employees.InsertOnSubmit(empTemp);
            dbEmp.SubmitChanges();
            BindEmp();
        }
    }
}