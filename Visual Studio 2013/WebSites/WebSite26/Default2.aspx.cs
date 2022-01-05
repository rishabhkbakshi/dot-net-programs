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
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Textbox1.Text))
        {
            int EnteredIntValue = 0;
            bool IsIntOrNot = false;
            IsIntOrNot = int.TryParse(Textbox1.Text, out EnteredIntValue);
            if (IsIntOrNot)
            {
                Label1.Text = "Yes, You Entered " + EnteredIntValue.ToString() + " is an Integer";
                Label2.Text = string.Empty;
            }
            else
            {
                Label2.Text = "No, You Entered " + Textbox1.Text + " is Not an Integer";
                Label1.Text = string.Empty;
            }
        }
        else
        {
            Label2.Text = "Please Enter Something in textbox";
            Label1.Text = string.Empty;
        }
    }
}