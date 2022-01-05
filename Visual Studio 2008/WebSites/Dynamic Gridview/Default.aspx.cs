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

    }
    private void FirstGridViewRow()
    {
        DataTable dt = new DataTable();
        DataRow dr = null;
        dt.Columns.Add(new DataColumn("RowNumber", typeof(string)));
        dt.Columns.Add(new DataColumn("Col1", typeof(string)));
        dt.Columns.Add(new DataColumn("Col1", typeof(string)));
        dt.Columns.Add(new DataColumn("Col1", typeof(string)));
        dt.Columns.Add(new DataColumn("Col1", typeof(string)));
        dt.Columns.Add(new DataColumn("Col1", typeof(string)));
        dr = dt.NewRow();
        dr["RowNumber"] = 1;
        dr["Col1"] = string.Empty;
        dr["Col2"] = string.Empty;
        dr["Col3"] = string.Empty;
        dr["Col4"] = string.Empty;
        dr["Col5"] = string.Empty;
        dt.Rows.Add(dr);
        ViewState["CurrentTable"] = dt;
        grvStudentDetails.DataSource = dt;
        grvStudentDetails.DataBind();
    }
    private void AddNewRow()
    {
        int rowindex = 0;
        if (ViewState["CurrentTable"] != null)
        {
            DataTable dtCurrentTable = (DataTable)ViewState["CurrentTable"];
            DataRow drCurrentRow = null;
            if (dtCurrentTable.Rows.Count > 0)
            {
                for (int i = 0; i <= dtCurrentTable.Rows.Count; i++)
                {
                    TextBox textboxName = (TextBox)grvStudentDetails.Rows[rowindex].Cells[1].FindControl("txtName");
                    TextBox textBoxAge = (TextBox)grvStudentDetails.Rows[rowindex].Cells[2].FindControl("txtAge");
                    TextBox textBoxAddress = (TextBox)grvStudentDetails.Rows[rowindex].Cells[3].FindControl("txtAddress");
                    RadioButtonList rblGender = (RadioButtonList)grvStudentDetails.Rows[rowindex].Cells[4].FindControl("rblGender");
                    DropDownList drpQualification = (DropDownList)grvStudentDetails.Rows[rowindex].Cells[5].FindControl("drpQualification");
                    drCurrentRow = dtCurrentTable.NewRow();
                }
            }
        }
    }
}
