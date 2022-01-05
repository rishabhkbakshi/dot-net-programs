using System;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Drop1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string[] Car = new[] {"BMW","Maruti","Ford"};
        string[] AeroPlane = new[] { "SpiceJet", "Kingfisher", "Sahara" };
        string[] Bike = new[] { "Suzuki", "Honda", "Yamaha" };
        if (Drop1.SelectedValue == "1")
        {
            Drop2.DataSource = Car;
        }
        else if (Drop1.SelectedValue == "2")
        {
            Drop2.DataSource = AeroPlane;
        }
        else 
        {
            Drop2.DataSource = Bike;
        }
        Drop2.DataBind();
        Drop2.Visible = true;
    }
    protected void btn_Click(object sender, EventArgs e)
    {
        lblDrop.Text =  Drop1.SelectedItem.ToString()+ "->"+ Drop2.SelectedItem.ToString();
    }
}
