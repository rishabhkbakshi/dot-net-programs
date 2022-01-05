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
/// Summary description for BLL
/// </summary>
public class BLL
{
    public BLL()
    {
        //
        // TODO: Add constructor logic here
        //
    }


    public int InsertUserInformation(string Username, string Password, string Firstname, string Lastname, string Email, string PhoneNo, string Location)
    {
        DAL objUserDAL = new DAL();
        try
        {
            return objUserDAL.InsertUserInformation( Username,  Password,  Firstname,  Lastname,  Email,  PhoneNo,  Location);
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            objUserDAL = null;
        }
    }
}



