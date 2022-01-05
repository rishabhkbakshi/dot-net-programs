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
                    <asp:GridView ID="PageGrid" runat="server" AllowPaging="True" PageSize="5" 
                        DataKeyNames="Id" AutoGenerateColumns="false" 
                        onpageindexchanging="PageGrid_PageIndexChanging">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="Id" />
                            <asp:BoundField DataField="Username" HeaderText="Username" />
                            <asp:BoundField DataField="Password" HeaderText="Password" />
                            <asp:BoundField DataField="Firstname" HeaderText="Firstname" />
                            <asp:BoundField DataField="Lastname" HeaderText="Lastname" />
                            <asp:BoundField DataField="Email" HeaderText="Email" />
                            <asp:BoundField DataField="PhoneNo" HeaderText="PhoneNo" />
                            <asp:BoundField DataField="Location" HeaderText="Location" />
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnfirst" runat="server" OnClick="btnfirst_Click" Text="First" />
                    <asp:Button ID="btnnext" runat="server" OnClick="btnnext_Click" Text="Next" />
                    <asp:Button ID="btnprevious" runat="server" OnClick="btnprevious_Click" Text="Previous" />
                    <asp:Button ID="btnlast" runat="server" OnClick="btnlast_Click" Text="Last" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
