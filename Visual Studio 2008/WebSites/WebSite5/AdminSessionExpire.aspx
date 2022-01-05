<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminSessionExpire.aspx.cs"
    Inherits="AdminSessionExpire" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .Session
        {
            background-color: Silver;
            font-family: Arial;
            text-align: center;
            padding-top: 200px;
        }
    </style>
</head>
<body style="background-color: Gray">
    <form id="form1" runat="server">
    <div class="Session">
        <table>
            <tr>
                <td>
                    <h2>
                        'Thank you for visiting This Site'.<br />
                        Your session has expired.
                    </h2>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:HyperLink ID="hprLink" runat="server" NavigateUrl="~/AdminLogin1.aspx" Text="Click here to re-login"
                        ForeColor="Red"></asp:HyperLink>
                </td>
            </tr>
        </table>
        <div class="Session">
        </div>
    </div>
    </form>
</body>
</html>
