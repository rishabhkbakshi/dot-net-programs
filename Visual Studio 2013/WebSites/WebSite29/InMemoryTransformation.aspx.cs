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

public partial class InMemoryTransformation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strXML= "<?xml version=\"1.0\" encoding=\"utf-8\"?><Employees>  <Employee>    <ID>100</ID>    <FirstName>Bala</FirstName>    <LastName>Murugan</LastName>    <Dept>Production Support</Dept>  </Employee>  <Employee>    <ID>101</ID>    <FirstName>Peter</FirstName>    <LastName>Laurence</LastName>    <Dept>Development</Dept>  </Employee>  <Employee>    <ID>102</ID>    <FirstName>Rick</FirstName>    <LastName>Anderson</LastName>    <Dept>Sales</Dept>  </Employee>  <Employee>    <ID>103</ID>    <FirstName>Ramesh</FirstName>    <LastName>Kumar</LastName>    <Dept>HR</Dept>  </Employee>  <Employee>    <ID>104</ID>    <FirstName>Katie</FirstName>    <LastName>Yu</LastName>    <Dept>Recruitment</Dept>  </Employee>  <Employee>    <ID>105</ID>    <FirstName>Suresh</FirstName>    <LastName>Babu</LastName>    <Dept>Inventory</Dept>  </Employee></Employees>";
        
        string strXSLTFile = Server.MapPath("EmployeeXSLT.xslt");          
       
        StringReader stringReader = new StringReader(strXML);
        XmlReader reader = XmlReader.Create(stringReader, null);
    
        XslCompiledTransform objXSLTransform = new XslCompiledTransform();
        objXSLTransform.Load(strXSLTFile);
        StringBuilder htmlOutput = new StringBuilder();
        TextWriter htmlWriter = new StringWriter(htmlOutput);
        objXSLTransform.Transform(reader, null, htmlWriter);
        ltRss.Text = htmlOutput.ToString();        
        reader.Close();
    }
}
