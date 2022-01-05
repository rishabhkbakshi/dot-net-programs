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
                    <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblLname" runat="server" Text="Last Name"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtLname" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPhone" runat="server" Text="PhoneNo."></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblRank" runat="server" Text="RRank"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtRank" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblBranch" runat="server" Text="Branch"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="drop" runat="server">
                        <asp:ListItem Value="0">IT</asp:ListItem>
                        <asp:ListItem Value="1">CS</asp:ListItem>
                        <asp:ListItem Value="2">EC</asp:ListItem>
                        <asp:ListItem Value="3">EE</asp:ListItem>
                        <asp:ListItem Value="4">ME</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                        onclick="btnSubmit_Click" />
                </td>
            </tr>
        </table>
        <table>
            <asp:GridView ID="Grid" runat="server" AutoGenerateColumns="false" 
                onrowdeleting="Grid_RowDeleting" DataKeyNames="Id" onrowupdating="Grid_RowUpdating">
                <Columns>
                    <asp:BoundField HeaderText="Id" DataField="Id" />
                    <asp:BoundField HeaderText="Name" DataField="Name" />
                    <asp:BoundField HeaderText="Last name" DataField="Lname" />
                    <asp:BoundField HeaderText="Phone" DataField="Phone" />
                    <asp:BoundField HeaderText="RRank" DataField="Rank" />
                    <asp:BoundField HeaderText="Branch" DataField="Branch" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="Delete" Text="Delete" runat="server" CommandName="Delete"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="Update" Text="Update" runat="server" CommandName="Update"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </table>
    </div>
    </form>
</body>
</html>
