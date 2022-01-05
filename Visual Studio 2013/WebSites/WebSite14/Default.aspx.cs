using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindTravelGrid();
            BindAccomodationGrid();
            BindCabGrid();
        }
    }

    private void BindTravelGrid()
    {
        DataTable dtTravel = new DataTable();
        DataColumn dcTravel = new DataColumn();
        dcTravel = new DataColumn("Origin", typeof(string));
        dtTravel.Columns.Add(dcTravel);
        dcTravel = new DataColumn("Destination", typeof(string));
        dtTravel.Columns.Add(dcTravel);
        dcTravel = new DataColumn("Date", typeof(string));
        dtTravel.Columns.Add(dcTravel);
        dcTravel = new DataColumn("Mode", typeof(string));
        dtTravel.Columns.Add(dcTravel);
        dcTravel = new DataColumn("Class", typeof(string));
        dtTravel.Columns.Add(dcTravel);
        DataRow drTravel = dtTravel.NewRow();
        drTravel["Origin"] = string.Empty;
        drTravel["Destination"] = string.Empty;
        drTravel["Date"] = string.Empty;
        drTravel["Mode"] = string.Empty;
        drTravel["Class"] = string.Empty;
        dtTravel.Rows.Add(drTravel);
        TravelGrid.DataSource = dtTravel;
        TravelGrid.DataBind();
    }

    private void BindAccomodationGrid()
    {
        DataTable dtAccomodation = new DataTable();
        DataColumn dcAccomodation = new DataColumn();
        dcAccomodation = new DataColumn("Location", typeof(string));
        dtAccomodation.Columns.Add(dcAccomodation);
        dcAccomodation = new DataColumn("Check In Date", typeof(string));
        dtAccomodation.Columns.Add(dcAccomodation);
        dcAccomodation = new DataColumn("No. of Night", typeof(string));
        dtAccomodation.Columns.Add(dcAccomodation);
        DataRow drAccomodation = dtAccomodation.NewRow();
        drAccomodation["Location"] = string.Empty;
        drAccomodation["Check In Date"] = string.Empty;
        drAccomodation["No. of Night"] = string.Empty;
        dtAccomodation.Rows.Add(drAccomodation);
        GridAccomodation.DataSource = dtAccomodation;
        GridAccomodation.DataBind();
    }

    private void BindCabGrid()
    {
        DataTable dtCab = new DataTable();
        DataColumn dcCab = new DataColumn();
        dcCab = new DataColumn("City", typeof(string));
        dtCab.Columns.Add(dcCab);
        dcCab = new DataColumn("Service", typeof(string));
        dtCab.Columns.Add(dcCab);
        dcCab = new DataColumn("Origin", typeof(string));
        dtCab.Columns.Add(dcCab);
        dcCab = new DataColumn("Desination", typeof(string));
        dtCab.Columns.Add(dcCab);
        dcCab = new DataColumn("Date", typeof(string));
        dtCab.Columns.Add(dcCab);
        dcCab = new DataColumn("Hours", typeof(string));
        dtCab.Columns.Add(dcCab);
        dcCab = new DataColumn("Remark", typeof(string));
        dtCab.Columns.Add(dcCab);
        DataRow drCab = dtCab.NewRow();
        drCab["City"] = string.Empty;
        drCab["Service"] = string.Empty;
        drCab["Origin"] = string.Empty;
        drCab["Desination"] = string.Empty;
        drCab["Date"] = string.Empty;
        drCab["Hours"] = string.Empty;
        drCab["Remark"] = string.Empty;
        dtCab.Rows.Add(drCab);
        GridCab.DataSource = dtCab;
        GridCab.DataBind();
    }

    protected void TravelAddNew(object sender, EventArgs e)
    {
        TravelAddNewRow();
    }

    private void TravelAddNewRow()
    {
        DataTable dtTravel = new DataTable();
        DataColumn dcTravel = new DataColumn();
        dcTravel = new DataColumn("Origin", typeof(string));
        dtTravel.Columns.Add(dcTravel);
        dcTravel = new DataColumn("Destination", typeof(string));
        dtTravel.Columns.Add(dcTravel);
        dcTravel = new DataColumn("Date", typeof(string));
        dtTravel.Columns.Add(dcTravel);
        dcTravel = new DataColumn("Mode", typeof(string));
        dtTravel.Columns.Add(dcTravel);
        dcTravel = new DataColumn("Class", typeof(string));
        dtTravel.Columns.Add(dcTravel);
        DataRow drTravel = dtTravel.NewRow();
        foreach (GridViewRow gvTravelRow in TravelGrid.Rows)
        {
            drTravel = dtTravel.NewRow();
            TextBox txtOrigin = gvTravelRow.FindControl("txtOrigin") as TextBox;
            TextBox txtDestination = gvTravelRow.FindControl("txtDestination") as TextBox;
            TextBox txtDate = gvTravelRow.FindControl("txtDate") as TextBox;
            DropDownList drpMode = gvTravelRow.FindControl("drpMode") as DropDownList;
            DropDownList drpClass = gvTravelRow.FindControl("drpClass") as DropDownList;
            drTravel["Origin"] = txtOrigin.Text;
            drTravel["Destination"] = txtDestination.Text;
            drTravel["Date"] = txtDate.Text;
            drTravel["Mode"] = drpMode.SelectedValue;
            drTravel["Class"] = drpClass.SelectedValue;
            dtTravel.Rows.Add(drTravel);
        }
        drTravel = dtTravel.NewRow();
        drTravel["Origin"] = string.Empty;
        drTravel["Destination"] = string.Empty;
        drTravel["Date"] = string.Empty;
        drTravel["Mode"] = string.Empty;
        drTravel["Class"] = string.Empty;
        dtTravel.Rows.Add(drTravel);
        TravelGrid.DataSource = dtTravel;
        TravelGrid.DataBind();
    }

    protected void AccomodationAddNew(object sender, EventArgs e)
    {
        AccomodationAddNewRow();
    }

    private void AccomodationAddNewRow()
    {
        DataTable dtAccomodation = new DataTable();
        DataColumn dcAccomodation = new DataColumn();
        dcAccomodation = new DataColumn("Location", typeof(string));
        dtAccomodation.Columns.Add(dcAccomodation);
        dcAccomodation = new DataColumn("Check In Date", typeof(string));
        dtAccomodation.Columns.Add(dcAccomodation);
        dcAccomodation = new DataColumn("No. of Night", typeof(string));
        dtAccomodation.Columns.Add(dcAccomodation);
        DataRow drAccomodation = dtAccomodation.NewRow();
        foreach (GridViewRow gvAccomodationRow in GridAccomodation.Rows)
        {
            drAccomodation = dtAccomodation.NewRow(); ;
            TextBox txtLocationAcc = gvAccomodationRow.FindControl("txtLocationAcc") as TextBox;
            TextBox txtChecKInDate = gvAccomodationRow.FindControl("txtChecKInDate") as TextBox;
            TextBox txtNoofNight = gvAccomodationRow.FindControl("txtNoofNight") as TextBox;
            drAccomodation["Location"] = txtLocationAcc.Text;
            drAccomodation["Check In Date"] = txtChecKInDate.Text;
            drAccomodation["No. of Night"] = txtNoofNight.Text;
            dtAccomodation.Rows.Add(drAccomodation);
        }
        drAccomodation = dtAccomodation.NewRow();
        drAccomodation["Location"] = string.Empty;
        drAccomodation["Check In Date"] = string.Empty;
        drAccomodation["No. of Night"] = string.Empty;
        dtAccomodation.Rows.Add(drAccomodation);
        GridAccomodation.DataSource = dtAccomodation;
        GridAccomodation.DataBind();
    }

    protected void CabAddNew(object sender, EventArgs e)
    {
        CabAddNewRow();
    }

    private void CabAddNewRow()
    {
        DataTable dtCab = new DataTable();
        DataColumn dcCab = new DataColumn();
        dcCab = new DataColumn("City", typeof(string));
        dtCab.Columns.Add(dcCab);
        dcCab = new DataColumn("Service", typeof(string));
        dtCab.Columns.Add(dcCab);
        dcCab = new DataColumn("Origin", typeof(string));
        dtCab.Columns.Add(dcCab);
        dcCab = new DataColumn("Desination", typeof(string));
        dtCab.Columns.Add(dcCab);
        dcCab = new DataColumn("Date", typeof(string));
        dtCab.Columns.Add(dcCab);
        dcCab = new DataColumn("Hours", typeof(string));
        dtCab.Columns.Add(dcCab);
        dcCab = new DataColumn("Remark", typeof(string));
        dtCab.Columns.Add(dcCab);
        DataRow drCab = dtCab.NewRow();
        foreach (GridViewRow gvCabRow in GridCab.Rows)
        {
            drCab = dtCab.NewRow();
            TextBox txtCity = gvCabRow.FindControl("txtCity") as TextBox;
            DropDownList drpService = gvCabRow.FindControl("drpService") as DropDownList;
            TextBox txtCabOrigin = gvCabRow.FindControl("txtCabOrigin") as TextBox;
            TextBox txtCabDestination = gvCabRow.FindControl("txtCabDestination") as TextBox;
            TextBox txtCabDate = gvCabRow.FindControl("txtCabDate") as TextBox;
            TextBox txtHours = gvCabRow.FindControl("txtHours") as TextBox;
            TextBox txtRemark = gvCabRow.FindControl("txtRemark") as TextBox;
            drCab["City"] = txtCity.Text;
            drCab["Service"] = drpService.SelectedValue;
            drCab["Origin"] = txtCabOrigin.Text;
            drCab["Desination"] = txtCabDestination.Text;
            drCab["Date"] = txtCabDate.Text;
            drCab["Hours"] = txtHours.Text;
            drCab["Remark"] = txtRemark.Text;
            dtCab.Rows.Add(drCab);
        }
        drCab = dtCab.NewRow();
        drCab["City"] = string.Empty;
        drCab["Service"] = string.Empty;
        drCab["Origin"] = string.Empty;
        drCab["Desination"] = string.Empty;
        drCab["Date"] = string.Empty;
        drCab["Hours"] = string.Empty;
        drCab["Remark"] = string.Empty;
        dtCab.Rows.Add(drCab);
        GridCab.DataSource = dtCab;
        GridCab.DataBind();
    }

    protected void TravelNext(object sender, EventArgs e)
    {
        TabContainer1.ActiveTab = TabContainer1.Tabs[1];
    }

    protected void TravelPrev(object sender, EventArgs e)
    {
        TabContainer1.ActiveTab = TabContainer1.Tabs[0];
    }

    protected void AccomodationNext(object sender, EventArgs e)
    {
        TabContainer1.ActiveTab = TabContainer1.Tabs[2];
    }

    protected void CabPrev(object sender, EventArgs e)
    {
        TabContainer1.ActiveTab = TabContainer1.Tabs[1];
    }

    protected void Submit(object sender, EventArgs e)
    {
        InsertToTravel();
        InsertToAccomodation();
        InsertToCab();
        Response.Write("Insertion Successfully");
    }

    private void InsertToTravel()
    {
        con.Open();
        foreach (GridViewRow gvTravelInsert in TravelGrid.Rows)
        {
            SqlCommand cmd = new SqlCommand("usp_TravelInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            TextBox txtOrigin = gvTravelInsert.FindControl("txtOrigin") as TextBox;
            TextBox txtDestination = gvTravelInsert.FindControl("txtDestination") as TextBox;
            TextBox txtDate = gvTravelInsert.FindControl("txtDate") as TextBox;
            DropDownList drpMode = gvTravelInsert.FindControl("drpMode") as DropDownList;
            DropDownList drpClass = gvTravelInsert.FindControl("drpClass") as DropDownList;
            cmd.Parameters.AddWithValue("@TravelOrigin", txtOrigin.Text);
            cmd.Parameters.AddWithValue("@TravelDestination", txtDestination.Text);
            cmd.Parameters.AddWithValue("@TravelDate", Convert.ToDateTime(txtDate.Text));
            cmd.Parameters.AddWithValue("@TravelMode", drpMode.SelectedValue);
            cmd.Parameters.AddWithValue("@TravelClass", drpClass.SelectedValue);
            cmd.ExecuteNonQuery();
        }
        con.Close();
    }

    private void InsertToAccomodation()
    {
        con.Open();
        foreach (GridViewRow gvAccomodationInsert in GridAccomodation.Rows)
        {
            SqlCommand cmd = new SqlCommand("usp_AccomodationInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            TextBox txtLocationAcc = gvAccomodationInsert.FindControl("txtLocationAcc") as TextBox;
            TextBox txtChecKInDate = gvAccomodationInsert.FindControl("txtChecKInDate") as TextBox;
            TextBox txtNoofNight = gvAccomodationInsert.FindControl("txtNoofNight") as TextBox;
            cmd.Parameters.AddWithValue("@AccomodationLocation", txtLocationAcc.Text);
            cmd.Parameters.AddWithValue("@AccomodationDate", Convert.ToDateTime(txtChecKInDate.Text));
            cmd.Parameters.AddWithValue("@AccomodationNoOfNight", txtNoofNight.Text);
            cmd.ExecuteNonQuery();
        }
        con.Close();
    }

    private void InsertToCab()
    {
        con.Open();
        foreach (GridViewRow gvCabInsert in GridCab.Rows)
        {
            SqlCommand cmd = new SqlCommand("usp_CabInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            TextBox txtCity = gvCabInsert.FindControl("txtCity") as TextBox;
            DropDownList drpService = gvCabInsert.FindControl("drpService") as DropDownList;
            TextBox txtCabOrigin = gvCabInsert.FindControl("txtCabOrigin") as TextBox;
            TextBox txtCabDestination = gvCabInsert.FindControl("txtCabDestination") as TextBox;
            TextBox txtCabDate = gvCabInsert.FindControl("txtCabDate") as TextBox;
            TextBox txtHours = gvCabInsert.FindControl("txtHours") as TextBox;
            TextBox txtRemark = gvCabInsert.FindControl("txtRemark") as TextBox;
            cmd.Parameters.AddWithValue("@CabCity", txtCity.Text);
            cmd.Parameters.AddWithValue("@CabService", drpService.SelectedValue);
            cmd.Parameters.AddWithValue("@CabOrigin", txtCabOrigin.Text);
            cmd.Parameters.AddWithValue("@CabDestination", txtCabDestination.Text);
            cmd.Parameters.AddWithValue("@CabDate", Convert.ToDateTime(txtCabDate.Text));
            cmd.Parameters.AddWithValue("@CabHours", txtHours.Text);
            cmd.Parameters.AddWithValue("@CabRemark", txtRemark.Text);
            cmd.ExecuteNonQuery();
        }
        con.Close();
    }

    protected void Reset(object sender, EventArgs e)
    {
        foreach (GridViewRow gvTravelRowReset in TravelGrid.Rows)
        {
            TextBox txtOrigin = gvTravelRowReset.FindControl("txtOrigin") as TextBox;
            TextBox txtDestination = gvTravelRowReset.FindControl("txtDestination") as TextBox;
            TextBox txtDate = gvTravelRowReset.FindControl("txtDate") as TextBox;
            DropDownList drpMode = gvTravelRowReset.FindControl("drpMode") as DropDownList;
            DropDownList drpClass = gvTravelRowReset.FindControl("drpClass") as DropDownList;
            txtOrigin.Text = "";
            txtDestination.Text = "";
            txtDate.Text = "";
            drpClass.ClearSelection();
            drpClass.ClearSelection();
        }
        foreach (GridViewRow gvAccomodationReset in GridAccomodation.Rows)
        {
            TextBox txtLocationAcc = gvAccomodationReset.FindControl("txtLocationAcc") as TextBox;
            TextBox txtChecKInDate = gvAccomodationReset.FindControl("txtChecKInDate") as TextBox;
            TextBox txtNoofNight = gvAccomodationReset.FindControl("txtNoofNight") as TextBox;
            txtLocationAcc.Text = "";
            txtChecKInDate.Text = "";
            txtNoofNight.Text = "";
        }
        foreach (GridViewRow gvCabRowReset in GridCab.Rows)
        {
            TextBox txtCity = gvCabRowReset.FindControl("txtCity") as TextBox;
            DropDownList drpService = gvCabRowReset.FindControl("drpService") as DropDownList;
            TextBox txtCabOrigin = gvCabRowReset.FindControl("txtCabOrigin") as TextBox;
            TextBox txtCabDestination = gvCabRowReset.FindControl("txtCabDestination") as TextBox;
            TextBox txtCabDate = gvCabRowReset.FindControl("txtCabDate") as TextBox;
            TextBox txtHours = gvCabRowReset.FindControl("txtHours") as TextBox;
            TextBox txtRemark = gvCabRowReset.FindControl("txtRemark") as TextBox;
            txtCity.Text = "";
            drpService.ClearSelection();
            txtCabOrigin.Text = "";
            txtCabDestination.Text = "";
            txtCabDate.Text = "";
            txtHours.Text = "";
            txtRemark.Text = "";
        }
    }

    protected void TravelGrid_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Remove")
        {
            DataTable dtTravel = new DataTable();
            DataColumn dcTravel = new DataColumn();
            dcTravel = new DataColumn("Origin", typeof(string));
            dtTravel.Columns.Add(dcTravel);
            dcTravel = new DataColumn("Destination", typeof(string));
            dtTravel.Columns.Add(dcTravel);
            dcTravel = new DataColumn("Date", typeof(string));
            dtTravel.Columns.Add(dcTravel);
            dcTravel = new DataColumn("Mode", typeof(string));
            dtTravel.Columns.Add(dcTravel);
            dcTravel = new DataColumn("Class", typeof(string));
            dtTravel.Columns.Add(dcTravel);
            DataRow drTravel = dtTravel.NewRow();
            GridViewRow gvDeleteTravelRow = (e.CommandSource as LinkButton).NamingContainer as GridViewRow;
            int RowIndex = gvDeleteTravelRow.RowIndex;
            foreach (GridViewRow gvTravelRow in TravelGrid.Rows)
            {
                drTravel = dtTravel.NewRow();
                TextBox txtOrigin = gvTravelRow.FindControl("txtOrigin") as TextBox;
                TextBox txtDestination = gvTravelRow.FindControl("txtDestination") as TextBox;
                TextBox txtDate = gvTravelRow.FindControl("txtDate") as TextBox;
                DropDownList drpMode = gvTravelRow.FindControl("drpMode") as DropDownList;
                DropDownList drpClass = gvTravelRow.FindControl("drpClass") as DropDownList;
                drTravel["Origin"] = txtOrigin.Text;
                drTravel["Destination"] = txtDestination.Text;
                drTravel["Date"] = txtDate.Text;
                drTravel["Mode"] = drpMode.SelectedValue;
                drTravel["Class"] = drpClass.SelectedValue;
                dtTravel.Rows.Add(drTravel);
            }
            dtTravel.Rows.RemoveAt(RowIndex);
            TravelGrid.DataSource = dtTravel;
            TravelGrid.DataBind();
        }
    }

    protected void GridAccomodation_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Remove")
        {
            DataTable dtAccomodation = new DataTable();
            DataColumn dcAccomodation = new DataColumn();
            dcAccomodation = new DataColumn("Location", typeof(string));
            dtAccomodation.Columns.Add(dcAccomodation);
            dcAccomodation = new DataColumn("Check In Date", typeof(string));
            dtAccomodation.Columns.Add(dcAccomodation);
            dcAccomodation = new DataColumn("No. of Night", typeof(string));
            dtAccomodation.Columns.Add(dcAccomodation);
            DataRow drAccomodation = dtAccomodation.NewRow();
            GridViewRow gvDeleteAccomodationRow = (e.CommandSource as LinkButton).NamingContainer as GridViewRow;
            int RowIndex = gvDeleteAccomodationRow.RowIndex;
            foreach (GridViewRow gvAccomodationRow in GridAccomodation.Rows)
            {
                drAccomodation = dtAccomodation.NewRow(); ;
                TextBox txtLocationAcc = gvAccomodationRow.FindControl("txtLocationAcc") as TextBox;
                TextBox txtChecKInDate = gvAccomodationRow.FindControl("txtChecKInDate") as TextBox;
                TextBox txtNoofNight = gvAccomodationRow.FindControl("txtNoofNight") as TextBox;
                drAccomodation["Location"] = txtLocationAcc.Text;
                drAccomodation["Check In Date"] = txtChecKInDate.Text;
                drAccomodation["No. of Night"] = txtNoofNight.Text;
                dtAccomodation.Rows.Add(drAccomodation);
            }
            dtAccomodation.Rows.RemoveAt(RowIndex);
            GridAccomodation.DataSource = dtAccomodation;
            GridAccomodation.DataBind();
        }
    }

    protected void GridCab_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Remove")
        {
            DataTable dtCab = new DataTable();
            DataColumn dcCab = new DataColumn();
            dcCab = new DataColumn("City", typeof(string));
            dtCab.Columns.Add(dcCab);
            dcCab = new DataColumn("Service", typeof(string));
            dtCab.Columns.Add(dcCab);
            dcCab = new DataColumn("Origin", typeof(string));
            dtCab.Columns.Add(dcCab);
            dcCab = new DataColumn("Desination", typeof(string));
            dtCab.Columns.Add(dcCab);
            dcCab = new DataColumn("Date", typeof(string));
            dtCab.Columns.Add(dcCab);
            dcCab = new DataColumn("Hours", typeof(string));
            dtCab.Columns.Add(dcCab);
            dcCab = new DataColumn("Remark", typeof(string));
            dtCab.Columns.Add(dcCab);
            DataRow drCab = dtCab.NewRow();
            GridViewRow gvDeleteCabRow = (e.CommandSource as LinkButton).NamingContainer as GridViewRow;
            int RowIndex = gvDeleteCabRow.RowIndex;
            foreach (GridViewRow gvCabRow in GridCab.Rows)
            {
                drCab = dtCab.NewRow();
                TextBox txtCity = gvCabRow.FindControl("txtCity") as TextBox;
                DropDownList drpService = gvCabRow.FindControl("drpService") as DropDownList;
                TextBox txtCabOrigin = gvCabRow.FindControl("txtCabOrigin") as TextBox;
                TextBox txtCabDestination = gvCabRow.FindControl("txtCabDestination") as TextBox;
                TextBox txtCabDate = gvCabRow.FindControl("txtCabDate") as TextBox;
                TextBox txtHours = gvCabRow.FindControl("txtHours") as TextBox;
                TextBox txtRemark = gvCabRow.FindControl("txtRemark") as TextBox;
                drCab["City"] = txtCity.Text;
                drCab["Service"] = drpService.SelectedValue;
                drCab["Origin"] = txtCabOrigin.Text;
                drCab["Desination"] = txtCabDestination.Text;
                drCab["Date"] = txtCabDate.Text;
                drCab["Hours"] = txtHours.Text;
                drCab["Remark"] = txtRemark.Text;
                dtCab.Rows.Add(drCab);
            }
            dtCab.Rows.RemoveAt(RowIndex);
            GridCab.DataSource = dtCab;
            GridCab.DataBind();
        }
    }

}