<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body
        {
            font-family: Arial;
            color: Black;
        }
    </style>
</head>
<body style="background-color: Gray; width: 100%">
    <form id="form1" runat="server">
    <div style="text-align: center; background-color: Silver">
        <table style="color: Black">
            <tr>
                <td style="text-align: center">
                    <asp:Label ID="lbl" runat="server" Text="Login" Font-Size="XX-Large"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="color: Black;">
                    <asp:Label ID="lblUser" runat="server" Text="Username" Font-Size="X-Large"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtUser" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="Rfv" runat="server" ErrorMessage="*" ControlToValidate="txtUser"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPass" runat="server" Text="Password" Font-Size="X-Large"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="Rfv2" runat="server" ErrorMessage="*" ControlToValidate="txtPass"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl1" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
