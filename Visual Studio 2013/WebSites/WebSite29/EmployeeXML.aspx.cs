using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Xsl;
using System.Xml;
using System.Xml.XPath;
using System.IO;
using System.Text;


public partial class EmployeeXML : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strXSLTFile = Server.MapPath("EmployeeXSLT.xslt");
        string strXMLFile = Server.MapPath("App_Data/Employess.xml");

        XmlReader reader = XmlReader.Create(strXMLFile);
        XslCompiledTransform objXSLTransform = new XslCompiledTransform();
        objXSLTransform.Load(strXSLTFile);
        StringBuilder htmlOutput = new StringBuilder();
        TextWriter htmlWriter = new StringWriter(htmlOutput);
        objXSLTransform.Transform(reader, null, htmlWriter);
        ltRss.Text = htmlOutput.ToString();
        reader.Close();
    }
}
