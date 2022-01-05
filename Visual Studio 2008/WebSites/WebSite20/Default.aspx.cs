using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;


public partial class _Default : System.Web.UI.Page 
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindCountryDrop();
        }
    }
    private void BindCountryDrop()
    {
        SqlCommand cmd = new SqlCommand("usp_Country", con);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        DrpCountry.DataTextField = "Countryname";
        DrpCountry.DataValueField = "CId";
        DrpCountry.DataSource = dt;
        DrpCountry.DataBind();
        DrpCountry.Items.Insert(0, "--Select--");
    }
    private void BindStateDrop()
    {
        SqlCommand cmd = new SqlCommand("usp_State", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@CId", DrpCountry.SelectedValue);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        DrpState.DataTextField = "Statename";
        DrpState.DataValueField = "SId";
        DrpState.DataSource=dt;
        DrpState.DataBind();
        DrpDistrict.DataSource = "";
        DrpDistrict.DataBind();
        DrpState.Items.Insert(0,"--Select--");
    }
    private void BindDistrictDrop()
    {
        SqlCommand cmd = new SqlCommand("usp_District", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@SId", DrpState.SelectedValue);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        DrpDistrict.DataTextField = "Districtname";
        DrpDistrict.DataValueField = "DId";
        DrpDistrict.DataSource = dt;
        DrpDistrict.DataBind();
        DrpDistrict.Items.Insert(0, "--Select--");
    }
    protected void DrpCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindStateDrop();
    }
    protected void DrpState_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindDistrictDrop();
    }
}
