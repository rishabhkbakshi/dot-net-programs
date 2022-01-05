using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Default2 : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["constr"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("select Id,FirstName,LastName from student ", con);
        cmd.CommandType = CommandType.Text;
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        chu.DataSource = dt;
        chu.DataBind();
        chu1.DataSource = dt;
        chu1.DataBind();

    }
    protected void cusDate_ServerValidate(object source, ServerValidateEventArgs args)
    {
        DateTime date = DateTime.ParseExact(txtDate.Text, "dd/MMM/yyyy", CultureInfo.InvariantCulture);
        if (DateTime.Now.AddYears(-5) > date)
        {
            args.IsValid = true;
            lblDate.Text = "Eligible";
        }
        else
        {
            args.IsValid = false;
            lblDate.Text = "Not Eligible";
        }
    }
}