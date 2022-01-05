<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:CheckBoxList ID="CBL" runat="server" AutoPostBack="true" OnSelectedIndexChanged="fun">
            <asp:ListItem Value="1" Text="a"></asp:ListItem>
            <asp:ListItem Value="2" Text="b"></asp:ListItem>
            <asp:ListItem Value="3" Text="c"></asp:ListItem>
            <asp:ListItem Value="4" Text="d"></asp:ListItem>
        </asp:CheckBoxList>
        <asp:DropDownList ID="DDL" runat="server" Visible="false">
            <asp:ListItem Value="5" Text="d"></asp:ListItem>
            <asp:ListItem Value="6" Text="e"></asp:ListItem>
            <asp:ListItem Value="7" Text="f"></asp:ListItem>
            <asp:ListItem Value="8" Text="g"></asp:ListItem>
        </asp:DropDownList>
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="1:-"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="tb1" runat="server">
                    </asp:TextBox>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="2:-"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="tb2" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="3:-"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="tb3" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="4:-"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="tb4" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="5:-"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="tb5" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:CheckBox ID="Chkbox" runat="server" Text="Color" AutoPostBack="true" />
                </td>
                <td>
                    <asp:CheckBoxList ID="chklist" runat="server" 
                        onselectedindexchanged="chklist_SelectedIndexChanged" >
                        <asp:ListItem Value="0">Red</asp:ListItem>
                        <asp:ListItem Value="1">Green</asp:ListItem>
                        <asp:ListItem Value="2">Yellow</asp:ListItem>
                    </asp:CheckBoxList>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
