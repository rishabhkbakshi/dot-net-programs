<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 100%">
            <tr>
                <td>
                    <asp:Label ID="lbl1" runat="server" Text="Firstname"></asp:Label>
                    <asp:TextBox ID="txtFname" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl2" runat="server" Text="Lastname"></asp:Label>
                    <asp:TextBox ID="txtLname" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl3" runat="server" Text="Branch"></asp:Label>
                    <asp:DropDownList ID="drop" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btn" Text="Submit" runat="server" OnClick="btn_Click" />
                </td>
            </tr>
            <tr>
                <asp:GridView ID="Grid" runat="server" AutoGenerateColumns="false" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" />
                        <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                        <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                        <asp:BoundField DataField="Branch" HeaderText="Branch" />
                    </Columns>
                </asp:GridView>
            </tr>
        </table>
        <table style="width: 100%">
            <tr>
                <td>
                    <asp:GridView ID="Grid2" runat="server" AutoGenerateColumns="false" Width="100%"
                        OnRowCommand="Grid2_RowCommand">
                        <Columns>
                            <asp:TemplateField HeaderText="Firstname">
                                <ItemTemplate>
                                    <asp:TextBox ID="txt_Fname" runat="server" Text='<%#Bind("Firstname") %>'></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Lastname">
                                <ItemTemplate>
                                    <asp:TextBox ID="txt_Lname" runat="server" Text='<%#Bind("Lastname") %>'></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Branch">
                                <ItemTemplate>
                                    <asp:DropDownList ID="drop2" runat="server">
                                        <asp:ListItem Value="1" Text="IT"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="CS"></asp:ListItem>
                                        <asp:ListItem Value="3" Text="ME"></asp:ListItem>
                                        <asp:ListItem Value="4" Text="EE"></asp:ListItem>
                                        <asp:ListItem Value="5" Text="EC"></asp:ListItem>
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnDelete" runat="server" Text="Delete" CommandName="Remove"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:Button ID="btn_add" Text="Add new row" runat="server" OnClick="btn_add_Click" />
                    <asp:Button ID="btn_sub" Text="Submit" runat="server" OnClick="btn_sub_Click" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
