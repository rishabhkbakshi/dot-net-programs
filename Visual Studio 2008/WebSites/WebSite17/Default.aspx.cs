using System;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;


public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_Submit_Click(object sender, EventArgs e)
    {
        Submit();
    }
    private void Submit()
    {
        if (txt_Pass.Text == txt_Rpass.Text)
        {
            int Result = 0;
            BLL sub = new BLL(); ;
            string Username = txt_User.Text;
            string Password = txt_Pass.Text;
            string Firstname = txt_Fname.Text;
            string Lastname = txt_Lname.Text;
            string Email = txt_Email.Text;
            string PhoneNo = txt_Phone.Text;
            string Location = txt_Loc.Text;
            try
            {
                Result = sub.InsertUserInformation( Username,Password,Firstname,Lastname,Email,PhoneNo,Location);
                Response.Write("Insertion Sucessfully");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
