<%@ Page Language="C#" AutoEventWireup="true" CodeFile="After Login.aspx.cs" Inherits="After_Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td>
                    <asp:Label ID="lblWelcome" runat="server" Font-Size="Larger"></asp:Label>
                </td>
                <td>
                    <asp:Button ID="txtLogout" runat="server" Text="LogOut" OnClick="txtLogout_Click" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
