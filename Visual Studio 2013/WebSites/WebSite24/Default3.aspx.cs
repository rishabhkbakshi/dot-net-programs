using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Default3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnGetFiles_Click(object sender, EventArgs e)
    {
        BindGridview();
    }
    // Bind Data to Gridview
    protected void BindGridview()
    {
        string strpath = @"E:\Images\";
        string[] folders = Directory.GetFiles(strpath, "*", SearchOption.AllDirectories);
        gvDetails.DataSource = folders;
        gvDetails.DataBind();
    }
}