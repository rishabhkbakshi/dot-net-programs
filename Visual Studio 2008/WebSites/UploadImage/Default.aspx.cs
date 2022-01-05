using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class _Default : System.Web.UI.Page 
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        Bindgrid();
    }
    protected void Submit(object sender, EventArgs e)
    {
        con.Open();
        string filename = Path.GetFileName(Fupload.PostedFile.FileName) ;
        Fupload.SaveAs(Server.MapPath("Image/" + filename));
        SqlCommand cmd = new SqlCommand("InsertImage", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Fname", txtName.Text);
        cmd.Parameters.AddWithValue("@Lname", txtLname.Text);
        cmd.Parameters.AddWithValue("@Image", "Image/" + filename);
        cmd.ExecuteNonQuery();
        con.Close();
        Bindgrid();
    }
    private void Bindgrid()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("SelectImage", con);
        cmd.CommandType = CommandType.StoredProcedure;
        Grid.DataSource = cmd.ExecuteReader();
        Grid.DataBind();
        con.Close();
    }
}
