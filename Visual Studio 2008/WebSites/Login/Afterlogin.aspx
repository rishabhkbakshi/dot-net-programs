<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Afterlogin.aspx.cs" Inherits="Afterlogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color:Yellow;width:100%">
    <form id="form1" runat="server">
    <div>
        <table> 
            <tr>
                <td>
                    <asp:Label ID="lblWel" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:Button ID="btnLo" runat="server" Text="LogOut" onclick="btnLo_Click" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
