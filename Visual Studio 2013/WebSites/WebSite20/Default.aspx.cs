using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnCreate_Click(object sender, EventArgs e)
    {
        string strpath = @"D:\" + txtName.Text;
        //Condition to check if any directory exists with same name
        if (!(Directory.Exists(strpath)))
        {
            Directory.CreateDirectory(strpath);
            lblResult.Text = "Directory Created";
        }
        else
        {
            lblResult.Text = "Already Directory Exists with the same name";
        }
    }
    // Delete direcoty or folder
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        string strpath = @"D:\" + txtdltName.Text;
        if (Directory.Exists(strpath))
        {
            RemoveDirectories(strpath);
        }
        else
        {
            lblResult.Text = "Directory not exists";
        }
    }

    private void RemoveDirectories(string strpath)
    {
        //This condition is used to delete all files from the Directory
        foreach (string file in Directory.GetFiles(strpath))
        {
            File.Delete(file);
        }
        //This condition is used to check all child Directories and delete files
        foreach (string subfolder in Directory.GetDirectories(strpath))
        {
            RemoveDirectories(subfolder);
        }
        Directory.Delete(strpath);
        lblResult.Text = "Directory deleted";
    }
}