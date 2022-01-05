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
                <td align="center">
                    <asp:Label ID="lbl_Reg" runat="Server" Text="Regestration Form"></asp:Label>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:Label ID="lbl_User" runat="server" Text="Username"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_User" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_Pass" runat="server" Text="Password"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_Pass" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td>
                    <asp:Label ID="lbl_RPass" runat="server" Text="RepeatPassword"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_Rpass" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_Fname" runat="server" Text="Firstname"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_Fname" runat="server" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_Lname" runat="server" Text="Lastname"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_Lname" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_Email" runat="server" Text="Email"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_Email" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_Phone" runat="server" Text="PhoneNo"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_Phone" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_Loc" runat="server" Text="Location"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_Loc" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:Button ID="btn_Submit" Text="Submit" runat="server" 
                        onclick="btn_Submit_Click" />
                </td>
                <td>
                    <asp:Button ID="btn_Reset" Text="Reset" runat="server" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
