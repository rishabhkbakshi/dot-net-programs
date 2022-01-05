using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for DBUtil
/// </summary>
public class DBUtil
{
	 public static String ConnectionString
     {
         get{ 
             return "Data Source=.\\SQLEXPRESS;AttachDbFilename=d:\\aspnet\\lm\\App_Data\\Database.mdf;Integrated Security=True;User Instance=True"; 
         }

   	}
}
