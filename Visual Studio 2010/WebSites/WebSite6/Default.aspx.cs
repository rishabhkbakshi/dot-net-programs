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
            SqlCommand cmd = new SqlCommand("usp_Stateselect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            DropDownList1.DataSource = dt;
            DropDownList1.DataTextField = "State";
            DropDownList1.DataValueField = "State_Id";
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0,"--Select--");
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("usp_Districtselect", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@State_Id",DropDownList1.SelectedItem.Value);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        DropDownList2.DataSource = dt;
        DropDownList2.DataTextField = "District";
        DropDownList2.DataValueField = "District_Id";
        DropDownList2.DataBind();
        DropDownList3.DataSource = "";
        DropDownList3.DataBind();
        DropDownList2.Items.Insert(0,"--Select--");
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("usp_Villageselect", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@District_Id", DropDownList2.SelectedItem.Value);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        DropDownList3.DataSource = dt;
        DropDownList3.DataTextField = "Village";
        DropDownList3.DataValueField = "Village_Id";
        DropDownList3.DataBind();
        DropDownList3.Items.Insert(0, "--Select--");
    }
}