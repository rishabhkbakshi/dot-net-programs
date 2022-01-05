using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ImageUpload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Image1.ImageUrl = "~/Image/blank_img.jpeg";

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string filename = "";
        string path;
        if (FileUpload1.HasFile)
        {
            filename = FileUpload1.PostedFile.FileName;
            path = Server.MapPath("~/Image/") + FileUpload1.FileName;
            string onlyname = path.Substring(path.LastIndexOf("\\") + 1);
            Image1.ImageUrl = "~/Image/" + onlyname;

        }
    }
}
