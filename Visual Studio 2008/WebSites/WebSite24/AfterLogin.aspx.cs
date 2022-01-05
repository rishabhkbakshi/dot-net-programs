using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AfterLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Login"] != null)
        {
            lblWel.Text = "Welcome " + Session["Login"].ToString();
        }
        else
        {
            Response.Redirect("Default.aspx");
        }
    }
    protected void btnLo_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}
