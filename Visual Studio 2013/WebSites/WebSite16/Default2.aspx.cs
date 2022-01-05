using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        System.Threading.Thread.Sleep(5000);
    }

    protected void btnConfirm_Click(object sender, EventArgs e)
    {
        lblMessage.Text = "You clicked the <b>OK</b> button of AJAX confirm";
    }
    private void Check()
    {
        foreach (ListItem li in chklist.Items)
        {
            if (chkColor.Checked == true)
            {
                li.Selected = true;
            }
            else
            {
                li.Selected = false;
            }
        }
    }
    protected void chkColor_CheckedChanged(object sender, EventArgs e)
    {
        Check();
    }
    protected void chklist_SelectedIndexChanged(object sender, EventArgs e)
    {
        int sum = 0;
        foreach (ListItem li in chklist.Items)
        {
            sum = sum + Convert.ToInt32(li.Selected);
        }
        if (chklist.Items.Count == sum)
        {
            chkColor.Checked = true;
        }
        else
        {
            chkColor.Checked = false;
        }
    }
}