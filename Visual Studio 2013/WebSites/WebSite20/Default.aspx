<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Create or Delete Directory/floder in asp.net</title>
</head>
<body>
    <form id="form1" runat="server">
    <table>
        <tr>
            <td>
                <b>Enter File Name to Create:</b>
            </td>
            <td>
                <asp:TextBox ID="txtName" runat="server" />
            </td>
            <td>
                <asp:Button ID="btnCreate" runat="server" Text="Create Directory" Font-Bold="true"
                    OnClick="btnCreate_Click" />
            </td>
        </tr>
        <tr>
            <td>
                <b>Enter File Name to Delete:</b>
            </td>
            <td>
                <asp:TextBox ID="txtdltName" runat="server" />
            </td>
            <td>
                <asp:Button ID="btnDelete" runat="server" Text="Delete Directory" Font-Bold="true"
                    OnClick="btnDelete_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Label ID="lblResult" runat="server" ForeColor="Red" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
