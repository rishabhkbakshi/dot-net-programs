using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;
using System.Net.Mail;
using System.Configuration;

public partial class CreateAccount : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("usp_Find", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Username", txtUserName.Text);
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        cmd.ExecuteReader();
        con.Close();
        if (dt.Rows.Count == 0)
        {
            int Id = 0;
            Id = Createuser();
            Mail(Id);
        }
        else
        {
            Response.Write("User Exist");
        }
    }

    private int Createuser()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("usp_Create", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Fname", txtFirstname.Text);
        cmd.Parameters.AddWithValue("@Lname", txtLastName.Text);
        cmd.Parameters.AddWithValue("@Username", txtUserName.Text);
        cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
        cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
        cmd.Parameters.AddWithValue("@PhoneNo", txtPhoneNo.Text);
        cmd.Parameters.AddWithValue("@Confirmation", 0);
        lblAccount.Text = "Account Creation sucessfully";
        return Convert.ToInt32(cmd.ExecuteScalar());
    }

    private void Mail(int Id)
    {
        try
        {
            MailMessage Mail = new MailMessage();
            Mail.From = new MailAddress("bakshirishab90@gmail.com");
            Mail.To.Add(txtEmail.Text);
            Mail.Subject = "Test";
            Mail.Body = "Thank You for visiting this web site" + "<br>"
                        + "<b>" + "Your Username:-" + " </b>" + txtUserName.Text + "<br>"
                        + "<b>" + "Your Password:-" + "</b>" + txtPassword.Text + "<br>"
                        + "<b>" + "Your Id:-" + "</b>" + Id + "<br>"
                        + "To verify your account Please" + "<br>"
                        + "<a href='http://localhost:53917/WebSite3/Confirmation.aspx?User Id=" + Id + " '>Click Here </a>";
            Mail.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient("smtp.gmail.com");
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("Bakshirishab90@gmail.com", "Vipul1991");
            smtp.EnableSsl = true;
            smtp.Send(Mail);
            lblMail.Text = "Mail has been sent successfully";
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}