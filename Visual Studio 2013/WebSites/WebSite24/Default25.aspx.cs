using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.Services;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class Default25 : System.Web.UI.Page
{
    public static string strcon = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindState();
        }
    }
    public void BindState()
    {
        SqlConnection con = new SqlConnection(strcon);
        SqlCommand cmd = new SqlCommand("usp_Stateselect");
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Connection = con;
        con.Open();
        ddlstate.DataSource = cmd.ExecuteReader();
        ddlstate.DataTextField = "State";
        ddlstate.DataValueField = "State_Id";
        ddlstate.DataBind();
        ddlstate.Items.Insert(0, new ListItem("Select State", "0"));
        con.Close();
    }

    [WebMethod]
    public static string BindDistrict(string state)
    {
        StringWriter builder = new StringWriter();
        DataSet ds = new DataSet(); SqlConnection con = new SqlConnection(strcon);
        SqlCommand cmd = new SqlCommand("usp_Districtselect");
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@State_Id", state);
        cmd.Connection = con;
        con.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        con.Close();
        DataTable dt = ds.Tables[0];
        builder.WriteLine("[");
        if (dt.Rows.Count > 0)
        {
            builder.WriteLine("{\"optionDisplay\":\"Select District\",");
            builder.WriteLine("\"optionValue\":\"0\"},");
            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                builder.WriteLine("{\"optionDisplay\":\"" + dt.Rows[i]["District"] + "\",");
                builder.WriteLine("\"optionValue\":\"" + dt.Rows[i]["District_Id"] + "\"},");
            }
        }
        else
        {
            builder.WriteLine("{\"optionDisplay\":\"Select District\",");
            builder.WriteLine("\"optionValue\":\"0\"},");
        }
        string returnjson = builder.ToString().Substring(0, builder.ToString().Length - 3);
        returnjson = returnjson + "]";
        return returnjson.Replace("\r", "").Replace("\n", "");
    }

    [WebMethod]
    public static string BindVillege(string district)
    {
        StringWriter builder = new StringWriter();
        DataSet ds = new DataSet();
        SqlConnection con = new SqlConnection(strcon);
        SqlCommand cmd = new SqlCommand("usp_Villageselect");
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@District_Id", district);
        cmd.Connection = con;
        con.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        con.Close();
        DataTable dt = ds.Tables[0];
        builder.WriteLine("[");
        if (dt.Rows.Count > 0)
        {
            builder.WriteLine("{\"optionDisplay\":\"Select Villege\",");
            builder.WriteLine("\"optionValue\":\"0\"},");
            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                builder.WriteLine("{\"optionDisplay\":\"" + dt.Rows[i]["Village"] + "\",");
                builder.WriteLine("\"optionValue\":\"" + dt.Rows[i]["Village_Id"] + "\"},");
            }
        }
        else
        {
            builder.WriteLine("{\"optionDisplay\":\"Select Villege\",");
            builder.WriteLine("\"optionValue\":\"0\"},");
        }
        string returnjson = builder.ToString().Substring(0, builder.ToString().Length - 3);
        returnjson = returnjson + "]";
        return returnjson.Replace("\r", "").Replace("\n", "");
    }
}