using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;


public partial class _Default : System.Web.UI.Page 
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        BindGrid();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string filename = Path.GetFileName(FUpload.PostedFile.FileName);
        FUpload.SaveAs(MapPath("Image/" + filename));
        SqlCommand cmd = new SqlCommand("usp_ImageInsert", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Imagename", filename);
        cmd.Parameters.AddWithValue("@Image", "Image/" + filename);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        BindGrid();
    }
    private void BindGrid()
    {
        SqlCommand cmd = new SqlCommand("usp_ImageSelect", con);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        Grid.DataSource = dt;
        Grid.DataBind();
    }
}
