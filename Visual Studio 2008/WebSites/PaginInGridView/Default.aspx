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
                    <asp:GridView ID="PageGrid" runat="server" AllowPaging="true" DataKeyNames="Id" OnPageIndexChanging="PageGrid_PageIndexChanging"
                        PageSize="5" AutoGenerateColumns="false">
                        <PagerSettings PageButtonCount="4" FirstPageText="First" LastPageText="Last" Mode="Numeric" />
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="Id" />
                            <asp:BoundField DataField="Username" HeaderText="Username" />
                            <asp:BoundField DataField="Firstname" HeaderText="Firstname" />
                            <asp:BoundField DataField="Password" HeaderText="Password" />
                            <asp:BoundField DataField="Email" HeaderText="Email" />
                            <asp:BoundField DataField="PhoneNo" HeaderText="PhoneNo" />
                            <asp:BoundField DataField="Location" HeaderText="Location" />
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
