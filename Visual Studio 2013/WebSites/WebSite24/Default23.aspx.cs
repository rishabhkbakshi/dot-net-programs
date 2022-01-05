using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Default23 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        //Get Filename from fileupload control
        string filename = Path.GetFileName(fileuploadimages.PostedFile.FileName);
        //Save images into Images folder
        fileuploadimages.SaveAs(Server.MapPath("UploadFiles/" + filename));
        //Getting dbconnection from web.config connectionstring
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ToString());
        //Open the database connection
        con.Open();
        //Query to insert images path and name into database
        SqlCommand cmd = new SqlCommand("Insert into ImagesPath(ImageName,ImagePath) values(@ImageName,@ImagePath)", con);
        //Passing parameters to query
        cmd.Parameters.AddWithValue("@ImageName", filename);
        cmd.Parameters.AddWithValue("@ImagePath", "UploadFiles/" + filename);
        cmd.ExecuteNonQuery();
        //Close dbconnection
        con.Close();
        Response.Redirect("~/Default23.aspx");
    }
}