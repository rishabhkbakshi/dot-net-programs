<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td>
                    <asp:Label ID="lblShow" runat="server" Text="Selected Items:- "></asp:Label>
                </td>
                <td>
                     <asp:Label ID="lblDrop" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:DropDownList ID="Drop1" runat="server" 
                        onselectedindexchanged="Drop1_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem Value="0" Text="Select Items"></asp:ListItem>
                        <asp:ListItem Value="1" Text="Car"></asp:ListItem>
                        <asp:ListItem Value="2" Text="Aeroplane"></asp:ListItem>
                        <asp:ListItem Value="3" Text="Bike"></asp:ListItem>
                        </asp:DropDownList>
                </td>
                <td>
                    <asp:DropDownList ID="Drop2" runat="server" Visible="false"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btn" runat="server" Text="submit" onclick="btn_Click" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
