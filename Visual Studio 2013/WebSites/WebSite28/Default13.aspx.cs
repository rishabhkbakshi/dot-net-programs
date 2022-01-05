using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Default13 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Server.Transfer("Default11.aspx");
    }
    protected void btnResponse_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default10.aspx");
    }
    protected void btnRedirect_Click(object sender, EventArgs e)
    {
        Response.RedirectPermanent("http://www.dotnetperls.com/redirect");
    }
    protected void btnRead_Click(object sender, EventArgs e)
    {
        StreamReader streamReader = new StreamReader(@"D:\Study\Report\TXT Document\Steps of MINAKSHI Transition.txt");
        string text = streamReader.ReadToEnd();
        streamReader.Close();
        lblShow.Text = text;
    }
}