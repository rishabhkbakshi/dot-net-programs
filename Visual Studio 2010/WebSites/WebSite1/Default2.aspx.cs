using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void cusDate_ServerValidate(object source, ServerValidateEventArgs args)
    {
        DateTime date = DateTime.ParseExact(txtDate.Text, "dd/MMM/yyyy", CultureInfo.InvariantCulture);
        if (DateTime.Now.AddYears(-5) > date)
        {
            args.IsValid = true;
            lblDate.Text = "Eligible";
        }
        else
        {
            args.IsValid = false;
            lblDate.Text = "Not Eligible";
        }
    }
}