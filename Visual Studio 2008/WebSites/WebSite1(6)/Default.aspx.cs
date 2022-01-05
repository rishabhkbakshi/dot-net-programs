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
        BindGrid();
    }
    protected void TravelSubmit(object sender, EventArgs e)
    {
        TravelInsert();
    }
    protected void TravelReset(object sender, EventArgs e)
    {
        txtOrigin.Text = "";
        txtDestination.Text = "";
        txtDate.Text = "";
        drpMode.ClearSelection();
        drpClass.ClearSelection();
        txtLocationAcc.Text = "";
        txtChecKInDate.Text = "";
        txtNoofNight.Text = "";
        txtCity.Text = "";
        drpService.ClearSelection();
        txtCabOrigin.Text = "";
        txtCabDestination.Text = "";
        txtDate.Text = "";
        txtHours.Text = "";
        txtRemark.Text = "";
    }
    private void BindGrid()
    {
        SqlCommand cmd = new SqlCommand("TravelRequest_Select", con);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        TravelGrid.DataSource = dt;
        TravelGrid.DataBind();
    }
    private void TravelInsert()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("TravelRequest_Insert", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@TravelOrigin", txtOrigin.Text);
        cmd.Parameters.AddWithValue("@TravekDestination", txtDestination.Text);
        cmd.Parameters.AddWithValue("@TravelDate", txtDate.Text);
        cmd.Parameters.AddWithValue("@TravelMode", drpMode.SelectedValue);
        cmd.Parameters.AddWithValue("@TravelClass", drpClass.SelectedValue);
        cmd.Parameters.AddWithValue("@AccomodationLocation", txtLocationAcc.Text);
        cmd.Parameters.AddWithValue("@AccomodationDate", txtChecKInDate.Text);
        cmd.Parameters.AddWithValue("@AccomodationNoOfNight", txtNoofNight.Text);
        cmd.Parameters.AddWithValue("@CabCity", txtCity.Text);
        cmd.Parameters.AddWithValue("@CabService", drpService.SelectedValue);
        cmd.Parameters.AddWithValue("@CabOrigin", txtCabOrigin.Text);
        cmd.Parameters.AddWithValue("@CabDestination", txtCabDestination.Text);
        cmd.Parameters.AddWithValue("@CabDate", txtDate.Text);
        cmd.Parameters.AddWithValue("@CabHours", txtHours.Text);
        cmd.Parameters.AddWithValue("@CabRemark", txtRemark.Text);
        cmd.ExecuteNonQuery();
        con.Close();
        BindGrid();
    }
    public void TravelTabNext1(object sender, EventArgs e)
    {
        TabContainer1.ActiveTab = TabContainer1.Tabs[1];
        ViewState["Destination"] = txtDestination.Text;
    }
    public void TravelTabPrev1(object sender, EventArgs e)
    {
        TabContainer1.ActiveTab = TabContainer1.Tabs[0];
    }
    public void TravelTabNext2(object sender, EventArgs e)
    {
        TabContainer1.ActiveTab = TabContainer1.Tabs[2];
    }
    public void TravelTabPrev2(object sender, EventArgs e)
    {
        TabContainer1.ActiveTab = TabContainer1.Tabs[1];
    }
}
