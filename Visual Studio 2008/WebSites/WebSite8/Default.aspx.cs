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
        tb1.Text = "*****";
        tb2.Text = "****";
        tb3.Text = "***";
        tb4.Text = "**";
        tb5.Text = "*";

        if (Chkbox.Checked == true)
        {
            foreach (ListItem li in chklist.Items)
            {
                li.Selected = true;
            }
        }
        else
        {
            foreach (ListItem li in chklist.Items)
            {
                li.Selected = false;
            }
        }
    }

    protected void fun(object sender, EventArgs e)
    {
        if (CBL.SelectedItem.Text == "a")
        {
            DDL.Visible = true;
        }
        else
        {
            DDL.Visible = false;
        }
    }

    protected void chklist_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
}


