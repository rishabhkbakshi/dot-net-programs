<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default21.aspx.cs" Inherits="Default21" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Maintain Password textbox data in postback</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td><b>UserName:</b></td>
                    <td>
                        <asp:TextBox ID="txtUserName" runat="server" /></td>
                </tr>
                <tr>
                    <td><b>Password</b></td>
                    <td>
                        <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" /></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" style="height: 26px" /></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
