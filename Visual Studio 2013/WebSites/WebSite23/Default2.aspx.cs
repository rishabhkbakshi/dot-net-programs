using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

public partial class Default2 : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source =.;User Id=sa;Password=sqlserver2008;Database=Practice");
    public static string str;
    public static string str2;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindEval();
            BindCan();
        }
    }
    protected void grdView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        ViewState["Id"] = grdView.DataKeys[e.RowIndex].Value;
        ViewState["Eval"] = grdView.Rows[e.RowIndex].Cells[1].Text;
        str = Convert.ToString(ViewState["Id"]);
        str2 = Convert.ToString(ViewState["Eval"]);
        chklst.Visible = true;
        BindCan();
    }
    private void BindEval()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("Select * from TempEval", con);
        cmd.CommandType = CommandType.Text;
        grdView.DataSource = cmd.ExecuteReader();
        grdView.DataBind();
        con.Close();
    }
    private void BindEvalMap()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("Select * from Mapping", con);
        cmd.CommandType = CommandType.Text;
        grdvew2.DataSource = cmd.ExecuteReader();
        grdvew2.DataBind();
        con.Close();
    }
    private void BindCan()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("Select * from tempcand", con);
        cmd.CommandType = CommandType.Text;
        chklst.DataValueField = "CandidateId";
        chklst.DataTextField = "CandidateId";
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        DataTable dt2 = new DataTable();
        DataColumn dc = new DataColumn("CandidateId");
        dt2.Columns.Add(dc);
        DataRow dr = dt2.NewRow();
        for (int i = 0; i <= dt.Rows.Count - 1; i++)
        {
            for (int j = 0; j <= dt.Columns.Count - 2; j++)
            {
                string data = dt.Rows[i].ItemArray[j].ToString();
                dr["CandidateId"] = "CandidateId" + data;
                dt2.Rows.Add(dr);
                chklst.DataSource = dt2;
                dr = dt2.NewRow();
            }
        }
        chklst.DataBind();
        con.Close();
    }
    protected void btn_Click(object sender, EventArgs e)
    {
        Insert();
    }
    public void Insert()
    {
        con.Open();
        foreach (ListItem item in chklst.Items)
        {
            if (item.Selected)
            {
                SqlCommand cmd = new SqlCommand("insertEvalCand", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@EvaluatorMapId", ViewState["Id"]);
                cmd.Parameters.AddWithValue("@EvaluatorMapName", ViewState["Eval"]);
                cmd.Parameters.AddWithValue("@CandidateName", item.Text);
                cmd.ExecuteNonQuery();
            }
        }
        con.Close();
        BindEvalMap();
    }
}