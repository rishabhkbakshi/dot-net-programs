using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page 
{
    protected void lball_Click(object sender, EventArgs e)
    {
        foreach(ListItem li in checkboxlist.Items)
        {
            li.Selected= true;
        }
    }
    protected void lbnone_Click(object sender, EventArgs e)
    {
        foreach(ListItem li in checkboxlist.Items)
        {
            li.Selected= false;
        }
    }
    protected void cusCustom_ServerValidate(object sender, ServerValidateEventArgs e)
    {
        if (e.Value.Length == 8)
        {
            e.IsValid = true;
        }
        else
        {
            e.IsValid = false;
        }
    }
    protected void btnHelloWorld_Click(object sender, EventArgs e)
    {
        lblHelloWorld.Text = "Hello, world - this is a fresh message from ASP.NET AJAX! The time right now is: " + DateTime.Now.ToLongTimeString();
    }

    protected void DropDown1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string[] Cars = { "Maruti", "Ford", "Mahindra" };
        string[] Bikes = { "Honda", "Yamaha", "Suzuki" };
        string[] AeroPlanes = { "Spicejet", "Kingfishar", "Sahara" };
        if (DropDown1.SelectedIndex==1)
        {
            DropDown2.DataSource = Cars;
        }
        else if (DropDown1.SelectedIndex == 2)
        {
            DropDown2.DataSource = Bikes;
        }
        else
        {
            DropDown2.DataSource = AeroPlanes;
        }
        DropDown2.DataBind();
        DropDown2.Visible = true;
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Lbl2.Text = DropDown1.SelectedItem.Text + "->" + DropDown2.SelectedItem.Text;
    }
}
