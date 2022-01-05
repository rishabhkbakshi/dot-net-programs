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

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (txtUser.Text == txtPass.Text)
        {
            lblResponse.Text = "Username & Password are Same";
        }

        else if (txtPass.Text.Length == 3)
        {
            lblResponse.Text = "Week";
        }

        else if (txtPass.Text.Length == 5)
        {
            lblResponse.Text = "Week";
        }

        else if (txtPass.Text.Length == 7)
        {
            if (txtPass.Text.Contains("#@") ||
                 txtPass.Text.Contains("%") || txtPass.Text.Contains("^") ||
                txtPass.Text.Contains("*") || txtPass.Text.Contains("$") ||
                 txtPass.Text.Contains("&") || txtPass.Text.Contains(" "))
            {
                lblResponse.Text = "Strong";
            }
            else
            {
                lblResponse.Text = "Week";
            }
        }

        else if (txtPass.Text.Length == 10)
        {
            if (txtPass.Text.Contains("#@") ||
                 txtPass.Text.Contains("%") || txtPass.Text.Contains("^") ||
                txtPass.Text.Contains("*") || txtPass.Text.Contains("$") ||
                 txtPass.Text.Contains("&") || txtPass.Text.Contains(" "))
            {
                lblResponse.Text = "Strong";
            }
            else
            {
                lblResponse.Text = "Week";
            }
        }
        
        else if (txtPass.Text.Length == 12)
        {
            if (txtPass.Text.Contains("#@") ||
                 txtPass.Text.Contains("%") || txtPass.Text.Contains("^") ||
                txtPass.Text.Contains("*") || txtPass.Text.Contains("$") ||
                 txtPass.Text.Contains("&") || txtPass.Text.Contains(" "))
            {
                lblResponse.Text = "Strong";
            }
            else
            {
                lblResponse.Text = "Week";
            }
        }
        //else if (txtPass.Text.Contains("#@") ||
        //         txtPass.Text.Contains("%") || txtPass.Text.Contains("^") ||
        //         txtPass.Text.Contains("*") || txtPass.Text.Contains("$") ||
        //         txtPass.Text.Contains("&") || txtPass.Text.Contains(" "))
        //{
        //    if (txtPass.Text.Length == 9)
        //    {
        //        lblResponse.Text = "Excellent";
        //    }
        //}
        else
        {
            lblResponse.Text = "Enter Valid Password";
        }
    }
}
