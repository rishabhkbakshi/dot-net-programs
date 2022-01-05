<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="lblResponse" runat="server"></asp:Label>
        <table>
            <tr>
                <td>
                    <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblcity" runat="server" Text="City"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtcity" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnsave" runat="server" OnClick="btnsave_Click" Text="save" />
                </td>
            </tr>
        </table>
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
        <table>
            <tr>
                <td>
                    <asp:Label ID="lblSelect" runat="server" Text="Enter the Id"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtselect" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnselect" runat="server" OnClick="btnselect_Click" Text="select" />
                </td>
            </tr>
        </table>
        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" PageSize="5" OnPageIndexChanging="Gridview2_PageIndexChanging">
            <PagerSettings PageButtonCount="4" FirstPageText="First" LastPageText="Last" Mode="Numeric" />
        </asp:GridView>
        <table>
            <tr>
                <td>
                    <asp:Button ID="btnfirst" runat="server" OnClick="btnfirst_Click" Text="First" />
                </td>
                <td>
                    <asp:Button ID="btnnext" runat="server" OnClick="btnnext_Click" Text="Next" />
                </td>
                <td>
                    <asp:Button ID="btnprevious" runat="server" OnClick="btnprevious_Click" Text="Previous" />
                </td>
                <td>
                    <asp:Button ID="btnlast" runat="server" OnClick="btnlast_Click" Text="Last" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
