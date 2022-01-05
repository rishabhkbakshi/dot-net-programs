<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

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
                    <asp:TextBox ID="tb1" runat="server" ></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="btn1" runat="server" Text="Search" onclick="btn1_Click" />
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:GridView ID="grid1" runat="server" AutoGenerateColumns="true">
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
