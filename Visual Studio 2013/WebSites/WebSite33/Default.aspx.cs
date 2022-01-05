using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        btnSubmit.Click += new EventHandler(btnSubmit_Click);

        List<Employee> employeeList = new List<Employee>();
        employeeList.Add(new Employee() { ID = 101, Name = "Devang", Salary = 10000, Experience = 5 });
        employeeList.Add(new Employee() { ID = 101, Name = "Devi", Salary = 20000, Experience = 1 });
        employeeList.Add(new Employee() { ID = 101, Name = "Lal", Salary = 5000, Experience = 0 });
        employeeList.Add(new Employee() { ID = 101, Name = "Singh", Salary = 7000, Experience = 7 });

       // ispromote isPromote = new ispromote(Promote);

        //Employee.PromoteEmployee(employeeList, isPromote);
    }

    //public static bool Promote(Employee emp)
    //{
    //    if (emp.Experience >= 5)
    //    {
    //        return true;
    //    }
    //    else
    //    {
    //        return false;
    //    }l
    //}

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (WebUserControl1.Value == "0")
        {
            Response.Write("Please Select ");
        }
        else
        {
            Response.Write(WebUserControl1.Date + WebUserControl1.Color);
        }
    }
}

delegate bool ispromote(Employee emp);

class Employee
{
    public int ID { get; set; }
    public String Name { get; set; }
    public int Salary { get; set; }
    public int Experience { get; set; }

    public static void PromoteEmployee(List<Employee> empList, ispromote isElegibleToPromote)
    {
        foreach (var Employee in empList)
        {
            if (isElegibleToPromote(Employee))
            {
                Console.WriteLine(Employee.Name + "Experience = " + Employee.Experience);
            }
        }
    }
}