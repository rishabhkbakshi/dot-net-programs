using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

public partial class Default4 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (txt.Text == "")
        {
            args.IsValid = false;
            txt.BackColor = Color.Blue;
        }
        else
        {
            args.IsValid = true;
            txt.BackColor = Color.White;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
}