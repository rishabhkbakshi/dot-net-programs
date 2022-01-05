using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.IO;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        BindImageGrid();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        InsertImage();
    }

    private void BindImageGrid()
    {
        SqlCommand cmd = new SqlCommand("SelectImage", con);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        ImageGrid.DataSource = dt;
        ImageGrid.DataBind();
    }

    private void InsertImage()
    {
        con.Open();
        Stream InputStream;
        int len = Fupload.PostedFile.ContentLength;
        InputStream = Fupload.PostedFile.InputStream;
        byte[] imageSize = new byte[len];
        InputStream.Read(imageSize, 0, len);
        SqlCommand cmd = new SqlCommand("InsertImage", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Fname", txtFname.Text);
        cmd.Parameters.AddWithValue("@Lname", txtLname.Text);
        cmd.Parameters.AddWithValue("@Image", imageSize);
        cmd.ExecuteNonQuery();
        BindImageGrid();
        con.Close();
    }
}