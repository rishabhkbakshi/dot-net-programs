using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Xml;
using System.Net;
using System.IO;
using System.Xml.Xsl;
using System.Text;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindUserDetails("");
            xml();
        }
    }
    protected void BindUserDetails(string userName)
    {
        WebService objUserDetails = new WebService();
        DataSet dsresult = new DataSet();
        XmlElement exelement = objUserDetails.GetUserDetails(userName);
        if (exelement != null)
        {
            XmlNodeReader nodereader = new XmlNodeReader(exelement);
            dsresult.ReadXml(nodereader, XmlReadMode.Auto);
            gvUserDetails.DataSource = dsresult;
            gvUserDetails.DataBind();
        }
        else
        {
            gvUserDetails.DataSource = null;
            gvUserDetails.DataBind();
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        BindUserDetails(txtFirstName.Text);
    }
    protected void btnGet_Click(object sender, EventArgs e)
    {
        string xmlResult = null;
        string url;
        url = "http://www.webservicex.net/globalweather.asmx/GetWeather?CityName=Ahmadabad&CountryName=india";
        HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
        HttpWebResponse response = (HttpWebResponse)request.GetResponse();
        StreamReader resStream = new StreamReader(response.GetResponseStream());
        XmlDocument doc = new XmlDocument();
        xmlResult = resStream.ReadToEnd();
        doc.LoadXml(xmlResult);

        XmlDocument xl = new XmlDocument();
        xl.LoadXml(doc.GetElementsByTagName("string").Item(0).InnerText);

        //XmlNodeList xnList = xl.SelectNodes("CurrentWeather");

        //foreach (XmlNode xn in xnList)
        //{
        //    Label1.Text = "Temperature : " + xn["Temperature"].InnerText;
        //    Label2.Text = "Humidity : " + xn["RelativeHumidity"].InnerText;
        //}
        XmlNodeReader nodereader = new XmlNodeReader(xl);
        DataSet dsresult = new DataSet();

        dsresult.ReadXml(nodereader, XmlReadMode.Auto);
        GridView1.DataSource = dsresult;
        GridView1.DataBind();
    }
}