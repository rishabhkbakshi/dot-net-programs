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
        DataTable dt = GetSampleData();
        GridView1.DataSource = dt;
        GridView1.DataBind();
        GridView2.DataSource = dt;
        GridView2.DataBind();
    }

    private static DataTable GetSampleData()
    {
        DataTable dt = new DataTable();
        dt.Columns.AddRange(new DataColumn[3] { new DataColumn("Name"), new DataColumn("City"), new DataColumn("Country") });
        dt.Rows.Add("Maria Anders", "Berlin", "Germany");
        dt.Rows.Add("Ana Trujillo", "México D.F.", "Mexico");
        dt.Rows.Add("Antonio Moreno", "México D.F.", "Mexico");
        dt.Rows.Add("Thomas Hardy", "London", "UK");
        dt.Rows.Add("Christina Berglund", "Luleå", "Sweden");
        dt.Rows.Add("Hanna Moos", "Mannheim", "Germany");
        dt.Rows.Add("Frédérique Citeaux", "Strasbourg", "France");
        dt.Rows.Add("Martín Sommer", "Madrid", "Spain");
        dt.Rows.Add("Laurence Lebihan", "Marseille", "France");
        dt.Rows.Add("Elizabeth Lincoln", "Tsawassen", "Canada");
        dt.Rows.Add("Victoria Ashworth", "London", "UK");
        dt.Rows.Add("Patricio Simpson", "Buenos Aires", "Argentina");
        dt.Rows.Add("Francisco Chang", "México D.F.", "Mexico");
        dt.Rows.Add("Yang Wang", "Bern", "Switzerland");
        dt.Rows.Add("Pedro Afonso", "Sao Paulo", "Brazil");
        dt.Rows.Add("Elizabeth Brown", "London", "UK");
        dt.Rows.Add("Sven Ottlieb", "Aachen", "Germany");
        dt.Rows.Add("Janine Labrune", "Nantes", "France");
        dt.Rows.Add("Ann Devon", "London", "UK");
        dt.Rows.Add("Roland Mendel", "Graz", "Austria");
        return dt;
    }
    protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView2.PageIndex = e.NewPageIndex;
        GridView2.DataBind();
    }
}