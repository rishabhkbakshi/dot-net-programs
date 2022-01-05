<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Create.aspx.cs" Inherits="Create" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color:Yellow; width:100%">
    <form id="form1" runat="server">
    <div style="text-align: center">
    <asp:Label ID="lblMessage" runat="server"></asp:Label>
        <table>
            <tr>
                <td>
                    <asp:Label ID="lblC" runat="Server" Text="Create Account" Font-Size="X-Large"></asp:Label>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:Label ID="lblFN" runat="server" Text="Firstname"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtFN" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvFn" runat="server" ErrorMessage="*" ControlToValidate="txtFN"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblLN" runat="server" Text="Lastname"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtLN" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvLn" runat="server" ErrorMessage="*" ControlToValidate="txtLN"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblA" runat="server" Text="Address"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtA" runat="server" TextMode="MultiLine"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvA" runat="server" ErrorMessage="*" ControlToValidate="txtA"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblUN" runat="server" Text="Username"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtUN" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvUn" runat="server" ErrorMessage="*" ControlToValidate="txtUN"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPW" runat="server" Text="Password"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPW" runat="server" TextMode="Password" Width="135px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvPw" runat="server" ErrorMessage="*" ControlToValidate="txtPW"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblCPW" runat="server" Text="Confirm Password"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtCPW" runat="server" TextMode="Password" Width="135px"></asp:TextBox>
                </td>
                <td>
                    <asp:CompareValidator ID="CV" runat="server" ErrorMessage="Again Enter the password" ControlToCompare="txtPW" ControlToValidate="txtCPW"></asp:CompareValidator>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvCpw" runat="server" ErrorMessage="*" ControlToValidate="txtCPW"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblP" runat="server" Text="PhoneNo"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtP" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvP" runat="server" ErrorMessage="*" ControlToValidate="txtP"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblE" runat="server" Text="Email"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtE" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvE" runat="server" ErrorMessage="*" ControlToValidate="txtE"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="revE" runat="server" 
                        ErrorMessage="Enter proper Email" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtE"></asp:RegularExpressionValidator>
                </td>
            </tr>
        </table>
        <table>
            <asp:Button ID="btnCREATE" runat="server" Text="Submit" 
                onclick="btnCREATE_Click" />
        </table>
    </div>
    </form>
</body>
</html>
