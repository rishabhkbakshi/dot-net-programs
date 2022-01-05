<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color:Yellow;width:100%">
    <form id="form1" runat="server">
    <div style="text-align: center">
    <asp:Label ID="lblLog" runat="server"></asp:Label> 
        <table>
            <tr>
                <td>
                    <asp:Label ID="lblL" runat="server" Text="Login" Font-Size="X-Large"></asp:Label>
                </td>
            </tr>
        </table>
        <table >
            <tr>
                <td>
                    <asp:Label ID="lblU" runat="server" Text="Username"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtU" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvU" runat="server" ErrorMessage="*" ControlToValidate="txtU" ValidationGroup="user & Pass"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblP" runat="server" Text="Password"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtP" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvP" runat="server" ErrorMessage="*" ControlToValidate="txtP" ValidationGroup="user & Pass"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:Button ID="btnL" runat="server" Text="Login" onclick="btnL_Click" ValidationGroup="user & Pass"/>
                </td>
                <td>
                    <asp:Button ID="btnC" runat="server" Text="Create" onclick="btnC_Click" />
                </td>
                
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:Label ID="lblMes" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
