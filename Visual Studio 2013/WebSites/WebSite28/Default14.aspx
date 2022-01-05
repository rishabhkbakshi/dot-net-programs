<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default14.aspx.cs" Inherits="Default14" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        body {
            font-family: Arial;
            font-size: 10pt;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>Username:
                </td>
                <td>
                    <asp:TextBox ID="txtUsername" runat="server" Text="" />
                </td>
            </tr>
            <tr>
                <td>Password:
                </td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnSubmit" OnClick="Submit" Text="Submit" runat="server" />
                </td>
            </tr>
        </table>
        <hr />
        <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="false" HeaderStyle-BackColor="#3AC0F2"
            HeaderStyle-ForeColor="White" RowStyle-BackColor="#A1DCF2" OnRowDataBound="OnRowDataBound">
            <Columns>
                <asp:BoundField DataField="Username" HeaderText="Username" />
                <asp:BoundField DataField="Password" HeaderText="Encrypted Password" />
                <asp:BoundField DataField="Password" HeaderText="Decrypted Password" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
