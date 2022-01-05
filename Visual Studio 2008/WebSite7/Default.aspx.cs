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

    protected void UploadButton_Click(object sender, EventArgs e)
    {
        if (FileUploadControl.HasFile)
        {
            FileUploadControl.SaveAs(@"C:\Documents and Settings\Rishabh\My Documents\My Pictures" + FileUploadControl.FileName);
            StatusLabel.Text = "File Uploaded: " + FileUploadControl.FileName;
        }
        else
        {
            StatusLabel.Text = "No File Uploaded.";
        }
    }
}