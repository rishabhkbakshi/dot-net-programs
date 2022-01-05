using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Xml;
using System.Configuration;


/// <summary>
/// Summary description for WebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService {

    public WebService () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld() {
        return "Hello World";
    }

    [WebMethod]
    public XmlElement GetUserDetails(string FirstName)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ToString());
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from Temp where FirstName like @FirstName+'%'", con);
        cmd.Parameters.AddWithValue("@FirstName", FirstName);
        cmd.ExecuteNonQuery();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        // Create an instance of DataSet.
        DataSet ds = new DataSet();
        da.Fill(ds);
        con.Close();
        // Return the DataSet as an XmlElement.
        XmlDataDocument xmldata = new XmlDataDocument(ds);
        XmlElement xmlElement = xmldata.DocumentElement;
        return xmlElement;
    }
}
