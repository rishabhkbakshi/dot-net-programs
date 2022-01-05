<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Listbox Sample</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table align="center">
            <tr>
                <td align="center" colspan="3">
                    <b>ListBox Sample</b>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:ListBox ID="ListBox1" runat="server" Height="169px" Width="121px" SelectionMode="Multiple">
                        <asp:ListItem Value="0">Asp.Net</asp:ListItem>
                        <asp:ListItem Value="1">C#.Net</asp:ListItem>
                        <asp:ListItem Value="2">VB.Net</asp:ListItem>
                        <asp:ListItem Value="3">JavaScript</asp:ListItem>
                        <asp:ListItem Value="4">Ajax</asp:ListItem>
                    </asp:ListBox>
                </td>
                <td>
                    <table>
                        <tr>
                            <td>
                                <asp:Button ID="btn1" runat="server" Text=">" Width="45px" OnClick="btn1_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btn2" runat="server" Text=">>" Width="45px" OnClick="btn2_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btn3" runat="server" Text="<" Width="45px" OnClick="btn3_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btn4" runat="server" Text="<<" Width="45px" OnClick="btn4_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <asp:ListBox ID="ListBox2" runat="server" Height="169px" Width="121px" SelectionMode="Multiple">
                        <asp:ListItem Value="0">SQl Server</asp:ListItem>
                        <asp:ListItem Value="1">Sharesoint</asp:ListItem>
                        <asp:ListItem Value="2">Jquery</asp:ListItem>
                    </asp:ListBox>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Label ID="lbltxt" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
