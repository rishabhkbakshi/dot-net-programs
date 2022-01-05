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

public partial class _Default : System.Web.UI.Page
{
    int year, month;
    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime tnow = DateTime.Now;
        ArrayList AlYear = new ArrayList();
        int i;
        for (i = 2002; i <= 2010; i++)
            AlYear.Add(i);
        ArrayList AlMonth = new ArrayList();
        for (i = 1; i <= 12; i++)
            AlMonth.Add(i);
        if (!IsPostBack)
        {
            DropDownList1.DataSource = AlYear;
            DropDownList1.DataBind();
            DropDownList1.SelectedValue = tnow.Year.ToString();
            DropDownList2.DataSource = AlMonth;
            DropDownList2.DataBind();
            DropDownList2.SelectedValue = tnow.Month.ToString();
            year = Int32.Parse(DropDownList1.SelectedValue);
            month = Int32.Parse(DropDownList2.SelectedValue);
            BindDays(year, month);
            DropDownList3.SelectedValue = tnow.Day.ToString();
        }
        Label1.Text = "You select date:" + DropDownList1.SelectedValue + "year" + DropDownList2.SelectedValue + "month" + DropDownList3.SelectedValue;
    }

    //judge leap year
    private bool CheckLeap(int year)
    {
        if ((year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0))
            return true;
        else return false;
    }

    //binding every month day
    private void BindDays(int year, int month)
    {
        int i;
        ArrayList AlDay = new ArrayList();

        switch (month)
        {
            case 1:
            case 2:
                if (CheckLeap(year))
                {
                    for (i = 1; i <= 29; i++)
                        AlDay.Add(i);
                }
                else
                {
                    for (i = 1; i <= 28; i++)
                        AlDay.Add(i);
                }
                break;
            case 3:
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
            case 10:
            case 11:
                for (i = 1; i <= 30; i++)
                    AlDay.Add(i);
                break;
            case 12:
                for (i = 1; i <= 31; i++)
                    AlDay.Add(i);
                break;
        }
        DropDownList3.DataSource = AlDay;
        DropDownList3.DataBind();
    }
    //select year
    public void DropDownList1_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        year = Int32.Parse(DropDownList1.SelectedValue);
        month = Int32.Parse(DropDownList2.SelectedValue);
        BindDays(year, month);
    }
    //select month
    public void DropDownList2_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        year = Int32.Parse(DropDownList1.SelectedValue);
        month = Int32.Parse(DropDownList2.SelectedValue);
        BindDays(year, month);
    }
}
