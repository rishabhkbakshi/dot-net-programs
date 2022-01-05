<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

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
                    <asp:CheckBox ID="chkColor" runat="server" Text="Color" AutoPostBack="true" OnCheckedChanged="chkColor_CheckedChanged" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CheckBoxList ID="chklist" runat="server" AutoPostBack="true" OnSelectedIndexChanged="chklist_SelectedIndexChanged">
                        <asp:ListItem>Red</asp:ListItem>
                        <asp:ListItem>Blue</asp:ListItem>
                        <asp:ListItem>Green</asp:ListItem>
                    </asp:CheckBoxList>
                </td>
            </tr>
        </table>
        <table style="border: 1; border-color: Black; border-style: solid; border-width: thin;
            padding: 2;">
            <tr>
                <td>
                    <asp:Label ID="lblID" runat="server" Text="ID"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblFirstName" runat="server" Text="FirstName"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblLastName" runat="server" Text="LastName"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblBranch" runat="server" Text="Branch"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblPhone" runat="server" Text="PhoneNo"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblBindID" runat="server" Text='<%Bind("Id") %>'></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblBindFirstname" runat="server" Text='<%Bind("Fname") %>'></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblBindLastname" runat="server" Text='<%Bind("Lname") %>'></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblBindEmail" runat="server" Text='<%Bind("Email") %>'></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblBindBranch" runat="server" Text='<%Bind("Branch") %>'></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblBindPhone" runat="server" Text='<%Bind("PhoneNo") %>'></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
