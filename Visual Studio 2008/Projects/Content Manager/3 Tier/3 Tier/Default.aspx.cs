using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace _3_Tier
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            binddata();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                BOL.BOL DesignBOL = new BOL.BOL();
                DesignBOL.FirstName = txtFirstName.Text;
                DesignBOL.MiddleName = txtMiddleName.Text;
                DesignBOL.LastName = txtLastName.Text;
                DesignBOL.Age = txtAge.Text;
                DesignBOL.MaritalStatus = txtMaritalStatus.Text;
                BAL.BAL InsertBal = new BAL.BAL();
                InsertBal.InsertBAL(DesignBOL);
                lblMessage.Text = "Data inserted successfully";
                binddata();
            }
            catch (Exception ex)
            {
                
                throw ex;
            }
            
        }
        public void binddata()
        {
            DataTable dt = BAL.BAL.BindData();
            gvUserDetails.DataSource = dt;
            gvUserDetails.DataBind();
        }

        protected void gvUserDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvUserDetails.PageIndex = e.NewPageIndex;
            binddata();

        }
    }
}
