using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        DoxieBOL.DoxieBOL DesignBOL = new DoxieBOL.DoxieBOL();
        DesignBOL.FirstName = txtFirstName.Text;
        DesignBOL.MiddleName = txtMiddleName.Text;
        DesignBOL.LastName = txtLastName.Text;
        DesignBOL.Age =Convert.ToInt32(txtAge.Text);
        DesignBOL.MaritalStatus = txtMaritalStatus.Text;
        DoxiBAL.DoxieBAL InsertData = new DoxiBAL.DoxieBAL();
        InsertData.DoxieInsert(DesignBOL);
        BindData();
        
    }
    protected void BindData()
    {
        DataTable dt = DoxiBAL.DoxieBAL.DoxieSelect();
        gvUserDetails.DataSource = dt;
        gvUserDetails.DataBind();
    }
    protected void gvUserDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvUserDetails.PageIndex = e.NewPageIndex;
        DataBind();
    }
    protected void gvUserDetails_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        txtFirstName.Text = gvUserDetails.Rows[e.RowIndex].Cells[0].Text;
        txtMiddleName.Text = gvUserDetails.Rows[e.RowIndex].Cells[1].Text;
        txtLastName.Text = gvUserDetails.Rows[e.RowIndex].Cells[2].Text;
        txtAge.Text = gvUserDetails.Rows[e.RowIndex].Cells[3].Text;
        txtMaritalStatus.Text = gvUserDetails.Rows[e.RowIndex].Cells[4].Text;
    }
}
