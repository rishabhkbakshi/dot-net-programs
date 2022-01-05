<%@ Page Language="C#" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select fullname from users where uname = @uname and pwd  = @pwd", con);
            cmd.Parameters.Add("@uname", SqlDbType.VarChar, 10).Value = txtUname.Text;
            cmd.Parameters.Add("@pwd", SqlDbType.VarChar, 10).Value = txtPwd.Text;

            String fullname = (String)cmd.ExecuteScalar();
            if (fullname == null)
                lblmsg.Text = "Invalid Login!";
            else
            {
                Session.Add("uname", txtUname.Text);
                Session.Add("fullname", fullname);
                FormsAuthentication.RedirectFromLoginPage(txtUname.Text, false);
            }

        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
        }
        finally
        {
            con.Close();
        } 

    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Login Page</title>
</head>
<body>
    <form id="form1" runat="server">
       <h1>Library Managment</h1>
            <table width="100%" height="500px" border="0">
                <tr>
                    <td  width="30%" valign="top" bgcolor="#99ccff">
                        <h3>
                            Login<br />
                        </h3>
                        Usename<br />
                        <asp:TextBox ID="txtUname" runat="server" Width="150px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUname"
                            Display="None" ErrorMessage="Username is required!"></asp:RequiredFieldValidator><br />
                        Password<br />
                        <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" Width="150px"></asp:TextBox><asp:RequiredFieldValidator
                            ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPwd" Display="None"
                            ErrorMessage="Password is required!"></asp:RequiredFieldValidator><br />
                        <br />
                        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" /><br />
                        <br />
                        <asp:Label ID="lblmsg" runat="server" Font-Bold="True"></asp:Label><br />
                        <br />
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Login Errors:" />
                    </td>
                    <td valign="top" style="width: 525px">
                        <h4>This application allows your to do the follwoing: </h4>
                        <ul>
                            <li>Search for books
                                <li>Add members
                                <li>Add books
                                <li>Issue books
                                <li>Return books
                        </ul>
                        <br />
                    </td>
                </tr>
            </table>
        </form>
</body>
</html>
