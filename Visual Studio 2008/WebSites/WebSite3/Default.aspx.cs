using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        BindGrid();
        
    }
    protected void btn1_Click(object sender, EventArgs e)
    {
        Stream InputStream;
        int len = Fupload.PostedFile.ContentLength;
        InputStream=Fupload.PostedFile.InputStream;
        byte[] ImageSize = new byte[len];
        InputStream.Read(ImageSize,0,len);
        SqlCommand cmd = new SqlCommand("usp_Image_insert", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Fname", txtFname.Text);
        cmd.Parameters.AddWithValue("@Lname", txtLname.Text);
        cmd.Parameters.AddWithValue("@Image", ImageSize);
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        Grid.DataSource = dt;
        Grid.DataBind();
        BindGrid();
    }
    private void BindGrid()
    {
        SqlCommand cmd = new SqlCommand("usp_Image_Select", con);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        Grid.DataSource = dt;
        Grid.DataBind();
    }
}
