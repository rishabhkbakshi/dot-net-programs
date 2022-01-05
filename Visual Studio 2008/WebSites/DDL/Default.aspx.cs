using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            SqlCommand cmd = new SqlCommand("Countries1_select", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ddlCountries.DataSource = dt;
            ddlCountries.DataTextField = "Countries";
            ddlCountries.DataValueField = "ID";
            ddlCountries.DataBind();
            ddlCountries.Items.Insert(0, new ListItem("-select-", "0"));
        }
     
    }
    protected void ddlCountries_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            SqlCommand cmd = new SqlCommand("Cities1_select", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CountryID", SqlDbType.Int).Value = ddlCountries.SelectedIndex;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ddlCities.DataSource = dt;
            ddlCities.DataTextField = "Cities";
            ddlCities.DataValueField = "ID";
            ddlCities.DataBind();
        }
        catch (Exception ex)
        {
            throw ex;
        }
      
    }
}
