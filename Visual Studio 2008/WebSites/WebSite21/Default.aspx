<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 260px">
            <tr>
                <td>
                    <asp:Label ID="lblId" runat="server" Text="Id"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtId" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblname" runat="server" Text="Name"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
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
                    <asp:Label ID="lblphone" runat="server" Text="PhoneNo"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtphone" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblemail" runat="server" Text="Email"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblage" runat="server" Text="Age"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtage" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
        <table style="width: 260px">
            <tr>
                <td>
                    <asp:Button id="btnadd" Text="Add to grid" runat="server" 
                        onclick="btnadd_Click" />
                </td>
                <td>
                    <asp:Button ID="btnclr" Text="Clear" runat="server" onclick="btnclr_Click" />
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:GridView ID="Grid" runat="server">
                    <Columns>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <%# Container.DataItemIndex + 1%>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
        <table style="width: 258px">
            <tr>
                <td>
                    <asp:TextBox ID="txtdel" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="btndel" runat="server" Text="Delete" onclick="btndel_Click"/>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:Button ID="btnInst" runat="server" Text="Insert" onclick="btnInst_Click" 
                        Width="255px" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
